<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>

<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>

<mt:admin_tamplate title="Projeto" breadcrumb="Remover Usuarios">
	<jsp:attribute name="content">
	
		<label id="txtRemover" >CPF do Usuario</label>
		<input id="inputRemover" name="inputremover" type="text">
		
		<button  onclick= "remover()" class="btn btn-info btn-sm" type="submit">Remover</button>
	</jsp:attribute>

</mt:admin_tamplate>

<script>
function remover(){
	var cpf = document.getElementById("inputRemover").value;
	
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
		var i = 0;
		var index = 0;
		for (i = 0; i < usuario.length; i++) {
			if(cpf == usuario[i].cpf){
				console.log("encontrado")
				index += i;
				console.log(index)
				
				localStorage.removeItem("cadastrado"+index);
			}else{
				console.log("não encontrado")
			}
			
		}
		
		
	
}

</script>