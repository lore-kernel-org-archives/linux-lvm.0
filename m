Return-Path: <wim@comned.com>
From: "wim bakker" <wim@comned.com>
Date: Wed, 24 Jan 2001 15:35:30 +0100
Message-ID: <web-8135952@comned.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] vgextend segfaults
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hai,
setup: RH7 with all updates applied
kernel: 2.4.0 and 2.4.1-pre10
LVM: tried 0.9, 0.9.1-beta1 and 0.9.1-beta2
with fdisk I created 4 primary partitions on a testdrive all
8e.
After that I do a pvcreate for those 4 partitiions:
--------------------------------
[root@water 0.9]# pvcreate -v /dev/sdb1
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/sdb1"
pvcreate -- getting physical volume size
pvcreate -- checking partition type
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/sdb1 with
3212937 sectors
pvcreate -- writing physical volume data to disk "/dev/sdb1"
pvcreate -- physical volume "/dev/sdb1" successfully created
pvcreate -- unlocking logical volume manager

[root@water 0.9]# pvcreate -v /dev/sdb2
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/sdb2"
pvcreate -- getting physical volume size
pvcreate -- checking partition type
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/sdb2 with
3213000 sectors
pvcreate -- writing physical volume data to disk "/dev/sdb2"
pvcreate -- physical volume "/dev/sdb2" successfully created
pvcreate -- unlocking logical volume manager

[root@water 0.9]# pvcreate -v /dev/sdb3
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/sdb3"
pvcreate -- getting physical volume size
pvcreate -- checking partition type
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/sdb3 with
6426000 sectors
pvcreate -- writing physical volume data to disk "/dev/sdb3"
pvcreate -- physical volume "/dev/sdb3" successfully created
pvcreate -- unlocking logical volume manager

[root@water 0.9]# pvcreate -v /dev/sdb4
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/sdb4"
pvcreate -- getting physical volume size
pvcreate -- checking partition type
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/sdb4 with
5076540 sectors
pvcreate -- writing physical volume data to disk "/dev/sdb4"
pvcreate -- physical volume "/dev/sdb4" successfully created
pvcreate -- unlocking logical volume manager
-----------------------------------
then I do a vgscan
-----------------------------
[root@water 0.9]# vgscan
vgscan -- reading all physical volumes (this may take a
while...)
vgscan -- no volume groups found
--------------------------------------
then I do a vgcreate:
--------------------------------------
[root@water 0.9]# vgcreate -A y -l 10 -p 20 -s 4M -v testl
/dev/sdb1
vgcreate -- checking volume group name
vgcreate -- checking volume group directory existence
vgcreate -- locking logical volume manager
vgcreate -- checking volume group "testl" existence
vgcreate -- counting all existing volume groups
vgcreate -- reading all physical volume data from disks
vgcreate -- checking if all given physical volumes in
command line are new
vgcreate -- checking physical volumes name "/dev/sdb1"
vgcreate -- checking physical volume "/dev/sdb1"
vgcreate -- getting size of physical volume "/dev/sdb1"
vgcreate -- size of physical volume "/dev/sdb1"  is 3212937
sectors
vgcreate -- checking for new physical volume "/dev/sdb1"
vgcreate -- checking for identical physical volumes on
command line
vgcreate -- 1 physical volume will be inserted into volume
group "testl"
vgcreate -- checking command line arguments
vgcreate -- INFO: maximum of 20 physical volumes
vgcreate -- INFO: maximum of 10 logical volumes
vgcreate -- setting up volume data for creation
vgcreate -- INFO: maximum logical volume size is 255.99
Gigabyte
vgcreate -- storing volume group data on disk(s)
vgcreate -- removing any invalid special files of volume
group "testl"
vgcreate -- creating volume group directory /dev/testl
vgcreate -- creating VGDA for volume group "testl" in kernel
vgcreate -- inserting volume group "testl" into
"/etc/lvmtab"
vgcreate -- checking volume group name "testl"
vgcreate -- checking volume group consistency of "testl"
vgcreate -- checking existence of "/etc/lvmtab.d"
vgcreate -- storing volume group data of "testl" in
"/etc/lvmtab.d/testl.tmp"
vgcreate -- storing physical volume data of "testl" in
"/etc/lvmtab.d/testl.tmp"
vgcreate -- storing logical volume data of volume group
"testl" in "/etc/lvmtab.d/testl.tmp"
vgcreate -- renaming "/etc/lvmtab.d/testl.tmp" to
"/etc/lvmtab.d/testl"
vgcreate -- doing automatic backup of volume group "testl"
vgcreate -- checking volume group name "testl"
vgcreate -- checking volume group consistency of "testl"
vgcreate -- checking existence of "/etc/lvmconf"
vgcreate -- making directory "/etc/lvmconf"
vgcreate -- storing volume group data of "testl" in
"/etc/lvmconf/testl.conf.tmp"
vgcreate -- storing physical volume data of "testl" in
"/etc/lvmconf/testl.conf.tmp"
vgcreate -- storing logical volume data of volume group
"testl" in "/etc/lvmconf/testl.conf.tmp"
vgcreate -- checking existence of
"/etc/lvmconf/testl.conf.tmp"
vgcreate -- checking existence of "/etc/lvmconf/testl.conf"
vgcreate -- renaming "/etc/lvmconf/testl.conf.tmp" to
"/etc/lvmconf/testl.conf"
vgcreate -- unlocking logical volume manager
vgcreate -- volume group "testl" successfully created and
activated

[root@water 0.9]# vgdisplay -v
--- Volume group ---
VG Name               testl
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                10
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                20
Cur PV                1
Act PV                1
VG Size               1.53 GB
PE Size               4 MB
Total PE              392
Alloc PE / Size       0 / 0
Free  PE / Size       392 / 1.53 GB
VG UUID               ZUVQqV-cWzF-W0Ce-qJPk-wTN5-qKX3-PyNPeC

--- No logical volumes defined in testl ---


--- Physical volumes ---
PV Name (#)           /dev/sdb1 (1)
PV Status             available / allocatable
Total PE / Free PE    392 / 392
--------------------------------------
Then I do a vgextend:
--------------------------------------
 vgextend -v testl /dev/sdb2
vgextend -- locking logical volume manager
vgextend -- checking volume group name "testl"
vgextend -- checking volume group "testl" existence
vgextend -- checking for inactivity of volume group
vgextend -- reading data of volume group "testl" from lvmtab
vgextend -- INFO: maximum logical volume size is 255.99
Gigabyte
vgextend -- reading data for all physical volumes from
disk(s)
vgextend -- extending VGDA structures of volume group
"testl"
vgextend -- volume group "testl" will be extended by 1 new
physical volumes
vgextend -- extending volume group "testl" by physical
volume "/dev/sdb2" in kernel
Segmentation fault
----------------------------------------
It segfaults , it segfaults whatever 2.4.0 or 2.4.1-prexxx
I use, I tried this with the above mentioned lvm's
and allways the same result. a segfault .
Now what am I doink wrong???
I tried this on two different machine one dual processor
with
adaptec 29160 adapter and one with 53c875 adapter 
both with the same disks quantum 9Gb u2w disks
TIA 

wim bakker
ComNed Netwerken BV
31 20 4350025
