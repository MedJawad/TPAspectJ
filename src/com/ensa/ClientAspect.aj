package com.ensa;

import org.apache.log4j.Logger;

public aspect ClientAspect {
	   static Logger log = Logger.getLogger(ClientAspect.class.getName());
	pointcut operationBancaire(Client clt): 
		( call(* *..Client.retirer(*)) || call(* *..Client.verser(*)) ) && target(clt);

	void around(Client clt): operationBancaire(clt) {
		log.info("----------------------------------------------------------------");
		log.info("CLIENT "+clt.getNom()+" A FAIT L OPERATION << "+thisJoinPoint.getSignature().getName() +" >> AVEC UN MONTANT DE "+thisJoinPoint.getArgs()[0].toString());
		log.info("SOLDE AVANT "+clt.getCp().getSolde()+" ");
		double start = System.nanoTime();
		proceed(clt);
		double end = System.nanoTime();
		double duration = (end - start)/1000000; 
		log.info("SOLDE APRES "+clt.getCp().getSolde()+" ");
		log.info("L'operation a pris "+duration+"ms pour s'executer");
		log.info("----------------------------------------------------------------");

	}
}