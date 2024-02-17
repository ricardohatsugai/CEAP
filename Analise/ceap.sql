/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     17/02/2024 20:04:32                          */
/*==============================================================*/


drop table if exists BAIRROS;

drop table if exists CIDADES;

drop table if exists ESTADOS;

drop table if exists PESSOAS;

/*==============================================================*/
/* Table: BAIRROS                                               */
/*==============================================================*/
create table BAIRROS
(
   BAI_ID               int not null,
   BAI_NOME             varchar(30) not null,
   CID_ID               int,
   primary key (BAI_ID)
);

/*==============================================================*/
/* Table: CIDADES                                               */
/*==============================================================*/
create table CIDADES
(
   CID_ID               int not null,
   CID_NOME             varchar(50) not null,
   EST_ID               int,
   primary key (CID_ID)
);

/*==============================================================*/
/* Table: ESTADOS                                               */
/*==============================================================*/
create table ESTADOS
(
   EST_ID               int not null,
   EST_NOME             varchar(30) not null,
   EST_SIGLA            varchar(5) not null,
   primary key (EST_ID)
);

/*==============================================================*/
/* Table: PESSOAS                                               */
/*==============================================================*/
create table PESSOAS
(
   PES_ID               int not null,
   PES_DATA_CADASTRO    date not null,
   PES_NOME             varchar(50) not null,
   PES_IDENTIDADE       varchar(30),
   PES_CPF              varchar(15),
   PES_ENDERECO         varchar(50),
   PES_NUMERO           varchar(15),
   PES_COMPLEMENTO      varchar(30),
   BAI_ID               int,
   PES_CEP              varchar(15),
   PES_TELEFONE         varchar(15),
   PES_CELULAR          varchar(15),
   PES_OBS              longtext,
   primary key (PES_ID)
);

alter table BAIRROS add constraint FK_CIDADES_TEM_N_BAIRROS foreign key (CID_ID)
      references CIDADES (CID_ID) on delete restrict on update restrict;

alter table CIDADES add constraint FK_ESTADOS_TEM_N_CIDADES foreign key (EST_ID)
      references ESTADOS (EST_ID) on delete restrict on update restrict;

alter table PESSOAS add constraint FK_BAIRROS_TEM_N_PESSOAS foreign key (BAI_ID)
      references BAIRROS (BAI_ID) on delete restrict on update restrict;

