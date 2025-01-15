<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 8px;
            font-weight: bold;
        }
        input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        button {
            width: 100%;
            padding: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Details</h1>
        <form action="updateDetails" method="post">
            <label for="id">ID</label>
            <input type="text" id="id" name="id" placeholder="Enter your ID" value="${u.getId() }" readonly="readonly" required>

            <label for="name">Name</label>
            <input type="text" id="name" name="name" placeholder="Enter your name" value="${u.getName() }" required>

            <label for="email">Email</label>
            <input type="email" id="email" name="email" placeholder="Enter your email" value="${u.getEmail() }" required>

            <label for="phone">Phone</label>
            <input type="tel" id="phone" name="phone" placeholder="Enter your phone number" value="${u.getPhone() }" required>

            <label for="password">Password</label>
            <input type="password" id="password" name="password" placeholder="Enter your password" value="${u.getPassword() }" required>

            <button type="submit">Update</button>
        </form>
    </div>
</body>
</html>
