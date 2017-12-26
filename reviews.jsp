
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
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1252" />
<title>Book Store</title>
<link rel="stylesheet" type="text/css" href="style.css" />

</head>
<body>
    <%
            Connection con;
                                                Statement st;
                                                PreparedStatement ps;

            String content = "";

            
            
            if (request.getParameter("subdset") != null) {
                String dset = request.getParameter("dset");

                BufferedReader br = new BufferedReader(new FileReader(dset));
                String str1 = "", str2 = "";

                while ((str1 = br.readLine()) != null) {
                    str2 = str2 + " " + str1;
                }

                content = str2;
            }

            if (request.getParameter("suburl") != null) {
                String url1 = request.getParameter("url");
                URL url = new URL(url1);
                URLConnection conn = url.openConnection();
                BufferedReader br = new BufferedReader(
                        new InputStreamReader(conn.getInputStream()));
                String str1 = "", str2 = "";

                while ((str1 = br.readLine()) != null) {
                    str2 = str2 + " " + str1;
                }
                content = str2;
                Document doc = Jsoup.parse(content);
               content=doc.text();

            }

        %>
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

                           
                            <table align="center" width="500">
                                
                        <form action="reviews.jsp" method="post">
                                 <tr><td width="200" height="60">Data Set</td><td width="300"  align="center" ><b><input type="file" style="height: 30px" name="dset" size="60" /></b></td></tr>   
                                 <tr><td width="200" height="60"></td><td width="300" align="center"><b><input type="submit" name="subdset" size="30" value="GetContent" /></b></td></tr>   
                                  <tr><td width="200" height="60"></td><td width="300" align="center"><b></b></td></tr>   

                         
                     </table>
                  </div>
              </div></td>
            </tr>
            
            <tr><td align="center"  height="400"> 
                
                    <table align="center" width="400">
                        <tr><td width="200" height="60"></td><td width="300" align="center"></td></tr>
                         <tr><td width="200" height="60"></td><td width="300" align="center"><b>Extracted Data</b></td></tr>
                                
                                <tr><td width="200" height="60"></td><td width="300" ><b><textArea name="content" rows="20" cols="70" ><%=content%></textArea></b></td></tr> 
                                 
                                    <tr><td width="200" height="60"></td><td width="300" align="center"><b><input type="submit" name="review" size="30" value="GetReview" /></b></td></tr>   

 <%
            int pos = 0;
            int neg = 0;
             ArrayList<String> listp=new ArrayList<String>();//Creating arraylist  
  ArrayList<String> listn=new ArrayList<String>();
            System.out.println(content);
            if (request.getParameter("review") != null) {
                    content=request.getParameter("content");
               
                  try {
                     
                    String t3, t4 = "";
                    ResultSet rs, rs1 = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/noval", "root", "root");
                    String str1, str2 = "";

                    //while ((str1 = br.readLine()) != null) {
                        String[] strd = content.split(" ");
                       for (int i = 0; i < strd.length; i++) {
                            System.out.println(strd[i]);

                            st = con.createStatement();
                            rs = st.executeQuery("select * from posword1");

                            while (rs.next()) {
                                if ((rs.getString(1).contains(strd[i])) && (strd[i].equals(rs.getString(1)))) {
                                    pos = pos + 1;
                                    listp.add(rs.getString(1));
                                }
                            }

                            rs.close();
                            st.close();

                            st = con.createStatement();
                            rs = st.executeQuery("select * from negword1");

                            while (rs.next()) {
                                
                                if((rs.getString(1).contains(strd[i])) && (strd[i].equals(rs.getString(1)))) {
                                    neg = neg + 1;
                                    listn.add(rs.getString(1));
                                }
                            }

                            rs.close();
                            st.close();
                            
                        }
                        System.out.println(pos + "  " + neg);

                    //}

                } catch (Exception e) {
                    e.printStackTrace();
                }

            }

        %>

<tr>
                                  <td width="200" height="60">positive 
reviews </td>
                                  <td><input type="text" 
name="positive" value="<%=pos%>" /></td>
                      
</tr>
 <tr>
                                  <td width="200" height="60">positive 
words </td>
                                  <td><input type="text" 
name="positivewords" value="<%=listp%>" /></td>
                                </tr>
                              
                                <tr>
                                   <td width="200" height="60">Negative review</td>
                                  <td><input type="text" 
name="negative" value="<%=neg%>" /></td>
 
 </tr> 
<tr>
                                   <td width="200" height="60">Negative 
words</td>
                                  <td><input type="text" 
name="negativewords" value="<%=listn%>" /></td></tr>

                            
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
