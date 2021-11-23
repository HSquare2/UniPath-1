<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>Unipath</title>
    <link rel="icon" href="<%=basePath%>img/logo.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="<%=basePath%>css/index.css" />
    <script type="text/javascript" src="<%=basePath%>js/jquery.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/materialize.min.js" ></script>
    <script type="text/javascript" src="<%=basePath%>js/index.bundle.js" ></script>
    <link rel="stylesheet" href="<%=basePath%>css/materialize-icon.css" />
    <link rel="stylesheet" href="<%=basePath%>css/detail.css" />
    <script>
       function showLogin() {
            if($("#signup-show").css("display")=='block'){
                $("#signup-show").css("display","none");
            }
            if($("#login-show").css("display")=='none'){
                $("#login-show").css("display","block");
            }else{
                $("#login-show").css("display","none");
            }
        }
        function showSignup() {
            if($("#login-show").css("display")=='block'){
                $("#login-show").css("display","none");
            }
            if($("#signup-show").css("display")=='none'){
                $("#signup-show").css("display","block");
            }else{
                $("#signup-show").css("display","none");
            }
        }
        function ChangeName() {
            if($("#changeName").css("display")=='none'){
                $("#changeName").css("display","block");
            }else{
                $("#changeName").css("display","none");
            }
        }
    </script>
    
    <script type="text/javascript">
    
    function  addFocus(id) {
    	location.href = '<%=basePath%>user/addFocus/'+id
    	alert("已关注成功，查看关注列表~")
    	
    }
    
	/* 前往支付 */
    function  toPay(id) {
    	window.location.href = '<%=basePath%>goods/buyId/'+id
    }
	
    </script>
    
    
<body ng-view="ng-view">

<div ng-controller="headerController" class="header stark-components navbar-fixed ng-scope">
    <nav class="white nav1">
        <div class="nav-wrapper">
            <a href="<%=basePath%>goods/homeGoods" class="logo">
                <em class="em1"></em>
                <em class="em2">Unipath</em>
                <em class="em3"></em>
            </a>
            <div class="nav-wrapper search-bar">
                <form ng-submit="search()" class="ng-pristine ng-invalid ng-invalid-required" action="<%=basePath%>goods/search">
                    <div class="input-field">
                        <input id="search" name="str" placeholder="Searching..." style="height: 40px;"
                               class="ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required"/>
                        <input type="submit" class="btn"value="Search"></input>
                        <label for="search" class="active">
                            <i ng-click="search()" class="iconfont"></i>
                        </label>
                         
                    </div>
                   
                </form>
            </div>
            <ul class="right">
                <c:if test="${empty cur_user}">
                    <li class="publish-btn">
                        <button onclick="showLogin()" data-toggle="tooltip" 
                                title="You need to login！" class="red lighten-1 waves-effect waves-light btn" 	>
                            Upload</button>
                          
                    </li>
                </c:if>
                <c:if test="${!empty cur_user}">
                    <li class="publish-btn">
                        <button data-position="bottom" class="red lighten-1 waves-effect waves-light btn">
                            <a href="<%=basePath%>goods/publishGoods">Upload</a>
                        </button>
                    </li>
                    <li>
                        <a href="<%=basePath%>user/allGoods">My Items</a>
                    </li>
                    <li>
                        <a>${cur_user.username}</a>
                    </li>
                   <!--  <li class="notification">
                        <i ng-click="showNotificationBox()" class="iconfont"></i>
                        <div ng-show="notification.tagIsShow" class="notification-amount red lighten-1 ng-binding ng-hide">0 </div>
                    </li> -->
                    <li class="changemore">
                        <a class="changeMoreVertShow()">
                            <i class="iconfont"></i>
                        </a>
                        <div class="more-vert">
                            <ul class="dropdown-content">
                                <li><a href="<%=basePath%>user/home">My Home</a></li>
                                 <li><a href="<%=basePath%>user/allFocus">My List</a></li>
                                <li><a onclick="ChangeName()">Change username</a></li>
                                <li><a href="<%=basePath%>admin" target="_blank">admin</a></li>
                                <li><a href="<%=basePath%>user/logout">LogOut</a></li>
                            </ul>
                        </div>
                    </li>
                </c:if>
                <c:if test="${empty cur_user}">
                    <li>
                        <a onclick="showLogin()">LogIn</a>
                    </li>
                    <li>
                        <a onclick="showSignup()">Register</a>
                    </li>
                </c:if>
            </ul>
        </div>
    </nav>
