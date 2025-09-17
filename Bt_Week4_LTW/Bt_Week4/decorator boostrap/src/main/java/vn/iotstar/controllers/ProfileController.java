package vn.iotstar.controllers;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iotstar.models.User;
import vn.iotstar.services.IUserService;
import vn.iotstar.services.impl.UserServiceImpl;

@MultipartConfig(
    maxFileSize = 1024 * 1024 * 10,      // 10MB
    maxRequestSize = 1024 * 1024 * 20,    // 20MB
    fileSizeThreshold = 1024 * 1024 * 5   // 5MB
)
public class ProfileController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private IUserService userService = new UserServiceImpl();

    private static final String UPLOAD_DIR = "uploads";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getPathInfo();

        if (path == null || path.equals("/")) {
            // Hiển thị trang profile (giả lập user có id = 1)
            User user = userService.getUserById(1);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        try {
            // Lấy thông tin từ form
            String fullname = request.getParameter("fullname");
            String phone = request.getParameter("phone");

            // Lấy user hiện tại (giả lập user có id = 1)
            User user = userService.getUserById(1);
            if (user == null) {
                request.setAttribute("error", "Không tìm thấy thông tin người dùng");
                request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
                return;
            }

            // Cập nhật thông tin
            user.setFullname(fullname);
            user.setPhone(phone);

            // Xử lý upload file
            Part filePart = request.getPart("image");
            if (filePart != null && filePart.getSize() > 0) {
                String fileName = processUpload(filePart, request);
                if (fileName != null) {
                    user.setImage(fileName);
                }
            }

            // Cập nhật vào database
            boolean success = userService.updateUserProfile(user);

            if (success) {
                request.setAttribute("success", "Cập nhật thông tin thành công!");
            } else {
                request.setAttribute("error", "Có lỗi xảy ra khi cập nhật thông tin");
            }

            request.setAttribute("user", user);
            request.getRequestDispatcher("/views/profile.jsp").forward(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Có lỗi xảy ra: " + e.getMessage());
            User user = userService.getUserById(1);
            request.setAttribute("user", user);
            request.getRequestDispatcher("/views/profile.jsp").forward(request, response);
        }
    }

    private String processUpload(Part filePart, HttpServletRequest request) {
        try {
            String fileName = filePart.getSubmittedFileName();
            if (fileName == null || fileName.trim().isEmpty()) {
                return null;
            }

            // Validate file type
            String contentType = filePart.getContentType();
            if (!contentType.startsWith("image/")) {
                return null;
            }

            // Generate unique filename
            String fileExtension = fileName.substring(fileName.lastIndexOf("."));
            String uniqueFileName = UUID.randomUUID().toString() + fileExtension;

            // Create upload directory
            String uploadPath = request.getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            // Save file
            Path filePath = Paths.get(uploadPath, uniqueFileName);
            Files.copy(filePart.getInputStream(), filePath);

            return uniqueFileName;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}