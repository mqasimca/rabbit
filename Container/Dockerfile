FROM rabbitmq:management

COPY pre_rabbit.sh /bin
RUN rabbitmq-plugins enable --offline rabbitmq_peer_discovery_aws


#USER rabbitmq

CMD ["pre_rabbit.sh"]