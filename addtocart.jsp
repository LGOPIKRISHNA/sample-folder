<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String ff = request.getParameter("t1");
    String cc = request.getParameter("t2");
    String c_name = (String) session.getAttribute("fullname");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "9573");
        PreparedStatement pt = con.prepareStatement("insert into ordered values(?,?,?)");
        pt.setString(1, ff);
        pt.setString(2, cc);
        pt.setString(3, c_name);
        int flag = pt.executeUpdate();
        if (flag == 1) {
            con.close();
%>
            <div id='notificationqwer' style='position: center; margin-top: 20%;margin-left: 40%;margin-right: 40%; top: 70px; right: 800px; background-color: white; padding: 10px; border: 2px solid green;'>
                Hey! mr/ms. <%=c_name %> your order has been added to cart!!.....
            </div>
            <style>
                #notificationqwer {
                    display: block;
                    animation: fadeOut 20s forwards;
                }

                @keyframes fadeOut {
                    from {
                        opacity: 1;
                    }

                    to {
                        opacity: 0;
                    }
                }
            </style>
            <script>
                // Redirecting after displaying "added to cart" text
                setTimeout(function() {
                    window.location.href = 'loginedpage.jsp'; // Change 'other_page.jsp' to the URL of the page you want to redirect to
                }, 6000); // Redirect after 6 seconds (6000 milliseconds)
            </script>
<%
        } else {
            out.println("error");
        }
    } catch (Exception e) {
        out.println(e);
    }
%>
