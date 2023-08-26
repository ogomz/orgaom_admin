/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     01/05/2023 17:38:48                          */
/*==============================================================*/


/*drop index IDX_BARRIOS_NOMBRE;

drop table BARRIOS;

drop index IDX_CARGOS_NOMBRE;

drop table CARGOS;

drop index IDX_CIUDADES_NOMBRE;

drop table CIUDADES;

drop table COLORES;

drop table COMPROBANTES;

drop table COMPROBANTES_DETALLES;

drop table CONFIGURACIONES_SITIO;

drop table CORREOS;

drop index IDX_DTPOS_NOMBRE;

drop table DEPARTAMENTOS;

drop table DESTINATARIOS;

drop table DOCUMENTOS_ADJUNTOS;

drop index IDX_DONADORES_DOCUMENTOS;

drop table DONADORES;

drop table EVENTOS;

drop table FUENTES;

drop index IDX_FUNDACIONES_RUC;

drop table FUNDACIONES;

drop index IDX_HABILITACIONES_NRO_TIMBRADO;

drop table HABILITACIONES;

drop table MODULOS_SITIO;

drop table NOTICIAS;

drop table PAGINAS;

drop table PERMISOS;

drop index IDX_SOLICITANTES_DOCUMENTO;

drop table PERSONAS_FUNDACION;

drop index IDX_PROVEEDORES_RUC;

drop table PROVEEDORES;

drop table ROLES;

drop table SOLICITUDES;

drop table SOLICITUDES_VOLUNTARIADO;

drop table USUARIOS_ADMINISTRACION;

drop table USUARIOS_FUNDACION;

drop index IDX_VOLUNTARIOS_DOCUMENTO;

drop table VOLUNTARIOS;

drop domain D_CHAR1;

drop domain D_DATE;

drop domain D_INT2;

drop domain D_INT4;

drop domain D_NUMERIC12;

drop domain D_TIMESTAMP;

drop domain D_VARCHAR15;

drop domain D_VARCHAR150;

drop domain D_VARCHAR260;

drop domain D_VARCHAR3;

drop domain D_VARCHAR60;*/

/*==============================================================*/
/* Domain: D_CHAR1                                              */
/*==============================================================*/
create domain D_CHAR1 as CHAR(1);

/*==============================================================*/
/* Domain: D_DATE                                               */
/*==============================================================*/
create domain D_DATE as DATE;

/*==============================================================*/
/* Domain: D_INT2                                               */
/*==============================================================*/
create domain D_INT2 as INT2;

/*==============================================================*/
/* Domain: D_INT4                                               */
/*==============================================================*/
create domain D_INT4 as INT4;

/*==============================================================*/
/* Domain: D_NUMERIC12                                          */
/*==============================================================*/
create domain D_NUMERIC12 as NUMERIC(12);

/*==============================================================*/
/* Domain: D_TIMESTAMP                                          */
/*==============================================================*/
create domain D_TIMESTAMP as TIMESTAMP;

/*==============================================================*/
/* Domain: D_VARCHAR15                                          */
/*==============================================================*/
create domain D_VARCHAR15 as VARCHAR(15);

/*==============================================================*/
/* Domain: D_VARCHAR150                                         */
/*==============================================================*/
create domain D_VARCHAR150 as VARCHAR(150);

/*==============================================================*/
/* Domain: D_VARCHAR260                                         */
/*==============================================================*/
create domain D_VARCHAR260 as VARCHAR(260);

/*==============================================================*/
/* Domain: D_VARCHAR3                                           */
/*==============================================================*/
create domain D_VARCHAR3 as VARCHAR(3);

/*==============================================================*/
/* Domain: D_VARCHAR60                                          */
/*==============================================================*/
create domain D_VARCHAR60 as VARCHAR(60);

/*==============================================================*/
/* Table: BARRIOS                                               */
/*==============================================================*/
create table BARRIOS (
   ID_BARRIO            SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   ID_CIUDAD            INT4                 not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_BARRIOS primary key (ID_BARRIO)
);

