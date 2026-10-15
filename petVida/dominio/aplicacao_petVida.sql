create database if not exists petVida;

create table if not exists clientes(
	id_cliente int auto_increment primary key,
    nomeCliente varchar (150) not null,
    cpfCliente char (15) not null unique,
    enderecoCliente varchar (100) not null,
    telefoneCliente char (16) not null
) ENGINE = InnoDB;

create table if not exists pets(
	id_pet int auto_increment primary key,
    id_cliente int not null,
    especie varchar (15) not null,
    raca varchar (25) not null,
    dataNascimento varchar (15) not null,
	foreign key (id_cliente) references clientes(id_cliente)
)ENGINE = InnoDB;

create table if not exists veterinarios (
	id_veterinario int auto_increment primary key,
     nomeVeterinario varchar (150) not null,
    cpfVeterinario char (15) not null unique,
    enderecoVeterinario varchar (100) not null,
    telefoneVeterinario char (16) not null
)ENGINE = InnoDB;

create table if not exists consultas(
	id_consulta int auto_increment primary key,
    data_consulta datetime not null,
    status_consulta char(15) not null,
    valor_consulta decimal(10,2),
    id_cliente int not null,
    id_veterinario int not null,
    foreign key (id_cliente) references clientes(id_cliente),
    foreign key (id_veterinario) references veterinarios(id_veterinario)
)ENGINE = InnoDB;

create table if not exists prescricoes(
	id_prescricoes int auto_increment primary key,
	id_consulta int not null,
    id_pet int not null,
    id_veterinario int not null,
    posologia varchar (200) not null,
	foreign key (id_consulta) references consultas(id_consulta),
    foreign key (id_pet) references pets(id_pet)    
)ENGINE = InnoDB;


-- insert dos clientes genéricos --

INSERT INTO clientes (nomeCliente, cpfCliente,enderecoCliente , telefoneCliente) VALUES
('Ana Silva', '111.222.333-01', 'rua são paulo, jardim progresso 200', '(11) 98765-4321'),
('Bruno Costa', '222.333.444-02', 'Avenida Brasil, Centro 500', '(11) 98765-4322'),
('Carla Souza', '333.444.555-03', 'Rua das Flores, Vila Nova 120', '(11) 98765-4323'),
('Daniel Oliveira', '444.555.666-04', 'Rua XV de Novembro, Alto da Boa Vista 45', '(11) 98765-4324'),
('Eduarda Lima', '555.666.777-05', 'Alameda Santos, Jardins 880', '(11) 98765-4325'),
('Fernando Santos', '666.777.888-06', 'Rua Amazonas, Bairro dos Estados 310', '(11) 98765-4326'),
('Gabriela Rocha', '777.888.999-07', 'Avenida Paulista, Bela Vista 1500', '(11) 98765-4327'),
('Henrique Alves', '888.999.000-08', 'Rua Rio de Janeiro, Santa Efigênia 72', '(11) 98765-4328'),
('Isabela Martins', '999.000.111-09', 'Rua Castro Alves, Liberdade 405', '(11) 98765-4329'),
('João Pedro Ferreira', '000.111.222-10', 'Avenida Rebouças, Pinheiros 2100', '(11) 98765-4330'),
('Karina Mendes', '123.123.123-11', 'Rua Augusta, Consolação 950', '(11) 98765-4331'),
('Lucas Barbosa', '234.234.234-12', 'Rua Vergueiro, Vila Mariana 1340', '(11) 98765-4332'),
('Mariana Dias', '345.345.345-13', 'Avenida Brigadeiro Faria Lima, Itaim Bibi 3000', '(11) 98765-4333'),
('Nicolas Ribeiro', '456.456.456-14', 'Rua Domingos de Morais, Saúde 820', '(11) 98765-4334');

insert into veterinarios (nomeVeterinario, cpfVeterinario, telefoneVeterinario, enderecoVeterinario) VALUES
('Dr. Carlos Mendes', '11122233301', '11977771111', 'Rua das Palmeiras, 100 - São Paulo'),
('Dra. Vanessa Rios', '22233344402', '11977772222', 'Avenida Paulista, 1500 - São Paulo'),
('Dr. Roberto Rocha', '33344455503', '11977773333', 'Rua Augusta, 850 - Consolação'),
('Dra. Fernanda Luz', '44455566604', '11977774444', 'Alameda Santos, 400 - Jardins');

INSERT INTO pets (id_cliente, especie, raca, dataNascimento) VALUES
(1, 'Cachorro', 'Pastor Alemão', '2020-05-10'),
(2, 'Gato', 'Persa', '2021-02-15'),
(3, 'Cachorro', 'Golden Retriever', '2019-11-20'),
(4, 'Gato', 'Siamês', '2022-01-05'),
(5, 'Cachorro', 'Poodle', '2018-08-30'),
(6, 'Cachorro', 'Vira-lata SRD', '2021-06-12'),
(7, 'Gato', 'Maine Coon', '2020-09-01'),
(8, 'Cachorro', 'Bulldog Francês', '2022-03-18'),
(9, 'Cachorro', 'Beagle', '2019-04-25'),
(10, 'Gato', 'Vira-lata SRD', '2023-01-10'),
(11, 'Cachorro', 'Rottweiler', '2017-12-01'),
(12, 'Cachorro', 'Shih Tzu', '2020-07-22'),
(13, 'Gato', 'Angorá', '2019-03-14'),
(14, 'Cachorro', 'Husky Siberiano', '2021-10-08');

