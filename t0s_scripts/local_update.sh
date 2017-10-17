#! /usr/bin/env sh

# Скрипт обновления локально ОСОБЫМ ОБРАЗОМ установленного проекта.
# Если проект не установлен особым образом, следуйте инструкции:
# https://confluence.lamoda.ru/pages/viewpage.action?pageId=56733088


DIR="`pwd`"
SITE_URL="lamoda"
REQ_FILE="requirements.dev.txt"
APILIB_CONF_PROTO="etc/apilib.*.conf.proto"
NGINX_CONF_PROTO="etc/nginx.conf.proto"

# local environment
ENVS_DIR="../envs"
ENV_BIN_ACTIVATE="${ENVS_DIR}/djangoenv/bin/activate"
NGINX_DIR="/usr/local/etc/nginx/servers"
LAMODA_ETC_DIR="/etc/lamoda"
APILIB_DEFAULT_COUNTRY="${LAMODA_ETC_DIR}/apilib.ru.conf"
APILIB_DEFAULT="${LAMODA_ETC_DIR}/apilib.conf"

GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NORMAL='\033[0m'

echo_warning () { echo -e >&2 "${YELLOW}$1${NORMAL}"; }
echo_success () { echo -e >&2 "${GREEN}$1${NORMAL}"; }
echo_error () { echo -e >&2 "${RED}$1${NORMAL}"; }
echo_info () { echo -e >&2 "${BLUE}$1${NORMAL}"; }

