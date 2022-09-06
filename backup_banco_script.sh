echo "Deseja realizar um backup manual do banco ?"
echo "Responda - Y ou N"
read option
if [ $option = "Y" ]
then
echo "Fazendo o backup do banco agora , por favor informe o nome do banco"
read DATABASE_NAME
echo "Informe o container id"
read CONTAINER_ID
docker exec -it $CONTAINER_ID /usr/bin/mysqldump --databases $DATABASE_NAME --password=mariadb > $(date '+%Y%m%d%H%M%S').sql
fi

sleep 1
echo "Deseja restaurar um backup ?"
echo "Responda - Y ou N"
read option
if [ $option = "Y" ]
then
echo "Restaurando o backup do banco agora "
cat *.sql | docker exec -i $CONTAINER_ID /usr/bin/mysql --password=mariadb $DATABASE_NAME
else
echo "Ok o programa fará a limpeza e será fechado em seguida"
fi

echo "Movendo dados.."
mv *.sql /home/backups
sleep 2
