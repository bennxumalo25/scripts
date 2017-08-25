function configuration_variables(){
    APP_ENV="local"
    APP_KEY="Some Application Key Here"
    APP_DEBUG="true"
    APP_LOG_LEVEL="debug"
    APP_URL="http://localhost"
    DB_CONNECTION="mysql"
    DB_HOST="localhost"
    DB_PORT="3306"
    DB_DATABASE="myDatabaseName"
    DB_USERNAME="root"
    DB_PASSWORD="My Database Password"
    BROADCAST_DRIVER="log"
    CACHE_DRIVER="file"
    SESSION_DRIVER="file"
    QUEUE_DRIVER="sync"
    REDIS_HOST="127.0.0.1"
    REDIS_PASSWORD="null"
    REDIS_PORT="6379"
    MAIL_DRIVER="smtp"
    MAIL_HOST="smtp.mailtrap.io"
    MAIL_PORT="2525"
    MAIL_USERNAME="null"
    MAIL_PASSWORD="null"
    MAIL_ENCRYPTION="null"
    PUSHER_APP_ID=""
    PUSHER_APP_KEY=""
    PUSHER_APP_SECRET=""
    DRUPAL_BASE_URL="http://mynewproject.devbox00.red24.com"
    DRUPAL_API_USER="apiuser"
    DRUPAL_API_PASS="Drupal API USER pass"
    OWC_CLIENT_ID="_iF_oSQZiunI4iBFgBP6iQehWK4a"
    OWC_CLIENT_SECRET="E39kl8un6rUqfJMPJ5clapu7_yMa"
    SCOUT_DRIVER="mysql"
    CONSTANT_CONTACT_API_KEY=""
    CONSTANT_CONTACT_ACCESS_TOKEN=""
    CONSTANT_CONTACT_LIST_ID=""
    CONSTANT_CONTACT_EMAIL=""

    echo ">>> Following are configuration for your .env file"
    read -e -i "$DB_CONNECTION" -p "DB_CONNECTION: " input
    read -e -i "$DB_DATABASE" -p "DB_DATABASE: " input
    read -e -i "$DB_USERNAME" -p "DB_USERNAME: " input
    read -e -i "$DB_PASSWORD" -p "DB_PASSWORD: " input

    DB_CONNECTION="${input:-$DB_CONNECTION}"
    DB_DATABASE="${input:-$DB_DATABASE}"
    DB_USERNAME="${input:-$DB_USERNAME}"
    DB_PASSWORD="${input:-$DB_PASSWORD}"
    #DB_CONNECTION="${input:-$DB_CONNECTION}"

    while read line
    do
        eval echo "$line"
    done < "./env"
}