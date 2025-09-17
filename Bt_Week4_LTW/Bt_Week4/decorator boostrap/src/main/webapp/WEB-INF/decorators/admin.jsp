<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="sitemesh" uri="http://www.opensymphony.com/sitemesh/decorator" %>

<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin - <sitemesh:write property="title"/></title>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    
    <style>
        .admin-sidebar {
            background: #343a40;
            min-height: 100vh;
        }
        .admin-content {
            background: #f8f9fa;
            min-height: 100vh;
        }
    </style>
    
    <sitemesh:write property="head"/>
</head>
<body>
    <div class="container-fluid">
        <div class="row">
            <!-- Sidebar -->
            <div class="col-md-2 admin-sidebar p-0">
                <div class="text-white p-3">
                    <h5><i class="fas fa-cog"></i> Admin Panel</h5>
                </div>
                <!-- Navigation menu here -->
            </div>
            
            <!-- Main Content -->
            <div class="col-md-10 admin-content p-4">
                <sitemesh:write property="body"/>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <sitemesh:write property="javascript"/>
</body>
</html>