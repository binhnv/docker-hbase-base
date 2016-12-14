FROM binhnv/hadoop-base
MAINTAINER "Binh Van Nguyen<binhnv80@gmail.com>"

# User need to provide the following environment variable
# HD_NAMENODE_HOSTNAME - Hadoop namenode hostname
# KRB_SERVICE_KEYTAB_FILE - Kerberos keytab file
# HBASE_KERBEROS_PRINCIPAL - Keberos principal for HBase
# ZOOKEEPER_HOST - Comma separated list of ZooKeeper hosts

ENV HBASE_VERSION="1.1.2" \
    HBASE_HOME="${MY_APP_DIR}/hbase" \
    HBASE_LOG_DIR="${MY_APP_LOG_DIR}/hbase" \
    HBASE_HEAPSIZE="256M" \
    HBASE_OFFHEAPSIZE="256M" \
    HBASE_PID_DIR="${MY_APP_DATA_DIR}/hbase/pids" \
    HBASE_USER="${MY_USER}" \
    HBASE_MANAGES_ZK="false"

# Master web UI
EXPOSE 16010
# RegionServer web UI
EXPOSE 16030

WORKDIR ${HBASE_HOME}

COPY scripts/build /my_build
RUN /my_build/install.sh && rm -rf /my_build

COPY templates ${MY_TEMPLATE_DIR}
