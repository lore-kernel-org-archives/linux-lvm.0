Message-ID: <A11077E28200D51182EA00D0B775525307142799@xin02.india.hp.com>
From: "HERUR,CHANNABASAPPA (HP-India,ex2)" <channabasappa.herur@hp.com>
MIME-Version: 1.0
Subject: [linux-lvm] Problems while trying to crash Oracle database
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
Date: Tue Apr 29 19:58:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi ,
	I am basically trying to crash the oracle database which has been
created using raw logical volumes . When I use 'dd' command to crash the
oracle database I find that the database is actually not crashing . 

	I used the following steps to create Oracle database on raw logical
volumes .


1. Created Physical Volumes's using pvcreate command 
# pvcreate /dev/sdp
pvcreate -- physical volume "/dev/sdp" successfully created

# pvcreate /dev/sdq
pvcreate -- physical volume "/dev/sdq" successfully created

2. Created Volume Groups's
# vgcreate vg06 /dev/sdp
vgcreate -- INFO: using default physical extent size 4.00 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- doing automatic backup of volume group "vg06"
vgcreate -- volume group "vg06" successfully created and activated

# vgcreate vg07 /dev/sdq
vgcreate -- INFO: using default physical extent size 4.00 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- doing automatic backup of volume group "vg07"
vgcreate -- volume group "vg07" successfully created and activated

3. Created Logical Volume's

# lvcreate -l 25 -n control01.ctl /dev/vg06
lvcreate -- doing automatic backup of "vg06"
lvcreate -- logical volume "/dev/vg06/control01.ctl" successfully created

# lvcreate -l 25 -n control02.ctl /dev/vg06
lvcreate -- doing automatic backup of "vg06"
lvcreate -- logical volume "/dev/vg06/control02.ctl" successfully created

# lvcreate -l 100 -n system01.dbf /dev/vg06
lvcreate -- doing automatic backup of "vg06"
lvcreate -- logical volume "/dev/vg06/system01.dbf" successfully created

# lvcreate -l 100 -n log01.log /dev/vg07
lvcreate -- doing automatic backup of "vg07"
lvcreate -- logical volume "/dev/vg07/log01.log" successfully created

# lvcreate -l 100 -n log02.log /dev/vg07
lvcreate -- doing automatic backup of "vg07"
lvcreate -- logical volume "/dev/vg07/log02.log" successfully created

4. Removed the existing raw devices

