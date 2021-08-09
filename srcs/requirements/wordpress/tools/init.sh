#!/user/bin/env bash

mkdir -p /run/php/

touch /run/php/php7.3-fpm.pid

sleep 5

wp core install --allow-root --url=${DOMAIN_NAME} --title=${WP_TITLE} \
	--admin_user=${WP_LOGIN} --admin_password=${WP_PASSWORD} \
	--admin_email=${WP_EMAIL} --path=${WP_PATH}
wp user create --allow-root ${WP_USER} ${WP_USER_EMAIL} \
	--user_pass=${WP_USER_PASS} --path=${WP_PATH}


exec php-fpm7.3 --nodaemonize