/*==============================================================*/
/* Index: IDX_BARRIOS_NOMBRE                                    */
/*==============================================================*/
create unique index IDX_BARRIOS_NOMBRE on BARRIOS (
NOMBRE,
ID_CIUDAD
);

/*==============================================================*/
/* Table: CARGOS                                                */
/*==============================================================*/
create table CARGOS (
   ID_CARGO             D_INT2               not null,
   NOMBRE               D_VARCHAR60          not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_CARGOS primary key (ID_CARGO)
);

/*==============================================================*/
/* Index: IDX_CARGOS_NOMBRE                                     */
/*==============================================================*/
create unique index IDX_CARGOS_NOMBRE on CARGOS (
NOMBRE
);

/*==============================================================*/
/* Table: CIUDADES                                              */
/*==============================================================*/
create table CIUDADES (
   ID_CIUDAD            SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   ID_DEPARTAMENTO      INT4                 not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_CIUDADES primary key (ID_CIUDAD)
);

/*==============================================================*/
/* Index: IDX_CIUDADES_NOMBRE                                   */
/*==============================================================*/
create unique index IDX_CIUDADES_NOMBRE on CIUDADES (
NOMBRE,
ID_DEPARTAMENTO
);

/*==============================================================*/
/* Table: COLORES                                               */
/*==============================================================*/
create table COLORES (
   ID_COLOR             SERIAL               not null,
   DESCRIPCION          D_VARCHAR60          not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_COLORES primary key (ID_COLOR)
);

/*==============================================================*/
/* Table: COMPROBANTES                                          */
/*==============================================================*/
create table COMPROBANTES (
   COMPROBANTE          SERIAL               not null,
   ID_FUNDACION         INT4                 not null,
   ID_PROVEEDOR         INT4                 not null,
   ID_DONADOR           INT4                 not null,
   FECHA                D_TIMESTAMP          not null,
   CONDICION            D_CHAR1              not null,
   TIMBRADO             D_VARCHAR15          not null,
   CODIGO_CONTROL       D_VARCHAR15          not null,
   TOTAL_COMPROBANTE    D_NUMERIC12          not null,
   TOTAL_IMPUESTO       D_NUMERIC12          not null,
   CODIGOQR             BYTEA                null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_COMPROBANTES primary key (COMPROBANTE)
);

/*==============================================================*/
/* Table: COMPROBANTES_DETALLES                                 */
/*==============================================================*/
create table COMPROBANTES_DETALLES (
   COMPROBANTE          INT4                 not null,
   ITEM                 D_INT2               not null,
   CONCEPTO             D_VARCHAR60          not null,
   CANTIDAD             D_INT2               not null,
   MONTO                D_NUMERIC12          not null,
   IMPUESTO             D_INT2               not null,
   SUBTOTAL             D_NUMERIC12          not null,
   MONTO_IMPUESTO       D_NUMERIC12          not null,
   constraint PK_COMPROBANTES_DETALLES primary key (COMPROBANTE, ITEM)
);

/*==============================================================*/
/* Table: CONFIGURACIONES_SITIO                                 */
/*==============================================================*/
create table CONFIGURACIONES_SITIO (
   ID_FUNDACION         INT4                 not null,
   ID_COLOR             INT4                 null,
   ID_FUENTES           INT4                 null,
   LOGO                 BYTEA                null,
   ESTADO               D_CHAR1              not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_CONFIGURACIONES_SITIO primary key (ID_FUNDACION)
);

/*==============================================================*/
/* Table: CORREOS                                               */
/*==============================================================*/
create table CORREOS (
   ID_CORREO            SERIAL               not null,
   ID_FUNDACION         INT4                 not null,
   ASUNTO               D_VARCHAR60          not null,
   CUERPO               D_VARCHAR260         not null,
   constraint PK_CORREOS primary key (ID_CORREO)
);

/*==============================================================*/
/* Table: DEPARTAMENTOS                                         */
/*==============================================================*/
create table DEPARTAMENTOS (
   ID_DEPARTAMENTO      SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_DEPARTAMENTOS primary key (ID_DEPARTAMENTO)
);