[root@LNXSRVZ /dev]# rm /dev/raw/raw41
rm: remove `/dev/raw/raw41'? y
[root@LNXSRVZ /dev]# rm /dev/raw/raw42
rm: remove `/dev/raw/raw42'? y
[root@LNXSRVZ /dev]# rm /dev/raw/raw43
rm: remove `/dev/raw/raw43'? y
[root@LNXSRVZ /dev]# rm /dev/raw/raw44
rm: remove `/dev/raw/raw44'? y
[root@LNXSRVZ /dev]# rm /dev/raw/raw45
rm: remove `/dev/raw/raw45'? y

5.Recreate raw devices using 'mknod' command

# mknod /dev/vg06/rsystem01.dbf c 162 41
# mknod /dev/vg06/rcontrol01.ctl c 162 42
# mknod /dev/vg06/rcontrol02.ctl c 162 43
# mknod /dev/vg07/rlog01.log c 162 44
# mknod /dev/vg07/rlog02.log c 162 45


6. Used 'raw' command to bind raw device to block device

# raw /dev/vg06/rsystem01.dbf /dev/vg06/system01.dbf
/dev/raw/raw41: bound to major 58, minor 19
# raw /dev/vg06/rcontrol01.ctl /dev/vg06/control01.ctl
/dev/raw/raw42: bound to major 58, minor 17
# raw /dev/vg06/rcontrol02.ctl /dev/vg06/control02.ctl
/dev/raw/raw43: bound to major 58, minor 18
# raw /dev/vg07/rlog01.log /dev/vg07/log01.log
/dev/raw/raw44: bound to major 58, minor 20
# raw /dev/vg07/rlog02.log /dev/vg07/log02.log
/dev/raw/raw45: bound to major 58, minor 21


7. CHANGED THE FILE PERMISSIONS
# chmod 766 /dev/vg06
# chmod 766 /dev/vg06/*
# chmod 766 -R /dev/vg07         
# chmod 766 -R /dev/vg07/*            
# chown oracle:oinstall -R /dev/vg07  

# ll /dev/vg06/*
brwxrw-rw-    1 oracle   oinstall  58,  17 Apr 29 14:06
/dev/vg06/control01.ctl
brwxrw-rw-    1 oracle   oinstall  58,  18 Apr 29 14:06
/dev/vg06/control02.ctl
crwxrw-rw-    1 oracle   oinstall 109,   6 Apr 29 14:05 /dev/vg06/group
crwxrw-rw-    1 oracle   oinstall 162,  42 Apr 29 14:10
/dev/vg06/rcontrol01.ctl
crwxrw-rw-    1 oracle   oinstall 162,  43 Apr 29 14:10
/dev/vg06/rcontrol02.ctl
crwxrw-rw-    1 oracle   oinstall 162,  41 Apr 29 14:10
/dev/vg06/rsystem01.dbf
brwxrw-rw-    1 oracle   oinstall  58,  19 Apr 29 14:06
/dev/vg06/system01.dbf

# ll /dev/vg07/*
crwxrw-rw-    1 oracle   oinstall 109,   7 Apr 29 14:05 /dev/vg07/group
brwxrw-rw-    1 oracle   oinstall  58,  20 Apr 29 14:06 /dev/vg07/log01.log
brwxrw-rw-    1 oracle   oinstall  58,  21 Apr 29 14:07 /dev/vg07/log02.log
crwxrw-rw-    1 oracle   oinstall 162,  44 Apr 29 14:10 /dev/vg07/rlog01.log
crwxrw-rw-    1 oracle   oinstall 162,  45 Apr 29 14:10 /dev/vg07/rlog02.log

9. init$ORACLE_SID.ora file had the following contents

db_name                         = rawlvm1

db_files                        = 400

db_file_multiblock_read_count   = 16

db_block_buffers                = 550

shared_pool_size                = 5000000

log_checkpoint_interval         = 10000

processes                       = 100

parallel_max_servers            = 8

log_buffer                      = 32768

global_names                    = TRUE

control_files                   = (/dev/raw/raw42, /dev/raw/raw43)

db_block_checksum               = true

db_block_size                   = 4096

background_dump_dest            = /u00/app/oracle/admin/hard/rawlvm/bdump

core_dump_dest                  = /u00/app/oracle/admin/hard/rawlvm/cdump

user_dump_dest                  = /u00/app/oracle/admin/hard/rawlvm/udump

10. Created oracle database

SQL> startup nomount;
ORACLE instance started.

Total System Global Area   53178448 bytes
Fixed Size                   450640 bytes
Variable Size              50331648 bytes
Database Buffers            2252800 bytes
Redo Buffers                 143360 bytes
SQL>
SQL> create database "rawlvm1"
  2    controlfile reuse
  3    maxinstances 8
  4    maxlogfiles 32
  5    datafile
  6         '/dev/raw/raw41' size 40M reuse
  7      logfile
  8         '/dev/raw/raw44'  size 20M ,
  9         '/dev/raw/raw45'  size 20M ;

Database created.

	Please let me know if there is something fundamentally wrong in the
above steps used for creating Oracle database . After creating the database
I used the following 'dd' command to crash the database 

	dd if=/boot/vmlinux-2.4.2-2 of=/dev/sdp

	Strangely this command does'nt seem to crash the database . Can
anybody help me out to crash the Oracle database ?
