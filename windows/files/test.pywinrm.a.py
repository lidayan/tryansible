#!/usr/bin/python

import getpass
import sys
import winrm

user = r"administrator@datasset.datayes.net"
host = "10.23.40.135"
print("Enter password for User [%s]" % user)
pw = getpass.getpass()

from winrm.protocol import Protocol
p = Protocol(
endpoint='http://'+host+':5986/wsman',
transport='plaintext',
username=user,
password=pw)
shell_id = p.open_shell()
command_id = p.run_command(shell_id, 'ipconfig', ['/all'])
std_out, std_err, status_code = p.get_command_output(shell_id, command_id)

print std_out
print std_err
print status_code
