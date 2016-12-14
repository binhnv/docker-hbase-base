#!/usr/bin/env bash

set -e

g_user=${HBASE_USER}
g_app_home=${HBASE_HOME}
g_pid_dir=${HBASE_PID_DIR}
g_log_dir=${HBASE_LOG_DIR}
g_hbase_bin_url="https://github.com/binhnv/hbase-binaries/releases/download/v${HBASE_VERSION}-hadoop-${HD_VERSION}/hbase-${HBASE_VERSION}-bin.tar.gz"

function install_hbase {
    echo "Downloading file from ${g_hbase_bin_url}..."
    curl -sL ${g_hbase_bin_url} | tar -xz -C ${g_app_home} --strip-component=1
}

function init {
    mkdir -p ${g_app_home} ${g_pid_dir} ${g_log_dir}
    chown ${g_user} ${g_pid_dir} ${g_log_dir}
}

function main {
    init
    install_hbase
}

main "$@"
