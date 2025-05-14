create database software_medicinal;
use softwaremedicinal;
-- Tabela do estoque, chave primaria: ESTOQUE_ID, chave estrangeira: FuncionarioGeral_ID ---- (ARRUMAR OS ATRIBUTOS E ADICIONAR MAIS INFORMAÇÕES, POIS SE O RELACIONAMENTO É 1 PARA 1 SIGNIFICA QUE ESSE ATRIBUTO PERTENCE A TABELA!);
create table estoque(
Valor int(200) NOT NULL,
ESTOQUE_ID int NOT NULL,
NomeRemedios varchar(255) NOT NULL,
QuantidadeRemedios int NOT NULL,
PRIMARY KEY (ESTOQUE_ID), 

);

-- Tabela dos funcionarios, chave primaria: FuncionarioGeral_ID, Chaves estrangeiras : ESTOQUE_ID e PACIENTE_ID;
create table Funcionarios(
FuncionarioGeral_ID int NOT NULL,
PRIMARY KEY(FuncionarioGeral_ID),
Nome varchar(255) NOT NULL,
Cargo varchar(255) NOT NULL,

);

-- Tabela dos pacientes, chave primaria: PACIENTE_ID, chaves estrangeiras: Medico_ID e FuncionarioGeral_ID;
create table PACIENTE(
PACIENTE_ID int NOT NULL,
PRIMARY KEY (PACIENTE_ID),
CEP int(8) NOT NULL,
Nome varchar(255) NOT NULL,

);
-- Tabela dos Medicos, chave primaria: MEDICO_ID, chaves estrangeiras : PACIENTE_ID
create table MEDICOS(
MEDICO_ID int NOT NULL,
PRIMARY KEY (MEDICO_ID),
Nome varchar(255) NOT NULL,

);

-- Tabela das receitas, Chave primaria : RECEITAS_ID(PK), Chaves estrangeiras: MEDICO_ID(FK)
create table RECEITAS(
Receitas_ID int NOT NULL,
PRIMARY KEY(Receitas_ID),
Nome_Do_Paciente varchar(255),
Categoria varchar(255),

); 

-- Adiciona a chave estrangeira FuncionarioGeral_ID em estoque após a criação da tabela Funcionarios
ALTER TABLE estoque
ADD FuncionarioGeral_ID INT UNIQUE,
ADD CONSTRAINT fk_estoque_funcionario FOREIGN KEY (FuncionarioGeral_ID) REFERENCES Funcionarios(FuncionarioGeral_ID);

-- Adiciona a chave estrangeira PACIENTE_ID em Funcionarios após a criação da tabela PACIENTE
ALTER TABLE Funcionarios
ADD PACIENTE_ID INT,
ADD CONSTRAINT fk_funcionario_paciente FOREIGN KEY (PACIENTE_ID) REFERENCES PACIENTE(PACIENTE_ID);

-- Adiciona a chave estrangeira FuncionarioGeral_ID em PACIENTE após a criação da tabela Funcionarios
ALTER TABLE PACIENTE
ADD FuncionarioGeral_ID INT,
ADD CONSTRAINT fk_paciente_funcionario FOREIGN KEY (FuncionarioGeral_ID) REFERENCES Funcionarios(FuncionarioGeral_ID);

-- Adiciona a chave estrangeira PACIENTE_ID em MEDICOS após a criação da tabela PACIENTE
ALTER TABLE MEDICOS
ADD PACIENTE_ID INT,
ADD CONSTRAINT fk_medico_paciente FOREIGN KEY (PACIENTE_ID) REFERENCES PACIENTE(PACIENTE_ID);

-- Corrige o nome da tabela referenciada em RECEITAS (de Medico para MEDICOS)
ALTER TABLE RECEITAS
ADD MEDICO_ID INT,
ADD CONSTRAINT fk_receita_medico FOREIGN KEY (MEDICO_ID) REFERENCES MEDICOS(MEDICO_ID)
