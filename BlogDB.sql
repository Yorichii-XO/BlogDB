PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE Role (
    id_role integer AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(50)
);
INSERT INTO Role VALUES(NULL,'super-admin');
INSERT INTO Role VALUES(NULL,'Admin');
INSERT INTO Role VALUES(NULL,'Editor');
INSERT INTO Role VALUES(NULL,'User');
CREATE TABLE Utilisateur (
    id_utilisateur integer AUTO_INCREMENT PRIMARY KEY,
    nom VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    mot_de_passe VARCHAR(100),
    id_role integer,
    FOREIGN KEY (id_role ) REFERENCES Role(id_role )
);
INSERT INTO Utilisateur VALUES(NULL,'nom_utilisateur','exemple@email.com','mot_de_passe',1);
INSERT INTO Utilisateur VALUES(NULL,'MarwaBD','marey@email.com','marwa_not_giveUp',3);
CREATE TABLE Catégorie (
    id_categorie integer AUTO_INCREMENT PRIMARY KEY ,
    nom VARCHAR(100) UNIQUE,
    parent_id_categorie integer,
    FOREIGN KEY (parent_id_categorie) REFERENCES Catégorie(id_categorie)
);
CREATE TABLE Article (
    id_article integer AUTO_INCREMENT PRIMARY KEY,
    titre VARCHAR(200),
    contenu TEXT,
    date_publication DATE,
    id_categorie integer ,
    id_utilisateur integer ,
    FOREIGN KEY (id_categorie) REFERENCES Catégorie(id_categorie),
    FOREIGN KEY (id_utilisateur ) REFERENCES Utilisateur(id_utilisateur )
);
CREATE TABLE Commentaire (
    id_commentaire integer AUTO_INCREMENT PRIMARY KEY,
    contenu TEXT,
    date_creation DATE,
    id_article integer ,
    id_utilisateur integer ,
    FOREIGN KEY (id_article) REFERENCES Article(id_article),
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateur(id_utilisateur)
);
COMMIT;
