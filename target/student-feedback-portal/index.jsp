<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Feedback Portal</title>
</head>
<body>
    <h2>Submit Your Feedback</h2>
    <form action="submit-feedback" method="POST">
        <label>Name:</label><br>
        <input type="text" name="name" required><br><br>
        
        <label>Email:</label><br>
        <input type="email" name="email" required><br><br>
        
        <label>Feedback:</label><br>
        <textarea name="message" required></textarea><br><br>
        
        <input type="submit" value="Submit">
    </form>
</body>
</html>