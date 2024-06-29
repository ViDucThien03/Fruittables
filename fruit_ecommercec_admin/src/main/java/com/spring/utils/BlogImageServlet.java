package com.spring.utils;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLDecoder;

@WebServlet(urlPatterns = "/blog/image/*")
public class BlogImageServlet extends HttpServlet {

    private String imagePath;

    @Override
    public void init() throws ServletException {
        // Define the directory where blog images are stored
        imagePath = System.getProperty("catalina.home") + File.separator + "assets/user/img/blog";
        System.out.println(imagePath);
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
