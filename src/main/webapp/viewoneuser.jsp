<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 10px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        h1 {
            text-align: center;
        }
    </style>
</head>
<body>
    <h1>View User</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Password</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
          
           	 <tr>
                <td>${u.getId() }</td>
                <td>${u.getName() }</td>
                <td>${u.getEmail() }</td>
                <td>${u.getPhone() }</td>
                <td>${u.getPassword() }</td>
                <td>
                <a href="update?id=${u.getId() }"><button>update</button></a>
	<a href="deleteuser?id=${u.getId() }"><button>delete</button></a>
                
                </td>
            </tr>
           
        </tbody>
    </table>
</body>
</html>
