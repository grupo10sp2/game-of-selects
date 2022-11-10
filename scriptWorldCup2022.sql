create database worldcup2022;
use worldcup2022;

create table selecao (
idSelecao int primary key auto_increment,
pais VARCHAR(45),
tecnico varchar(45),
fkClassificacao int,
foreign key (fkClassificacao) references selecao(idSelecao)
);

create table jogador (
idJogador int primary key auto_increment,
nome varchar(45),
numeroCamisa int,
posicao varchar(45),
fkSelecao int,
foreign key (fkSelecao) references jogador(idJogador)
);

create table classificacao (
idClassificacao int primary key auto_increment,
qtd_pontos int,
qtd_vitorias int,
qtd_derrotas int,
qtd_empates int,
qtd_jogos int,
gols_contra int,
gols_pro int,
saldo_gols int,
fkGrupoA int,
foreign key (fkGrupoA) references classificacao(idClassificacao),
fkGrupoB int,
foreign key (fkGrupoB) references classificacao(idClassificacao),
fkGrupoC int,
foreign key (fkGrupoC) references classificacao(idClassificacao),
fkGrupoD int,
foreign key (fkGrupoD) references classificacao(idClassificacao),
fkGrupoE int,
foreign key (fkGrupoE) references classificacao(idClassificacao),
fkGrupoF int,
foreign key (fkGrupoF) references classificacao(idClassificacao),
fkGrupoG int,
foreign key (fkGrupoG) references classificacao(idClassificacao),
fkGrupoH int,
foreign key (fkGrupoH) references classificacao(idClassificacao)
);

create table Estádio (
idEstadio int primary key auto_increment,
nome varchar(45),
cidade varchar(45)
);

create table local_partida (
idLocal_partida int auto_increment,
fkEstadio int,
foreign key (fkEstadio) references local_partida(idLocal_partida),
fkPartida int,
foreign key (fkPartida) references local_partida(idLocal_partida),
primary key (idLocal_partida, fkEstadio, fkPartida)
);

create table partida (
idPartida int primary key auto_increment,
dataHora datetime
);