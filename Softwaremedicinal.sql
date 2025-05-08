create database software_medicinal;
use softwaremedicinal;
-- Tabela do estoque, chave primaria: ESTOQUE_ID, chave estrangeira: FuncionarioGeral_ID ---- (ARRUMAR OS ATRIBUTOS E ADICIONAR MAIS INFORMAÇÕES, POIS SE O RELACIONAMENTO É 1 PARA 1 SIGNIFICA QUE ESSE ATRIBUTO PERTENCE A TABELA!);
create table estoque(
Valor int(200) NOT NULL,
ESTOQUE_ID int NOT NULL,
NomeRemedios varchar(255) NOT NULL,
QuantidadeRemedios int NOT NULL,
PRIMARY KEY (ESTOQUE_ID), 
FOREIGN KEY (FuncionarioGeral_ID) REFERENCES Funcionarios(FuncionarioGeral_ID)
);

-- Tabela dos funcionarios, chave primaria: FuncionarioGeral_ID, Chaves estrangeiras : ESTOQUE_ID e PACIENTE_ID;
create table Funcionarios(
FuncionarioGeral_ID int NOT NULL,
PRIMARY KEY(FuncionarioGeral_ID),
Nome varchar(255) NOT NULL,
Cargo varchar(255) NOT NULL,
FOREIGN KEY ( ESTOQUE_ID) REFERENCES Estoque( ESTOQUE_ID),
FOREIGN KEY (PACIENTE_ID) REFERENCES Paciente(PACIENTE_ID)
);

-- Tabela dos pacientes, chave primaria: PACIENTE_ID, chaves estrangeiras: Medico_ID e FuncionarioGeral_ID;
create table PACIENTE(
PACIENTE_ID int NOT NULL,
PRIMARY KEY (PACIENTE_ID),
CEP int(8) NOT NULL,
Nome varchar(255) NOT NULL,
FOREIGN KEY (Medico_ID) REFERENCES Medicos(Medico_ID),
FOREIGN KEY (FuncionarioGeral_ID) REFERENCES Funcionarios(FuncionarioGeral_ID)
);
-- Tabela dos Medicos, chave primaria: MEDICO_ID, chaves estrangeiras : PACIENTE_ID
create table MEDICOS(
MEDICO_ID int NOT NULL,
PRIMARY KEY (MEDICO_ID),
Nome varchar(255) NOT NULL,
FOREIGN KEY (PACIENTE_ID) REFERENCES Paciente(PACIENTE_ID)
);

-- Tabela das receitas, Chave primaria : RECEITAS_ID(PK), Chaves estrangeiras: MEDICO_ID(FK)
create table RECEITAS(
Receitas_ID int NOT NULL,
PRIMARY KEY(Receitas_ID),
Nome_Do_Paciente varchar(255),
Categoria varchar(255),
FOREIGN KEY (MEDICO_ID) REFERENCES Medico(MEDICO_ID)

)  