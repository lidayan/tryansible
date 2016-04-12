#/bin/bash


grep "HISTTIMEFORMAT" /etc/profile  || echo 'HISTTIMEFORMAT="%F %T `whoami` "' >> /etc/profile