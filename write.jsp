<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>

 

<html>

 

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width" , initial-scale="1">

<!-- 반응형 웹설정 -->

<link rel="stylesheet" href="css/bootstrap.css">

<!-- css참조 -->

<link rel="stylesheet" href="css/custom.css">

<title>막개발의 JSP 게시판 만들기</title>

</head>

 

<body>

 

    <%

        String userID = null; /* 로그인 되어있지 않은 사람은 userID에 null값을 받음*/

        if (session.getAttribute("userID") != null) {

            userID = (String) session.getAttribute("userID"); /* 로그인 된 사람은 userID 에 본인 아이디 값을 받음 */

        }

    %>

 

    <!-- 네비게이션 -->

 

    <nav class="navbar navbar-default">

 

        <div class="navbar-header">

 

            <button type="button" class="navbar-toggle collapsed"

                data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"

                aria-expanded="false">

 

                <span class="icon-bar"></span> <span class="icon-bar"></span> <span

                    class="icon-bar"></span>

 

            </button>

 

            <a class="navbar-brand" href="main.jsp">JSP 게시판 웹사이트</a>

 

        </div>

 

        <div class="collapse navbar-collapse"

            id="bs-example-navbar-collapse-1">

 

            <ul class="nav navbar-nav">

 

                <li><a href="main.jsp">메인</a></li>

 

                <li class="active"><a href="bbs.jsp">게시판</a></li>

 

            </ul>

            <%

                if (userID == null) {

            %>

            <!-- 로그인 하지 않은 사람들이 볼 수 있는 페이지 -->

            <ul class="nav navbar-nav navbar-right">

 

                <li class="dropdown"><a href="#" class="dropdown-toggle"

                    data-toggle="dropdown" role="button" aria-haspopup="true"

                    aria-expanded="false">접속하기<span class="caret"></span></a>

 

                    <ul class="dropdown-menu">

 

                        <li><a href="login.jsp">로그인</a></li>

                        <li><a href="join.jsp">회원가입</a>

                        <li>

                    </ul></li>

 

            </ul>

            <%

                } else {

            %>

            <!-- 로그인 된사람들이 볼 수 있는 페이지 -->

            <ul class="nav navbar-nav navbar-right">

 

                <li class="dropdown"><a href="#" class="dropdown-toggle"

                    data-toggle="dropdown" role="button" aria-haspopup="true"

                    aria-expanded="false">회원관리<span class="caret"></span></a>

 

                    <ul class="dropdown-menu">

 

                        <li><a href="logoutAction.jsp">로그아웃</a></li>

                        <li>

                    </ul></li>

 

            </ul>

            <%

                }

            %>

        </div>

 

    </nav>

 

    <div class="container">

        <div class="row">

            <form method="post" action="writeAction.jsp">

                <!-- 작성된 글은, 아래의 submit을 통해 writeAction.jsp로 보냄 -->

                <table class="table table-striped"

                    style="text-align: center; border: 1px solid #dddddd">

                    <thead>

                        <!-- 테이블 속성 -->

                        <tr>

                            <th colspan="2"

                                style="background-color: #eeeeee; text-align: center;">게시판

                                글쓰기</th>

                            <!-- 2개에 걸처 사용되도록 colspan="2" -->

                        </tr>

                    </thead>

 

                    <tbody>

                        <tr>

                            <td><input type="text" class="form-control"    placeholder="글 제목" name="bbsTitle" maxlength="50"></td>

                                </tr>

                                <tr>

                            <td><textarea class="form-control" placeholder="내 용" name="bbsContent" maxlength="2048"    style="height: 350px;"></textarea></td>

                            <!-- 장문의 글을 쓸수있는 textarea -->

                        </tr>

                    </tbody>

                </table>

                <input type="submit" class="btn btn-primary pull-right" value="글쓰기">

            </form>

        </div>

    </div>

 

    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>

 

    <!--애니메이션 담당할 제이쿼리 참조  -->

 

    <script src="js/bootstrap.js"></script>

 

    <!-- 부트스트랩에서 제공하는 자바스크립트 참조 -->

</body>

 

</html>
[출처] 17. 게시판 글작성 페이지 write.jsp 만들기|작성자 막돼먹은 개발자
