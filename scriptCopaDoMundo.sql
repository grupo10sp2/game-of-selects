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

select * from selecao;

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

-- add o atributo pontos na entidade classificacao
alter table classificacao add column pontos int;

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

-- Inserindo valores da entidade jogador

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Neuer", 1, "goleiro", 1),
("Hofmann ", 2, "lateral-direito", 1),
("Süle", 3, "zagueiro", 1),
("Rüdiger", 4, "zagueiro", 1),
("Raum", 6, "lateral-esquerdo", 1),
("Kimmich", 5, "volante", 1),
("Gündogan", 8, "meia-direita", 1),
("Havertz", 10, "atacante", 1),
("Musiala", 11, "meia-esquerda", 1),
("Sané", 7, "ponta-direita", 1),
("Werner", 9, "ponta-esquerda", 1);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Al-Owais", 1, "goleiro", 2),
("Al-Amri", 2, "lateral-direito", 2),
("Al-Gaham", 3, "zagueiro", 2),
("Madu", 4, "zagueiro", 2),
("Al-Shahrami", 6, "lateral-esquerdo", 2),
("Kanno", 5, "volante", 2),
("Al-Malki", 8, "meia-direita", 2),
("Al-Muwallad", 10, "atacante", 2),
("Al-Faraj", 11, "meia-esquerda", 2),
("Al-Dawasari", 7, "ponta-direita", 2),
("Al-Shehri", 9, "ponta-esquerda", 2);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Martinez", 1, "goleiro", 3),
("Molina", 2, "lateral-direito", 3),
("Otamendi", 3, "zagueiro", 3),
("Romero", 4, "zagueiro", 3),
("Acuña", 6, "lateral-esquerdo", 3),
("De Paul", 5, "volante", 3),
("Paredes", 8, "meia-direita", 3),
("Di Maria", 10, "ponta-direita", 3),
("Messi", 11, "meia-esquerda", 3),
("Lo Celso", 7, "ponta-direita", 3),
("L. Martinez", 9, "centroavante", 3);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Ryan", 1, "goleiro", 4),
("Atkinson", 2, "lateral-direito", 4),
("Wright", 3, "zagueiro", 4),
("Rowles", 4, "zagueiro", 4),
("Behich", 6, "lateral-esquerdo", 4),
("Irvine", 5, "volante", 4),
("Mooy", 8, "meia-direita", 4),
("Boyle", 7, "ponta-direita", 4),
("Hrustic", 10, "meia-esquerda", 4),
("Leckie", 11, "ponta-esquerda", 4),
("Duke", 9, "centroavante", 4);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Courtois", 1, "goleiro", 5),
("Debaste", 2, "lateral-direito", 5),
("Boyata", 3, "zagueiro", 5),
("Vertonghen", 4, "zagueiro", 5),
("Carrasco", 6, "lateral-esquerdo", 5),
("Witsel", 5, "volante", 5),
("Tielemans", 8, "meia-direita", 5),
("Meunier", 7, "ponta-direita", 5),
("De Bruyne", 10, "meia-esquerda", 5),
("Hazard", 11, "ponta-esquerda", 5),
("Lukkaku", 9, "centroavante", 5);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Alisson", 1, "goleiro", 6),
("Danilo", 2, "lateral-direito", 6),
("Thiago Silva", 3, "zagueiro", 6),
("Marquinhos", 4, "zagueiro", 6),
("AlexSandro", 6, "lateral-esquerdo", 6),
("Fred", 5, "volante", 6),
("Casemiro", 8, "meia-direita", 6),
("Raphinha", 7, "ponta-direita", 6),
("Neymar", 10, "meia-esquerda", 6),
("L. Paquetá", 11, "ponta-esquerda", 6),
("Richarlison", 9, "centroavante", 6);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Onana", 1, "goleiro", 7),
("Fai", 2, "lateral-direito", 7),
("Castelletto", 3, "zagueiro", 7),
("Nkoulou", 4, "zagueiro", 7),
("Tolo", 6, "lateral-esquerdo", 7),
("Gouet", 5, "volante", 7),
("Anguissa", 8, "meia-direita", 7),
("Hongla", 7, "ponta-direita", 7),
("Ekambi", 10, "meia-esquerda", 7),
("Mbeuno", 11, "ponta-esquerda", 7),
("Aboubakar", 9, "centroavante", 7);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Borjan", 1, "goleiro", 8),
("Johnston", 2, "lateral-direito", 8),
("Vitória", 3, "zagueiro", 8),
("Miller", 4, "zagueiro", 8),
("Osorio", 6, "lateral-esquerdo", 8),
("Koné", 5, "volante", 8),
("Kaye", 8, "meia-direita", 8),
("Lareya", 7, "ponta-direita", 8),
("David", 10, "meia-esquerda", 8),
("Davies", 11, "ponta-esquerda", 8),
("Larin", 9, "centroavante", 8);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Barshan", 1, "goleiro", 9),
("Rawi", 2, "lateral-direito", 9),
("Khoukhi", 3, "zagueiro", 9),
("Salman", 4, "zagueiro", 9),
("Roró", 6, "lateral-esquerdo", 9),
("Madibo", 5, "volante", 9),
("Ahmed", 8, "meia-direita", 9),
("Al-Haydos", 7, "ponta-direita", 9),
("Hatern", 10, "meia-esquerda", 9),
("Ali", 11, "ponta-esquerda", 9),
("Afif", 9, "centroavante", 9);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Kim", 1, "goleiro", 10),
("Min-jae", 2, "lateral-direito", 10),
("Kwon", 3, "zagueiro", 10),
("Lee Yong", 4, "zagueiro", 10),
("Jin-su", 6, "lateral-esquerdo", 10),
("Hwang", 5, "volante", 10),
("Jung", 8, "meia-direita", 10),
("HeeChan", 7, "ponta-direita", 10),
("Son", 10, "meia-esquerda", 10),
("Sung", 11, "ponta-esquerda", 10),
("UiJo", 9, "centroavante", 10);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Navas", 1, "goleiro", 11),
("Gamboa", 2, "lateral-direito", 11),
("Waston", 3, "zagueiro", 11),
("Duarte", 4, "zagueiro", 11),
("Oviedo", 6, "lateral-esquerdo", 11),
("Borges", 5, "volante", 11),
("Chacon", 8, "meia-direita", 11),
("Torres", 7, "ponta-direita", 11),
("Benette", 10, "meia-esquerda", 11),
("Campbell", 11, "ponta-esquerda", 11),
("Venegas", 9, "centroavante", 11);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Livakovic", 1, "goleiro", 12),
("Juranovic", 2, "lateral-direito", 12),
("Vida", 3, "zagueiro", 12),
("Gvardiol", 4, "zagueiro", 12),
("Barisic", 6, "lateral-esquerdo", 12),
("Brozovic", 5, "volante", 12),
("Kovacic", 8, "meia-direita", 12),
("Vlasic", 7, "ponta-direita", 12),
("Modric", 10, "meia-esquerda", 12),
("Perisic", 11, "ponta-esquerda", 12),
("Kramaric", 9, "centroavante", 12);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Schmeichel", 1, "goleiro", 13),
("Andersen", 2, "lateral-direito", 13),
("Kjaer", 3, "zagueiro", 13),
("Christensen", 4, "zagueiro", 13),
("Maehle", 6, "lateral-esquerdo", 13),
("Hojberg", 5, "volante", 13),
("Delaney", 8, "meia-direita", 13),
("Eriksen", 7, "ponta-direita", 13),
("Olsen", 10, "meia-esquerda", 13),
("Wass", 11, "ponta-esquerda", 13),
("Dolberg", 9, "centroavante", 13);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Dominguez", 1, "goleiro", 14),
("Preciado", 2, "lateral-direito", 14),
("Torres", 3, "zagueiro", 14),
("Hincapié", 4, "zagueiro", 14),
("Estupinan", 6, "lateral-esquerdo", 14),
("Franco", 5, "volante", 14),
("Gruezo", 8, "meia-direita", 14),
("Caicedo", 7, "ponta-direita", 14),
("Plata", 10, "meia-esquerda", 14),
("Valencia", 11, "ponta-esquerda", 14),
("Ibarra", 9, "centroavante", 14);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Simon", 1, "goleiro", 15),
("Azpilicueta", 2, "lateral-direito", 15),
("Garcia", 3, "zagueiro", 15),
("Torres", 4, "zagueiro", 15),
("Alba", 6, "lateral-esquerdo", 15),
("Busquets", 5, "volante", 15),
("Gavi", 8, "meia-direita", 15),
("Sarabia", 7, "ponta-direita", 15),
("Pedri", 10, "meia-esquerda", 15),
("Fernando", 11, "ponta-esquerda", 15),
("Morata", 9, "centroavante", 15);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Turner", 1, "goleiro", 16),
("Yedlin", 2, "lateral-direito", 16),
("Long", 3, "zagueiro", 16),
("Zimmerman", 4, "zagueiro", 16),
("Dest", 6, "lateral-esquerdo", 16),
("Adams", 5, "volante", 16),
("Musah", 8, "meia-direita", 16),
("Aaronson", 7, "ponta-direita", 16),
("McKennie", 10, "meia-esquerda", 16),
("Pulisic", 11, "ponta-esquerda", 16),
("Ferreira", 9, "centroavante", 16);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Lloris", 1, "goleiro", 17),
("Koundé", 2, "lateral-direito", 17),
("Varane", 3, "zagueiro", 17),
("Kimpembe", 4, "zagueiro", 17),
("Hernandez", 6, "lateral-esquerdo", 17),
("Tchounameni", 5, "volante", 17),
("Cavaminga", 8, "meia-direita", 17),
("Griezman", 7, "ponta-direita", 17),
("Pavard", 10, "meia-esquerda", 17),
("Mbappé", 11, "ponta-esquerda", 17),
("Benzema", 9, "centroavante", 17);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Wollacott", 1, "goleiro", 18),
("Odoi", 2, "lateral-direito", 18),
("Amartey", 3, "zagueiro", 18),
("Salisu", 4, "zagueiro", 18),
("Rahman", 6, "lateral-esquerdo", 18),
("Partey", 5, "volante", 18),
("Ayew", 8, "meia-direita", 18),
("Sulemana", 7, "ponta-direita", 18),
("Kudus", 10, "meia-esquerda", 18),
("Ayew", 11, "ponta-esquerda", 18),
("Williams", 9, "centroavante", 18);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Flekken", 1, "goleiro", 19),
("Timber", 2, "lateral-direito", 19),
("Van Dijk", 3, "zagueiro", 19),
("Aké", 4, "zagueiro", 19),
("De Jong", 6, "lateral-esquerdo", 19),
("Gravenbarch", 5, "volante", 19),
("Dumfries", 8, "meia-direita", 19),
("Berghies", 7, "ponta-direita", 19),
("Blind", 10, "meia-esquerda", 19),
("Bergwin", 11, "ponta-esquerda", 19),
("Depay", 9, "centroavante", 19);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Pickford", 1, "goleiro", 20),
("Walker", 2, "lateral-direito", 20),
("Stones", 3, "zagueiro", 20),
("Maguire", 4, "zagueiro", 20),
("Bellingham", 6, "lateral-esquerdo", 20),
("Rice", 5, "volante", 20),
("Alexander", 8, "meia-direita", 20),
("Shaw", 7, "ponta-direita", 20),
("Foden", 10, "meia-esquerda", 20),
("Sterling", 11, "ponta-esquerda", 20),
("Kane", 9, "centroavante", 20);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Beiranvand", 1, "goleiro", 21),
("Moharrami", 2, "lateral-direito", 21),
("Khalizadeh", 3, "zagueiro", 21),
("Kannandinezan", 4, "zagueiro", 21),
("Mohammadi", 6, "lateral-esquerdo", 21),
("Ezatolah", 5, "volante", 21),
("Hajsafi", 8, "meia-direita", 21),
("Torabi", 7, "ponta-direita", 21),
("Amiri", 10, "meia-esquerda", 21),
("Taremi", 11, "ponta-esquerda", 21),
("Azmoun", 9, "centroavante", 21);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Gonda", 1, "goleiro", 22),
("Sakai", 2, "lateral-direito", 22),
("Yoshida", 3, "zagueiro", 22),
("Tomiyasi", 4, "zagueiro", 22),
("Nagatomo", 6, "lateral-esquerdo", 22),
("Shibasaki", 5, "volante", 22),
("Tanaka", 8, "meia-direita", 22),
("Kubo", 7, "ponta-direita", 22),
("Minamino", 10, "meia-esquerda", 22),
("Maeda", 11, "ponta-esquerda", 22),
("Furuhashi", 9, "centroavante", 22);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Bono", 1, "goleiro", 23),
("Mazraoui", 2, "lateral-direito", 23),
("Saiss", 3, "zagueiro", 23),
("Aguerd", 4, "zagueiro", 23),
("Hakimi", 6, "lateral-esquerdo", 23),
("Ambarat", 5, "volante", 23),
("Ounahi", 8, "meia-direita", 23),
("Harit", 7, "ponta-direita", 23),
("Ziyech", 10, "meia-esquerda", 23),
("Boufai", 11, "ponta-esquerda", 23),
("Nesyri", 9, "centroavante", 23);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Ochoa", 1, "goleiro", 24),
("Sanchez", 2, "lateral-direito", 24),
("Montes", 3, "zagueiro", 24),
("Vasquez", 4, "zagueiro", 24),
("Alvarez", 6, "lateral-esquerdo", 24),
("Herrera", 5, "volante", 24),
("Guardado", 8, "meia-direita", 24),
("Alvarado", 7, "ponta-direita", 24),
("Lozano", 10, "meia-esquerda", 24),
("Arteaga", 11, "ponta-esquerda", 24),
("Jimenez", 9, "centroavante", 24);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Hennesey", 1, "goleiro", 25),
("Mephan", 2, "lateral-direito", 25),
("Rodon", 3, "zagueiro", 25),
("Davues", 4, "zagueiro", 25),
("Allen", 6, "lateral-esquerdo", 25),
("Ramsey", 5, "volante", 25),
("Roberts", 8, "meia-direita", 25),
("Neco", 7, "ponta-direita", 25),
("Bale", 10, "meia-esquerda", 25),
("Johnson", 11, "ponta-esquerda", 25),
("James", 9, "centroavante", 25);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Szceznezy", 1, "goleiro", 26),
("Kedziora", 2, "lateral-direito", 26),
("Glick", 3, "zagueiro", 26),
("Bednarek", 4, "zagueiro", 26),
("Zalewski", 6, "lateral-esquerdo", 26),
("Litteny", 5, "volante", 26),
("Zurkowski", 8, "meia-direita", 26),
("Cash", 7, "ponta-direita", 26),
("Symanski", 10, "meia-esquerda", 26),
("Zielinski", 11, "ponta-esquerda", 26),
("Lewandowski", 9, "centroavante", 26);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Costa", 1, "goleiro", 27),
("Cancelo", 2, "lateral-direito", 27),
("Dias", 3, "zagueiro", 27),
("Danilo", 4, "zagueiro", 27),
("Nuno", 6, "lateral-esquerdo", 27),
("Neves", 5, "volante", 27),
("William", 8, "meia-direita", 27),
("Cristiano Ronaldo", 7, "ponta-direita", 27),
("Bernardo", 10, "meia-esquerda", 27),
("Otavio", 11, "ponta-esquerda", 27),
("Fernandes", 9, "centroavante", 27);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Mendy", 1, "goleiro", 28),
("Sabaly", 2, "lateral-direito", 28),
("Seck", 3, "zagueiro", 28),
("Diallo", 4, "zagueiro", 28),
("Touré", 6, "lateral-esquerdo", 28),
("Gueye", 5, "volante", 28),
("Mendy", 8, "meia-direita", 28),
("Diatta", 7, "ponta-direita", 28),
("Sarr", 10, "meia-esquerda", 28),
("Dia", 11, "ponta-esquerda", 28),
("Mané", 9, "centroavante", 28);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Dmitrovic", 1, "goleiro", 29),
("Milenkovic", 2, "lateral-direito", 29),
("Velikovic", 3, "zagueiro", 29),
("Pavlovic", 4, "zagueiro", 29),
("Kostic", 6, "lateral-esquerdo", 29),
("Gudelj", 5, "volante", 29),
("Lukic", 8, "meia-direita", 29),
("Zivkovic", 7, "ponta-direita", 29),
("Tadic", 10, "meia-esquerda", 29),
("Mitrovic", 11, "ponta-esquerda", 29),
("Vlahovic", 9, "centroavante", 29);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Sommer", 1, "goleiro", 30),
("Widmer", 2, "lateral-direito", 30),
("Akanji", 3, "zagueiro", 30),
("Elvedi", 4, "zagueiro", 30),
("Rodriguez", 6, "lateral-esquerdo", 30),
("Freuler", 5, "volante", 30),
("Xhaka", 8, "meia-direita", 30),
("Shaqiri", 7, "ponta-direita", 30),
("Sow", 10, "meia-esquerda", 30),
("Vargas", 11, "ponta-esquerda", 30),
("Embolo", 9, "centroavante", 30);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Said", 1, "goleiro", 31),
("Drager", 2, "lateral-direito", 31),
("Ifa", 3, "zagueiro", 31),
("Talbi", 4, "zagueiro", 31),
("Maaloul", 6, "lateral-esquerdo", 31),
("Laidouni", 5, "volante", 31),
("Ben", 8, "meia-direita", 31),
("Khazri", 7, "ponta-direita", 31),
("Sassi", 10, "meia-esquerda", 31),
("Msakni", 11, "ponta-esquerda", 31),
("Jaziri", 9, "centroavante", 31);

