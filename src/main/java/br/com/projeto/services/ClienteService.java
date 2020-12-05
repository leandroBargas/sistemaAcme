package br.com.projeto.services;

import java.util.Collection;

import br.com.cliente.dao.ClienteImpl;

import br.com.projeto.model.Cliente;


public class ClienteService {

	private ClienteImpl iml = new ClienteImpl();
	
	public ClienteService(){}
	
	public Collection<Cliente> listacliente() throws Exception{
		return this.iml.listAll();
	}
	
	public void save(Cliente cliente) throws Exception {
		this.iml.save(cliente);
	}
	
	public Cliente findById(long id) throws Exception {
		return this.iml.findById(id);
	}
	
	public void deleteById(long id)throws Exception {
		this.iml.deleteById(id);
	}
	
	public Cliente ativar_desativar(long id) throws Exception{
		return this.iml.ativarDesativar(id);
	}
	
}
