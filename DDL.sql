DROP SCHEMA IF EXISTS Remissivas;
CREATE SCHEMA Remissivas;
USE Remissivas;

CREATE TABLE Aluno 
(
  cd_rm_aluno INT,
  nm_aluno VARCHAR(200),
  cd_rg_aluno VARCHAR(45),
  cd_cpf_aluno VARCHAR(45),
  PRIMARY KEY (cd_rm_aluno)
);

CREATE TABLE Curso 
(
  cd_curso INT,
  sg_curso VARCHAR(5),
  nm_curso VARCHAR(200),
  PRIMARY KEY (cd_curso)
);

CREATE TABLE Prontuario 
(
  cd_rm_aluno INT,
  cd_curso INT,
  ds_obs TEXT,
  CONSTRAINT pk_prontuario PRIMARY KEY (cd_rm_aluno, cd_curso),
  CONSTRAINT fk_Aluno_Curso_Aluno1
    FOREIGN KEY (cd_rm_aluno)
    REFERENCES Aluno (cd_rm_aluno),
  CONSTRAINT fk_Aluno_Curso_Curso2
    FOREIGN KEY (cd_curso)
    REFERENCES Curso (cd_curso)
);

CREATE TABLE tipo_diploma 
(
  cd_tipo_diploma INT,
  nm_tipo_diploma VARCHAR(45),
  CONSTRAINT pk_tipo_diploma PRIMARY KEY (cd_tipo_diploma)
);

CREATE TABLE diploma 
(
  codigo INT AUTO_INCREMENT,
  cd_rm_aluno INT,
  cd_curso INT,
  cd_diploma VARCHAR(20),
  cd_tipo_diploma INT,
  ic_segundavia BOOL,
  cd_livro VARCHAR(15),
  cd_pagina VARCHAR(15),
  dt_conclusao DATE,
  dt_emissao DATE,
  dt_retirada DATE,
  CONSTRAINT pk_diploma PRIMARY KEY (codigo, cd_rm_aluno, cd_curso),
  CONSTRAINT fk_diploma_tipo_diploma
    FOREIGN KEY (cd_tipo_diploma)
    REFERENCES tipo_diploma (cd_tipo_diploma),
  CONSTRAINT fk_diploma_Prontuario
    FOREIGN KEY (cd_rm_aluno, cd_curso)
    REFERENCES Prontuario (cd_rm_aluno, cd_curso)
);

CREATE TABLE documento 
(
  cd_documento INT,
  nm_documento VARCHAR(45),
  CONSTRAINT pk_documento PRIMARY KEY (cd_documento)
);

CREATE TABLE documento_aluno 
(
  cd_rm_aluno INT,
  cd_documento INT,
  ic_consta BOOL,
  CONSTRAINT pk_documento_aluno PRIMARY KEY (cd_rm_aluno, cd_documento),
  CONSTRAINT fk_Prontuario_documento_documento1
    FOREIGN KEY (cd_documento)
    REFERENCES documento (cd_documento),
  CONSTRAINT fk_item_prontuario_Aluno1
    FOREIGN KEY (cd_rm_aluno)
    REFERENCES Aluno (cd_rm_aluno)
);
