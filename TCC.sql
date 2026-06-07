create database if not exists TCC CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
use TCC;

CREATE TABLE Usuario (
    Id_Usuario integer PRIMARY KEY auto_increment,
    Nome VARCHAR(255),
    Email VARCHAR(255),
    Senha VARCHAR(255)
);

CREATE TABLE Material (
    Id_Material integer PRIMARY KEY auto_increment,
    Nome_Arquivo VARCHAR(255),
    Tipo_Arquivo VARCHAR(255),
    Data_Upload DATE,
    Tamanho_Arquivo BIGINT,
    fk_Usuario_Id_Usuario integer
);

CREATE TABLE Conteudo_Processado (
    Id_Conteudo_Processado integer PRIMARY KEY auto_increment,
    Texto_Extraido text,
    Data_Processamento DATE,
    fk_Material_Id_Material integer
);

CREATE TABLE Material_Adaptado (
    Id_Material_Adaptado integer PRIMARY KEY auto_increment,
    Data_Geracao DATE,
    Texto_Adaptado text,
    Nivel_Adaptacao ENUM('LEVE','MEDIA','ALTA'),
    fk_Conteudo_Processado_Id_Conteudo_Processado integer
);

CREATE TABLE Mapa_Mental (
    Id_Mapa_Mental integer PRIMARY KEY auto_increment,
    Estrutura json,
	fk_Material_Adaptado_Id_Material_Adaptado integer
);

CREATE TABLE Exportacao (
    Id_Exportacao integer PRIMARY KEY auto_increment,
    Formato VARCHAR(255),
    Data_Exportacao DATE,
	fk_Material_Adaptado_Id_Material_Adaptado integer
);
 
ALTER TABLE Conteudo_Processado ADD CONSTRAINT FK_Conteudo_Processado_2
    FOREIGN KEY (fk_Material_Id_Material)
    REFERENCES Material (Id_Material)
    ON DELETE cascade;
 
ALTER TABLE Material_Adaptado ADD CONSTRAINT FK_Material_Adaptado_2
    FOREIGN KEY (fk_Conteudo_Processado_Id_Conteudo_Processado)
    REFERENCES Conteudo_Processado (Id_Conteudo_Processado)
    ON DELETE RESTRICT;
 
ALTER TABLE Mapa_Mental ADD CONSTRAINT FK_Mapa_Mental_2
    FOREIGN KEY (fk_Material_Adaptado_Id_Material_Adaptado)
    REFERENCES Material_Adaptado (Id_Material_Adaptado)
    ON DELETE CASCADE;
 
ALTER TABLE Exportacao ADD CONSTRAINT FK_Exportacao_2
    FOREIGN KEY (fk_Material_Adaptado_Id_Material_Adaptado)
    REFERENCES  Material_Adaptado (Id_Material_Adaptado)
    ON DELETE cascade;
    
ALTER TABLE Material ADD CONSTRAINT FK_Material_Usuario
	FOREIGN KEY (fk_Usuario_Id_Usuario)
	REFERENCES Usuario(Id_Usuario)
    ON DELETE CASCADE;