/*==============================================================*/
/* Index: IDX_DTPOS_NOMBRE                                      */
/*==============================================================*/
create unique index IDX_DTPOS_NOMBRE on DEPARTAMENTOS (
NOMBRE
);

/*==============================================================*/
/* Table: DESTINATARIOS                                         */
/*==============================================================*/
create table DESTINATARIOS (
   ID_DESTINATARIO      SERIAL               not null,
   FECHA_ENVIO          D_TIMESTAMP          not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   EMAIL                D_VARCHAR60          null,
   constraint PK_DESTINATARIOS primary key (ID_DESTINATARIO)
);

/*==============================================================*/
/* Table: DOCUMENTOS_ADJUNTOS                                   */
/*==============================================================*/
create table DOCUMENTOS_ADJUNTOS (
   ID_FUNDACION         INT4                 not null,
   ITEM                 D_INT2               not null,
   DESCRIPCION          D_VARCHAR150         not null,
   DOCUMENTO            D_VARCHAR150         not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_DOCUMENTOS_ADJUNTOS primary key (ID_FUNDACION, ITEM)
);

/*==============================================================*/
/* Table: DONADORES                                             */
/*==============================================================*/
create table DONADORES (
   ID_DONADOR           SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   DOCUMENTO            D_VARCHAR15          not null,
   DIRECCION            D_VARCHAR150         not null,
   CORREO_ELECTRONICO   D_VARCHAR60          not null,
   constraint PK_DONADORES primary key (ID_DONADOR)
);

/*==============================================================*/
/* Index: IDX_DONADORES_DOCUMENTOS                              */
/*==============================================================*/
create unique index IDX_DONADORES_DOCUMENTOS on DONADORES (
DOCUMENTO
);

/*==============================================================*/
/* Table: EVENTOS                                               */
/*==============================================================*/
create table EVENTOS (
   ID_EVENTO            SERIAL               not null,
   ID_FUNDACION         INT4                 not null,
   TITULO               D_VARCHAR60          not null,
   DESCRIPCION_CORTA    D_VARCHAR150         not null,
   DESCRIPCION          D_VARCHAR260         not null,
   FECHA_PUBLICACION    D_DATE               not null,
   FECHA_EVENTO         D_DATE               not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   IMAGEN               BYTEA                not null,
   constraint PK_EVENTOS primary key (ID_EVENTO)
);

/*==============================================================*/
/* Table: FUENTES                                               */
/*==============================================================*/
create table FUENTES (
   ID_FUENTES           SERIAL               not null,
   DESCRIPCION          D_VARCHAR60          not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_FUENTES primary key (ID_FUENTES)
);

/*==============================================================*/
/* Table: FUNDACIONES                                           */
/*==============================================================*/
create table FUNDACIONES (
   ID_FUNDACION         SERIAL               not null,
   RAZON_SOCIAL         D_VARCHAR60          not null,
   RUC                  D_VARCHAR15          not null,
   FELEFONO             D_VARCHAR15          not null,
   DIRECCION            D_VARCHAR150         not null,
   ID_BARRIO            INT4                 not null,
   RUBRO                D_VARCHAR60          not null,
   PROPOSITO            D_VARCHAR150         not null,
   FECHA_FUNDACION      D_DATE               not null,
   EMAIL                D_VARCHAR60          not null,
   ESTADO               D_CHAR1              not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_FUNDACIONES primary key (ID_FUNDACION)
);

comment on table FUNDACIONES is
'Rubros: educación, ayuda social, ayuda financiera
Propósito: para qué sirve la fundación';

/*==============================================================*/
/* Index: IDX_FUNDACIONES_RUC                                   */
/*==============================================================*/
create unique index IDX_FUNDACIONES_RUC on FUNDACIONES (
RUC
);

