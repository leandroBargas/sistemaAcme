<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@page import="java.util.Collection"%>
<%@page import="java.util.List"%>

<mt:admin_tamplate title="Projeto" breadcrumb="Usuários">

	<jsp:attribute name="content">
	
	<section class="content">
			
		  <section class="content-header">
		  	<div>
				
				<h6>CONTATOS</h6>
				
			</div>
			
			<c:if test="${cadastrado != null}">
				<div class="alert alert-success" role="alert">
  					<p>${cadastrado}</p>
				</div>
			
			</c:if>
			
			
			<c:if test="${editado != null}">
				<div class="alert alert-primary" role="alert">
  					<p>${editado}</p>
				</div>
			
			</c:if>
		
  			<c:if test="${excluido != null}">
  				<div class="alert alert-warning" role="alert">
  					<p>${excluido}</p>
				</div>
			</c:if>
			
			<c:if test="${cliente != null}">
				<div class="alert alert-${cliente.ativo? "
						primary" : "danger"}" role="alert">
  					<p>${cliente.ativo? "Usuario Ativado" : "Usuario Desativado"}</p>
				</div>
			</c:if>
			 <span id="result"></span>
			
		
			<div>
					
				<table class="table table-sm">
				
					<thead>
					<tr>
						<th scope="col">ID</th>
						<th scope="col">Nome</th>
						<th scope="col">ATIVO_DESATIVO</th>
						<th scope="col">Telefone</th>
						<th scope="col">Email</th>
						<th scope="col">AÇÔES</th>
						
					</tr>
					</thead>
					
					<tbody>
						<c:forEach var="cliente" items="${listaCliente}">
						<tr>
							<td>${cliente.id}</td>
							
							<td>${cliente.nome}</td>
						
							<td>${cliente.ativo ? "Ativo" : "desativo"}</td>
						
							<td>${cliente.cpf}</td>
						
							<td>${cliente.email}</td>
							<td>
								<a
										href="${pageContext.request.contextPath}/ServletCliente?id=${cliente.id}&action=editar"
										class="btn btn-primary">Editar</a>
							
								<a
										href="${pageContext.request.contextPath}/ServletCliente?id=${cliente.id}&action=delete"
										class="btn btn-danger">Excluir</a>
								
								<a
										href="${pageContext.request.contextPath}/ServletCliente?id=${cliente.id}&action=ativar_desativar"
										class="btn btn-success">${cliente.ativo? "desativar" : "ativar"}</a>
								
								 <!--  <p id="buttonModal"   data-toggle="modal" data-target="#visualizarUsuario" data-whatever="${json}" /> -->
									
					 			
								 
								 
								  <button class="btn btn-warning" id="buttonvisu+${cliente.id}" value= ${cliente.id} onclick="abrirmodal(${cliente.id})" >VISUALIZAR</button> 
								
							</td>
						</tr>
							
							
					</c:forEach>
					 
					</tbody>
				</table>	
				
				  <!-- Inicio Modal Visualizar -->
		<div class="modal fade" id="visualizarUsuario" tabindex="-1"
						role="dialog" aria-labelledby="exampleModalLabel"
						aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Dados do usuario: </h5>
		        <button type="button" class="close" data-dismiss="modal"
										aria-label="Fechar">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <form class="text-center border border-light p-5">
		
			    
				<div class="form-group col-md-12">
					ID: <input type="hidden" name="id" id = "id" disabled='disabled'
												>
				</div>
				
				<div class="form-group">
				    <!-- Name -->
				    NOME: <input name="nome" type="text" disabled='disabled' id="nome"
												class="form-control mb-4">
			    </div>
			
				<div class="form-group">
				    <!-- dataNascimento -->
				    NASCIMENTO: <input name="dataNascimento" type="text" id="dataNascimento"
												class="form-control mb-4">
			    </div>
			    
			    <div class="form-group">
				    <!-- cpf -->
				    CPF: <input name="cpf" type="text" id="cpf" class="form-control mb-4">
			    </div>
			    <div class="form-group">
				    <!--  administrador-->
				    PERMISSÃO: <input name="adm" type="text" id="adm" class="form-control mb-4">
			    </div>
			    <div class="form-group">
				    <!-- login -->
				    LOGIN: <input name="email" type="email" id="email"
												class="form-control mb-4">
			    </div>
			    
			    
				
		      
								</div>
		      <div class="modal-footer">
		        <button type="button" data-dismiss="modal"
										class="btn btn-primary">Fechar</button>
		      </div>
		    </div>
		  </div>
		</div>
		<!-- Final Modal Visualizar -->
				
						
			</div>
			
				
			<div>
				<a href="${pageContext.request.contextPath}/admin/usuarios/cadastroUsuario.jsp"class="btn btn-info btn-sm" type="submit">Novo</a>
						
			</div> 
			
			
	     </section>
			<br><br>
     		
     	
     	
     	
     </section>
  
 
</jsp:attribute>

</mt:admin_tamplate>

<script type="text/javascript">


//Desse jeito tbm funciona!!
/*var btn = document.getElementById("buttonvisu");

btn.addEventListener("click",function(){
	
	var ourRequest = new XMLHttpRequest();
	ourRequest.open("GET", "${pageContext.request.contextPath }/AjaxCliente?id=3");
	ourRequest.onload=function(){
		var ourData = JSON.parse(ourRequest.responseText);
		console.log(ourData)
	};
	ourRequest.send();
})*/

	
		function abrirmodal(valor) {
			
			$.ajax({
				type : 'GET',
				data : {id: valor},
				url : '${pageContext.request.contextPath}/AjaxCliente?action=modal',
				headers : {
					Accept: "application/json; charset=utf-8",
					"Content-Type" : "application/json; charset=utf-8"
				},
				success : function(result) {
					
					var json = $.parseJSON(result);
					
					
					console.log(json)
					
					$('#visualizarUsuario').modal('show')
					
					//modal.find('.modal-title').text('Informações do usuario: ' + json.id)
					document.getElementById("nome").value = json.nome;
					document.getElementById("id").value = json.id.toString();
					document.getElementById("exampleModalLabel").value = json.nome;
					document.getElementById("adm").value = json.administrador?"Administrador":"Comum";
					document.getElementById("cpf").value = json.cpf;
					document.getElementById("email").value = json.email;
					document.getElementById("dataNascimento").value = json.dataNascimento;
					
					
  					
					}	
			});
		
}
	
	

	
</script>

