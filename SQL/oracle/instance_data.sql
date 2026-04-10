/*Verificar dados da instancia do banco*/
DESC gv$instance;
/*Name e status*/
SELECT instance_name,host_name,status,version FROM gv$instance;