/*==============================================================*/
/* Table: HABILITACIONES                                        */
/*==============================================================*/
create table HABILITACIONES (
   ID_HABILITACION      SERIAL               not null,
   ID_FUNDACION         INT4                 null,
   NRO_TIMBRADO         D_VARCHAR15          not null,
   FECHA_INICIO         D_DATE               not null,
   FECHA_VIGENCIA       D_DATE               not null,
   ESTABLECIMIENTO      D_VARCHAR3           not null,
   PUNTO_EXPEDICION     D_VARCHAR3           not null,
   CODIGO_CONTROL       D_VARCHAR15          not null,
   RANGO_INICIAL        D_INT2               not null,
   RANGO_FINAL          D_INT2               not null,
   RANGO_ACTUAL         D_INT4               not null,
   ACTIVO               D_CHAR1              not null,
   TIPO                 D_CHAR1              not null,
   constraint PK_HABILITACIONES primary key (ID_HABILITACION)
);

/*==============================================================*/
/* Index: IDX_HABILITACIONES_NRO_TIMBRADO                       */
/*==============================================================*/
create unique index IDX_HABILITACIONES_NRO_TIMBRADO on HABILITACIONES (
NRO_TIMBRADO
);

/*==============================================================*/
/* Table: MODULOS_SITIO                                         */
/*==============================================================*/
create table MODULOS_SITIO (
   ID_MODULO            SERIAL               not null,
   ID_FUNDACION         INT4                 not null,
   "ORDER"              D_INT2               not null,
   TIPO                 D_CHAR1              not null,
   ESTADO               D_CHAR1              not null,
   TITULO               D_VARCHAR60          not null,
   DESCRIPCION          D_VARCHAR260         null,
   IMAGEN               BYTEA                null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_MODULOS_SITIO primary key (ID_MODULO)
);

/*==============================================================*/
/* Table: NOTICIAS                                              */
/*==============================================================*/
create table NOTICIAS (
   ID_NOTICIA           SERIAL               not null,
   ID_FUNDACION         INT4                 not null,
   TITUTO               D_VARCHAR60          not null,
   COPETE               D_VARCHAR150         not null,
   DESCRIPCION          D_VARCHAR260         not null,
   FECHA_PUBLICACION    D_DATE               not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   IMAGEN               BYTEA                not null,
   constraint PK_NOTICIAS primary key (ID_NOTICIA)
);

/*==============================================================*/
/* Table: PAGINAS                                               */
/*==============================================================*/
create table PAGINAS (
   ID_PAGINA            SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   URL                  D_VARCHAR150         not null,
   ESTADO               D_CHAR1              not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_PAGINAS primary key (ID_PAGINA)
);

/*==============================================================*/
/* Table: PERMISOS                                              */
/*==============================================================*/
create table PERMISOS (
   ID_PERMISO           INT8                 not null,
   ID_ROL               INT4                 not null,
   ID_PAGINA            INT4                 not null,
   ACCESO               D_CHAR1              not null,
   LEER                 D_CHAR1              not null,
   ACTUALIZAR           D_CHAR1              not null,
   BORRAR               D_CHAR1              not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_PERMISOS primary key (ID_PERMISO)
);

/*==============================================================*/
/* Table: PERSONAS_FUNDACION                                    */
/*==============================================================*/
create table PERSONAS_FUNDACION (
   ID_PERSONA_FUNDACION SERIAL               not null,
   NOMBRE               D_VARCHAR60          not null,
   DOCUMENTO            D_VARCHAR15          not null,
   DIRECCION            D_VARCHAR150         not null,
   ID_BARRIO            INT4                 not null,
   CELULAR              D_VARCHAR15          not null,
   TELEFONO             D_VARCHAR15          null,
   EMAIL                D_VARCHAR60          not null,
   ID_CARGO             D_INT2               not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_PERSONAS_FUNDACION primary key (ID_PERSONA_FUNDACION)
);

comment on column PERSONAS_FUNDACION.DOCUMENTO is
'Representante Legal de la Empresa';

