Message-ID: <20030407130255.2140.qmail@webmail8.rediffmail.com>
MIME-Version: 1.0
From: "Amitst" <amitstora@rediffmail.com>
Content-Disposition: inline
Subject: [linux-lvm] Raw device setup problems on Suse v8.0 Linux!
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Mon Apr  7 08:05:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain;
	format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: amitstora@rediffmail.com

Hi all!

Working on Oracle v8.1.7.0.0 with OS  as Suse v8.0 Linux.

I had created LVM,linked raw devices to LVM as below:

# for binding raw devices

raw /dev/raw/raw1 /dev/oracle/sam_raw_system_251m
raw /dev/raw/raw2 /dev/oracle/sam_raw_users_26m
raw /dev/raw/raw3 /dev/oracle/sam_raw_temp_41m
raw /dev/raw/raw4 /dev/oracle/sam_raw_rbs_201m
raw /dev/raw/raw5 /dev/oracle/sam_raw_indx_26m
raw /dev/raw/raw6 /dev/oracle/sam_raw_controlfile1_110m
raw /dev/raw/raw7 /dev/oracle/sam_raw_controlfile2_110m
raw /dev/raw/raw8 /dev/oracle/sam_raw_controlfile3_110m
raw /dev/raw/raw9 /dev/oracle/sam_raw_tools_11m
raw /dev/raw/raw10 /dev/oracle/sam_raw_redo01_120m
raw /dev/raw/raw11 /dev/oracle/sam_raw_redo02_120m
raw /dev/raw/raw12 /dev/oracle/sam_raw_redo03_10m


# for linking raw devices with file system


ln -s /dev/raw/raw1 
/ora8/m01/app/oracle/oradata/sam/sam_raw_system_251m
ln -s /dev/raw/raw2 
/ora8/m01/app/oracle/oradata/sam/sam_raw_users_26m
ln -s /dev/raw/raw3 
/ora8/m01/app/oracle/oradata/sam/sam_raw_temp_41m
ln -s /dev/raw/raw4 
/ora8/m01/app/oracle/oradata/sam/sam_raw_rbs_201m
ln -s /dev/raw/raw5 
/ora8/m01/app/oracle/oradata/sam/sam_raw_indx_26m
ln -s /dev/raw/raw6 
/ora8/m01/app/oracle/oradata/sam/sam_raw_controlfile1_110m
ln -s /dev/raw/raw7 
/ora8/m01/app/oracle/oradata/sam/sam_raw_controlfile2_110m
ln -s /dev/raw/raw8 
/ora8/m01/app/oracle/oradata/sam/sam_raw_controlfile3_110m
ln -s /dev/raw/raw9 
/ora8/m01/app/oracle/oradata/sam/sam_raw_tools_11m
ln -s /dev/raw/raw10 
/ora8/m01/app/oracle/oradata/sam/sam_raw_redo01_120m
ln -s /dev/rawr/aw11 
/ora8/m01/app/oracle/oradata/sam/sam_raw_redo02_120m
ln -s /dev/raw/raw12 
/ora8/m01/app/oracle/oradata/sam/sam_raw_redo03_10m

I had then executed the script sqlora8.sh as below after making 
all the changes in
initsam.ora control files with raw devices,samrun.sh,samrun1.sh 
and replaced the
data files,redo log files with the necessary raw devices.

P.S:SAM is the db name and I want to create the SAM DB with the 
help of
sqlora8.sh script....

oracle@saraswathi:/ora8/m01/app/oracle/product/8.1.7/assistants/dbca>
./sqlora8.sh

I get the following error as below:

ORA-01109: database not open
create or replace function privilege_list (priv_list out 
ora_name_list_t)
*
ORA-01109: database not open
grant execute on privilege_list to public
*
ORA-01109: database not open
drop public synonym ora_privilege_list
*
ORA-01109: database not open
create public synonym ora_privilege_list for privileg_list
*
ORA-01109: database not open
create or replace function with_grant_option return boolean is

ORA-01109: database not open
grant execute on is_drop_column to public
*
ORA-01109: database not open
drop public synonym ora_is_drop_column
*
ORA-01109: database not open
create public synonym ora_is_drop_column for is_drop_column
*
ORA-01109: database not open
create or replace function grantee (user_list out 
ora_name_list_t)
*
ORA-01109: database not open
grant execute on grantee to public
*
ORA-01109: database not open
drop public synonym ora_grantee
*
ORA-01109: database not open
create public synonym ora_grantee for grantee
*
ORA-01109: database not open
create or replace function revokee (user_list out 
ora_name_list_t)
*
ORA-01109: database not open
grant execute on revokee to public
*
ORA-01109: database not open
drop public synonym ora_revokee
*
ORA-01109: database not open
create public synonym ora_revokee for revokee
*
ORA-01109: database not open
create or replace function privilege_list (priv_list out 
ora_name_list_t)
*
ORA-01109: database not open
grant execute on privilege_list to public
*
ORA-01109: database not open
drop public synonym ora_privilege_list
*
ORA-01109: database not open
create public synonym ora_privilege_list for privileg_list
*
ORA-01109: database not open
create or replace function with_grant_option return boolean is




ORA-01109: database not open
grant execute on is_drop_column to public
*
ORA-01109: database not open
drop public synonym ora_is_drop_column
*
ORA-01109: database not open
create public synonym ora_is_drop_column for is_drop_column
*
ORA-01109: database not open
create or replace function grantee (user_list out 
ora_name_list_t)
*
ORA-01109: database not open
grant execute on grantee to public
*
ORA-01109: database not open
drop public synonym ora_grantee
*
ORA-01109: database not open
create public synonym ora_grantee for grantee
*
ORA-01109: database not open
create or replace function revokee (user_list out 
ora_name_list_t)
*
ORA-01109: database not open
grant execute on revokee to public
*
ORA-01109: database not open
drop public synonym ora_revokee
*
ORA-01109: database not open
create public synonym ora_revokee for revokee
*
ORA-01109: database not open
create or replace function privilege_list (priv_list out 
ora_name_list_t)
*
ORA-01109: database not open
grant execute on privilege_list to public
*
ORA-01109: database not open
drop public synonym ora_privilege_list
*
ORA-01109: database not open
create public synonym ora_privilege_list for privileg_list
*
ORA-01109: database not open
create or replace function with_grant_option return boolean is

Has anyone experienced the same problem so far and please could 
figure out as to
what is causing this problem...ORA:01109:database not open....

THESE ARE THE SETTINGS FOR MY INITORA8.ORA FILE:

db_name = "ora8"
instance_name = ora8

control_files = ("/dev/raw/raw1","/dev/raw/raw2", 
"/dev/raw/raw3")

open_cursors = 300
max_enabled_roles = 30

db_block_buffers = 2048

shared_pool_size = 4194304

large_pool_size = 614400
java_pool_size = 0

log_checkpoint_interval = 10000
log_checkpoint_timeout = 1800

processes = 150

log_buffer = 163840

# audit_trail = false  # if you want auditing
# timed_statistics = false  # if you want timed statistics
"initora8.ora" [readonly] 110L, 4292C

Thanks&Regards,

Amit.




Amit Sood Tagala,
Sr.Oracle Database(OCP) Administrator(DBA) v8i,v9i,
Ph#:(R)+91-40-27508534.
Mobile#:9849050133.
*E-mail:amitstora@rediffmail.com,
amitst@yahoo.com


_______________________________________________________________________
Odomos - the only  mosquito protection outside 4 walls -
Click here to know more!
http://r.rediff.com/r?http://clients.rediff.com/odomos/Odomos.htm&&odomos&&wn
