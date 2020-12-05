
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>



<%@ taglib prefix="mt" tagdir="/WEB-INF/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<mt:admin_tamplate title="Projeto" breadcrumb="Lista_usuarios">
	<jsp:attribute name="content">

	
<table class="table table-sm">
		<thead>
			    <tr>
			     <th scope="col">ID</th>
			      <th scope="col">Nome</th>
			      <th scope="col">E-mail</th>
			      <th scope="col">Idade</th>
			      <th scope="col">Telefone</th>
			      
			    </tr>
		</thead>
		<tbody id="tbody">
			
			 <c:forEach var="li" items="${objParse}">
        <tr>
        	<td>0</td>
            <td>${li.nome}</td>
            <td>${li.email}</td>
            <td>${li.idade}</td>
            <td>${li.cpf}</td>
            
            
            
        </tr>
		</c:forEach>
			   
		</tbody>	
			    
			
</table>

	
		
		
	</jsp:attribute>

</mt:admin_tamplate>
<script>


	var vetor = []
	var objParse = []
	

	var nome = "";
	var email = "";
	var idade = "";
	var cpf = "";

	window.onload = a();
	function a() {
		//pegando o dado do localStorage
		
		var i = 0
		for (i = 0; i < localStorage.length; i++) {
			var a = localStorage.getItem("cadastrado" + i)
			vetor.push(a)
			var converter = JSON.parse(a);
			objParse.push(converter)
			
			nome = converter.nome;
			email = converter.email;
			idade = converter.idade;
			cpf = converter.cpf;
			//objParse.push([])
			//objParse[i][0]=nome;
			//objParse[i][1]=email;
			//objParse[i][2]=idade;
			//objParse[i][3]=cpf;

		}
		console.log(objParse)
		console.log(vetor)
		document.body.querySelector("#tbody").innerHTML = objParse;

	}
	
	
		
		document.write(<"td>" +x+ "/td>"")
	
	
	/*this.criar_tabela = function() {

		var linha = document.createElement("tr");
		var nome = document.createElement("td");
		var email = document.createElement("td");
		var idade = document.createElement("td");
		var cpf = document.createElement("td");
	}*/
	
</script>