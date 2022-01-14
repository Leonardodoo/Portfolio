create table aluno (
	id_cpf serial primary key,
	cpf varchar(20) not null,
	nome varchar(100) not null,
	endereco varchar(255) not null,
	telefone varchar(25) not null,
	data_nasc date not null
);

create table departamento (
	cod_dpto serial primary key,
	nome varchar(25)
);

create table curso (
	cod_curso serial primary key,
	nome varchar(50) not null,
	descricao varchar(255),
	cod_dpto int references departamento(cod_dpto)
);

create table matricula (
	cod_matricula serial primary key,
	data_matricula date not null,
	cod_curso int references curso(cod_curso),
	cpf_aluno int references aluno(id_cpf)
);

create table professor (
	id_matricula serial primary key,
	matricula varchar(5) not null,
	nome varchar(100) not null,
	endereco varchar(255) not null,
	telefone varchar(17),
	data_nasc date not null,
	data_contratacao date not null,
	cod_dpto int references departamento(cod_dpto)
);


create table disciplina (
	cod_disc serial primary key,
	disciplina varchar(36),
	qtde_credito varchar(20),
	matricula_prof int references professor(id_matricula)
);

create table cursa (
	cpf_aluno int references aluno(id_cpf),
	cod_disc int references disciplina(cod_disc)
);

create table compoe (
	cod_curso int references curso(cod_curso),
	cod_disc int references disciplina(cod_disc)
);

create table pre_req (
	cod_disc int references disciplina(cod_disc),
	cod_disc_dependencia int references disciplina(cod_disc),
	pre_req varchar(20)
);

insert into aluno(id_cpf, cpf, nome, endereco, telefone, data_nasc)
values (1, '578-906-789-01', 'Fernanda Machado de Assis', 'Rua da Esperança, 76', '21-99898-7417', '2000-04-18'),
(2, '558-996-329-21', 'Lucas Brabonildo de Melo', 'Rua da Serenidade, 26', '21-99878-7717', '2000-07-27'),
(3, '158-796-359-82', 'Miguel da Silva Santos', 'Rua da Saracutaia, 1576', '21-97787-0587', '2000-12-25'),
(4, '540-856-347-59', 'Agatha Souza do Ó', 'Rua da Joao Miguel, 175', '21-99208-7245', '2000-03-30'),
(5, '872-456-019-57', 'Fernando Fernades Torres', 'Rua do Sofrimento, 128', '21-99547-7777', '2000-04-19');

insert into departamento(cod_dpto, nome)
values (1, 'Coordenação'), (2, 'Administração'), (3, 'Financeiro');

insert into curso(cod_curso, nome, descricao, cod_dpto)
values (1, 'Administração', 'Curso voltado para parte administrativa empresarial', 2), 
(2, 'Gestão empresarial', 'Curso de Gestão empresárial', 2), 
(3, 'Tecnico em edificações', 'Curso da área de construção civil', 2);

insert into matricula(cod_matricula, data_matricula, cod_curso, cpf_aluno)
values (1, '2021-01-10', 3, 1), (2, '2021-01-10', 1, 2), (3, '2021-01-11', 2, 2),
(4, '2021-01-13', 1, 3), (5, '2021-01-14', 3, 4), (6, '2021-01-15', 2, 5);

insert into professor(id_matricula, matricula, nome, endereco, telefone, data_nasc, data_contratacao, cod_dpto)
values (1, '10501', 'André Pereira', 'Rua Santa Clara, 10', '21-98854-0345', '2064-01-01', '2021-01-01', 2),
(2, '10502', 'Jõao Bastardo Filho', 'Rua Bonita, 25', '21-98994-0775', '2078-07-15', '2021-01-02', 2),
(3, '10503', 'Antunes Mario Cavalcante', 'Rua São José, 57', '21-98479-2176', '2065-11-21', '2021-01-02', 2);

insert into disciplina(cod_disc, disciplina, qtde_credito, matricula_prof)
values (1, 'Matemática', '24 créditos', 1), (2, 'Administração', '24 créditos', 1), 
(3, 'Finanças','24 créditos', 1), (4, 'Economia','24 créditos', 2), 
(5, 'Fundamentos contabeis','24 créditos', 2), (6, 'Recursos Humanos','24 créditos', 2),
(7, 'Matemática','24 créditos', 3), (8, 'Desenho Técnico','24 créditos', 3),
(9, 'Mecânica do solo','24 créditos', 3);

insert into cursa(cpf_aluno, cod_disc)
values (1, 7), (1, 8), (1, 9), (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6),
(3, 1), (3, 2), (3, 3), (4, 7), (4, 8), (4, 9), (5, 4), (5, 5), (5, 6);

insert into compoe(cod_curso, cod_disc)
values (1, 1), (1, 2), (1, 3),
(2, 4), (2, 5), (2, 6),
(3, 7), (3, 8), (3, 9);

insert into pre_req(cod_disc, cod_disc_dependencia, pre_req)
values (1, 1, 'Min 3 faltas'), (2, 2, 'Min 3 faltas'), (3, 3, 'Min 3 faltas'),
(4, 4, 'Min 3 faltas'), (5, 5, 'Min 3 faltas'), (6, 6, 'Min 3 faltas'),
(7, 7, 'Min 3 faltas'), (8, 8, 'Min 3 faltas'), (9, 9, 'Min 3 faltas');