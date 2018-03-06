------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------



------------------------------------------------------------
-- Table: ECOLE
------------------------------------------------------------
CREATE TABLE public.ECOLE(
	id_ecole VARCHAR (50) NOT NULL ,
	mdp      VARCHAR (50) NOT NULL ,
	CONSTRAINT prk_constraint_ECOLE PRIMARY KEY (id_ecole)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: TEAM
------------------------------------------------------------
CREATE TABLE public.TEAM(
	id_team VARCHAR (50) NOT NULL ,
	mdp     VARCHAR (50) NOT NULL ,
	CONSTRAINT prk_constraint_TEAM PRIMARY KEY (id_team)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: REPAS
------------------------------------------------------------
CREATE TABLE public.REPAS(
	id_repas SERIAL NOT NULL ,
	classe   VARCHAR (50) NOT NULL ,
	nb_repas NUMERIC (50,0)  NOT NULL ,
	CONSTRAINT prk_constraint_REPAS PRIMARY KEY (id_repas)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: COMMANDE
------------------------------------------------------------
CREATE TABLE public.COMMANDE(
	id_com SERIAL NOT NULL ,
	date_j DATE  NOT NULL ,
	CONSTRAINT prk_constraint_COMMANDE PRIMARY KEY (id_com)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: REPAS_SP
------------------------------------------------------------
CREATE TABLE public.REPAS_SP(
	id_r_spe SERIAL NOT NULL ,
	ss_porc  NUMERIC (10,0)  NOT NULL ,
	veget    NUMERIC (10,0)  NOT NULL ,
	ss_glut  NUMERIC (10,0)  NOT NULL ,
	ss_lact  NUMERIC (10,0)  NOT NULL ,
	CONSTRAINT prk_constraint_REPAS_SP PRIMARY KEY (id_r_spe)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: a
------------------------------------------------------------
CREATE TABLE public.a(
	id_ecole VARCHAR (50) NOT NULL ,
	id_team  VARCHAR (50) NOT NULL ,
	CONSTRAINT prk_constraint_a PRIMARY KEY (id_ecole,id_team)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: contient
------------------------------------------------------------
CREATE TABLE public.contient(
	id_r_spe INT  NOT NULL ,
	id_repas INT  NOT NULL ,
	CONSTRAINT prk_constraint_contient PRIMARY KEY (id_r_spe,id_repas)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: est composé de
------------------------------------------------------------
CREATE TABLE public.est_compose_de(
	id_com   INT  NOT NULL ,
	id_repas INT  NOT NULL ,
	CONSTRAINT prk_constraint_est_compose_de PRIMARY KEY (id_com,id_repas)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: passe
------------------------------------------------------------
CREATE TABLE public.passe(
	id_ecole VARCHAR (50) NOT NULL ,
	id_com   INT  NOT NULL ,
	CONSTRAINT prk_constraint_passe PRIMARY KEY (id_ecole,id_com)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: consulte
------------------------------------------------------------
CREATE TABLE public.consulte(
	id_team VARCHAR (50) NOT NULL ,
	id_com  INT  NOT NULL ,
	CONSTRAINT prk_constraint_consulte PRIMARY KEY (id_team,id_com)
)WITHOUT OIDS;



ALTER TABLE public.a ADD CONSTRAINT FK_a_id_ecole FOREIGN KEY (id_ecole) REFERENCES public.ECOLE(id_ecole);
ALTER TABLE public.a ADD CONSTRAINT FK_a_id_team FOREIGN KEY (id_team) REFERENCES public.TEAM(id_team);
ALTER TABLE public.contient ADD CONSTRAINT FK_contient_id_r_spe FOREIGN KEY (id_r_spe) REFERENCES public.REPAS_SP(id_r_spe);
ALTER TABLE public.contient ADD CONSTRAINT FK_contient_id_repas FOREIGN KEY (id_repas) REFERENCES public.REPAS(id_repas);
ALTER TABLE public.est_compose_de ADD CONSTRAINT FK_est_compose_de_id_com FOREIGN KEY (id_com) REFERENCES public.COMMANDE(id_com);
ALTER TABLE public.est_compose_de ADD CONSTRAINT FK_est_compose_de_id_repas FOREIGN KEY (id_repas) REFERENCES public.REPAS(id_repas);
ALTER TABLE public.passe ADD CONSTRAINT FK_passe_id_ecole FOREIGN KEY (id_ecole) REFERENCES public.ECOLE(id_ecole);
ALTER TABLE public.passe ADD CONSTRAINT FK_passe_id_com FOREIGN KEY (id_com) REFERENCES public.COMMANDE(id_com);
ALTER TABLE public.consulte ADD CONSTRAINT FK_consulte_id_team FOREIGN KEY (id_team) REFERENCES public.TEAM(id_team);
ALTER TABLE public.consulte ADD CONSTRAINT FK_consulte_id_com FOREIGN KEY (id_com) REFERENCES public.COMMANDE(id_com);
