package br.com.cliente.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import br.com.projeto.model.Cliente;
import br.com.projeto.services.ClienteService;
import br.com.projeto.utils.Constantes;


/**
* @author Leandro
 */

/**
 * Servlet implementation class AjaxCliente
 */

@WebServlet("/AjaxCliente")
public class AjaxCliente extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ClienteService service;
	private Cliente cliente ;
	
    public AjaxCliente() {
        super();
        service = new ClienteService();
        cliente = new Cliente();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		String action = request.getParameter(Constantes.ACTION);
		
		try {
			switch (action) {
				case "retornarLista":
					retornarLista(request, response);			
					break;
				case "modal":
					modalVisualização(request, response);
					break;
			}
			
			
		} catch (Exception ex) {
			
			throw new ServletException(ex);
		}
		
	}

	
	private void retornarLista(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		PrintWriter out = response.getWriter(); 
		Gson gson = new Gson();
		System.out.println("Entrou no RetornarLista");
		Collection<Cliente>list =  service.listacliente();
		System.out.println(list);
		
		 
		out.print(gson.toJson(list)); 
		out.flush();
	}
	
	private void modalVisualização(HttpServletRequest request, HttpServletResponse response) {
		
		
		  Gson gson = new Gson(); 
		  try { cliente = service.findById(Long.parseLong(request.getParameter("id"))); 
			  PrintWriter out = response.getWriter(); 
			  out.print(gson.toJson(cliente)); 
			  out.flush();
			  out.close(); 
		  } catch (Exception e) { 
			  // TODO Auto-generated catch block
			  e.printStackTrace(); 
		  }
		 
		
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
