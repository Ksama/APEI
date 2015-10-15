CREATE TABLE pages (
	nom text PRIMARY KEY NOT NULL,
	titre text NOT NULL,
	contenu text
);

CREATE TABLE menus (
	page text NOT NULL,
	cible text NOT NULL,
	position int NOT NULL,
	PRIMARY KEY (page, cible),
	FOREIGN KEY (page) REFERENCES pages (nom),
	FOREIGN KEY (cible) REFERENCES pages (nom)
);

CREATE TABLE lexique (
	abreviation varchar(15) PRIMARY KEY NOT NULL,
	signification text NOT NULL
);

CREATE TABLE adresses (
	id serial PRIMARY KEY NOT NULL,
	nom text NOT NULL,
	pole text NOT NULL,
	adresse text NOT NULL,
	telephone text NOT NULL,
	fax text,
	mail text,
	web text
);

CREATE TABLE evenements (
	id serial PRIMARY KEY NOT NULL,
	titre text NOT NULL,
	date_heure bigint NOT NULL,
	duree int,
	message text NOT NULL
);

CREATE TABLE emplois (
	date_heure bigint PRIMARY KEY NOT NULL,
	etablissement text NOT NULL,
	nom text NOT NULL,
	missions text NOT NULL,
	profil text NOT NULL,
	debut bigint NOT NULL,
	type text NOT NULL,
	conditions text NOT NULL,
	contact text NOT NULL,
	mail text NOT NULL,
	valide boolean NOT NULL DEFAULT false
);

CREATE TABLE infos (
	id serial PRIMARY KEY NOT NULL,
	titre varchar(255) NOT NULL
);

INSERT INTO pages (nom, titre) VALUES
('accueil', 'Accueil'),
('contact', 'Contact'),
('espace-emploi', 'Espace emploi'),
('lexique', 'Lexique'),

('qui-sommes-nous', 'Qui sommes-nous ?'),
('notre-organisation', 'Notre organisation'),

('etablissements', 'Les établissements et services'),
('vie-associative', 'Vie associative'),
('siege-social', 'Siège Social'),
('enfance', 'Pôle Enfance'),
('travail-protege', 'Pôle Travail Protégé'),
('hebergement-adultes', 'Pôle Hébergement pour Adultes'),
('services-milieux-ouverts', 'Pôle Services Milieux Ouverts'),
('hebergement-soins-adultes', 'Pôle Hébergement et Soins pour Adultes'),

('ime', 'IME "Jean Stiévenard"'),
('sessad', 'SESSAD'),
('esat', 'ESAT "Les Ateliers de l''Ostrevent"'),
('ostrevent-espace-services', 'Ostrevent Espace Service'),
('sisep', 'SISEP'),
('ego', 'EGO Chantier d''Insertion'),
('centre-habitat', 'Centre d''Habitat et Annexes'),
('les-grands-champs', 'Foyer d''Accompagnement "Les Grands Champs"'),
('les-pepinieres', 'Foyer de Vie "Les Pépinières"'),
('foyer-logement', 'Foyer Logement'),
('savs', 'SAVS'),
('parentalite', 'Parentalité'),
('accueil-temporaire', 'Accueil Temporaire'),
('saj', 'Accueil de Jour, Accueil Loisirs'),
('accueil-specialise', 'Maison d''Accueil Spécialisée'),

('engagement-parental', 'L''engagement des parents'),
('a-votre-ecoute', 'A votre écoute'),

('actualites', 'La vie des établissements'),

('identification', 'Identification'),
('gestion', 'Gestion'),
('evenements', 'Evènements'),
('adresses', 'Adresses'),
('offres', 'Offres d''emploi'),
('images', 'Images'),
('fichiers', 'Fichiers');

INSERT INTO menus VALUES
('qui-sommes-nous', 'qui-sommes-nous', 1),
('qui-sommes-nous', 'notre-organisation', 2),
('notre-organisation', 'qui-sommes-nous', 1),
('notre-organisation', 'notre-organisation', 2),

('siege-social', 'siege-social', 1),
('siege-social', 'vie-associative', 2),
('siege-social', 'enfance', 3),
('siege-social', 'travail-protege', 4),
('siege-social', 'hebergement-adultes', 5),
('siege-social', 'services-milieux-ouverts', 6),
('siege-social', 'hebergement-soins-adultes', 7),

('vie-associative', 'siege-social', 1),
('vie-associative', 'vie-associative', 2),
('vie-associative', 'enfance', 3),
('vie-associative', 'travail-protege', 4),
('vie-associative', 'hebergement-adultes', 5),
('vie-associative', 'services-milieux-ouverts', 6),
('vie-associative', 'hebergement-soins-adultes', 7),

('enfance', 'siege-social', 1),
('enfance', 'vie-associative', 2),
('enfance', 'enfance', 3),
	('enfance', 'ime', 4),
	('enfance', 'sessad', 5),
