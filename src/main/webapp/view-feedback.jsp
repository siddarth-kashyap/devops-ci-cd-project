<%@ page import="java.io.*" %>
<html>
<head><title>Feedback Dataset</title></head>
<body>
    <h2>Pre-loaded Feedback Dataset</h2>
    <table border="1" cellpadding="5">
        <tr><th>Name</th><th>Email</th><th>Feedback</th><th>Rating</th><th>Date</th></tr>
        <%
            String filePath = application.getRealPath("/") + "sample-feedback.csv";
            try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
                String line = br.readLine(); // skip header
                while ((line = br.readLine()) != null) {
                    String[] cols = line.split(",");
                    if (cols.length >= 5) {
                        out.print("<tr><td>"+cols[0]+"</td><td>"+cols[1]+"</td><td>"+cols[2]+"</td><td>"+cols[3]+"</td><td>"+cols[4]+"</td></tr>");
                    }
                }
            } catch(Exception e) {
                out.print("<tr><td colspan='5'>Error loading dataset.</td></tr>");
            }
        %>
    </table>
    <br>
    <a href="index.jsp">Back to Home</a>
</body>
</html>