INSERT INTO consultas (data_consulta, status_consulta, valor_consulta, id_cliente, id_veterinario) VALUES
('2026-10-15 09:00:00', 'Realizada', 150.00, 1, 1),
('2026-10-15 10:00:00', 'Realizada', 200.00, 2, 2),
('2026-10-15 11:00:00', 'Realizada', 180.00, 3, 3),
('2026-10-15 14:00:00', 'Realizada', 250.00, 4, 4),
('2026-10-16 09:30:00', 'Agendada', 150.00, 5, 1),
('2026-10-16 10:30:00', 'Agendada', 220.00, 6, 2),
('2026-10-16 11:30:00', 'Agendada', 190.00, 7, 3),
('2026-10-16 14:30:00', 'Agendada', 300.00, 8, 4),
('2026-10-17 08:00:00', 'Agendada', 150.00, 9, 1),
('2026-10-17 09:00:00', 'Agendada', 210.00, 10, 2),
('2026-10-17 10:00:00', 'Agendada', 175.00, 11, 3),
('2026-10-17 11:00:00', 'Agendada', 280.00, 12, 4),
('2026-10-18 13:00:00', 'Cancelada', 150.00, 13, 1),
('2026-10-18 14:00:00', 'Agendada', 200.00, 14, 2);

INSERT INTO prescricoes (id_consulta, id_pet, id_veterinario, posologia) VALUES
(1, 1, 1, 'Aplicação de Vacina V10 em dose única no ato da consulta.'),
(2, 2, 2, 'Apoquel 16mg - Tomar 1 comprimido a cada 12 horas por 14 dias.'),
(3, 3, 3, 'Meloxicam 2.5mg - Administrar 1 comprimido ao dia por 7 dias após refeição.'),
(4, 4, 4, 'Dipirona Gotas - Mapear 10 gotas a cada 8 horas em caso de dor ou febre.'),
(5, 5, 1, 'Shampoo de Clorexidina - Banho 2 vezes por semana com repouso de 10 minutos.'),
(6, 6, 2, 'Tobramicina Colírio - Pingar 1 gota no olho afetado a cada 6 horas por 7 dias.'),
(7, 7, 3, 'Carproflan 75mg - Administrar 1 comprimido ao dia durante 5 dias.'),
(8, 8, 4, 'Gaviz V 10mg - Dar 1 comprimido em jejum pela manhã durante 10 dias.'),
(9, 9, 1, 'Vermífugo Drontal - Tomar 1 comprimido em dose única e repetir após 15 dias.'),
(10, 10, 2, 'Apoquel 5.4mg - Administrar 1/2 comprimido a cada 12 horas durante 10 dias.'),
(11, 11, 3, 'Condroton 1000mg - Dar 1 comprimido ao dia misturado na ração por 60 dias.'),
(12, 12, 4, 'Gel Dental Pet - Aplicação diária na gengiva após escovação noturna.'),
(13, 13, 1, 'Consulta cancelada pelo cliente - Sem prescrição médica liberada.'),
(14, 14, 2, 'Simparic Comprimido - Administrar 1 comprimido mastigável via oral hoje.');


-- consultas das tabelas --

select * from pets where especie = 'Cachorro';
select * from pets where especie = 'Gato';
select * from consultas where status_consulta = 'Cancelada';
select * from consultas where status_consulta = 'Agendada';
select * from consultas where status_consulta = 'Realizada';

--  listar em ordem alfabetica
SELECT nomeCliente, telefoneCliente, cpfCliente 
FROM clientes 
ORDER BY nomeCliente ASC;

--  Buscar clientes q nome cmc com A
SELECT * 
FROM clientes 
WHERE nomeCliente LIKE 'A%';

--  consulta pet e seu dono
SELECT p.id_pet, p.especie, p.raca, c.nomeCliente, c.telefoneCliente
FROM pets p
INNER JOIN clientes c ON p.id_cliente = c.id_cliente;

--  quantidade total de cada especie
SELECT especie, COUNT(*) AS total_pets
FROM pets
GROUP BY especie;

-- ver consultas entre 150 e 220
SELECT id_consulta, data_consulta, status_consulta, valor_consulta
FROM consultas
WHERE valor_consulta BETWEEN 150.00 AND 220.00;

--  valor faturado pela veterinaria com as consultas
SELECT SUM(valor_consulta) AS faturamento_total
FROM consultas;

--  media de valores das consultas
SELECT AVG(valor_consulta) AS media_valor_consulta
FROM consultas;

--  detalhar consultas
SELECT c.id_consulta, cl.nomeCliente, v.nomeVeterinario, c.data_consulta, c.valor_consulta, c.status_consulta
FROM consultas c
INNER JOIN clientes cl ON c.id_cliente = cl.id_cliente
INNER JOIN veterinarios v ON c.id_veterinario = v.id_veterinario;

--  total q tal pessou gastou em consultas
SELECT cl.nomeCliente, SUM(c.valor_consulta) AS total_gasto
FROM consultas c
INNER JOIN clientes cl ON c.id_cliente = cl.id_cliente
GROUP BY cl.nomeCliente
ORDER BY total_gasto DESC;

-- prescricao mais detalhada
SELECT pr.id_prescricoes, p.especie, v.nomeVeterinario, pr.posologia
FROM prescricoes pr
INNER JOIN pets p ON pr.id_pet = p.id_pet
INNER JOIN veterinarios v ON pr.id_veterinario = v.id_veterinario;

	






