SELECT 
    u.User,
    u.Host,
    db.Db,
    db.Select_priv,
    db.Insert_priv,
    db.Update_priv,
    db.Delete_priv,
    db.Create_priv,
    db.Drop_priv,
    db.Grant_priv,
    db.Index_priv,
    db.Alter_priv,
    db.Create_tmp_table_priv,
    db.Lock_tables_priv,
    db.Create_view_priv,
    db.Show_view_priv,
    db.Create_routine_priv,
    db.Alter_routine_priv,
    db.Execute_priv,
    db.Event_priv,
    db.Trigger_priv
FROM 
    mysql.db db
JOIN 
    mysql.user u ON db.User = u.User AND db.Host = u.Host
WHERE 
    db.Db IN ('$DATABASE1', '$DATABASE2') \G
