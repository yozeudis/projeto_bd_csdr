CREATE TABLE id_consentimento_usuario(
 id_consentimento_usuario SERIAL PRIMARY KEY,
 usuario_id varchar(36) not null,
 termo_id int not null,
 aceito boolean not null,
 data_consentimento  timestamp
);

CREATE TABLE diagnostico_compatibilidade(
id_diagnostico_compatibilidade SERIAL PRIMARY KEY,
usuario_id int not null,
dispositivo_id int not null,
aplicativo_id int not null,
status varchar (255) not null,
detalhes_falhas json,
executado_em timestamp
);
