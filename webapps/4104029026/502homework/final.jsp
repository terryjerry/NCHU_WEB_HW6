<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page language="java" import="java.sql.*"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <title>final</title>
    <%request.setCharacterEncoding("UTF-8");%>
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
      String determine = request.getParameter("determine");
      String user = "4104029026";
      String pass = "Ss4104029026!";
      String ip = "140.120.49.205";
      String database = "4104029026";
      String url = "jdbc:mysql://" + ip + "/" + database + "?useUnicode=true&characterEncoding=utf-8";
      Connection con = null;
      Statement stmt = null;
      PreparedStatement ps = null;
      ResultSet rs = null;

      if(determine.equals("register")){
  			String account = request.getParameter("account2");
  			String password = request.getParameter("password2");
  			String username = request.getParameter("username");
  			String birthday = request.getParameter("birthday");
  			String memo = request.getParameter("memo");

        try{
  				Class.forName("com.mysql.jdbc.Driver").newInstance();
  				con = DriverManager.getConnection(url,user,pass);
  				stmt = con.createStatement();
  				rs = stmt.executeQuery("select * from test;");

          String sql = "insert into test (account,password,name,birthday,memo) values(?,?,?,?,?)";
          ps = con.prepareStatement(sql);
          ps.setString(1, account);
          ps.setString(2, password);
          ps.setString(3, username);
          ps.setString(4, birthday);
          ps.setString(5, memo);
          int a = ps.executeUpdate();
          %>
          <header id="header" class="alt">
              <nav>
                  <ul>
                      <li><strong><a href="../index.html" style="color:black">回主頁</a></strong></li>
                  </ul>
              </nav>
          </header>
          <%
          out.println(account + "登入成功");
          %><br/><br/><button><a href = "index.jsp" style="color:white;text-decoration: none;">返回登入頁面</a></button><%
          rs.close();
          ps.close();
          stmt.close();
          con.close();
  			}catch(Exception ex){
          out.println("帳號重複，請重新輸入");
          %><br/><br/><button><a href = "register.jsp" style="color:white;text-decoration: none;">返回註冊頁面</a></button><%
        }
      }else if(determine.equals("index")){
        String account = request.getParameter("account");
  			String password = request.getParameter("password");

        try{
  				Class.forName("com.mysql.jdbc.Driver").newInstance();
  				con = DriverManager.getConnection(url,user,pass);
  				stmt = con.createStatement();
  				rs = stmt.executeQuery("select * from test;");

          String sql = "select * from test";
          ps = con.prepareStatement(sql);
          rs = ps.executeQuery();
          int flag = 0;
          String text_account = "";
          String text_password = "";
          while(rs.next()){
            text_account = rs.getString("account");
            if(text_account.equals(account)){
              text_password = rs.getString("password");
              if(text_password.equals(password)){
                %>
                <header id="header" class="alt">
                    <nav>
                        <ul>
                            <li><strong><a href="../index.html" style="color:black">回主頁</a></strong></li>
                        </ul>
                    </nav>
                </header>
                <%
                out.println(account + "登入成功");
                %><br/><br/><%
                flag = 1;
              }
            }
  			  }
          if(flag == 0){
            throw new Exception("帳密輸入錯誤，請重新輸入");
          }
          ps = con.prepareStatement(sql);
          rs = ps.executeQuery();

          %>
          <div align="center">
          <table id="bord">
      			<tr>
      				<th>account</th>
      				<th>password</th>
              <th>name</th>
              <th>birthday</th>
              <th>memo</th>
      			</tr>
            <%
            while(rs.next()){
            %>
      			<tr align="center">
      				<td><%=rs.getString("account")%></td>
      				<td><%=rs.getString("password")%></td>
              <td><%=rs.getString("name")%></td>
              <td><%=rs.getString("birthday")%></td>
              <td><%=rs.getString("memo")%></td>
            </tr>
            <%
          }
          %>
      		</table>
          </div>
          <br><br>
          <div align="center">
            <form action="final.jsp" method="post" id="bord2">
              輸入帳號查詢：<input type='text' name="account3" size="15" required/><br>
              <input type="hidden" name="determine" value="search" ClientIDMode='Static' />
              <input type="submit" value="search" />
            </form>
          </div>

          <br/><br/><button><a href = "index.jsp" style="color:white;text-decoration: none;">返回登入頁面</a></button><br/><br/>
          <%
          rs.close();
          ps.close();
          stmt.close();
          con.close();
        }catch(Exception ex){
  				out.println(ex.getMessage());
          %><br/><br/><button><a href = "index.jsp" style="color:white;text-decoration: none;">返回登入頁面</a></button><%
  			}
      }else if(determine.equals("search")) {
          String account = request.getParameter("account3");
          try{
    				Class.forName("com.mysql.jdbc.Driver").newInstance();
    				con = DriverManager.getConnection(url,user,pass);
    				stmt = con.createStatement();
    				rs = stmt.executeQuery("select * from test;");

            String sql = "select * from test";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            int flag = 0;
            while(rs.next()){
              if(rs.getString("account").equals(account)){
              %>
              <header id="header" class="alt">
                  <nav>
                      <ul>
                          <li><strong><a href="../index.html" style="color:black">回主頁</a></strong></li>
                      </ul>
                  </nav>
              </header>
              <div align="center">
                <table id="bord">
            			<tr>
            				<th>account</th>
            				<th>password</th>
                    <th>name</th>
                    <th>birthday</th>
                    <th>memo</th>
            			</tr>
            			<tr align="center">
            				<td><%=rs.getString("account")%></td>
            				<td><%=rs.getString("password")%></td>
                    <td><%=rs.getString("name")%></td>
                    <td><%=rs.getString("birthday")%></td>
                    <td><%=rs.getString("memo")%></td>
                  </tr>
            		</table>
              </div>
              <%
              flag = 1;
            }
            }
            if(flag == 0){
              throw new Exception("帳號輸入錯誤，請重新輸入");
            }
            %><br><br>
            <div align="center">
              <form action="final.jsp" method="post" id="bord2">
                輸入帳號查詢：<input type='text' name="account3" size="15" required/><br>
                <input type="hidden" name="determine" value="search" ClientIDMode='Static' />
                <input type="submit" value="search" />
              </form>
            </div>
            <%
          }catch(Exception ex){
    				out.println(ex.getMessage());
            %><br><br>
            <div align="center">
              <form action="final.jsp" method="post" id="bord2">
                輸入帳號查詢：<input type='text' name="account3" size="15" required/><br>
                <input type="hidden" name="determine" value="search" ClientIDMode='Static' />
                <input type="submit" value="search" />
              </form>
            </div>
            <%
            %><br/><br/><button><a href = "index.jsp" style="color:white;text-decoration: none;">返回登入頁面</a></button><%
    			}
      }
    %>
  </body>
</html>
