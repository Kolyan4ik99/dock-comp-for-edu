service mysql start

sleep 4

echo "CREATE DATABASE IF NOT EXISTS ${MYSQL_NAME};" | mysql -u root -h localhost --skip-password 
echo "CREATE USER IF NOT EXISTS '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_USER_PASSWORD}';" | mysql -u root -h localhost --skip-password
echo "GRANT ALL PRIVILEGES ON ${MYSQL_NAME}.* TO '${MYSQL_USER}'@'%';" | mysql -u root -h localhost --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root -h localhost --skip-password
mysqladmin -u ${MYSQL_LOGIN} password ${MYSQL_PASSWORD}
service mysql stop

exec mysqld
