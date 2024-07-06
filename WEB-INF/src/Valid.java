
import javax.servlet.*;
import java.io.*;
import javax.servlet.http.*;
import java.sql.*;
public class Valid extends GenericServlet
{
public void service(ServletRequest req,ServletResponse res) throws ServletException ,IOException
{
PrintWriter out=res.getWriter();
String name=req.getParameter("t1");
out.println("welcome:"+name);
RequestDispatcher rd=req.getRequestDispatcher("log.html");
rd.include(req,res);

}
}