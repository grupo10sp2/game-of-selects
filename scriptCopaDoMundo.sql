-- Criando o banco de dados Copa do Mundo

CREATE DATABASE copaDoMundo;

-- Selecionando o banco de dados

USE copaDoMundo;

-- Criando a tabela Seleção

CREATE TABLE selecao (
    idSelecao INT PRIMARY KEY AUTO_INCREMENT,
    pais VARCHAR(45),
    tecnico VARCHAR(45)
);

-- Criando a tabela Jogador

CREATE TABLE jogador (
    idJogador INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    numeroCamisa INT,
    posicao VARCHAR(45),
    fkSelecao INT,
    FOREIGN KEY (fkSelecao) REFERENCES selecao(idSelecao)
);

-- Criando a tabela Classificação

CREATE TABLE classificacao (
    idClassificacao INT PRIMARY KEY AUTO_INCREMENT,
    fkSelecao INT,
    FOREIGN KEY (fkSelecao) REFERENCES selecao(idSelecao),
    qtdJogos INT,
    qtdVitorias INT,
    qtdDerrotas INT,
    qtdEmpates INT,
    golsPros INT,
    golsContras INT,
    saldoGols INT,
    grupo VARCHAR(45)
);

-- Criando a tabela Partida

CREATE TABLE partida (
    idPartida INT PRIMARY KEY AUTO_INCREMENT,
    dataHoraInicio DATETIME,
    duracao TIME,
    golsSelecao1 INT,
    golsSelecao2 INT
);

-- Criando a tabela Seleçoes Partida

CREATE TABLE selecoesPartida (
    fkPartida INT,
    FOREIGN KEY (fkPartida) REFERENCES partida(idPartida),
    fkSelecao1 INT,
    FOREIGN KEY (fkSelecao1) REFERENCES selecao(idSelecao),
    fkSelecao2 INT,
    FOREIGN KEY (fkSelecao2) REFERENCES selecao(idSelecao),
    PRIMARY KEY (fkPartida, fkSelecao1, fkSelecao2)
);

-- Criando a tabela Estádio

CREATE TABLE estadio (
    idEstadio INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(45),
    cidade VARCHAR(45)
);

-- Criando a tabela Estádio Jogo

CREATE TABLE estadioJogo (
    fkPartida INT,
    FOREIGN KEY (fkPartida) REFERENCES partida(idPartida),
    fkEstadio INT,
    FOREIGN KEY (fkEstadio) REFERENCES estadio(idEstadio),
    PRIMARY KEY (fkPartida, fkEstadio)
);

-- Criando a tabela Arbitragem

CREATE TABLE arbitragem (
    idArbitragem INT PRIMARY KEY AUTO_INCREMENT,
    nomeArbitroOficial VARCHAR(45),
    nomeBandeirinha1 VARCHAR(45),
    nomeBandeirinha2 VARCHAR(45)
);

-- Criando a tabela Arbitragem Jogo

CREATE TABLE arbitragemJogo (
    fkPartida INT,
    FOREIGN KEY (fkPartida) REFERENCES partida(idPartida),
    fkArbitragem INT,
    FOREIGN KEY (fkArbitragem) REFERENCES arbitragem(idArbitragem),
    PRIMARY KEY (fkPartida, fkArbitragem)
);

 -- Inserindo valores da entidade Selecao
 
 insert into selecao (pais, tecnico) values 
("Alemanha", "Hansi Flick"),
("Arábia Saudita", "Hervé Renard"),
("Argentina", "Lionel Scaloni"),
("Austrália", "Graham Arnold"),
("Bélgica", "Roberto Martínez"),
("Brasil", "Tite"),
("Camarões", "Rigobert Song"),
("Canadá", "John Herdman"),
("Catar", "Félix Sanchez"),
("Coreia do Sul", "Paulo Bento"),
("Costa Rica", "Luis Fernando Suárez"),
("Croácia", "Zlatko Dalić"),
("Dinamarca", "Kasper Hjulmand"),
("Equador", "Gustavo Alfaro"),
("Espanha", "Luis Enrique"),
("Estados Unidos", "Gregg Berhalter"),
("França", "Didier Deschamps"),
("Gana", "Otto Addo"),
("Holanda", "Louis Van Gaal"),
("Inglaterra", "Gareth Southgate"),
("Irã", "Dragan Skočić"),
("Japão", "Hajime Moriyasu"),
("Marrocos", "Walid Regragui"),
("México", "Gerardo Tata Martino"),
("País de Gales", "Rob Page"),
("Polônia", "Czesław Michniewicz"),
("Portugal", "Fernando Santos"),
("Senegal", "Aliou Cissé"),
("Sérvia", "Dragan Stojković"),
("Suíça", "Murat Yakin"),
("Tunísia", "Jalel Kadri"),
("Uruguai", "Diego Alonso");