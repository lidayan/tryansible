db {
    securitymaster {
        url = "jdbc:mysql://{{datayesdb.host}}:{{datayesdb.port}}/datayesdbp"
        user = "{{datayesdb.user}}"
        password = "{{datayesdb.pass}}"
    }
    accountmaster {
        url = "jdbc:mysql://{{accountmaster.host}}:{{accountmaster.port}}/accountmaster"
        user = "{{accountmaster.user}}"
        password = "{{accountmaster.pass}}"
    }
    hibernate.show_sql = false
}

infinispan {
    port = 7800
    initial_hosts = ["localhost:7800"]
}

service {
    locale = "PRC"

    oms {
        string_api {
            enabled = {{trading.enabled}}
            host = "{{trading.host}}"
            port = {{trading.port}}
            client = "{{trading.client}}"
            token = "{{trading.token}}"
            user = "{{trading.user}}m"
            trader = "{{trading.trader}}"
            isStp = true
            retry_count = -1
        }
        sailfish_api {
            enabled = {{trading.sailfish}}
            akka {
                loggers = ["akka.event.slf4j.Slf4jLogger"]
                loglevel = "INFO"
                actor {
                    provider = "akka.remote.RemoteActorRefProvider"
                }
                remote {
                    enabled-transports = ["akka.remote.netty.tcp"]
                    netty.tcp {
                        hostname = "127.0.0.1"
                        port = 24261
                    }
                }
            }
            remote-actor-path = "akka.tcp://SailfishActorSystem@localhost:24262/user/RouteActor"
        }
        timeout {
            init = "<3 minute><Duration>"
            sync = "<60 seconds><Duration>"
            ping = "<30 seconds><Duration>"
            batch = "<3 minute><Duration>"
        }
        client_id = "dyClient01"
        daily_sync_time = "<08:00:00><LocalTime>"
    }

    mdl {
        host = "{{mdl.host}}"
        port = "{{mdl.port}}"
        token = "no_token"
        reconnect_try_times = 10
        test_mode = false
    }

    data_api {
        host = "{{dataapi.host}}"
        token = "{{dataapi.token}}"
    }
}

cache {
    marketdata {
        static_size = 1024
        chunk_size = 30
        max_thread_number = 30
    }
}

auth {
    sync_users {
        enabled = true
        user_master_backend_url = "{{usermaster}}"
    }
}

web {
    url {
        pms = "{{web_url.pms}}"
        f2e = "{{web_url.f2e}}"
        gw_wmcloud_host = "{{web_url.gw_wmcloud}}"
        app_wmcloud_host = "{{web_url.app_wmcloud}}"
        compliance_url = "{{web_url.compliance}}"
    }

    proxy {
        attribution {
            odbc_name = "ACCOUNT"
            timeout = "<600 second><Duration>"
            host {
                equity = "{{attribution}}"
            }
        }
        timeout = "<600 second><Duration>"
    }

    admin {
        white_list = ["127.0.0.1", "10.20.*.*"]
    }

    exporter {
        dir = "/datayes/invest-platform/pms/download"
    }
}

heartbeat {
    accountmaster {
        enabled = true
    }
    dydb {
        enabled = true
    }
    oms {
        enabled = true
    }
    mdl {
        enabled = true
        timeout = "<60 second><Duration>"
    }
    data_api {
        enabled = true
        timeout = "<20 second><Duration>"
    }
    usermaster {
        enabled = true
        timeout = "<30 second><Duration>"
    }
    attribution {
        enabled = true
        timeout = "<10 second><Duration>"
    }
}


#######################################################################
## STABLE SETTINGS
## In most cases, dev-ops don't have to change the following settings
#######################################################################

