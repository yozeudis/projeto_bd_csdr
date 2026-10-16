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



);

create table public.usuario (
  id_usuario serial not null,
  nome character varying(100) not null,
  email character varying(150) not null,
  senha_hash character varying(255) not null,
  perfil character varying(255) not null,
  criado_em timestamp without time zone null,
  atualizado_em timestamp without time zone null,
  constraint usuario_pkey primary key (id_usuario)
);

CREATE TABLE dispositivo(
 id_dispositivo SERIAL PRIMARY KEY,
 usuario_id varchar(36),
 modelo  varchar(100) not null,
 sistema_operacional varchar(50)not null,
 versao_so   varchar(50)not null,
 arquitetura_cpu  varchar(50),
 nucleos_cpu   int,
 frequencia_cpu_ghz  decimal(4,2),
 memoria_ram_mb  int not null ,
 armazenamento_total_mb   bigint not null,
 armazenamento_livre_mb   bigint not null,
 coletado_em  timestamp
);

CREATE TABLE sessao_usuario(
 id_sessao_usuario SERIAL PRIMARY KEY,
 usuario_id   varchar(36) not null,
 token_jwt    varchar(500) not null,
 ip_origem    varchar(45),
 user_agent   text,
 expira_em    timestamp not null,
 criado_em    timestamp
 );

CREATE TABLE termo_lgpd(
id_termo_lgpd SERIAL PRIMARY KEY,
versao varchar(20) not null,
conteudo text not null,
data_publicacao timestamp
);

SELECT * FROM termo_lgpd;

INSERT INTO termo_lgpd (versao , conteudo , data_publicacao) VALUES('2.0','aplicativo','2026-01-19 12:00:00');

CREATE TABLE aplicativo (
id_aplicativo SERIAL PRIMARY KEY,
nome varchar (150) not null,
desenvolvedora varchar (100),
descricao text,
categoria varchar (50),
criado_por varchar (36),
criado_em timestamp 
);

SELECT * FROM aplicativo;

INSERT INTO aplicativo (nome , desenvolvedora , descricao , categoria , criado_por , criado_em ) 
VALUES('whatsapp', 'meta', 'aplicativo de comunicacao', 'todas as idades', 'meta', '2009-02-24 14:00:00');
INSERT INTO aplicativo (nome , desenvolvedora , descricao , categoria , criado_por , criado_em ) 
VALUES('faceboock', 'meta', 'aplicativo de entretenimento', 'todas as idades', 'meta', '2004-06-19 14:00:00');
INSERT INTO aplicativo (nome , desenvolvedora , descricao , categoria , criado_por , criado_em ) 
VALUES('instagram', 'meta', 'aplicativo de entretenimento', 'todas as idades', 'meta', '2005-01-14 14:00:00');


