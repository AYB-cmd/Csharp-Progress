/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     11/01/2021 21:37:21                          */
/*==============================================================*/


drop table if exists QUESTIONS;

drop table if exists QUESTIONS_TAGS;

drop table if exists TAGS;

drop table if exists USERS;

drop table if exists USERS_QUESTIONS;

drop table if exists USERS_TAGS;

/*==============================================================*/
/* Table: QUESTIONS                                             */
/*==============================================================*/
create table QUESTIONS
(
   QUESTION_ID          numeric(8,0) not null,
   INTRODUCTION         text,
   DESCRITPION          text,
   FORMULE              text,
   PRICE                float,
   primary key (QUESTION_ID)
);

/*==============================================================*/
/* Table: QUESTIONS_TAGS                                        */
/*==============================================================*/
create table QUESTIONS_TAGS
(
   QUESTION_ID          numeric(8,0) not null,
   TAG_ID               numeric(8,0) not null,
   primary key (QUESTION_ID, TAG_ID)
);

/*==============================================================*/
/* Table: TAGS                                                  */
/*==============================================================*/
create table TAGS
(
   TAG_ID               numeric(8,0) not null,
   TAG_TITLE            char(256),
   primary key (TAG_ID)
);

/*==============================================================*/
/* Table: USERS                                                 */
/*==============================================================*/
create table USERS
(
   USER_ID              numeric(8,0) not null,
   USERNAME             char(256),
   PASSWORD             text,
   EMAIL                text,
   primary key (USER_ID)
);

/*==============================================================*/
/* Table: USERS_QUESTIONS                                       */
/*==============================================================*/
create table USERS_QUESTIONS
(
   USER_ID              numeric(8,0) not null,
   QUESTION_ID          numeric(8,0) not null,
   IS_ASKED             bool,
   IS_EARNED            bool,
   POURCENTAGE          float,
   primary key (USER_ID, QUESTION_ID)
);

/*==============================================================*/
/* Table: USERS_TAGS                                            */
/*==============================================================*/
create table USERS_TAGS
(
   USER_ID              numeric(8,0) not null,
   TAG_ID               numeric(8,0) not null,
   SCORE                numeric(8,0),
   primary key (USER_ID, TAG_ID)
);

alter table QUESTIONS_TAGS add constraint FK_QUESTIONS_TAGS foreign key (TAG_ID)
      references TAGS (TAG_ID) on delete restrict on update restrict;

alter table QUESTIONS_TAGS add constraint FK_QUESTIONS_TAGS2 foreign key (QUESTION_ID)
      references QUESTIONS (QUESTION_ID) on delete restrict on update restrict;

alter table USERS_QUESTIONS add constraint FK_USERS_QUESTIONS foreign key (QUESTION_ID)
      references QUESTIONS (QUESTION_ID) on delete restrict on update restrict;

alter table USERS_QUESTIONS add constraint FK_USERS_QUESTIONS2 foreign key (USER_ID)
      references USERS (USER_ID) on delete restrict on update restrict;

alter table USERS_TAGS add constraint FK_USERS_TAGS foreign key (TAG_ID)
      references TAGS (TAG_ID) on delete restrict on update restrict;

alter table USERS_TAGS add constraint FK_USERS_TAGS2 foreign key (USER_ID)
      references USERS (USER_ID) on delete restrict on update restrict;