/*==============================================================*/
/* Index: IDX_SOLICITANTES_DOCUMENTO                            */
/*==============================================================*/
create unique index IDX_SOLICITANTES_DOCUMENTO on PERSONAS_FUNDACION (
DOCUMENTO
);

/*==============================================================*/
/* Table: PROVEEDORES                                           */
/*==============================================================*/
create table PROVEEDORES (
   ID_PROVEEDOR         SERIAL               not null,
   RAZON_SOCIAL         D_VARCHAR60          not null,
   RUC                  D_VARCHAR15          not null,
   DIRECCION            D_VARCHAR150         not null,
   ID_BARRIO            INT4                 not null,
   TELEFONO             D_DATE               not null,
   EMAIL                D_VARCHAR60          not null,
   LOGO                 BYTEA                null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_PROVEEDORES primary key (ID_PROVEEDOR)
);

/*==============================================================*/
/* Index: IDX_PROVEEDORES_RUC                                   */
/*==============================================================*/
create unique index IDX_PROVEEDORES_RUC on PROVEEDORES (
RUC
);

/*==============================================================*/
/* Table: ROLES                                                 */
/*==============================================================*/
create table ROLES (
   ID_ROL               SERIAL               not null,
   ID_FUNDACION         INT4                 not null,
   NOMBRE               D_VARCHAR60          not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_ROLES primary key (ID_ROL)
);

/*==============================================================*/
/* Table: SOLICITUDES                                           */
/*==============================================================*/
create table SOLICITUDES (
   ID_SOLICITUD         SERIAL               not null,
   ID_PERSONA_FUNDACION INT4                 not null,
   ID_FUNDACION         INT4                 not null,
   FECHA_SOLICITUD      D_TIMESTAMP          not null,
   ESTADO               D_CHAR1              not null,
   MOTIVO_RECHAZO       D_VARCHAR150         null,
   OBSERVACION          D_VARCHAR150         null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_SOLICITUDES primary key (ID_SOLICITUD)
);

comment on column SOLICITUDES.ESTADO is
'Estado: [p]endiente, [a]probado, [r]echazado';

/*==============================================================*/
/* Table: SOLICITUDES_VOLUNTARIADO                              */
/*==============================================================*/
create table SOLICITUDES_VOLUNTARIADO (
   ID_SOLICITUD         SERIAL               not null,
   ID_FUNDACION         INT4                 not null,
   ESTADO               D_CHAR1              not null,
   FECHA_SOLICITUD      D_DATE               not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_SOLICITUDES_VOLUNTARIADO primary key (ID_SOLICITUD)
);

/*==============================================================*/
/* Table: USUARIOS_ADMINISTRACION                               */
/*==============================================================*/
create table USUARIOS_ADMINISTRACION (
   ID_USER              D_INT2               not null,
   NOMBRE               D_VARCHAR60          not null,
   EMAIL                D_VARCHAR150         not null,
   PASSWORD             D_VARCHAR60          not null,
   ESTADO               D_CHAR1              not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_USUARIOS_ADMINISTRACION primary key (ID_USER)
);

comment on table USUARIOS_ADMINISTRACION is
'Usuarios precargados, de OrgaOM';

/*==============================================================*/
/* Table: USUARIOS_FUNDACION                                    */
/*==============================================================*/
create table USUARIOS_FUNDACION (
   ID_USUARIO           INT8                 not null,
   ID_FUNDACION         INT4                 not null,
   ID_PERSONA_FUNDACION INT4                 not null,
   EMAIL                D_VARCHAR60          not null,
   ID_ROL               INT4                 not null,
   ESTADO               D_CHAR1              not null,
   FECHA_VENCIMIENTO    D_DATE               not null,
   PASSWORD             D_VARCHAR60          not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_USUARIOS_FUNDACION primary key (ID_USUARIO)
);

comment on table USUARIOS_FUNDACION is
'estados: activo, inactivo, caducado
fecha vencimiento: sumar 6 meses a la fecha de creación. Cuando llega la fecha de caducicad se pone a estado caducado. Cambio de caducado a activo, genera 6 meses mas de vencimiento.';

