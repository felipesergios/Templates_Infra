/*
Criação de usuário e inclusão de permissão de sysdba
Não utilizar em PRD
*/
CREATE USER usuarioteste IDENTIFIED BY "SENHA";
GRANT CREATE SESSION TO usuarioteste;
GRANT SYSDBA TO usuarioteste;
/* Verificação de campos da view */
DESC all_users;

SELECT username as Usuário,default_collation FROM all_users;
