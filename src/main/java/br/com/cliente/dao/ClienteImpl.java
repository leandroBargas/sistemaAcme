package br.com.cliente.dao;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.TypedQuery;

import br.com.projeto.jpa.JpaUtils;
import br.com.projeto.model.Cliente;

/**
* @author Leandro
 */

public class ClienteImpl implements ClienteDao{
	
	EntityManagerFactory emf = JpaUtils.getEntityManagerFactory();
	EntityManager factory= null;
	
	
	//Metodo para Salvar no banco
	@Override
	public void save(Cliente cliente) throws Exception {
		
		this.factory = emf.createEntityManager();
		
		try {
			
			factory.getTransaction().begin();
			if (cliente.getId() == null){
				factory.persist(cliente);
			} else {
				factory.merge(cliente);
			}
			factory.getTransaction().commit();
			
		} catch (Exception e) {
			e.getMessage();
			factory.getTransaction().rollback();
		}finally {
			factory.close();
		}
		
		
	}
	//Fazer uma busca pelo ID
	@Override
	public Cliente findById(Long id) throws Exception {
		
		factory = emf.createEntityManager();
		Cliente cliente  = new Cliente();
		
		try {
			cliente = factory.find(Cliente.class, id);
			return cliente;
		} catch (Exception e) {
			e.getMessage();
			factory.getTransaction().rollback();
		}finally {
			factory.close();
		}
		return null;
	}
	//Deletar o usuario do banco
	@Override
	public void deleteById(Long id) throws Exception {
		factory = emf.createEntityManager();
		Cliente cliente = new Cliente();
		try {
			cliente = factory.find(Cliente.class, id);
			factory.getTransaction().begin();
			factory.remove(cliente);
			factory.getTransaction().commit();
		} catch (Exception e) {
			e.getMessage();
			factory.getTransaction().rollback();
		}finally {
			factory.close();
		}
		
	}
	//Atualizar o usuario no banco
	@Override
	public void update(Cliente cliente) throws Exception {
		factory = emf.createEntityManager();
		try {
			factory.getTransaction().begin();
			factory.merge(cliente);
			factory.getTransaction().commit();
			
		} catch (Exception e) {
			e.getMessage();
			factory.getTransaction().rollback();
		}finally {
			factory.close();
		}
		
	}
	//Lista todos os usuarios da tabela tb-Cliente
	@Override
	public Collection<Cliente> listAll() throws Exception {
		// TODO Auto-generated method stub
		factory = emf.createEntityManager();
		List<Cliente>lcliente = new ArrayList<Cliente>();
		
		try {
			
			factory.getTransaction().begin();
			TypedQuery<Cliente> query = factory.createNamedQuery("Cliente.findAll", Cliente.class);
			lcliente = query.getResultList();
			factory.getTransaction().commit();
			
		} catch (Exception e) {
			e.getMessage();
			factory.getTransaction().rollback();
		}finally {
			factory.close();
		}
		
		return lcliente;
	}
	@Override
	//metodo para fazer os clientes cadastrado logar
	public Cliente acess(String login, String senha) throws Exception {
	
		Cliente cliente = null;
		factory = emf.createEntityManager();
		
		try {
			Query query = this.factory.createNamedQuery("Cliente.loginUsuario");
			query.setParameter("login", login);
			query.setParameter("senha", senha);
			
			cliente = (Cliente) query.getSingleResult();
			return cliente;
		} catch (Exception e) {
			e.getMessage();
			factory.getTransaction().rollback();
		}finally {
			factory.close();
		}
		
		return null;
	}
	
	//Se o usuario for desativado ele não consegue logar ;D
	@Override
	public Cliente ativarDesativar(Long id) throws Exception {
		Cliente cliente = this.findById(id);
		if(cliente.isAtivo()) {
			cliente.setAtivo(false);
		}else {
			cliente.setAtivo(true);
		}
		try {
			this.factory = emf.createEntityManager();
			factory.getTransaction().begin();
			this.factory.merge(cliente);
			this.factory.getTransaction().commit();
		} catch (Exception e) {
			e.getMessage();
			this.factory.getTransaction().rollback();
		}finally {
			factory.close();
		}
	
	return cliente;
	
	}

}