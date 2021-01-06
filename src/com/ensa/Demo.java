package com.ensa;

public class Demo {

	public static void main(String[] args) {
		Client clt = new Client();
		clt.setNom("JAWAD");
		Compte cpt = new Compte();
		clt.setCp(cpt);
		clt.verser(10000.0);
		clt.verser(5000.0);
		clt.retirer(9000.0);

	}

}
