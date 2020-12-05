package br.com.cliente.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import br.com.projeto.model.Cliente;
import br.com.projeto.services.ClienteService;
import br.com.projeto.utils.Constantes;

/**
* @author Leandro
 */

@WebServlet("/ServletCliente")
public class ServletCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private Cliente cliente;
	private ClienteService service;
	
	
    
    public ServletCliente() {
        super();
        service = new ClienteService();
           
    }
    
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	// TODO Auto-generated method stub
		String action = request.getParameter(Constantes.ACTION);
		
		try {
			switch (action) {
				case Constantes.EDITAR:
					editar(request, response);
					break;
				case Constantes.DELETE:
					remover(request, response);
					break;
				case Constantes.LISTAR:
					list(request, response);
					break;
				case Constantes.ATIVAR_DESATIVAR:
					ativar_desativar(request, response);
					break;
				case Constantes.VISUALIZAR:
					converterobj(request, response);
					break;
			}
			
			
		} catch (Exception ex) {
			
			throw new ServletException(ex);
		}
		
		
	
}
    
    
    private void list(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	
		Collection<Cliente> listaCliente = this.service.listacliente();
		request.setAttribute("listaCliente",listaCliente);
		RequestDispatcher rd = request.getRequestDispatcher(Constantes.USUARIOS);
		rd.forward(request, response);
		
	}
    
    private void editar(HttpServletRequest request,HttpServletResponse response) throws NumberFormatException,Exception{
    	
    	Cliente cliente = service.findById(Long.parseLong(request.getParameter("id")));
    	RequestDispatcher dispatcher = request.getRequestDispatcher(Constantes.ADD_USUARIOS);
    	request.setAttribute("cliente", cliente);
    	dispatcher.forward(request, response);
    	
    	
    }
    
    private void ativar_desativar(HttpServletRequest request, HttpServletResponse response) throws  Exception{
    	//Cliente cliente = service.findById(Long.parseLong(request.getParameter("id")));
    	Cliente cliente = service.ativar_desativar(Long.parseLong(request.getParameter("id")));
    	request.setAttribute("cliente", cliente);
    	list(request, response);
    	
    }
    
    private void converterobj(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException,Exception{
    	
    	
    	Cliente cliente = service.findById(Long.parseLong(request.getParameter("id")));
    	System.out.println(cliente);
    	Gson gson = new Gson();
    	String json = gson.toJson(cliente);
		request.setAttribute("json", json);
   	 	
   	 	System.out.println(json);
   	 	System.out.println(json);
   	 	System.out.println(json);
   	 	
   	
		list(request, response);
		
		
    	
    }
    
    private void remover(HttpServletRequest request, HttpServletResponse response) throws NumberFormatException,Exception{
    	
    	 service.deleteById(Long.parseLong(request.getParameter("id")));
    	 RequestDispatcher rd = request.getRequestDispatcher(Constantes.USUARIOS);
    	 request.setAttribute("excluido", Constantes.USUARIO_REMOVIDO);
    	 
    	 
    	 try {
			list(request, response);
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
    
    
   
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		cliente = new Cliente(); 
		
		//Mensagem de cadastro
		
		String msgS = "Usuario Cadastrado com Sucesso!";
		String msgE = "Usuario Não Foi Cadastrado!";
		
		//Pegando os dados cadastrado da tela de cadastro
		String id = request.getParameter("id");
		String nome = request.getParameter("nome");
		String email = request.getParameter("email");
		String cpf = request.getParameter("cpf");
		String dataNasc = request.getParameter("dataNascimento");
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		
		
		
		//aqui estou verificando se os parametro estão vazio!
		if(nome != "" && email != "" && cpf != "" && dataNasc != "" && login != "" && senha != "") {
			
			cliente.setNome(nome);
			cliente.setEmail(email);
			cliente.setCpf(cpf);
			cliente.setDataNascimento(dataNasc);
			cliente.setSenha(senha);
			cliente.setLogin(login);
			cliente.setAtivo(true);
			
				if(id != "") {
					cliente.setId(Long.parseLong(id));
					request.setAttribute("editado", nome +" " +Constantes.CONTATO_EDITADO);
				}else {
					request.setAttribute("cadastrado", nome + " "+ Constantes.CONTATO_SUCESSO);
				}
		
			try {
				service.save(cliente);
				
			}catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			RequestDispatcher rd = request.getRequestDispatcher(Constantes.USUARIOS);
			
			try {
				list(request, response);
				rd.forward(request,response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
		}else {
			RequestDispatcher rd = request.getRequestDispatcher(Constantes.ADD_USUARIOS);
			request.setAttribute("ERROR", "Algum campo estava vazio.");
			rd.forward(request, response);
			
		}
			
					
		 
		
	}
	
}
	


