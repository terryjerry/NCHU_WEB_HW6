<%@ page pageEncoding="utf-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<title>123</title>
		<%request.setCharacterEncoding("UTF-8");%>
		<style>
        body {
            background-image: url("../indexold/images/lag.png");
            background-repeat: no-repeat;
            background-attachment: fixed;
        }
    </style>
	</head>
	<body>
		<%
			String name = request.getParameter("username");
			String birY = request.getParameter("birY");
			String birM = request.getParameter("birM");
			String birD = request.getParameter("birD");
			String sex = request.getParameter("sex");
			String blood = request.getParameter("ABO");
			String[] hobby = request.getParameterValues("hobby");
			String[] broth = request.getParameterValues("broth");
			String note = request.getParameter("note");
			out.println("姓名:" + name);%><br><%
			out.println("生日:" + birY + "年" + birM + "月" + birD + "日");%><br><%
			out.println("性別:" + sex);%><br><%
			out.println("血型:" + blood);%><br><%
			out.print("興趣:");
			for(int i=0;i<hobby.length;i++) {
				out.println(hobby[i] + "  ");
			}%><br><%
			out.print("兄弟姊妹:");
			for(int i=0;i<broth.length;i++) {
				out.println(broth[i] + "  ");
			}%><br><%
			out.print("自我介紹:" + note);
    %>
		<br>
		<a href = "index.html">回上頁</a>
	</body>
</html>
