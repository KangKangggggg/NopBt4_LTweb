<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Trang chủ - IoTStar</title>
</head>
<body>
    <div class="container">
        <!-- Hero Section -->
        <div class="row mb-5">
            <div class="col-12">
                <div class="card bg-primary text-white">
                    <div class="card-body text-center py-5">
                        <h1 class="display-4 mb-3">
                            <i class="fas fa-star"></i> Chào mừng đến với IoTStar
                        </h1>
                        <p class="lead mb-4">
                            Hệ thống quản lý sản phẩm với SiteMesh Decorators 3 và Bootstrap 5
                        </p>
                        <a href="${pageContext.request.contextPath}/profile" class="btn btn-light btn-lg">
                            <i class="fas fa-user-edit"></i> Quản lý Profile
                        </a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Features Section -->
        <div class="row mb-5">
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-layout-alt fa-3x text-primary mb-3"></i>
                        <h5 class="card-title">SiteMesh Layout</h5>
                        <p class="card-text">Sử dụng SiteMesh Decorators 3 để tạo layout nhất quán cho toàn bộ website.</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-user-cog fa-3x text-success mb-3"></i>
                        <h5 class="card-title">Quản lý Profile</h5>
                        <p class="card-text">Cập nhật thông tin cá nhân, upload ảnh đại diện với hỗ trợ multipart.</p>
                    </div>
                </div>
            </div>
            
            <div class="col-md-4 mb-4">
                <div class="card h-100">
                    <div class="card-body text-center">
                        <i class="fab fa-bootstrap fa-3x text-info mb-3"></i>
                        <h5 class="card-title">Bootstrap 5</h5>
                        <p class="card-text">Giao diện responsive, hiện đại với Bootstrap 5 và Font Awesome.</p>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Technology Stack -->
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h5 class="mb-0"><i class="fas fa-tools"></i> Công nghệ sử dụng</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-3 mb-3">
                                <div class="d-flex align-items-center">
                                    <i class="fab fa-java fa-2x text-danger me-3"></i>
                                    <div>
                                        <strong>Java Servlet</strong><br>
                                        <small class="text-muted">Backend Framework</small>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-3 mb-3">
                                <div class="d-flex align-items-center">
                                    <i class="fas fa-database fa-2x text-primary me-3"></i>
                                    <div>
                                        <strong>SQL Server</strong><br>
                                        <small class="text-muted">Database</small>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-3 mb-3">
                                <div class="d-flex align-items-center">
                                    <i class="fab fa-bootstrap fa-2x text-info me-3"></i>
                                    <div>
                                        <strong>Bootstrap 5</strong><br>
                                        <small class="text-muted">CSS Framework</small>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-3 mb-3">
                                <div class="d-flex align-items-center">
                                    <i class="fas fa-layer-group fa-2x text-success me-3"></i>
                                    <div>
                                        <strong>SiteMesh 3</strong><br>
                                        <small class="text-muted">Layout Framework</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>