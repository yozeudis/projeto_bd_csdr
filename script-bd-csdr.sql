DROP TABLE consentimento_usuario;


CREATE TABLE consentimento_usuario(
  id_consentimento_usuario SERIAL PRIMARY KEY,
  fk_usuario int not null,
  termo_id int not null,
  aceito boolean not null,
  data_consentimento  timestamp,
  constraint fk_consentimento_usuario foreign key (fk_usuario) references usuario (id_usuario)
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
constraint fk_diagnostico_compatibilidade foreign key (fk_usuario) references usuario (id_usuario)


DROP TABLE diagnostico_compatibilidade

CREATE TABLE diagnostico_compatibilidade(
id_diagnostico_compatibilidade SERIAL PRIMARY KEY,
usuario_id int not null,
dispositivo_id int not null,
aplicativo_id int not null,
status varchar (255) not null,
detalhes_falhas json,
executado_em timestamp,
constraint fk_diagnostico_compatibilidade foreign key (fk_usuario) references usuario (id_usuario)
);


-- Exemplo 1: Diagnóstico com SUCESSO (JSON vazio ou nulo)
INSERT INTO diagnostico_compatibilidade (usuario_id, dispositivo_id, aplicativo_id, status, detalhes_falhas)
VALUES (101, 5, 12, 'Sucesso', '{}');


-- Exemplo 2: Diagnóstico com ALERTA (Falha parcial / Memória RAM insuficiente)
INSERT INTO diagnostico_compatibilidade (usuario_id, dispositivo_id, aplicativo_id, status, detalhes_falhas)
VALUES (102, 8, 12, 'Atencao', '{"componente": "RAM", "requerido": "8GB", "detectado": "4GB", "mensagem": "Desempenho pode ser afetado"}');


-- Exemplo 3: Diagnóstico com FALHA CRÍTICA (Versão do SO incompatível)
INSERT INTO diagnostico_compatibilidade (usuario_id, dispositivo_id, aplicativo_id, status, detalhes_falhas)
VALUES (103, 3, 15, 'Incompativel', '{"erro": "SO_DESATUALIZADO", "os_atual": "Android 9", "os_minimo": "Android 11", "bloqueante": true}');




SELECT * FROM consentimento_usuario;






 CREATE TABLE public.usuario (
 id_usuario serial not null,
 nome character varying(100) not null,
 email character varying(150) not null,
 senha_hash character varying(255) not null,
 perfil character varying(255) not null,
 criado_em timestamp without time zone,
 atualizado_em timestamp without time zone ,
 constraint usuario_pkey primary key (id_usuario)
);
select * from public.usuario


INSERT INTO public.usuario (nome, email, senha_hash, perfil, criado_em, atualizado_em) VALUES
('Ana Silva', 'ana.silva@email.com', '2b12$eImiTXuWVxfM37uY4JANjO3z565v8G6/2', 'Administrador', NOW(), NOW()),
('Carlos Souza', 'carlos.souza@email.com', '2b12$L7R2m30mS4mS8mQ7mE1mO.7mR30mS4mS8', 'Gestor', NOW(), NOW()),
('Mariana Costa', 'mariana.costa@email.com', '2b12$Z1x2c3v4b5n6m7asdfghjklpowqeyruti', 'Cliente', NOW(), NOW());