('enfance', 'travail-protege', 6),
('enfance', 'hebergement-adultes', 7),
('enfance', 'services-milieux-ouverts', 8),
('enfance', 'hebergement-soins-adultes', 9),

	('ime', 'siege-social', 1),
	('ime', 'vie-associative', 2),
	('ime', 'enfance', 3),
		('ime', 'ime', 4),
		('ime', 'sessad', 5),
	('ime', 'travail-protege', 6),
	('ime', 'hebergement-adultes', 7),
	('ime', 'services-milieux-ouverts', 8),
	('ime', 'hebergement-soins-adultes', 9),

	('sessad', 'siege-social', 1),
	('sessad', 'vie-associative', 2),
	('sessad', 'enfance', 3),
		('sessad', 'ime', 4),
		('sessad', 'sessad', 5),
	('sessad', 'travail-protege', 6),
	('sessad', 'hebergement-adultes', 7),
	('sessad', 'services-milieux-ouverts', 8),
	('sessad', 'hebergement-soins-adultes', 9),

('travail-protege', 'siege-social', 1),
('travail-protege', 'vie-associative', 2),
('travail-protege', 'enfance', 3),
('travail-protege', 'travail-protege', 4),
	('travail-protege', 'esat', 5),
	('travail-protege', 'ostrevent-espace-services', 6),
	('travail-protege', 'sisep', 7),
	('travail-protege', 'ego', 8),
('travail-protege', 'hebergement-adultes', 9),
('travail-protege', 'services-milieux-ouverts', 10),
('travail-protege', 'hebergement-soins-adultes', 11),

	('esat', 'siege-social', 1),
	('esat', 'vie-associative', 2),
	('esat', 'enfance', 3),
	('esat', 'travail-protege', 4),
		('esat', 'esat', 5),
		('esat', 'ostrevent-espace-services', 6),
		('esat', 'sisep', 7),
		('esat', 'ego', 8),
	('esat', 'hebergement-adultes', 9),
	('esat', 'services-milieux-ouverts', 10),
	('esat', 'hebergement-soins-adultes', 11),

	('ostrevent-espace-services', 'siege-social', 1),
	('ostrevent-espace-services', 'vie-associative', 2),
	('ostrevent-espace-services', 'enfance', 3),
	('ostrevent-espace-services', 'travail-protege', 4),
		('ostrevent-espace-services', 'esat', 5),
		('ostrevent-espace-services', 'ostrevent-espace-services', 6),
		('ostrevent-espace-services', 'sisep', 7),
		('ostrevent-espace-services', 'ego', 8),
	('ostrevent-espace-services', 'hebergement-adultes', 9),
	('ostrevent-espace-services', 'services-milieux-ouverts', 10),
	('ostrevent-espace-services', 'hebergement-soins-adultes', 11),

	('sisep', 'siege-social', 1),
	('sisep', 'vie-associative', 2),
	('sisep', 'enfance', 3),
	('sisep', 'travail-protege', 4),
		('sisep', 'esat', 5),
		('sisep', 'ostrevent-espace-services', 6),
		('sisep', 'sisep', 7),
		('sisep', 'ego', 8),
	('sisep', 'hebergement-adultes', 9),
	('sisep', 'services-milieux-ouverts', 10),
	('sisep', 'hebergement-soins-adultes', 11),

	('ego', 'siege-social', 1),
	('ego', 'vie-associative', 2),
	('ego', 'enfance', 3),
	('ego', 'travail-protege', 4),
		('ego', 'esat', 5),
		('ego', 'ostrevent-espace-services', 6),
		('ego', 'sisep', 7),
		('ego', 'ego', 8),
	('ego', 'hebergement-adultes', 9),
	('ego', 'services-milieux-ouverts', 10),
	('ego', 'hebergement-soins-adultes', 11),

('hebergement-adultes', 'siege-social', 1),
('hebergement-adultes', 'vie-associative', 2),
('hebergement-adultes', 'enfance', 3),
('hebergement-adultes', 'travail-protege', 4),
('hebergement-adultes', 'hebergement-adultes', 5),
	('hebergement-adultes', 'centre-habitat', 6),
	('hebergement-adultes', 'les-grands-champs', 7),
	('hebergement-adultes', 'les-pepinieres', 8),
	('hebergement-adultes', 'foyer-logement', 9),
