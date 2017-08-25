#k!/bin/bash

#Black        0;30     Dark Gray     1;30
#Red          0;31     Light Red     1;31
#Green        0;32     Light Green   1;32
#Brown/Orange 0;33     Yellow        1;33
#Blue         0;34     Light Blue    1;34
#Purple       0;35     Light Purple  1;35
#Cyan         0;36     Light Cyan    1;36
#Light Gray   0;37     White         1;37
function n(){
printf '\n'
}
function git_install(){
git --version > /dev/null 2>&1
GIT_IS_INSTALLED=$?

if [[ $GIT_IS_INSTALLED -ne 0 ]];then
n
echo ">>> Installing Git"
     # Install Git
      sudo apt-get install git
else
 n
 echo ">>> Git already installed"
fi

main_menu
}

composer_install(){
composer -v > /dev/null 2>&1
COMPOSER_IS_INSTALLED=$?

if [[ $COMPOSER_IS_INSTALLED -ne 0 ]];then
n
echo ">>> Installing Composer"
     # Install Curl then Composer
     sudo apt-get install curl php5-cli
     sudo curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
else
 n
 echo ">>> Composer already installed"
fi
main_menu
}
install_composer(){
main_menu
}
install_laravel(){
laravel --version > /dev/null 2>&1
LARAVEL_IS_INSTALLED=$?

if [[ $LARAVEL_IS_INSTALLED -ne 0 ]];then
n
echo ">>> Installing Laravel"
sudo composer global require "laravel/installer"
echo 'export PATH="$PATH:$HOME/.composer/vendor/bin"' >> ~/.bashrc
source ~/.bashrc
else
n
echo ">>> Laravel installer already configured"
fi
main_menu
}

#Project menu
git_clone(){
echo ">>> please enter github repo url [e.g https://github.com/red24crm/project1]"
read project
cd /var/www/
command `git clone $project .`

project_menu
}
create_host_files(){
project_menu
}
install_postgres(){
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib
}

config_postgres_db(){
#create database alert_central;
}
config_postgres_user(){
#psql
#create user ben with password 'somethingrandom';
#grant all privileges on database db_name to someuser;
}

function main_menu(){
n
echo "What would you like to do ?"
echo "1) Install git"
echo "2) Install composer"
echo "3) Install Laravel"
echo "4) Project configurations"
echo "5) Install Postgres DB"
echo "6) I do not know !"
read case;
#simple case bash structure
# note in this case $case is variable and does not have to
# be named case this is just an example
case $case in
    1) git_install;;
    2) composer_install;;
    3) install_laravel;;
    4) project_menu;;
    5) install_postgres;;
    6) exit
esac
}

function project_menu(){
n
echo "What would you like to do ?"
echo "1) Clone a project"
echo "2) Create host files for project"
echo "3) Back to Main Menu"
read case;
#simple case bash structure
# note in this case $case is variable and does not have to
# be named case this is just an example
case $case in
    1) git_clone;;
    2) create_host_files;;
    3) main_menu;;
esac
}

main_menu

################ Insible Ansible ####################
# sudo apt-get install software-properties-common
# sudo apt-add-repository ppa:ansible/ansible
# sudo apt-get update
# sudo apt-get install ansible