
CREATE DATABASE IF NOT EXISTS petcare
CHARACTER SET utf8mb4
COLLATE utf8mb4_unicode_ci;

USE petcare;

-- Tabela de usuários
CREATE TABLE IF NOT EXISTS usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela de pets
CREATE TABLE IF NOT EXISTS pets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    especie VARCHAR(50) NOT NULL,
    raca VARCHAR(100),
    idade INT NOT NULL,
    sexo VARCHAR(20) NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (usuario_id)
    REFERENCES usuarios(id)
    ON DELETE CASCADE
);

-- Tabela de consultas veterinárias
CREATE TABLE IF NOT EXISTS consultas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    veterinario VARCHAR(100) NOT NULL,
    data_consulta DATE NOT NULL,
    horario TIME NOT NULL,
    motivo TEXT NOT NULL,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (pet_id)
    REFERENCES pets(id)
    ON DELETE CASCADE
);

-- Tabela de cuidados
CREATE TABLE IF NOT EXISTS cuidados (
    id INT AUTO_INCREMENT PRIMARY KEY,
    pet_id INT NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    descricao TEXT NOT NULL,
    data_cuidado DATE NOT NULL,
    proxima_data DATE,
    criado_em TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (pet_id)
    REFERENCES pets(id)
    ON DELETE CASCADE
);

-- Índices para facilitar as consultas
CREATE INDEX idx_pets_usuario
ON pets(usuario_id);

CREATE INDEX idx_consultas_pet
ON consultas(pet_id);

CREATE INDEX idx_cuidados_pet
ON cuidados(pet_id);
