begin;
set @user := 'pmsadmin@datayes.com';
set @sid := (select id from acl_sid where sid = @user limit 1);
set @oid = (select oid.id from acl_features f join acl_object_identity oid on f.id = oid.object_id_identity where f.short_code = 'PRIVILEGE_MGMT' limit 1);
insert into acl_entry (acl_object_identity, sid, mask, granting, audit_success, audit_failure) values (@oid, @sid, 2, 1, 0, 0);
commit;