insert into jogador (nome, numeroCamisa, posicao, fkSelecao) values
("Rochet", 1, "goleiro", 32),
("Suarez", 2, "lateral-direito", 32),
("Coates", 3, "zagueiro", 32),
("Caceres", 4, "zagueiro", 32),
("Vina", 6, "lateral-esquerdo", 32),
("Bentancur", 5, "volante", 32),
("Torreira", 8, "meia-direita", 32),
("Valverde", 7, "ponta-direita", 32),
("Arrascaeta", 10, "meia-esquerda", 32),
("Nunez", 11, "ponta-esquerda", 32),
("L. Suarez", 9, "centroavante", 32);

insert into estadio (nome, cidade) values
('Al Bayt Stadium','Al Khor'),
('Lusail Stadium','Lusail'),
('Khalifa International Stadium','Doha'),
('Stadium 974','Ras Bu Abboud'),
('Education City','Al Rayyan'),
('Ahmad Bin Ali','Al Rayyan'),
('Al Thumama','Doha'),
('Al Janoub','Al Wakrah');

insert into arbitragem (nomeArbitroOficial, nomeBandeirinha1, nomeBandeirinha2) values
("Abdulrahman Al-Jassim","Taleb Al Marri","Saoud Al-Maqaleh"),
("Chris Beath","Anton Shchetinin","Ashley Beecham"),
("Alireza Faghani","Mohammadreza Mansouri","Mohammadreza Abolfazli"),
("Ma Ning","Shi Xiang","Cao Yi"),
("Mohammed Abdulla Mohammed","Mohamed Alhammadi","Hasan Almahri"),
("Bakary Gassama","Elvis Noupue","Mahmoud Abouelregal"),
("Mustapha Ghorbal","Abdelhak Etchiali","Mokrane Gourari"),
("Victor Gomes","Zakhele Siwela","Souru Phatsoane"),
("Maguette N'Diaye","Djibril Camara","El Hadji Samba"),
("Janny Sikazwe","Jerson dos Santos","Arsenio Marengula"),
("Iván Barton","David Morán","Zachari Zeegelaar"),
("Ismail Elfath","Kyle Atkins","Corey Parker"),
("Mario Escobar","Juan Carlos Mora","Caleb Wales"),
("Said Martínez","Walter López","Helpys Feliz"),
("César Arturo Ramos","Alberto Morín","Miguel Hernández"),
("Raphael Claus","Danilo Manis","Bruno Pires"),
("Andrés Matonte","Nicolas Taran","Martin Soppi"),
("Kevin Ortega","Michael Orue","Jesús Sánchez"),
("Fernando Rapallini","Juan Bellati","Diego Bonfá"),
("Wilton Sampaio","Rodrigo Figueiredo","Bruno Boschilia"),
("Facundo Tello","Ezequiel Brailovsky","Gabriel Chade"),
("Jesús Valenzuela","Jorge Urrego","Tulio Moreno"),
("Matthew Conger","Tevita Makasini","Mark Rule"),
("István Kovács","Vasile Marinescu","Ovidiu Artene"),
("Danny Makkelie","Hessel Steegstra","Jan de Vries"),
("Szymon Marciniak","Pawel Sokolnicki","Tomasz Listkiewicz"),
("Antonio Mateu Lahoz","Pau Cebrián Devís","Roberto Díaz Pérez"),
("Michael Oliver","Stuart Burt","Simon Bennett"),
("Daniele Orsato","Alessandro Giallatini","Ciro Carbone"),
("Daniel Siebert","Jan Seidel","Rafael Foltyn"),
("Anthony Taylor","Gary Beswick","Adam Nunn"),
("Clément Turpin","Nicolas Danos","Cyril Gringore"),
("Slavko Vinčić","Tomaž Klančnik","Andraž Kovačič");

