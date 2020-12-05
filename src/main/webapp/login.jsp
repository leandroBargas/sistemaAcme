<!doctype html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>Login</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/4.4/examples/sign-in/">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/admin/css/bootstrap.min.css"/>
	<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    
    <link href="${pageContext.request.contextPath}/assets/admin/signin.css" rel="stylesheet">
    
  </head>
  
  <body class="text-center">
  
    <form class="form-signin"  action="${pageContext.request.contextPath}/ServletLogin" method = "post" >
    
		  <h1 class="h3 mb-3 font-weight-normal">SISTEMA ACME</h1>
		  
		  <label for="login" class="sr-only">Login</label>
		  <input type="text" id="login" name="login" class="form-control" placeholder="Insira o login" required autofocus>
		    <br/>
		  <label for="senha" class="sr-only">Senha</label>
		  <input type="password" id="senha" name ="senha" class="form-control" placeholder="Insira a Senha" required>
		  
		  
		   <input class="btn btn-lg btn-primary btn-block" type="submit"  name="enviar" id="enviar"  value="Logar"/> 
			
			<c:if test="${erro.erro != null}">
				<div class="alert alert-danger" role="alert">
  					${erro.erro}
				</div>
			</c:if>
			
			<c:if test="${erro.senha != null}">
				<div class="alert alert-danger" role="alert">
  					${erro.senha}
				</div>
			</c:if>
			
			<c:if test="${erro.login != null}">
				<div class="alert alert-danger" role="alert">
  					${erro.login}
				</div>
			</c:if>
			<c:if test="${erro.inativo != null}">
				<div class="alert alert-danger" role="alert">
  					${erro.inativo}
				</div>
			</c:if>
		   
		  <p class="mt-5 mb-3 text-muted">&copy; 2020</p><br>
		
	</form>
	
</body>




</html>

