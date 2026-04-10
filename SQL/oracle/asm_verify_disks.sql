/*Verificar o status dos discos
Modo de executar , conectado no asm
*/
SELECT DISK_NUMBER,MOUNT_STATUS,HEADER_STATUS,MODE_STATUS,STATE,REDUNDANCY,DATA_INTEGRITY_CAPABLE FROM gv$asm_disk;

DESC gv$asm_operation;

/*
    Modo de Exec:
    - Conectado no banco
    OBJETIVO:
    Verificar o status do ASM no Oracle RAC com base na GV$ASM_OPERATION

    INTERPRETAÇÃO:
    - Se não houver linhas → ASM saudável (nenhuma operação em andamento)
    - STATE = RUN → operação em andamento (normal, mas monitorar)
    - STATE != RUN → possível problema
    - ERROR_CODE preenchido → FALHA (CRÍTICO)
*/

SELECT 
    inst_id,                          
    group_number,                     
    operation,                        
    state,                            
    power,                           
    actual,                          
    sofar,                            
    est_work,                         
    est_rate,                        
    est_minutes,                     
    error_code,                       
    CASE
        WHEN error_code IS NOT NULL THEN 'CRÍTICO'
        WHEN state != 'RUN' THEN 'ALERTA'
        ELSE 'EM EXECUÇÃO'
    END AS status_operacao

FROM gv$asm_operation
ORDER BY inst_id, group_number;

/* Verificar se o ASM está operando normal ou não */

SELECT 
    CASE
        WHEN COUNT(*) = 0 THEN 'OK - ASM saudável (sem operações)'
        WHEN SUM(CASE WHEN error_code IS NOT NULL THEN 1 ELSE 0 END) > 0 
            THEN 'CRÍTICO - Existem erros no ASM'
        WHEN SUM(CASE WHEN state != 'RUN' THEN 1 ELSE 0 END) > 0 
            THEN 'ALERTA - Operações não estão em execução normal'
        ELSE 'OK - Operações em andamento (rebalance normal)'
    END AS status_asm
FROM gv$asm_operation;