/*==============================================================*/
/* Table: VOLUNTARIOS                                           */
/*==============================================================*/
create table VOLUNTARIOS (
   ID_VOLUNTARIO        SERIAL               not null,
   ID_SOLICITUD         INT4                 not null,
   DOCUMENTO            D_VARCHAR15          not null,
   NOMBRE               D_VARCHAR60          not null,
   CELULAR              D_VARCHAR15          not null,
   DIRECCION            D_VARCHAR60          not null,
   EMAIL                D_VARCHAR60          not null,
   ID_BARRIO            INT4                 not null,
   FECHA_NACIMIENTO     D_DATE               not null,
   CREATED_AT           D_TIMESTAMP          not null,
   UPDATED_AT           D_TIMESTAMP          not null,
   constraint PK_VOLUNTARIOS primary key (ID_VOLUNTARIO)
);

/*==============================================================*/
/* Index: IDX_VOLUNTARIOS_DOCUMENTO                             */
/*==============================================================*/
create unique index IDX_VOLUNTARIOS_DOCUMENTO on VOLUNTARIOS (
DOCUMENTO
);

alter table BARRIOS
   add constraint FK_BARRIOS_REFERENCE_CIUDADES foreign key (ID_CIUDAD)
      references CIUDADES (ID_CIUDAD)
      on delete restrict on update restrict;

alter table CIUDADES
   add constraint FK_CIUDADES_REFERENCE_DEPARTAM foreign key (ID_DEPARTAMENTO)
      references DEPARTAMENTOS (ID_DEPARTAMENTO)
      on delete restrict on update restrict;

alter table COMPROBANTES
   add constraint FK_COMPROBA_REFERENCE_PROVEEDO foreign key (ID_PROVEEDOR)
      references PROVEEDORES (ID_PROVEEDOR)
      on delete restrict on update restrict;

alter table COMPROBANTES
   add constraint FK_COMPROBA_REFERENCE_DONADORE foreign key (ID_DONADOR)
      references DONADORES (ID_DONADOR)
      on delete restrict on update restrict;

alter table COMPROBANTES
   add constraint FK_COMPROBA_REFERENCE_FUNDACIO foreign key (ID_FUNDACION)
      references FUNDACIONES (ID_FUNDACION)
      on delete restrict on update restrict;

alter table COMPROBANTES_DETALLES
   add constraint FK_COMPROBA_REFERENCE_COMPROBA foreign key (COMPROBANTE)
      references COMPROBANTES (COMPROBANTE)
      on delete restrict on update restrict;

alter table CONFIGURACIONES_SITIO
   add constraint FK_CONFIGUR_REFERENCE_FUNDACIO foreign key (ID_FUNDACION)
      references FUNDACIONES (ID_FUNDACION)
      on delete restrict on update restrict;

alter table CONFIGURACIONES_SITIO
   add constraint FK_CONFIGUR_REFERENCE_COLORES foreign key (ID_COLOR)
      references COLORES (ID_COLOR)
      on delete restrict on update restrict;

alter table CONFIGURACIONES_SITIO
   add constraint FK_CONFIGUR_REFERENCE_FUENTES foreign key (ID_FUENTES)
      references FUENTES (ID_FUENTES)
      on delete restrict on update restrict;

alter table CORREOS
   add constraint FK_CORREOS_REFERENCE_FUNDACIO foreign key (ID_FUNDACION)
      references FUNDACIONES (ID_FUNDACION)
      on delete restrict on update restrict;

alter table DOCUMENTOS_ADJUNTOS
   add constraint FK_DOCUMENT_REFERENCE_FUNDACIO foreign key (ID_FUNDACION)
      references FUNDACIONES (ID_FUNDACION)
      on delete cascade on update restrict;

alter table EVENTOS
   add constraint FK_EVENTOS_REFERENCE_FUNDACIO foreign key (ID_FUNDACION)
      references FUNDACIONES (ID_FUNDACION)
      on delete restrict on update restrict;

