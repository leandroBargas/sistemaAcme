package br.com.cliente.dao;
import br.com.projeto.jpa.GenericDao;
import br.com.projeto.model.Cliente;

/**
* @author Leandro
 */

public interface ClienteDao extends GenericDao<Cliente , Long> {
	
	public Cliente acess (String login, String senha) throws Exception;
	
	public Cliente ativarDesativar(Long id) throws Exception;
	
}
