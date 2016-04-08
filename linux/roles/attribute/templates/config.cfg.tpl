[server]
mode = CELERY

[monitor_cache]
path = /datayes/invest-platform/attribution/cache

[celery]
broker = amqp://pms:datayes123@127.0.0.1:5672/attribution

[dydb]
host = {{datayesdb.host}}
port = {{datayesdb.port}}
user = {{datayesdb.user}}
password = {{datayesdb.pass}}
database = datayesdbp

[barra]
host = {{datayesdb.host}}
port = {{datayesdb.port}}
user = {{datayesdb.user}}
password = {{datayesdb.pass}}
database = barra

[accountmaster]
host = {{accountmaster.host}}
port = {{accountmaster.port}}
user = {{accountmaster.user}}
password = {{accountmaster.pass}}
database = accountmaster

[accountmaster_ACCOUNT]
host = {{accountmaster.host}}
port = {{accountmaster.port}}
user = {{accountmaster.user}}
password = {{accountmaster.pass}}
database = accountmaster
