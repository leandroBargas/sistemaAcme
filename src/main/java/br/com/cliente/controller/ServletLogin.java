package br.com.cliente.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import br.com.cliente.dao.ClienteImpl;
import br.com.projeto.model.Cliente;
import br.com.projeto.utils.Constantes;

/**
* @author Leandro
 */


@WebServlet("/ServletLogin")
public class ServletLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private ClienteImpl imp;
    
    public ServletLogin() {
        super();
        imp = new ClienteImpl();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.getRequestDispatcher(Constantes.LOGIN).forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String login = request.getParameter("login");
		String senha = request.getParameter("senha");
		Map<String, String> erro = new HashMap<String, String>();
		
		
		if(login == null || login.isEmpty()) {
			erro.put("login", Constantes.INFORME_LOGIN);
		}
		if(senha == null || login.isEmpty()) {
			erro.put("senha", Constantes.INFORME_SENHA);
		}
		if(erro.isEmpty()) {
			Cliente user;
			
			try {
				user = imp.acess(login, senha);
				if(user!= null){
					if(user.isAtivo()) {
						request.getSession().setAttribute("user", user.getNome());
						RequestDispatcher dispachador = request.getRequestDispatcher(Constantes.HOME);
						dispachador.forward(request, response);
						
						return;
					}else {
					erro.put("inativo", Constantes.USUARIO_ESTÃO_DESATIVADO);
					}
				}else{
	               erro.put("erro", Constantes.LOGIN_E_OU_SENHA_INVÁLIDO);
	           } 
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		request.setAttribute("erro", erro);
	    request.getRequestDispatcher(Constantes.LOGIN).forward(request, response);
		
	}

}
