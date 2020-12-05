 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<mt:admin_tamplate title="Projeto" breadcrumb="Cadastrar Usuarios">
	<jsp:attribute name="content">
	<section class="content">

	<section class="content-header">
			<form class="text-center border border-light p-5">
			
			    <p class="h4 mb-4">Editar Usuario</p>
				
				<div class="form-group">
				    <!-- Name -->
				    <input name="nome" type="text" id="nome"
							class="form-control mb-4" placeholder="Digite seu Nome">
			    </div>
			
				<div class="form-group">
				    <!-- Email -->
				    <input name="email" type="text" id="email"
							class="form-control mb-4" placeholder="Digite seu E-mail">
			    </div>
			    
			    <div class="form-group">
				     <!-- idade -->
				    <input name="idade" type="text" id="idade"
							class="form-control mb-4" placeholder="Data de nascimento">
			    </div>
			    <div class="form-group">
				     <!-- cpf -->
				    <input name="cpf" type="text" id="cpf"
							class="form-control mb-4" placeholder="Digite seu Cpf">
			    </div>
			
			    
			    <!-- Enviar -->
			    <button onclick="editar()" class="btn btn-info btn-sm"
						type="submit">Salvar</button>
			    
			    
			    
			    
			
			</form>
	     </section>
     
     
     </section>

	
</jsp:attribute>

</mt:admin_tamplate>

<script>

function editar(){
	
 	var nome = document.getElementById("nome").value;
	var email = document.getElementById("email").value;
	var idade = document.getElementById("idade").value;
	var cpf = document.getElementById("cpf").value;
	
	
	let usuario = []
	//Esse for joga todos os usuarios cadastrado no vetor usuario
	for (var b = 0; b < localStorage.length; b++) {
		//variavel recebe o usuario
		var recebe = JSON.parse(localStorage.getItem("cadastrado"+b))
		//envia o elemento para array
		usuario.push(recebe)
	}
	//para ver se ta aparecendo no console
	console.log(usuario)
	//Variavel do for
		var i = 0;
	//Variavel que vai receber o index do for
		var index = 0;
	//for basico com validação que vai ver se o cpf está cadastrado e se tiver vai editar
		for (i = 0; i < usuario.length; i++) {
			if(cpf == usuario[i].cpf){
				console.log("encontrado")
				index += i;
				
				var NovoUsuario = {
						nome: nome,
						email: email,
						idade: idade,
						cpf: cpf
					}
				
				var json = JSON.stringify(NovoUsuario);

				localStorage.setItem("cadastrado"+index, json);
			}else{
				console.log("não encontrado")
			}
			
		}
		
		event.preventDefault();
	
}

</script>