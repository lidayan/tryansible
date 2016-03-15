
import winrm

s=winrm.Session('192.168.91.1',auth=('administrator','123456'))

r = s.run_cmd('ipconfig', ['/all'])

print r.status_code
print r.std_out
