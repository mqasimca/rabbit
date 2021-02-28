#!/bin/bash

confDir="/etc/rabbitmq/conf.d"

runuser -l rabbitmq bash -c "tee $confDir/rabbitmq.conf <<EOF
cluster_formation.peer_discovery_backend = aws
cluster_formation.aws.region = "$REGION"
cluster_formation.aws.use_autoscaling_group = true
cluster_formation.discovery_retry_limit = 10
cluster_formation.discovery_retry_interval = 10000
cluster_name = cloudgeeks
log.file.level = debug
vm_memory_high_watermark.relative = 0.8
EOF"

# You can set RABBITMQ_NODENAME=rabbit@$HOSTNAME
# runuser -l rabbitmq bash -c "tee $confDir/rabbitmq-env.conf <<EOF
# NODENAME=rabbit@"$HOSTNAME"
# NODE_IP_ADDRESS="$IPV4"
# USE_LONGNAME=true
# EOF"
/opt/rabbitmq/sbin/rabbitmq-server