alter table FUNDACIONES
   add constraint FK_FUNDACIO_REFERENCE_BARRIOS foreign key (ID_BARRIO)
      references BARRIOS (ID_BARRIO)
      on delete restrict on update restrict;

alter table HABILITACIONES
   add constraint FK_HABILITA_REFERENCE_FUNDACIO foreign key (ID_FUNDACION)
      references FUNDACIONES (ID_FUNDACION)
      on delete restrict on update restrict;

alter table MODULOS_SITIO
   add constraint FK_MODULOS__REFERENCE_CONFIGUR foreign key (ID_FUNDACION)
      references CONFIGURACIONES_SITIO (ID_FUNDACION)
      on delete restrict on update restrict;

alter table NOTICIAS
   add constraint FK_NOTICIAS_REFERENCE_FUNDACIO foreign key (ID_FUNDACION)
      references FUNDACIONES (ID_FUNDACION)
      on delete restrict on update restrict;

alter table PERMISOS
   add constraint FK_PERMISOS_REFERENCE_ROLES foreign key (ID_ROL)
      references ROLES (ID_ROL)
      on delete restrict on update restrict;

alter table PERMISOS
   add constraint FK_PERMISOS_REFERENCE_PAGINAS foreign key (ID_PAGINA)
      references PAGINAS (ID_PAGINA)
      on delete restrict on update restrict;

alter table PERSONAS_FUNDACION
   add constraint FK_PERSONAS_REFERENCE_CARGOS foreign key (ID_CARGO)
      references CARGOS (ID_CARGO)
      on delete restrict on update restrict;

alter table PERSONAS_FUNDACION
   add constraint FK_PERSONAS_REFERENCE_BARRIOS foreign key (ID_BARRIO)
      references BARRIOS (ID_BARRIO)
      on delete restrict on update restrict;

alter table ROLES
   add constraint FK_ROLES_REFERENCE_FUNDACIO foreign key (ID_FUNDACION)
      references FUNDACIONES (ID_FUNDACION)
      on delete restrict on update restrict;

alter table SOLICITUDES
   add constraint FK_SOLICITU_REFERENCE_PERSONAS foreign key (ID_PERSONA_FUNDACION)
      references PERSONAS_FUNDACION (ID_PERSONA_FUNDACION)
      on delete restrict on update restrict;

alter table SOLICITUDES
   add constraint FK_SOLICITU_REFERENCE_FUNDACIO foreign key (ID_FUNDACION)
      references FUNDACIONES (ID_FUNDACION)
      on delete restrict on update restrict;

alter table SOLICITUDES_VOLUNTARIADO
   add constraint FK_SOLICITU_REFERENCE_FUNDACIO foreign key (ID_FUNDACION)
      references FUNDACIONES (ID_FUNDACION)
      on delete restrict on update restrict;

alter table USUARIOS_FUNDACION
   add constraint FK_USUARIOS_REFERENCE_FUNDACIO foreign key (ID_FUNDACION)
      references FUNDACIONES (ID_FUNDACION)
      on delete restrict on update restrict;

alter table USUARIOS_FUNDACION
   add constraint FK_USUARIOS_REFERENCE_ROLES foreign key (ID_ROL)
      references ROLES (ID_ROL)
      on delete restrict on update restrict;

alter table USUARIOS_FUNDACION
   add constraint FK_USUARIOS_REFERENCE_PERSONAS foreign key (ID_PERSONA_FUNDACION)
      references PERSONAS_FUNDACION (ID_PERSONA_FUNDACION)
      on delete restrict on update restrict;

alter table VOLUNTARIOS
   add constraint FK_VOLUNTAR_REFERENCE_SOLICITU foreign key (ID_SOLICITUD)
      references SOLICITUDES_VOLUNTARIADO (ID_SOLICITUD)
      on delete restrict on update restrict;

alter table VOLUNTARIOS
   add constraint FK_VOLUNTAR_REFERENCE_BARRIOS foreign key (ID_BARRIO)
      references BARRIOS (ID_BARRIO)
      on delete restrict on update restrict;

