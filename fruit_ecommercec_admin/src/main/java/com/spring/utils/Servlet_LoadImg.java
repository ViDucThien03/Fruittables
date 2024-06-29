package com.spring.utils;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.net.URLDecoder;

@WebServlet(urlPatterns = "/category/image/*")
public class Servlet_LoadImg extends HttpServlet {

    private String imagePath;

    @Override
    public void init() throws ServletException {
        imagePath = System.getProperty("catalina.home") + File.separator + "assets/user/img/category";
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String requestedImage = request.getPathInfo();

        if (requestedImage == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String decodedImagePath = URLDecoder.decode(requestedImage, "UTF-8");
        File image = new File(imagePath, decodedImagePath);

        if (!image.exists()) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        String contentType = getServletContext().getMimeType(image.getName());

        if (contentType == null || !contentType.startsWith("image")) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND);
            return;
        }

        response.reset();
        response.setContentType(contentType);
        response.setHeader("Content-Length", String.valueOf(image.length()));

        try (InputStream inputStream = new FileInputStream(image);
             OutputStream outputStream = response.getOutputStream()) {
            byte[] buffer = new byte[1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }
        }

    }
}
