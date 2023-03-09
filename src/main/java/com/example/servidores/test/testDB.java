package com.example.servidores.test;

import com.example.servidores.dao.DbConnection;
import com.example.servidores.dao.UsuarioDao;
import com.example.servidores.model.Usuario;

public class testDB {

	public static void main(String[] args) {
		DbConnection conn = new DbConnection();
		UsuarioDao userdao = new UsuarioDao(conn);
		Usuario user = userdao.login("admin","admin");
		System.out.println(user);
	}

}