</div>
<!--

    描述：登录
-->
<div ng-controller="loginController" class="ng-scope">
    <div id="login-show" class="login stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <a onclick="showLogin()">
                    <div class="col s12 title"></div>
                </a>
                <form action="<%=basePath%>user/login" method="post" commandName="user" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="phone" required="required" pattern="^1[0-9]{10}$" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>Phone</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="password" name="password" required="required" class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
                        <label>Password</label>
                        <!-- <a ng-click="showForget()" class="forget-btn">忘记密码？</a> -->
                    </div>
                    <button type="submit" class="waves-effect waves-light btn login-btn red lighten-1">
                        <i class="iconfont left"></i>
                        <em>LogIn</em>
                    </button>
                    <div class="col s12 signup-area">
                        <em>Don't have an account</em>
                        <a onclick="showSignup()" class="signup-btn">Register</a>
                        <em></em>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<!--

    描述：注册
-->
<div ng-controller="signupController" class="ng-scope">
    <div id="signup-show" class="signup stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <a onclick="showSignup()">
                    <div class="col s12 title"></div>
                </a>
                <form:form action="../../user/addUser" method="post" commandName="user" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="username" required="required" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>昵称</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="text" name="phone" required="required" pattern="^1[0-9]{10}$" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>Phone</label>
                    </div>
                    <div class="input-field col s12">
                        <input type="password" name="password" required="required" class="validate ng-pristine ng-untouched ng-empty ng-invalid ng-invalid-required" />
                        <label>Password</label>
                    </div>
                    <div ng-show="checkTelIsShow" class="col s12">
                        <button type="submit" class="waves-effect waves-light btn verify-btn red lighten-1">
                            <i class="iconfont left"></i>
                            <em>Register</em>
                        </button>
                    </div>
                    <div ng-show="checkTelIsShow" class="login-area col s12">
                        <em>Already have an account</em>
                        <a onclick="showLogin()">LogIn</a>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<!--更改用户名-->
<div ng-controller="changeNameController" class="ng-scope">
    <div id="changeName" class="change-name stark-components">
        <div class="publish-box z-depth-4">
            <div class="row">
                <div class="col s12 title">
                    <h1>Change</h1>
                </div>
                <form:form action="../../user/changeName" method="post" commandName="user" role="form">
                    <div class="input-field col s12">
                        <input type="text" name="username" required="required" class="validate ng-pristine ng-empty ng-invalid ng-invalid-required ng-valid-pattern ng-touched" />
                        <label>Change username</label>
                    </div>
                    <div ng-show="checkTelIsShow" class="col s12">
                        <button class="waves-effect waves-light btn publish-btn red lighten-1">
                            <i class="iconfont left"></i>
                            <em>Confirm</em>
                        </button>
                    </div>
                </form:form>
            </div>
        </div>
    </div>
</div>
<!--显示商品详情-->
<div ng-controller="detailBoxController" class="detail-box stark-components z-depth-1 row ng-scope">
    <div class="col s12 path">
        <a href="<%=basePath%>goods/catelog/${catelog.id}">${catelog.name}</a>
        <em>></em>
        <a>${goodsExtend.goods.name}</a>
    </div>
    <div class="col s6">
        <div class="slider" style="height: 440px;">
            <ul class="slides" style="height: 400px;">
                <img src="<%=basePath%>upload/${goodsExtend.images[0].imgUrl}" />
            </ul>
            <ul class="indicators" style="display:none;">
                <li class="indicator-item"></li>
                <li class="indicator-item"></li>
                <li class="indicator-item"></li>
                <li class="indicator-item"></li>
            </ul>
        </div>
    </div>
    <div class="col s6">
        <h1 class="item-name">${goodsExtend.goods.name}</h1>
        <h2 class="item-price">${goodsExtend.goods.price}</h2>
        <h2 class="publisher-info-title">Original：<span style="text-decoration:line-through;">${goodsExtend.goods.realPrice}</span></h2>
        <div class="item-public-info">
            <p class="bargain"></p>
            <p>
                <i class="iconfont"></i>
                <em class="item-location">Pace University</em>
            </p>
        </div>
        <div class="publisher-info-title">
            <em>Seller information</em><hr>
        </div>
        <c:if test="${empty cur_user}">
            <div class="item-contact">
                <p class="not-login">
                    <a onclick="showLogin()">Login</a>
<%--                    <em>or</em>--%>
                    <a onclick="showSignup()">Register</a>
