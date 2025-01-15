<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e9ecef;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
        }
        h1 {
            color: #343a40;
            margin-bottom: 30px;
            font-size: 2.5em;
            text-align: center;
        }
        a button, .search-container button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 20px;
            margin: 10px;
            border-radius: 5px;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        a button:hover, .search-container button:hover {
            background-color: #0056b3;
        }
        a {
            text-decoration: none;
        }
        .container {
            text-align: center;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .search-container {
            margin-top: 20px;
        }
        .search-container input {
            padding: 10px;
            font-size: 1em;
            border: 1px solid #ccc;
            border-radius: 5px;
            margin-right: 10px;
            width: calc(100% - 130px);
            max-width: 300px;
        }
        .search-container {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
    </style>
</head>
<body>
    <div class="container">
    	<h1>User management System</h1>
        <h1>${msg}</h1>
        <a href="userRegister"><button>Create User</button></a>
        <a href="updateuser"><button>Update User</button></a>
        <a href="viewUser"><button>View Users</button></a>
        <a href="login.jsp"><button>Logout</button></a>
    </div>
    <div class="search-container">
        <form action="searchUser" method="get">
            <input type="text" name="search" placeholder="Enter user email or name" required>
            <button type="submit">Search User</button>
        </form>
    </div>
</body>
</html>
