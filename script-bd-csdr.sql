CREATE TABLE id_consentimento_usuario(
 id_consentimento_usuario SERIAL PRIMARY KEY,
 usuario_id varchar(36) not null,
 termo_id int not null,
 aceito boolean not null,
 data_consentimento  timestamp
);

-- Exemplo 1: Usuário aceitou o termo de privacidade (ID 1)
INSERT INTO consentimento_usuario (usuario_id, termo_id, aceito) 
VALUES ('a1b2c3d4-e5f6-7a8b-9c0d-1e2f3a4b5c6d', 1, TRUE);

-- Exemplo 2: Outro usuário aceitou o termo de uso do app (ID 2)
INSERT INTO consentimento_usuario (usuario_id, termo_id, aceito) 
VALUES ('f9e8d7c6-b5a4-3f2e-1d0c-9b8a7f6e5d4c', 2, TRUE);

-- Exemplo 3: Usuário rejeitou ou revogou o consentimento de cookies (ID 3)
INSERT INTO consentimento_usuario (usuario_id, termo_id, aceito) 
VALUES ('12345678-abcd-ef01-2345-6789abcdef01', 3, FALSE);



SELECT * FROM consentimento_usuario;


CREATE TABLE diagnostico_compatibilidade(
id_diagnostico_compatibilidade SERIAL PRIMARY KEY,
usuario_id int not null,
dispositivo_id int not null,
aplicativo_id int not null,
status varchar (255) not null,
detalhes_falhas json,
executado_em timestamp
);