ok_msg () {
    COL=$(($(tput cols)-${#1}-${#GREEN}-${#NORMAL}))
    printf "$1%s%${COL}s\033[0;32m[OK]\033[0m\n";
}
error_msg () {
    COL=$(($(tput cols)-${#1}-${#RED}-${#NORMAL}-3))
    printf "$1%s%${COL}s\033[0;31m[ERROR]\033[0m\n";
}
warn_msg () {
    COL=$(($(tput cols)-${#1}-${#YELLOW}-${#NORMAL}-2))
    printf "$1%s%${COL}s\033[0;33m[WARN]\033[0m\n";
}

execute_and_check_result () {
    # Executes the given command and displays the status message depending on
    # of a command returning code number.
    # Usage: check_result "your_command" "Message" "Error Description"

    eval $1

    if [ "$?" = "0" ]; then
        ok_msg "$2"
    else
        error_msg "$2"
        echo_error "$3"
        echo_info "Please, ask the Django team for help."
        return 1
    fi

}

pip_install_requirements () {
    # Installs and upgrades packages.

    if [ ! -f ${REQ_FILE} ]; then
        warn_msg "Requirements file doesn't exists: ${REQ_FILE}"

        REQ_FILE=requirements.txt
        echo "Checking the default one: ${REQ_FILE}"

        if [ ! -f ${REQ_FILE} ]; then
            error_msg "Requirements file doesn't exist: ${REQ_FILE}"
            exit 1;
        else
            ok_msg "Requirements file doesn't exist: ${REQ_FILE}"
        fi
    else
        ok_msg "Requirements file exists: ${REQ_FILE}"
    fi;

    mkdir -p ${ENVS_DIR}
    cd ${ENVS_DIR}
    virtualenv djangoenv
    cd ${DIR}
    #source ${ENV_BIN_ACTIVATE}
    pip install -r ${REQ_FILE}
}

configure_apilib () {
    # Configures the apilib.*.conf.
    if [ ! -d ${LAMODA_ETC_DIR} ]; then
        warn_msg "Checking if ${LAMODA_ETC_DIR} exists"
        execute_and_check_result "sudo mkdir -p ${LAMODA_ETC_DIR}" \
        "Creating ${LAMODA_ETC_DIR}" "Could not create ${LAMODA_ETC_DIR}."
    else
        ok_msg "Checking if ${LAMODA_ETC_DIR} exists"
    fi

    # Copies the apilib.*.conf files.
    for apilib_sample_file in $APILIB_CONF_PROTO; do
        # Checks if proto-file exists.
        if [ ! -f $apilib_sample_file ]; then
            error_msg "Checking apilib file: $apilib_sample_file"
            echo_info "\tTry to update your GIT repository and run the this script one more time,"
            echo_info "\tor ask the front-end team for help."
            exit 1;
        else
            ok_msg "Checking apilib file: $apilib_sample_file"
        fi

        # Checks the differences between proto and exited apilib conf file.
        dest_apilib_conf=`echo ${LAMODA_ETC_DIR}/$(basename $apilib_sample_file) | sed -e "s|.proto||"`
        if [ -f $dest_apilib_conf ] && diff $apilib_sample_file $dest_apilib_conf >/dev/null; then
            echo_success "Apilib configuration files are identical: $dest_apilib_conf"
        else
            execute_and_check_result "sudo cp -f $apilib_sample_file $dest_apilib_conf" \
            "Copies the apilib configuration file: $dest_apilib_conf" \
            "Could not copy apilib conf file: $dest_apilib_conf"
        fi

        # Checks the symlink on the default file.
        if [ $APILIB_DEFAULT_COUNTRY = $dest_apilib_conf ]; then

            if [ -f $APILIB_DEFAULT ] && [ ! -L $APILIB_DEFAULT ]; then
                warn_msg "Move an existed file/dir $APILIB_DEFAULT to ${APILIB_DEFAULT}.back"
                execute_and_check_result "sudo mv -f $APILIB_DEFAULT ${APILIB_DEFAULT}.back" \
                "Moves an existed file/dir $APILIB_DEFAULT to ${APILIB_DEFAULT}.back" \
                "Could not move an existed file/dir $APILIB_DEFAULT to ${APILIB_DEFAULT}.back"
            fi

            if [ -L $APILIB_DEFAULT ]; then
                if [ `realpath $APILIB_DEFAULT` != $APILIB_DEFAULT_COUNTRY ]; then
                    execute_and_check_result "sudo rm -f $APILIB_DEFAULT" \
                    "Removes the obsolete apilib symlink: $APILIB_DEFAULT -> `realpath $APILIB_DEFAULT`" \
                    "Could not remove the obsolete apilib symlink: $APILIB_DEFAULT -> `realpath $APILIB_DEFAULT`"
                else
                    continue
                fi
            fi

            execute_and_check_result "sudo ln -s $APILIB_DEFAULT_COUNTRY $APILIB_DEFAULT" \
            "Creates the apilib symlink: $APILIB_DEFAULT -> $APILIB_DEFAULT_COUNTRY" \
            "Could create the apilib symlink: $APILIB_DEFAULT -> $APILIB_DEFAULT_COUNTRY"

        fi

    done
}

update_nginx () {
    echo_info "Enter your password to reload Nginx:"

    if [ ! -d ${NGINX_DIR} ]; then
        execute_and_check_result "sudo mkdir -p ${NGINX_DIR}" \
        "Creating ${NGINX_DIR}" \
        "Could not create the directory: ${NGINX_DIR}"
    fi

    NGINX_CONF_PROTO_TMP=`mktemp`
    cat ${NGINX_CONF_PROTO} | sed -e "s|DIR|${DIR}|g" | sed -e "s|USER|${SITE_URL}|g"| cat > ${NGINX_CONF_PROTO_TMP}

    if [ ! -e ${NGINX_DIR}/site.conf ]; then
        warn_msg "Nginx conf does not exit: ${NGINX_DIR}/site.conf"
        execute_and_check_result "sudo cp ${NGINX_CONF_PROTO_TMP} ${NGINX_DIR}/site.conf" \
        "Copying the Nginx conf file" \
        "Could not copy the Nginx file: ${NGINX_CONF_PROTO_TMP} to ${NGINX_DIR}/site.conf"
    else
        if ! sudo diff ${NGINX_CONF_PROTO_TMP} ${NGINX_DIR}/site.conf > /dev/null; then
            execute_and_check_result "sudo cp -f ${NGINX_CONF_PROTO_TMP} ${NGINX_DIR}/site.conf" \
            "Updating the Nginx configuration: ${NGINX_DIR}/site.conf" \
            "Could not copy the Nginx file: ${NGINX_CONF_PROTO_TMP} to ${NGINX_DIR}/site.conf"

            sudo chown `whoami` ${NGINX_DIR}/site.conf
        else
            ok_msg "The Nginx configuration is actual: ${NGINX_DIR}/site.conf"
        fi
    fi

    sudo pkill nginx
    sudo nginx
}

update_submodules () {
    git submodule init
    git submodule sync
    git submodule update
}

run_servers () {
    countries=('ru' 'ua' 'kz' 'by')
    ports=('8000' '8001' '8002' '8003')

    kill_screen () {
        #kill existing screen
        local site=$1
        local port=$2
        local screen_id=`screen -ls | grep ${site} | awk '{print $1}'`;

        ps -ax | grep "manage.py runserver ${port}" | awk '{print $1}' | xargs -n1 kill -9
        sleep 1
        screen -wipe ${site} >/dev/null 2>&1
        screen -SX $screen_id quit;
    }

    run_screen () {
        local site=$1
        local port=$2

        screen -dmS $site bash -c "clear; . ${ENV_BIN_ACTIVATE}; ./manage.py runserver ${port} --settings=frontend_xslt.settings.${site};"
    }

    for (( i = 0; i < ${#countries[@]}; ++i )); do
        echo "Running ${countries[$i]} @ ${ports[$i]} Access: screen -dr ${countries[$i]}"
        kill_screen ${countries[$i]} ${ports[$i]}
        run_screen ${countries[$i]} ${ports[$i]}
    done
}

update_nginx
pip_install_requirements
configure_apilib
update_submodules
if [ "$1" == "screen" ];then
    run_servers
fi
