package com.spring.controller;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.spring.Service.CheckoutServiceImpl;
import com.spring.config.Config;

import com.spring.model.Cart;
import com.spring.model.Checkout;
import com.spring.model.Payment;
import com.spring.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/api/payment")
public class PaymentController
{
    @Autowired
    private CheckoutServiceImpl checkoutService;
    @GetMapping(value = "/create_payment")
    public ResponseEntity<?> createPayment(HttpServletRequest req, HttpServletResponse resp, @RequestParam(required = false) double amount) throws IOException {

        String orderType = "other";
        long total_amount = (long) amount*100;

//        long total_amount = amount*100;
//        String bankCode = req.getParameter("bankCode");

        String vnp_TxnRef = Config.getRandomNumber(8);
        String vnp_IpAddr = Config.getIpAddress(req);

        String vnp_TmnCode = Config.vnp_TmnCode;

        Map<String, String> vnp_Params = new HashMap<>();
        vnp_Params.put("vnp_Version", Config.vnp_Version);
        vnp_Params.put("vnp_Command", Config.vnp_Command);
        vnp_Params.put("vnp_TmnCode", vnp_TmnCode);
        vnp_Params.put("vnp_Amount", String.valueOf(total_amount));
        vnp_Params.put("vnp_CurrCode", "VND");
        vnp_Params.put("vnp_BankCode", "NCB");

//        if (bankCode != null && !bankCode.isEmpty()) {
//            vnp_Params.put("vnp_BankCode", bankCode);
//        }
        vnp_Params.put("vnp_TxnRef", vnp_TxnRef);
        vnp_Params.put("vnp_OrderInfo", "Thanh toan don hang:" + vnp_TxnRef);
        vnp_Params.put("vnp_OrderType", orderType);
        vnp_Params.put("vnp_IpAddr", vnp_IpAddr);
        vnp_Params.put("vnp_Locale", "vn");
        String locate = req.getParameter("language");
//        if (locate != null && !locate.isEmpty()) {
//            vnp_Params.put("vnp_Locale", locate);
//        } else {
//
//        }
        vnp_Params.put("vnp_ReturnUrl", Config.vnp_ReturnUrl);
 //       vnp_Params.put("vnp_IpAddr", vnp_IpAddr);

        Calendar cld = Calendar.getInstance(TimeZone.getTimeZone("Etc/GMT+7"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMddHHmmss");
        String vnp_CreateDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_CreateDate", vnp_CreateDate);

        cld.add(Calendar.MINUTE, 15);
        String vnp_ExpireDate = formatter.format(cld.getTime());
        vnp_Params.put("vnp_ExpireDate", vnp_ExpireDate);

        List fieldNames = new ArrayList(vnp_Params.keySet());
        Collections.sort(fieldNames);
        StringBuilder hashData = new StringBuilder();
        StringBuilder query = new StringBuilder();
        Iterator itr = fieldNames.iterator();
        while (itr.hasNext()) {
            String fieldName = (String) itr.next();
            String fieldValue = (String) vnp_Params.get(fieldName);
            if ((fieldValue != null) && (fieldValue.length() > 0)) {
                //Build hash data
                hashData.append(fieldName);
                hashData.append('=');
                hashData.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                //Build query
                query.append(URLEncoder.encode(fieldName, StandardCharsets.US_ASCII.toString()));
                query.append('=');
                query.append(URLEncoder.encode(fieldValue, StandardCharsets.US_ASCII.toString()));
                if (itr.hasNext()) {
                    query.append('&');
                    hashData.append('&');
                }
            }
        }
        String queryUrl = query.toString();
        String vnp_SecureHash = Config.hmacSHA512(Config.secretKey, hashData.toString());
        queryUrl += "&vnp_SecureHash=" + vnp_SecureHash;
        String paymentUrl = Config.vnp_PayUrl + "?" + queryUrl;
        Payment payment = new Payment();
        payment.setStatus("Oke");
        payment.setMessage("Successfully");
        payment.setURL(paymentUrl);
        com.google.gson.JsonObject job = new JsonObject();
        job.addProperty("code", "00");
        job.addProperty("message", "success");
        job.addProperty("data", paymentUrl);
//        Gson gson = new Gson();
//        resp.getWriter().write(gson.toJson(job));
        return ResponseEntity.status(HttpStatus.OK).body(new Gson().toJson(job));
    }
    @RequestMapping(value = "/paymentResult", method = RequestMethod.GET)
    public ModelAndView showPaymentResult(HttpServletRequest request, HttpSession session) throws Exception {
        ModelAndView modelAndView = new ModelAndView("user/vnpay_return");

        // Begin process return from VNPAY
        Map<String, String> fields = new HashMap<>();
        for (Enumeration<String> params = request.getParameterNames(); params.hasMoreElements();) {
            String fieldName = params.nextElement();
            String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.UTF_8.toString());
            if (fieldValue != null && !fieldValue.isEmpty()) {
                fields.put(fieldName, fieldValue);
            }
        }

        String vnpSecureHash = request.getParameter("vnp_SecureHash");
        if (fields.containsKey("vnp_SecureHashType")) {
            fields.remove("vnp_SecureHashType");
        }
        if (fields.containsKey("vnp_SecureHash")) {
            fields.remove("vnp_SecureHash");
        }
        String signValue = Config.hashAllFields(fields); // Assume Config.hashAllFields() is correctly implemented

        // Prepare data for the view
        modelAndView.addObject("txnRef", request.getParameter("vnp_TxnRef"));
        modelAndView.addObject("amount", request.getParameter("vnp_Amount"));
        modelAndView.addObject("orderInfo", request.getParameter("vnp_OrderInfo"));
        modelAndView.addObject("responseCode", request.getParameter("vnp_ResponseCode"));
        modelAndView.addObject("transactionNo", request.getParameter("vnp_TransactionNo"));
        modelAndView.addObject("bankCode", request.getParameter("vnp_BankCode"));
        modelAndView.addObject("payDate", request.getParameter("vnp_PayDate"));
        Checkout checkout = (Checkout) session.getAttribute("checkoutdata");

        // Determine transaction status
        if (signValue.equals(vnpSecureHash)) {
            if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                modelAndView.addObject("transactionStatus", "Thành công");
                if(checkoutService.addCheckout(checkout) > 0)
                {
                    HashMap<Integer, Cart> carts = (HashMap<Integer, Cart>) session.getAttribute("cart");
                    checkoutService.addCheckoutDetail(carts);
                }
                session.removeAttribute("cart");

            } else {
                modelAndView.addObject("transactionStatus", "Không thành công");
            }
        } else {
            modelAndView.addObject("transactionStatus", "invalid signature");
        }

        return modelAndView;
    }
}