<%--                    <em>Check contact information</em>--%>
                </p>
            </div>
        </c:if>
        <c:if test="${!empty cur_user}">
            <div class="item-contact">
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <i class="iconfont"></i>
                    </div>
                    <div class="value">${seller.username}</div>
                </div>
                <div>
                    <div class="base-blue z-depth-1 attr">
                        <i class="iconfont"></i>
                    </div>
                    <div class="value">${seller.phone}</div>
                </div>
                <div>
              
               <input type="button" value="Add to my list" class="blue lighten-1 waves-effect waves-light btn" id="btn_cart" onclick="addFocus(${goodsExtend.goods.id})"></input>
               <c:if test="${cur_user.id==goodsExtend.goods.userId}">
               <input type="button" value="Pay now" data-toggle="tooltip"  title="Unable to buy my item" disabled="disabled" class="blue lighten-1 waves-effect waves-light btn" id="btn_buy"></input>
                </c:if>
                <c:if test="${cur_user.id!=goodsExtend.goods.userId}">
               <input type="button" value="Pay now"  class="blue lighten-1 waves-effect waves-light btn" id="btn_buy" onclick="toPay(${goodsExtend.goods.id})"></input>
                </c:if>
                </div>
                
            </div>
        </c:if>
        <h1 class="item-pub-time">Upload time ${goodsExtend.goods.startTime}</h1>
    </div>
</div>
<div class="detail-box stark-components z-depth-1 row">
    <h1 class="title">Item description</h1>
    <hr class="hr1" />
    <hr class="hr2" />
    <p class="section">Description：${goodsExtend.goods.describle}</p>
    <p class="section"></p>
    <p class="section">

    </p>
</div>
<div class="row detail-area">
    <div class="clo s12">
        <div ng-controller="commentController" class="comment stark-components z-depth-1 ng-scope">
            <h1 class="title">Comments</h1>
            <hr class="hr1" />
            <hr class="hr2" />
            <c:forEach var="item" items="${CommentExtend.comments}"  >
            <div class="comment-collection">
                <div class="comment-item ng-scope">
                    <div class="comment-main-content">
               <em class="name ng-binding">${item.user.username}:</em>
                        <em class="ng-hide">Reply</em>
                        <em class="name ng-binding ng-hide">@:</em>
                        <em class="ng-binding">${item.content}</em>
                    </div>
                    <div class="comment-function">
                        <em class="time ng-biinding">${item.createAt}</em>
                       
                       <!--  <a class="reply-or-delete">删除</a>
                        <a class="reply-or-delete">回复</a> -->
                    </div>
                </div>
            </div>
             </c:forEach>
          <form id="addCommentForm" class="form-horizontal" >
            <div class="comment-add row">
                <div class="input-field col s12">
                    <i class="iconfont prefix"></i>
                    <input id="goodsId" name="goods.id" value="${goodsExtend.goods.id}" type="hidden"/>
                    <input id="commentbox" type="text" name="content" class="validate ng-pristine ng-untouched ng-valid ng-empty"/>
                    <label for="commentbox">Write down your comments</label>
                    <c:if test="${!empty cur_user}">
                    <button type="button" class="waves-effect wave-light btn comment-submit" onclick="addComments()">Confirm</button>
                    </c:if>
                   <%--   <c:if test="${!empty cur_user} && ${cur_user.id!=goodsExtend.comments.userId}">
                    <button type="submit" class="waves-effect wave-light btn comment-submit">确认</button>
                    </c:if>
                     <c:if test="${!empty cur_user} && ${cur_user.id==goodsExtend.comments.userId}">
                    <button data-toggle="tooltip"  title="您已经评论过了哦！" disabled="disabled"  class="waves-effect wave-light btn comment-submit">确认</button>
                    </c:if> --%>
                     <c:if test="${empty cur_user}">
                    <button href="javacript:void(0);" data-toggle="tooltip"  title="you need login" disabled="disabled" class="waves-effect wave-light btn comment-submit">Confirm</button>
                    </c:if>
                   
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
</body>
<script type="text/javascript">
/* 评论 */
function addComments(){
	$.ajax({
		url:'<%=basePath%>goods/addComments',
		type:'POST',
		data:$('#addCommentForm').serialize(),// 序列化表单值  
		dataType:'json',
	/* 	success:function(json){
			alert(1)
			alert(json.msg)
		},
		error:function(){
			alert('请求超时或系统出错!');
		} */
	});
	alert("Comments have been made")
	window.location.reload();
}
</script>
</html>