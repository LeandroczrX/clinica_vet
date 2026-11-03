-- 1.1 cria o banco de dados
CREATE DATABASE clinica_vet CHARACTER SET utf8mb4;

USE clinica_vet;
SET NAMES utf8mb4;

-- 1.2 cria a tabela tutor
CREATE TABLE tutor (
    id_tutor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL,
    telefone VARCHAR(15),
    cidade VARCHAR(50)
);

-- 1.3 cria a tabela animal
CREATE TABLE animal (
    id_animal INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(30) NOT NULL,
    raca VARCHAR(40),
    data_nascimento DATE,
    id_tutor INT NOT NULL,
    FOREIGN KEY (id_tutor) REFERENCES tutor(id_tutor)
);

-- 1.4 cria a tabela consulta
CREATE TABLE consulta (
    id_consulta INT AUTO_INCREMENT PRIMARY KEY,
    data_consulta DATE NOT NULL,
    motivo VARCHAR(100) NOT NULL,
    valor DECIMAL(8,2) NOT NULL,
    id_animal INT NOT NULL,
    FOREIGN KEY (id_animal) REFERENCES animal(id_animal)
);

-- 1.5 mostra as tabelas
SHOW TABLES;

-- confere a tabela tutor
DESCRIBE tutor;

-- confere a tabela animal
DESCRIBE animal;

-- confere a tabela consulta
DESCRIBE consulta;

-- 2.1 insere os tutores
INSERT INTO tutor (nome, telefone, cidade) VALUES
('Mariana Souza', '14 99123-4567', 'Bauru'),
('Carlos Pereira', '14 98822-1100', 'Duartina'),
('Fernanda Lima', '14 99700-3344', 'Cabrália Paulista');

-- 2.2 insere os animais
INSERT INTO animal (nome, especie, raca, data_nascimento, id_tutor) VALUES
('Thor', 'Cachorro', 'Labrador', '2020-03-15', 1),
('Mel', 'Gato', 'Siamês', '2021-07-22', 1),
('Bob', 'Cachorro', 'Poodle', '2019-11-05', 2),
('Luna', 'Gato', 'SRD', '2022-01-30', 3);

-- 2.3 insere as consultas
INSERT INTO consulta (data_consulta, motivo, valor, id_animal) VALUES
('2026-10-05', 'Vacinação', 90.00, 1),
('2026-10-12', 'Check-up', 120.00, 2),
('2026-10-20', 'Vacinação', 90.00, 3),
('2026-11-10', 'Retorno', 60.00, 1),
('2026-11-18', 'Check-up', 120.00, 4);

-- 2.4 mostra os registros das tabelas
SELECT * FROM tutor;
SELECT * FROM animal;
SELECT * FROM consulta;

-- 3.1 adiciona email na tabela tutor
ALTER TABLE tutor ADD email VARCHAR(100);

-- 3.2 adiciona peso na tabela animal
ALTER TABLE animal ADD peso DECIMAL(5,2);

-- 3.3 altera o tamanho do telefone
ALTER TABLE tutor MODIFY telefone VARCHAR(20);

-- 3.4 adiciona status na tabela consulta
ALTER TABLE consulta
ADD status VARCHAR(15) NOT NULL DEFAULT 'Agendada';

-- 4.1 atualiza o email da Mariana
UPDATE tutor
SET email = 'mariana.souza@email.com'
WHERE nome = 'Mariana Souza';

-- 4.2 atualiza o peso do Thor
UPDATE animal
SET peso = 32.50
WHERE nome = 'Thor';

-- atualiza o peso da Mel
UPDATE animal
SET peso = 4.20
WHERE nome = 'Mel';

-- 4.3 atualiza o telefone do Carlos
UPDATE tutor
SET telefone = '14 98822-9999'
WHERE nome = 'Carlos Pereira';

-- 4.4 atualiza o status das consultas
UPDATE consulta
SET status = 'Realizada'
WHERE data_consulta < '2026-11-01';

-- 4.5 aumenta o valor das consultas de vacinação em 10%
UPDATE consulta
SET valor = valor * 1.10
WHERE motivo = 'Vacinação';

-- 4.6 altera a data e o status da consulta
UPDATE consulta
SET data_consulta = '2026-11-12',
    status = 'Remarcada'
WHERE id_consulta = 4;

-- confere os tutores
SELECT * FROM tutor;

-- confere os animais
SELECT * FROM animal;

-- confere as consultas
SELECT * FROM consulta;