business {

    scheduler {
        interval = "<1 minute><Duration>"
        eod_delay = "<15 minute><Duration>"
    }

    valuation {
        interval {
            market_time = "<10 second><Duration>"
            idle_time = "<50 second><Duration>"
        }
        before_open_duration = "<15 minute><Duration>"
        after_close_duration = "<15 minute><Duration>"
        parallelism = 0
    }

    place_order {
        enable = true
        interval = "<60 seconds><Duration>"
        parallelism = 4
    }

    reconcile_position {
        enable = true
        interval = "<600 seconds><Duration>"
        start_time = "<07:00:00><LocalTime>"
        end_time = "<09:00:00><LocalTime>"
        parallelism = 4
    }

    future_order {
        skip_restriction_check = false
    }

    simulation {
        flush_delay_days = 10
        blocking_queue_size = 20
        time_out = "<60 minute><Duration>"
    }

    importer {
        turnover_limit {
            position = "<0.0><BigDecimal>"
            transaction = "<0.0><BigDecimal>"
        }
        weight_limit = "<0.99><BigDecimal>"

        converter {
            host = "http://localhost:1234"
        }
        memoryThreshold = "<10485760><Int>"
    }

    realtime_monitor.interval {
        common = "<5 seconds><Duration>"
        trend = "<30 seconds><Duration>"
    }

    market {
        import_limit = "<09:05:00><LocalTime>"
        open_time = "<09:30:00><LocalTime>"
        close_time = "<15:00:00><LocalTime>"
        check_market_session = true
    }

    commission_settle_frequency = "DAILY"

    huoniu_guard {
        enable = false
        interval {
            market_time = "<1 minute><Duration>"
            idle_time = "<1 hour><Duration>"
        }
        before_open_duration = "<15 minute><Duration>"
        after_close_duration = "<15 minute><Duration>"
    }

    algorithm {
        time_interval_min = 10
    }

    secret_key = {
        des = "abcdefgh"
    }
}

cache {

    external_pms {
        size = 10000
        expiration = "<1 hour><Duration>"
    }

    dev_mode {
        marketdata = false
        security = false
    }
}

auth {
    cache {
        sid {
            size = 50000
            expiration = "<1 hour><Duration>"
        }
        acl {
            size = 50000
            expiration = "<1 hour><Duration>"
        }
    }
}

parsers.text.maxLength = 10240K

ws.timeout = 600000
ws.timeout.connection = 600000
ws.timeout.idle = 600000
ws.timeout.request = 600000

web {
    
    title = "通联数据-组合管理系统"
    logoFileName = "logo.png"

    auth {
        enabled = true
        skip_localhost = true

        permission {
            # TRADE
            STOCK_ORDER = true
            FUTURE_ORDER = true
            TRADE_HISTORY = true
            SECURITY_ADJUSTMENT = true
            BASKET_ORDER = true
            GROUP_ORDER = true

            # MONITOR
            MY_ACCOUNT = true
            REALTIME_MONITOR = true
            ACCOUNT_POSITION = true
            REALTIME_ATTR = true
            RULE_SCAN = true

            # ATTR
            PERFORMANCE_ATTR = true
            RISK_ATTR = true

            # MGMT
            PRIVILEGE_MGMT = false
            ACCOUNT_INFO = true
            CREATE_ACCOUNT = true
            EDIT_FEE = true
            ACCOUNT_RULE = true
            RULE_SAVE = true
            EXTERNAL_MGMT = true
            RECONCILE = true
            ACCOUNT_GROUP = true
            COMPLIANCE_SETTING = true
            CACHE_MGMT = true
        }
    }

    create_account_on_first_login = {
        enabled = false
        open_date = "<2014-11-18><LocalDate>"
        initial_cash = "<20000000><BigDecimal>"
        initial_margin = "<10000000><BigDecimal>"
        initial_share = "<30000000><BigDecimal>"
    }
}

# Secret key
application.secret = "ASlm`6N=Tc]JWRL3]/;<vnwcERuXc[fSc6O3TR/BnT^gpSOYFRtA>k9Tn<22=4[q"

play {
    akka {
        loglevel = WARNING
        actor {
            default-dispatcher = {
                fork-join-executor {
                    parallelism-min = 300
                    parallelism-max = 300
                }
            }
        }
    }
}
