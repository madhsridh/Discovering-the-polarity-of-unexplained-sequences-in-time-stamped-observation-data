
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
		<li><a href="vproduct.jsp">Search Product</a></li>
        <li><a href="transaction.jsp">Transaction</a></li>
        <li><a href="myaccount.jsp">Log out </a></li>
        <li><a href="specials.jsp">Top selling books</a></li>
        <li><a href="category.jsp">Top liked books</a></li>
          
    </ul>
        </div>     
            
            
       </div> 
       
       
       <div class="center_content">
         <FORM action="" method="post" >
		<table border="0" align="center" bgcolor="#FFFFFF">
		  <% int index=0;
	try
	{
            String a11=null;
             	   HttpSession so = request.getSession(true);
 System.out.println(a11);
		int flag=0;
		String url="jdbc:mysql://localhost:3306/books";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con=DriverManager.getConnection(url,"root","root");
		Statement st=con.createStatement();
		ResultSet rs = st.executeQuery("select * from register where username='"+so.getAttribute("un")+"'");

    while(rs.next())
		{						
	 %>

          <tr>
            <td width="90%" height="611"><table width="100%" height="597" border="0" cellpadding="5" cellspacing="10">
              <tr>
                <td height="127"><table width="100%" height="200" border="0" cellpadding="5" cellspacing="5">
                  <tr>
                    <td width="49%" height="190"><table width="100%" border="0" cellspacing="5" cellpadding="5">
                        <tr>
                          <td width="25%" height="49"><span class="style63 style8"><strong>Name: </strong></span></td>
                          <td width="75%"><span class="style14"><%=rs.getString(2)%></span></td>
                        </tr>
                        <tr>
                          <td height="53"><span class="style63 style8"><strong>Email Id:</strong></span></td>
                          <td><span class="style14"><%=rs.getString(6)%></span></td>
                        </tr>
                        <tr>
                          <td height="50"><span class="style63 style8"><strong>Mobile No: </strong></span></td>
                          <td><span class="style14"><%=rs.getString(10)%></span></td>
                        </tr>
                    </table></td>
                    <td align="right"><table width="65%" border="0" cellspacing="2" cellpadding="2">
                        <tr>
                          <td height="145" align="center"><img src="userimage/<%=rs.getString(2)%>.jpg" width="219" height="135" /></td>
                        </tr>
                        <tr>
                          <td height="30" align="center"><a href="profile.jsp" class="style2 style63"><strong>Change Image</strong></a></td>
                        </tr>
                    </table></td>
                  </tr>
                </table></td>
              </tr>
              <tr>
                <td height="361" align="center"><table width="798" border="0">
  <tr>
    <td width="792" height="46" align="center"><span class="style48 style66">TRANSACTION DETAILS</span></td>
  </tr>
  <tr>
    <td height="117"><table width="735" border="0" bgcolor="" align="center">
                  <tr>
                    <td width="821"><table width="724" height="39" border="0">
                      <tr>
                        <td width="76" height="33"><div align="center" class="style64 style63 style55"><strong>Product Id </strong></div></td>
                        <td width="119"><div align="center" class="style64 style63 style55"><strong>Product Name </strong></div></td>
                        <td width="76"><div align="center" class="style64 style63 style55"><strong>Price</strong></div></td>
                        <td width="84"><div align="center" class="style64 style63 style55"><strong>Discount </strong></div></td>
                        <td width="108"><div align="center" class="style64 style63 style55"><strong> Amount </strong></div></td>
						   <td width="117"><div align="center" class="style64 style63 style55"><strong>No of Product</strong></div></td>
                       
                        <td width="114"><div align="center" class="style64 style63 style54 style53"><strong>Paid Date </strong></div></td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td><table width="725" height="39" border="0">
                      <% 
	try
	{
            String a111=null;
             	   HttpSession so1 = request.getSession(true);
 System.out.println(a11);
		int flag1=0;
		String url1="jdbc:mysql://localhost:3306/books";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con1=DriverManager.getConnection(url1,"root","root");
		Statement st11=con1.createStatement();
		ResultSet rs1 = st11.executeQuery("select * from purchase where uname='"+so1.getAttribute("un")+"'");

    while(rs1.next())
		{						
	 %>
                      <tr>
                        <td width="78" height="33"><div align="center"><%=rs1.getString(1)%></div></td>
                        <td width="115"><div align="center"><%=rs1.getString(3)%></div></td>
                        <td width="76"><div align="center"><%=rs1.getString(4)%></div></td>
                        <td width="87"><div align="center"><%=rs1.getString(5)%></div></td>
                        <td width="109"><div align="center"><%=rs1.getString(6)%></div></td>
                        <td width="118"><div align="center"><%=rs1.getString(7)%></div></td>
					             <td width="112"><div align="center"><%=rs1.getString(9)%></div></td>
                      </tr><%         } 
                	}catch (Exception e) {
		out.println(e);
	}
	%>
                    </table></td>
                  </tr>
                </table></td>
  </tr>
</table></td>
              </tr>
            </table></td>
          </tr><%
 
													
													} 
													}
	catch (Exception e) {
		out.println(e);
	}
	%>
        
      </table>

		      
</FORM>
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