('hebergement-adultes', 'services-milieux-ouverts', 10),
('hebergement-adultes', 'hebergement-soins-adultes', 11),

	('centre-habitat', 'siege-social', 1),
	('centre-habitat', 'vie-associative', 2),
	('centre-habitat', 'enfance', 3),
	('centre-habitat', 'travail-protege', 4),
	('centre-habitat', 'hebergement-adultes', 5),
		('centre-habitat', 'centre-habitat', 6),
		('centre-habitat', 'les-grands-champs', 7),
		('centre-habitat', 'les-pepinieres', 8),
		('centre-habitat', 'foyer-logement', 9),
	('centre-habitat', 'services-milieux-ouverts', 10),
	('centre-habitat', 'hebergement-soins-adultes', 11),

	('les-grands-champs', 'siege-social', 1),
	('les-grands-champs', 'vie-associative', 2),
	('les-grands-champs', 'enfance', 3),
	('les-grands-champs', 'travail-protege', 4),
	('les-grands-champs', 'hebergement-adultes', 5),
		('les-grands-champs', 'centre-habitat', 6),
		('les-grands-champs', 'les-grands-champs', 7),
		('les-grands-champs', 'les-pepinieres', 8),
		('les-grands-champs', 'foyer-logement', 9),
	('les-grands-champs', 'services-milieux-ouverts', 10),
	('les-grands-champs', 'hebergement-soins-adultes', 11),

	('les-pepinieres', 'siege-social', 1),
	('les-pepinieres', 'vie-associative', 2),
	('les-pepinieres', 'enfance', 3),
	('les-pepinieres', 'travail-protege', 4),
	('les-pepinieres', 'hebergement-adultes', 5),
		('les-pepinieres', 'centre-habitat', 6),
		('les-pepinieres', 'les-grands-champs', 7),
		('les-pepinieres', 'les-pepinieres', 8),
		('les-pepinieres', 'foyer-logement', 9),
	('les-pepinieres', 'services-milieux-ouverts', 10),
	('les-pepinieres', 'hebergement-soins-adultes', 11),

	('foyer-logement', 'siege-social', 1),
	('foyer-logement', 'vie-associative', 2),
	('foyer-logement', 'enfance', 3),
	('foyer-logement', 'travail-protege', 4),
	('foyer-logement', 'hebergement-adultes', 5),
		('foyer-logement', 'centre-habitat', 6),
		('foyer-logement', 'les-grands-champs', 7),
		('foyer-logement', 'les-pepinieres', 8),
		('foyer-logement', 'foyer-logement', 9),
	('foyer-logement', 'services-milieux-ouverts', 10),
	('foyer-logement', 'hebergement-soins-adultes', 11),

('services-milieux-ouverts', 'siege-social', 1),
('services-milieux-ouverts', 'vie-associative', 2),
('services-milieux-ouverts', 'enfance', 3),
('services-milieux-ouverts', 'travail-protege', 4),
('services-milieux-ouverts', 'hebergement-adultes', 5),
('services-milieux-ouverts', 'services-milieux-ouverts', 6),
	('services-milieux-ouverts', 'savs', 7),
	('services-milieux-ouverts', 'parentalite', 8),
	('services-milieux-ouverts', 'accueil-temporaire', 9),
	('services-milieux-ouverts', 'saj', 10),
('services-milieux-ouverts', 'hebergement-soins-adultes', 11),

	('savs', 'siege-social', 1),
	('savs', 'vie-associative', 2),
	('savs', 'enfance', 3),
	('savs', 'travail-protege', 4),
	('savs', 'hebergement-adultes', 5),
	('savs', 'services-milieux-ouverts', 6),
		('savs', 'savs', 7),
		('savs', 'parentalite', 8),
		('savs', 'accueil-temporaire', 9),
		('savs', 'saj', 10),
	('savs', 'hebergement-soins-adultes', 11),

	('parentalite', 'siege-social', 1),
	('parentalite', 'vie-associative', 2),
	('parentalite', 'enfance', 3),
	('parentalite', 'travail-protege', 4),
	('parentalite', 'hebergement-adultes', 5),
	('parentalite', 'services-milieux-ouverts', 6),
		('parentalite', 'savs', 7),
		('parentalite', 'parentalite', 8),
		('parentalite', 'accueil-temporaire', 9),
		('parentalite', 'saj', 10),
	('parentalite', 'hebergement-soins-adultes', 11),

	('accueil-temporaire', 'siege-social', 1),
	('accueil-temporaire', 'vie-associative', 2),
	('accueil-temporaire', 'enfance', 3),
	('accueil-temporaire', 'travail-protege', 4),
	('accueil-temporaire', 'hebergement-adultes', 5),
	('accueil-temporaire', 'services-milieux-ouverts', 6),
		('accueil-temporaire', 'savs', 7),
		('accueil-temporaire', 'parentalite', 8),
		('accueil-temporaire', 'accueil-temporaire', 9),
		('accueil-temporaire', 'saj', 10),
	('accueil-temporaire', 'hebergement-soins-adultes', 11),

	('saj', 'siege-social', 1),
	('saj', 'vie-associative', 2),
	('saj', 'enfance', 3),
	('saj', 'travail-protege', 4),
	('saj', 'hebergement-adultes', 5),
	('saj', 'services-milieux-ouverts', 6),
		('saj', 'savs', 7),
		('saj', 'parentalite', 8),
		('saj', 'accueil-temporaire', 9),
		('saj', 'saj', 10),
	('saj', 'hebergement-soins-adultes', 11),

