
<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.Jsoup"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="style.css" />

</head>
<body>
    
<div id="wrap">

       <div class="header">
       		<div class="logo"><a href="index.html"><img src="images/logo.gif" alt="" title="" border="0" /></a></div>            
        <div id="menu" style="width:800px;">
           <ul >
        <li><a href="sucess.jsp">Home</a></li>
		<li><a href="profile.jsp">Profile</a></li>
        <li><a href="product.jsp">Product</a></li>
		<li><a href="vproduct.jsp">Product opinion</a></li>
        <li><a href="transaction.jsp">Transaction</a></li>
        <li><a href="myaccount.jsp">Log out </a></li>
          
    </ul>
        </div>     
            
            
       </div> 
       
       
       <div class="center_content">
           <table width="905" border="0"  bgcolor="#FFFFFF" height="300" align="center">
                 <tr>
                <td height="600"><div align="center">
                        <div align="center">

                            <form  method="post" action="Annota">
                            <table align="center" width="500">
                                
                      
      <table width="1013" border="0" align="center">
  <tr>
    <td width="1003">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="171">
                      <%

String chk=(String)request.getAttribute("chk");
String line=(String)request.getAttribute("ok");
String line1=(String)request.getAttribute("ok2");
//Arrayli u=(String)request.getAttribute("ok1");
  
String mes="";
if(chk!=null)
{ 
    mes=(String)request.getAttribute("mes");
    
    
    
}  

%>
		    <p>
		    
		      <input type="submit" name="button2" id="stop" value="Stopwords" />
		      <input type="submit" name="button3" id="stemm" value="Stemmer" />
		      <input type="submit" name="button4" id="syn" value="Synonymword" />
	        </p>
		    <p>
		      <label for="textarea"></label>
		    .</p>
		    <table width="657" border="0" align="center">
		      
              <%
			ArrayList al1=(ArrayList)request.getAttribute("al1");
			if(al1!=null)
			{
			Iterator it;
			it=al1.iterator();
			while(it.hasNext())
			{
			
			%>
              <tr>
		        <td width="40"><strong>Pid</strong></td>
		        <td width="72"><strong>Pname</strong></td>
		        <td width="83"><strong>Pdetail</strong></td>
		        <td width="82"><strong>Price</strong></td>
		        <td width="87"><strong>Discount</strong></td>
		        <td width="87"><strong>Stock</strong></td>
		        <td width="96"><strong>Type</strong></td>
		        <td width="76"><strong>Uname</strong></td>
	          </tr>
		      <tr>
		        <td><%=it.next()%></td>
		        <td><%=it.next()%></td>
		        <td><%=it.next()%></td>
		        <td><%=it.next()%></td>
		        <td><%=it.next()%></td>
		        <td><%=it.next()%></td>
		        <td><%=it.next()%></td>
		        <td><%=it.next()%></td>
	          </tr>
                  <%}}%>
	        </table>
                    
		    <p>
		      <label for="textfield"></label>
                      <%if(request.getParameter("button2")!=null){%>
		      <label for="textarea2"></label>
		      <textarea name="textarea2" id="stop" cols="45" rows="5" ><%=line%></textarea>
                      <%}%>
		      <label for="textarea3"></label>
                      <%
                      ArrayList al=(ArrayList)request.getAttribute("ok1");
			if(al!=null)
			{
			Iterator it;
			it=al.iterator();
			  %>
		      <textarea name="textarea3" id="stemm" cols="45" rows="5"><%while(it.hasNext())
			{%><%=it.next()%><%}}%></textarea>
		    </p>
                    
		    <p>
		      <label for="textarea4"></label>
                       <%if(request.getParameter("button4")!=null){%>
		      <textarea name="textarea4" id="syn" cols="45" rows="5"><%=line1%></textarea>
                       <%}%>
		      <label for="textarea5"></label>
		    </p>
                    <%=mes%>
                    <%
            String lines="",lines1="";
            int pcount=0;
            int ncount=0;
            
            if(request.getParameter("pre")!=null)
            {
            lines=request.getParameter("textarea3");
            Class.forName("com.mysql.jdbc.Driver");
           Connection  con =DriverManager.getConnection("jdbc:mysql://localhost:3306/books","root","root");
            Statement st=con.createStatement();
            
                ResultSet rs1=st.executeQuery("select * from posword1");
                while(rs1.next())
                {
                   if(lines.contains(rs1.getString(1)) )
                   {
                       pcount=pcount+1;
                       out.println(rs1.getString(1));
                   }
                 }
                Statement st2=con.createStatement();
                ResultSet rs2=st.executeQuery("select * from negword1");
                while(rs2.next())
                {
                   if(lines.contains(rs2.getString(1).trim()))
                   {
                       ncount=ncount+1;
                       out.println(rs2.getString(1));
                     }
                }
            if(pcount>ncount){
                lines1="positive";
            }else if(pcount<ncount){
                lines1="negative";
            }else if(pcount==ncount){
                lines1="Intermediate";
            }else{
                lines1="no Comments";
            }
            
            }
             %>

            <table align="center" width="500">
                <tr>
                  <td height="57">&nbsp;</td>
                </tr>
                <tr>
                  <td align="center">&nbsp;</td>
                </tr>
                <tr><td height="50"><div align="right"><input type="submit" name="pre" value="Preprocess"></div></td>
                    
                            <tr><td><div align="center">
                                        <table align="center" width="500">
                                            <tr><td><div align="center">Positive</div></td><td><div align="center">Negative</div></td></tr>
                                                <tr><td><div align="center"><%=pcount%></div></td><td><div align="center"><%=ncount%></div></td></tr>
                                              <tr><td><div align="center">Result</div></td><td><div align="center">Negative</div></td></tr>
                                                <tr><td><div align="center"><%=lines1%></div></td><td><div align="center"><%=ncount%></div></td></tr>   
                                       </table>
                                       
                                     </div>
                                       
            </table>
		 
    </td>
  </tr>
</table>
                                       </form>

           
       	<!--end of left content--><!--end of right content-->
        
        
       
       
       <div class="clear"></div>
       </div><!--end of center content-->
       
              
       <div class="footer">
       	<div class="left_footer"><img src="images/footer_logo.gif" alt="" title="" /><br /> <a href="http://csscreme.com/freecsstemplates/" title="free templates"><img src="images/csscreme.gif" alt="free templates" title="free templates" border="0" /></a></div>
        <div class="right_footer">
        <a href="#">home</a>
        <a href="#">about us</a>
        <a href="#">services</a>
        <a href="#">privacy policy</a>
        <a href="#">contact us</a>
       
        </div>
        
       
       </div>
    

</div>

</body>
</html>
