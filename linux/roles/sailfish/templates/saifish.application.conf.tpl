akka {
  akka.loggers = ["akka.event.slf4j.Slf4jLogger"]
  loglevel = "INFO"
  actor {
    provider = "akka.remote.RemoteActorRefProvider"
  }
  remote {
    enabled-transports = ["akka.remote.netty.tcp"]
    netty.tcp {
      hostname = "127.0.0.1"
      port = 24262
    }
    log-sent-messages = on
    log-received-messages = on
  }
  log-dead-letters-during-shutdown = off
}


system {
  scheduler {
    backend {
      interval = "<1 minute><Duration>"
    }
    execution_scan {
      interval = "<5 second><Duration>"
    }
    order_write {
      interval = "<10 minute><Duration>"
    }
  }

  file {
    history {
      order = "/datayes/invest-platform/sailfish/tmp/history/order"
      sender = "/datayes/invest-platform/sailfish/tmp/history/sender"
      execution = "/datayes/invest-platform/sailfish/tmp/history/execution"
      idGenerator = "/datayes/invest-platform/sailfish/tmp/history/idGenerator"
    }
    upload {
      order = "/datayes/invest-platform/sailfish/tmp/order"
      execution = "/datayes/invest-platform/sailfish/tmp/execution"
      cancel = "/datayes/invest-platform/sailfish/tmp/cancel"
      extension = ".xlsx"
    }
  }
}

mode {
  execution {
    amount = "INCREMENT"          # FULL, INCREMENT
    mapping = "FIFO"              # SOLO, FIFO
    no_account = true             # 缁..?..浜ゆ.?..涓涓..浠惰??..寮?...
  }
  file {
    read = "PERFORMANCE"       # NORMAL,PERFORMANCE
  }
}
