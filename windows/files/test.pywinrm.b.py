
import winrm

s=winrm.Session('10.23.40.135',auth=('administrator','4rfv$RFV'))

r = s.run_cmd('ipconfig', ['/all'])

print r.status_code
print r.std_out
