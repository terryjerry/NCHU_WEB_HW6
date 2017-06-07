<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*"%>
<jsp:useBean id="database" class="com.database.Database">
  <jsp:setProperty property="ip" name="database" value="140.120.49.205"/>
  <jsp:setProperty property="port" name="database" value="3306"/>
  <jsp:setProperty property="db" name="database" value="4104029026"/>
  <jsp:setProperty property="user" name="database" value="4104029026"/>
  <jsp:setProperty property="password" name="database" value="Ss4104029026!"/>
</jsp:useBean>
<%
  database.connectDB();
  request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>final</title>
    <link rel="stylesheet" href="assets/css/main2.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <style>
        body {
            background-image: url("background.jpg");
        }
        #bord {
          border-radius:50px;
          -moz-border-radius:50px;
          -webkit-border-radius:50px;
          -webkit-box-shadow:0px 0px 50px 20px #00f9ff inset;
          -moz-box-shadow:0px 0px 50px 20px #00f9ff inset;
          box-shadow:0px 0px 50px 20px #00f9ff inset;
          margin-right: 10%;
          margin-left: 10%;
        }
        #bord2 {
          border-radius:50px;
          -moz-border-radius:50px;
          -webkit-border-radius:50px;
          -webkit-box-shadow:0px 0px 50px 20px #00f9ff inset;
          -moz-box-shadow:0px 0px 50px 20px #00f9ff inset;
          box-shadow:0px 0px 50px 20px #00f9ff inset;
          margin-right: 38%;
          margin-left: 38%;
        }
    </style>

  </head>
  <body align="center">
    <%
      if(session.getAttribute("user") == null){
        out.println("請重新登入");
        response.setHeader("Refresh","0; URL=index.jsp");
      }
      try {
        String account = request.getParameter("account3");
        String sql = "select * from test where account='" + account + "'";
        database.query(sql);
        ResultSet rs = database.getRS();
        %>
        <header id="header" class="alt">
            <nav>
                <ul>
                    <li><strong><a href="../index.html" style="color:black">回主頁</a></strong></li>
                </ul>
            </nav>
        </header>
        <%
        if(rs.next()){
          %>
            <div align="center">
              <table id="bord">
                <tr>
                  <th>account</th>
                  <th>password</th>
                  <th>username</th>
                  <th>birthday</th>
                  <th>memo</th>
                </tr>
                <tr align="center">
                  <td><%=rs.getString("account")%></td>
                  <td><%=rs.getString("password")%></td>
                  <td><%=rs.getString("username")%></td>
                  <td><%=rs.getString("birthday")%></td>
                  <td><%=rs.getString("memo")%></td>
                </tr>
              </table>
            </div>
            <%
        }
        %>
        <br><br>
        <div align="center">
          <form action="search.jsp" method="post" id="bord2">
            輸入帳號查詢：<input type='text' name="account3" size="15" required/><br>
            <input type="hidden" name="determine" value="search" ClientIDMode='Static' />
            <input type="submit" value="search" />
          </form>
        </div>
        <br/><a href="logout.jsp"><button>登出</button><a/><br/>
        <%
        rs.close();
      }catch(Exception ex){
        out.println(ex.getMessage());
        response.setHeader("Refresh","2; URL=search.jsp");
      }
    %>
  </body>
</html>