('hebergement-soins-adultes', 'siege-social', 1),
('hebergement-soins-adultes', 'vie-associative', 2),
('hebergement-soins-adultes', 'enfance', 3),
('hebergement-soins-adultes', 'travail-protege', 4),
('hebergement-soins-adultes', 'hebergement-adultes', 5),
('hebergement-soins-adultes', 'services-milieux-ouverts', 6),
('hebergement-soins-adultes', 'hebergement-soins-adultes', 7),
	('hebergement-soins-adultes', 'accueil-specialise', 8),

	('accueil-specialise', 'siege-social', 1),
	('accueil-specialise', 'vie-associative', 2),
	('accueil-specialise', 'enfance', 3),
	('accueil-specialise', 'travail-protege', 4),
	('accueil-specialise', 'hebergement-adultes', 5),
	('accueil-specialise', 'services-milieux-ouverts', 6),
	('accueil-specialise', 'hebergement-soins-adultes', 7),
		('accueil-specialise', 'accueil-specialise', 8),

('engagement-parental', 'engagement-parental', 1),
('engagement-parental', 'a-votre-ecoute', 2),
('a-votre-ecoute', 'engagement-parental', 1),
('a-votre-ecoute', 'a-votre-ecoute', 2);

INSERT INTO adresses (nom, pole, adresse, telephone, fax, mail, web) VALUES
('ZA Les pierres Blanches', 'Siège Social', '1 rue Louis Petit 59220 DENAIN', '0327433800', '0327315024', 'secretariat.siege@apei-denain.fr', NULL),

('IME', 'Pôle Enfance', '431 route d''Oisy 59220 DENAIN', '0327214260', NULL, 'imejstievenard@apei-denain.fr', NULL),
('SESSAD', 'Pôle Enfance', '260 rue Arthur Brunet 59220 DENAIN', '0327318833', NULL, 'sessad@apei-denain.fr', NULL),

('ESAT "Les Ateliers de l''Ostrevent"', 'Pôle Travail Protégé', '523 route d''Oisy 59220 DENAIN', '0327219850', NULL, NULL, NULL),
('EA "Ostrevent Espace Service"', 'Pôle Travail Protégé', '523 route d''Oisy 59220 DENAIN', '0327219850', NULL, NULL, NULL),
('SISEP', 'Pôle Travail Protégé', '96 avenue Jean Jaurès 59220 DENAIN', '0327435372', NULL, NULL, NULL),

('Centre Habitat et Annexes', 'Pôle Hébergement pour Adultes', '523 route d''Oisy 59220 DENAIN', '0327219860', NULL, NULL, NULL),
('Foyer d''Accompagnement "Les Grands Champs"', 'Pôle Hébergement pour Adultes', '865 route d''Oisy 59220 DENAIN', '0327310174', NULL, NULL, NULL),
('Foyer de Vie "Les Pépinières"', 'Pôle Hébergement pour Adultes', '771 route d''Oisy 59220 DENAIN', '0327310133', NULL, NULL, NULL),
('Foyer Logement', 'Pôle Hébergement pour Adultes', '88/100/104 avenue Jean Jaurès 59220 DENAIN', '0327435372', NULL, NULL, NULL),

('Service d''Accompagnement à la Vie Sociale', 'Pôle Services des Milieux Ouverts pour Adultes', '88 avenue Jean Jaurès 59220 DENAIN', '0327435372', NULL, NULL, NULL),
('Espace Ernest Janiot SAL/SAJ/SATJ', 'Pôle Services des Milieux Ouverts pour Adultes', '7 bd Caraman 59220 DENAIN', '0327447441', NULL, NULL, NULL),
('Service d''Aide à la Parentalité', 'Pôle Services des Milieux Ouverts pour Adultes', '88 avenue Jean Jaurès 59220 DENAIN', '0327435372', NULL, NULL, NULL),

('Maison d''Accueil Spécialisée', 'Pôle Hébergement et soins pour Adultes', '481 rue Berthelot 59220 DENAIN', '0327219140', NULL, NULL, NULL);

CREATE OR REPLACE FUNCTION modifier_menu(text, text, integer) RETURNS void AS $$
BEGIN
	IF(SELECT EXISTS(SELECT 1 FROM menus WHERE page = $1 AND cible = $2)) THEN
		UPDATE menus SET position = $3 WHERE page = $1 AND cible = $2;
	ELSE
		INSERT INTO menus VALUES($1, $2, $3);
	END IF;
END;
$$ LANGUAGE plpgsql;