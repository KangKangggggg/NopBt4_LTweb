<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Thông tin cá nhân - IoTStar</title>
    <style>
        .profile-img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            border: 5px solid #fff;
            box-shadow: 0 0.125rem 0.25rem rgba(0, 0, 0, 0.075);
        }
        
        .profile-upload {
            position: relative;
            display: inline-block;
        }
        
        .upload-btn {
            position: absolute;
            bottom: 0;
            right: 0;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 50%;
            width: 40px;
            height: 40px;
            cursor: pointer;
        }
        
        .form-floating {
            margin-bottom: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card">
                    <div class="card-header bg-primary text-white">
                        <h4 class="mb-0">
                            <i class="fas fa-user-edit"></i> Thông tin cá nhân
                        </h4>
                    </div>
                    
                    <div class="card-body p-4">
                        <!-- Alert Messages -->
                        <c:if test="${not empty success}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="fas fa-check-circle"></i> ${success}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="fas fa-exclamation-circle"></i> ${error}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>
                        
                        <form action="${pageContext.request.contextPath}/profile" method="post" 
                              enctype="multipart/form-data" id="profileForm">
                            
                            <div class="row">
                                <!-- Profile Image -->
                                <div class="col-md-4 text-center mb-4">
                                    <div class="profile-upload">
                                      <img src="${pageContext.request.contextPath}/uploads/${not empty user.image ? user.image : 'default-avatar.jpg'}" 
     alt="Profile Image" class="profile-img" id="profileImage" 
     onerror="this.src='${pageContext.request.contextPath}/images/default-avatar.jpg'">
                                        <button type="button" class="upload-btn" onclick="document.getElementById('imageInput').click()">
                                            <i class="fas fa-camera"></i>
                                        </button>
                                    </div>
                                    <input type="file" id="imageInput" name="image" accept="image/*" style="display: none;" onchange="previewImage(this)">
                                    <p class="text-muted mt-2">Nhấn vào camera để thay đổi ảnh</p>
                                </div>
                                
                                <!-- User Information -->
                                <div class="col-md-8">
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="username" 
                                               value="${user.username}" readonly>
                                        <label for="username">Tên đăng nhập</label>
                                    </div>
                                    
                                    <div class="form-floating">
                                        <input type="email" class="form-control" id="email" 
                                               value="${user.email}" readonly>
                                        <label for="email">Email</label>
                                    </div>
                                    
                                    <div class="form-floating">
                                        <input type="text" class="form-control" id="fullname" name="fullname" 
                                               value="${user.fullname}" required>
                                        <label for="fullname">Họ và tên *</label>
                                    </div>
                                    
                                    <div class="form-floating">
                                        <input type="tel" class="form-control" id="phone" name="phone" 
                                               value="${user.phone}" pattern="[0-9]{10,11}">
                                        <label for="phone">Số điện thoại</label>
                                    </div>
                                </div>
                            </div>
                            
                            <hr class="my-4">
                            
                            <div class="d-flex justify-content-between">
                                <button type="button" class="btn btn-secondary" onclick="resetForm()">
                                    <i class="fas fa-undo"></i> Đặt lại
                                </button>
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-save"></i> Cập nhật thông tin
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
                
                <!-- Additional Info Card -->
                <div class="card mt-4">
                    <div class="card-body">
                        <h6 class="card-title">Thông tin tài khoản</h6>
                        <div class="row">
                            <div class="col-md-6">
                                <p><strong>Ngày tạo:</strong> 
                                   <c:if test="${not empty user.createdDate}">
                                       ${user.createdDate}
                                   </c:if>
                                </p>
                            </div>
                            <div class="col-md-6">
                                <p><strong>Cập nhật lần cuối:</strong> 
                                   <c:if test="${not empty user.updatedDate}">
                                       ${user.updatedDate}
                                   </c:if>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        function previewImage(input) {
            if (input.files && input.files[0]) {
                const reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('profileImage').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            }
        }
        
        function resetForm() {
            document.getElementById('profileForm').reset();
            // Reset image to original
            document.getElementById('profileImage').src = 
                '${pageContext.request.contextPath}/uploads/${not empty user.image ? user.image : "default-avatar.jpg"}';
        }
        
        // Form validation
        document.getElementById('profileForm').addEventListener('submit', function(e) {
            const fullname = document.getElementById('fullname').value.trim();
            
            if (!fullname) {
                e.preventDefault();
                alert('Vui lòng nhập họ và tên');
                return false;
            }
            
            const phone = document.getElementById('phone').value.trim();
            if (phone && !/^[0-9]{10,11}$/.test(phone)) {
                e.preventDefault();
                alert('Số điện thoại phải có 10-11 chữ số');
                return false;
            }
            
            // Check file size
            const imageInput = document.getElementById('imageInput');
            if (imageInput.files[0]) {
                const fileSize = imageInput.files[0].size / 1024 / 1024; // MB
                if (fileSize > 10) {
                    e.preventDefault();
                    alert('Kích thước file không được vượt quá 10MB');
                    return false;
                }
            }
        });
    </script>
</body>
</html>