insert into classificacao (fkSelecao, pontos, qtdJogos, qtdVitorias, qtdDerrotas, qtdEmpates, golsPros, golsContras, saldoGols, grupo) values
(1, 9, 3, 3, 0, 0, 6, 2, 4, "E"),
(2, 0, 3, 0, 3, 0, 2, 5, -3, "C"),
(3, 9, 3, 3, 0, 0, 8, 3, 5, "C"),
(4, 1, 3, 0, 2, 1, 3, 6, -3, "D"),
(5, 9, 3, 3, 0, 0, 7, 3, 4, "F"),
(6, 9, 3, 3, 0, 0, 7, 2, 5, "G"),
(7, 4, 3, 1, 1, 1, 5, 5, 0, "G"),
(8, 0, 3, 0, 3, 0, 1, 7, -6, "F"),
(9, 0, 3, 0, 3, 0, 1, 6, -5, "A"),
(10, 3, 3, 1, 2, 0, 3, 4, -1, "H"),
(11, 0, 3, 0, 3, 0, 1, 4, -3, "E"),
(12, 6, 3, 2, 1, 0, 6, 3, 3, "F"),
(13, 7, 3, 2, 0, 1, 6, 2, 4, "D"),
(14, 6, 3, 2, 1, 0, 4, 3, 1, "A"),
(15, 6, 3, 2, 1, 0, 5, 5, 0, "E"),
(16, 3, 3, 1, 2, 0, 3, 5, -2, "B"),
(17, 7, 3, 2, 0, 1, 7, 3, 4, "D"),
(18, 0, 3, 0, 3, 0, 3, 6, -3, "H"),
(19, 9, 3, 3, 0, 0, 8, 2, 6, "A"),
(20, 6, 3, 2, 1, 0, 5, 3, 2, "B"),
(21, 0, 3, 0, 3, 0, 2, 6, -4, "B"),
(22, 3, 3, 1, 2, 0, 3, 4, -1, "E"),
(23, 0, 3, 0, 3, 0, 1, 6, -5, "F"),
(24, 3, 3, 1, 2, 0, 3, 4, -1, "C"),
(25, 6, 3, 2, 1, 0, 3, 5, -2, "B"),
(26, 6, 3, 2, 1, 0, 3, 3, 0, "C"),
(27, 7, 3, 2, 0, 1, 7, 4, 3, "H"),
(28, 3, 3, 1, 2, 0, 3, 3, 0, "A"),
(29, 4, 3, 1, 1, 1, 3, 4, -1, "G"),
(30, 4, 3, 1, 1, 1, 4, 4, 0, "G"),
(31, 1, 3, 0, 2, 1, 2, 7, -5, "D"),
(32, 7, 3, 2, 0, 1, 6, 3, 3, "H");






