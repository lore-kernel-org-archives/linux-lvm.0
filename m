Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j04D3Qr08368
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2005 08:03:26 -0500
Received: from sandesh.patni.com (sandesh.patni.com [208.250.32.13])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j04D39M5011328
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2005 08:03:10 -0500
Received: from onsitemail.patni.com ([192.168.175.202])
	by sandesh.patni.com (8.12.11/8.12.11) with ESMTP id j04D1NgJ005824
	for <linux-lvm@redhat.com>; Tue, 4 Jan 2005 08:01:34 -0500
Message-ID: <21259.208.250.32.6.1104847734.squirrel@192.168.175.202>
Date: Tue, 4 Jan 2005 09:08:54 -0500 (EST)
From: "Santosh Rokade" <santosh.rokade@patni.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;boundary="----=_20050104090854_54440"
Subject: [linux-lvm] Problem while migrating form environment SD-LVM to
	SD-MD-LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com
Cc: sandhya.suman@patni.com, martin.george@patni.com

------=_20050104090854_54440
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Hi,

Problem Description:
====================
I am trying to migrate from environment having lvm on top of SD
to environment having lvm on top of MD and MD on top of SD device.
The migration is successful however output of pvscan and vgscan
shows that particular vg is still in inactive and exported state

Please refer attached diagram for migration details.

The migration steps that i am following are as follows for detail please
refer console logs given below :
1. Unmount logical volume
2. Deactivate volume group
3. Export volume group by command vgexport
4. Edit /etc/raidtab to have entry for MD device on top of cooresponding SD
5. Create md device using mkraid command
6. Run vgscan command
7. Vgimport on md device
8. Mount logical volume

Here pvscan and vgscan output shows vg in inactive and exported state.

However if i run following commands after step #8 the pvscan and vgscan
output is proper

9. Unmount logical volume
10. Deactivate vg
11. raidstop all md devices beneath vg
12. raidstart all md devices beneath vg
13. Activate vg

Inputs Expected:
================
1. Please let us know why pvscan and vgscan shows vg in exported and in
inactive state even though it is imported and accessible through logical
volume.
(vgdisplay -v output is proper)

2. After migration (Steps #1 to #8) if i try to run lvscan, vgchange
command it gives output as below
linux:~ # lvscan
lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
vgscan

3. Please let us know whether the steps mentioned above are correct or not.

4. Why execution of steps #9 to #13 after step #8 solving problem.


**Please refer console logs for details of steps carried out: *****

===========================================================
linux:~ # fdisk -l /dev/sdd

Disk /dev/sdd: 255 heads, 63 sectors, 652 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/sdd1             1       200   1606468+  8e  Linux LVM
/dev/sdd2           201       400   1606500   8e  Linux LVM
/dev/sdd3           401       652   2024190   8e  Linux LVM
linux:~ # pvcreate /dev/sdd1 /dev/sdd2 /dev/sdd3
pvcreate -- physical volume "/dev/sdd1" successfully created
pvcreate -- physical volume "/dev/sdd2" successfully created
pvcreate -- physical volume "/dev/sdd3" successfully created

linux:~ # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdd1" is in no VG  [1.53 GB]
pvscan -- inactive PV "/dev/sdd2" is in no VG  [1.53 GB]
pvscan -- inactive PV "/dev/sdd3" is in no VG  [1.93 GB]
pvscan -- total: 3 [4.99 GB] / in use:  [0] / in no VG: 3 [4.99 GB]

linux:~ # vgcreate vgtest /dev/sdd1 /dev/sdd2 /dev/sdd3
vgcreate -- INFO: using default physical extent size 4 MB
vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
vgcreate -- doing automatic backup of volume group "vgtest"
vgcreate -- volume group "vgtest" successfully created and activated

linux:~ # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "vgtest"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

linux:~ # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sdd1" of VG "vgtest" [1.53 GB / 1.53 GB free]
pvscan -- ACTIVE   PV "/dev/sdd2" of VG "vgtest" [1.53 GB / 1.53 GB free]
pvscan -- ACTIVE   PV "/dev/sdd3" of VG "vgtest" [1.93 GB / 1.93 GB free]
pvscan -- total: 3 [4.99 GB] / in use: 3 [4.99 GB] / in no VG:  [0]

linux:~ # lvcreate -L 100M -n lvtest vgtest
lvcreate -- doing automatic backup of "vgtest"
lvcreate -- logical volume "/dev/vgtest/lvtest" successfully created

linux:~ # lvscan
lvscan -- ACTIVE            "/dev/vgtest/lvtest" [100 MB]
lvscan -- 1 logical volumes with 100 MB total in 1 volume group
lvscan -- 1 active logical volumes

linux:~ # mke2fs /dev/vgtest/lvtest
mke2fs 1.28 (31-Aug-2002)
Filesystem labelOS type: Linux
Block size=1024 (log=0)
Fragment size=1024 (log=0)
25688 inodes, 102400 blocks
5120 blocks (5.00%) reserved for the super user
First data block=1
13 block groups
8192 blocks per group, 8192 fragments per group
1976 inodes per group
Superblock backups stored on blocks:
        8193, 24577, 40961, 57345, 73729

Writing inode tables: done
Writing superblocks and filesystem accounting information: done

This filesystem will be automatically checked every 35 mounts or
180 days, whichever comes first.  Use tune2fs -c or -i to override.

linux:~ # mount /dev/vgtest/lvtest /mnt/
linux:~ # mount
/dev/hda7 on / type ext3 (rw)
proc on /proc type proc (rw)
devpts on /dev/pts type devpts (rw,mode=0620,gid=5)
/dev/hda8 on /boot type ext3 (rw)
shmfs on /dev/shm type shm (rw)
usbdevfs on /proc/bus/usb type usbdevfs (rw)
/dev/vgtest/lvtest on /mnt type ext2 (rw)

linux:~ # touch /mnt/file
linux:~ # ls -al /mnt/
total 17
drwxr-xr-x    3 root     root         1024 Oct 30 13:40 .
drwxr-xr-x   24 root     root         4096 Oct 30 09:08 ..
-rw-r--r--    1 root     root             Oct 30 13:40 file
drwx------    2 root     root        12288 Oct 30 13:39 lost+found

*************************  MIGRATION STEPS START **************************

linux:~ # umount /mnt/
linux:~ # vgchange -a n vgtest
vgchange -- volume group "vgtest" successfully deactivated

linux:~ # vgexport vgtest
vgexport -- volume group "vgtest" sucessfully exported

linux:~ # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found exported volume group "vgtestPV_EXP"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

linux:~ # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/sdd1"  is in EXPORTED VG "vgtest" [1.53 GB /
1.43 GB free]
pvscan -- inactive PV "/dev/sdd2"  is in EXPORTED VG "vgtest" [1.53 GB /
1.53 GB free]
pvscan -- inactive PV "/dev/sdd3"  is in EXPORTED VG "vgtest" [1.93 GB /
1.93 GB free]
pvscan -- total: 3 [4.99 GB] / in use: 3 [4.99 GB] / in no VG:  [0]

linux:~ # cat /etc/raidtab
raiddev /dev/md0
           raid-level              linear
           nr-raid-disks           1
           persistent-superblock   1
           chunk-size              32

           device                  /dev/sdd1
           raid-disk               0

raiddev /dev/md1
           raid-level              linear
           nr-raid-disks           1
           persistent-superblock   1
           chunk-size              32

           device                  /dev/sdd2
           raid-disk               0

raiddev /dev/md2
           raid-level              linear
           nr-raid-disks           1
           persistent-superblock   1
           chunk-size              32

           device                  /dev/sdd3
           raid-disk               0


linux:~ # mkraid -R /dev/md0 /dev/md1 /dev/md2
DESTROYING the contents of /dev/md0 in 5 seconds, Ctrl-C if unsure!
handling MD device /dev/md0
analyzing super-block
disk 0: /dev/sdd1, 1606468kB, raid superblock at 1606400kB
DESTROYING the contents of /dev/md1 in 5 seconds, Ctrl-C if unsure!
handling MD device /dev/md1
analyzing super-block
disk 0: /dev/sdd2, 1606500kB, raid superblock at 1606400kB
DESTROYING the contents of /dev/md2 in 5 seconds, Ctrl-C if unsure!
handling MD device /dev/md2
analyzing super-block
disk 0: /dev/sdd3, 2024190kB, raid superblock at 2024064kB

linux:~ # cat /proc/mdstat
Personalities : [linear]
read_ahead 1024 sectors
md2 : active linear sdd3[0]
      2024064 blocks 32k rounding

md1 : active linear sdd2[0]
      1606400 blocks 32k rounding

md0 : active linear sdd1[0]
      1606400 blocks 32k rounding

unused devices: <none>

linux:~ # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/md0"  is in EXPORTED VG "vgtest" [1.53 GB /
1.43 GB free]
pvscan -- inactive PV "/dev/md1"  is in EXPORTED VG "vgtest" [1.53 GB /
1.53 GB free]
pvscan -- inactive PV "/dev/md2"  is in EXPORTED VG "vgtest" [1.93 GB /
1.93 GB free]
pvscan -- total: 3 [4.99 GB] / in use: 3 [4.99 GB] / in no VG:  [0]

linux:~ # vgimport vgtest /dev/md0 /dev/md1 /dev/md2
vgimport -- doing automatic backup of volume group "vgtest"
vgimport -- volume group "vgtest" successfully imported and activated

linux:~ # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "vgtestPV_EXP"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

linux:~ # pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/md0"  is in EXPORTED VG "vgtest" [1.53 GB /
1.43 GB free]
pvscan -- inactive PV "/dev/md1"  is in EXPORTED VG "vgtest" [1.53 GB /
1.53 GB free]
pvscan -- inactive PV "/dev/md2"  is in EXPORTED VG "vgtest" [1.93 GB /
1.93 GB free]
pvscan -- total: 3 [4.99 GB] / in use: 3 [4.99 GB] / in no VG:  [0]

linux:~ # vgdisplay -v
--- Volume group ---
VG Name               vgtest
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                3
Act PV                3
VG Size               4.98 GB
PE Size               4 MB
Total PE              1275
Alloc PE / Size       25 / 100 MB
Free  PE / Size       1250 / 4.88 GB
VG UUID               p63Nem-1fai-k30T-B9wQ-bD7f-3f5T-bfmyS1

--- Logical volume ---
LV Name                /dev/vgtest/lvtest
VG Name                vgtest
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 0
LV Size                100 MB
Current LE             25
Allocated LE           25
Allocation             next free
Read ahead sectors     1024
Block device           58:0


--- Physical volumes ---
PV Name (#)           /dev/md0 (1)
PV Status             available / allocatable
Total PE / Free PE    391 / 366

PV Name (#)           /dev/md1 (2)
PV Status             available / allocatable
Total PE / Free PE    391 / 391

PV Name (#)           /dev/md2 (3)
PV Status             available / allocatable
Total PE / Free PE    493 / 493

linux:~ # vgchange -a y vgtest
vgchange -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
run vgscan

linux:~ # vgchange -a n vgtest
vgchange -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please
run vgscan

linux:~ # lvscan
lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
vgscan

linux:~ # vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "vgtestPV_EXP"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

linux:~ # lvscan
lvscan -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run
vgscan
==================================================================

Thanks in advance.

Thanks & Regards,
Santosh Rokade
------=_20050104090854_54440
Content-Type: image/pjpeg; name="clip_image002.jpg"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="clip_image002.jpg"

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
1vsyIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiIKDS2lqaq1wvpoHTupqlk7omdk5oznGd52
5x28KutN3t9W/g4qqPhQcGF5LJGnmLXAEHxELri0E52qLW2m3XFmpXUFNVN5pomv94QeD2AHiUOb
t+LxIdD7GBqspJIm/wB2Goljb6GuAXk6H2h2Nd1xkA7T7pUuHoMmEESfABJIxzqgrLlT1QloaAmv
rHNLRDTf0hBO7WI2NHjdhdY3Q3R0HMlqhqD/APc5m/3kq2gpoKWEQ08McMTRgMjaGtA8gQaLZTPo
rVR0khBdBAyNxG7LWgH3KYsYWUBERAREQEREBERAREQEREBERAREQEREBERAREQEREFXpJRVFy0d
r6KlDXTzQObGHHALsbAT2lzlvvFEagU08ho6ob6aqHBSD7DvHjGQu21QtNVRUtbFwVXTRVEe/Ulj
DxnyFBFi2xbNv2rRKF46j7A3+ptzaYc1NI+EehhAXk6HWggjWuIB7TbpUgegSII8u/8ARU1bdaGn
kETqhr53dhBEC+R55mtG0rouozR8/wBZb+HH92eaSVvoc4hWNFa7fbWFlDQ09K07xDE1gPoCCu0S
o6mhsYZVQmGSWeWbg3Hrmh7y4A8xwRnerxedUeNekBERAREQEREBERAREQEREBERAREQf//X+zIi
ICIiAiIgIiICIiAiIgKPTVsNZEZYHh7GyPiJAIw5jixw28zmkKQuLnob1Jo/cLNFbp4JJKueZlQZ
YuDlY6odJqDrieuYSOubjbtQdiXntALOt6cr5VdqFlpt76a5UpkE1NU8So6iaKM07zq4cwNwzPiY
XOGetB1iplVole5nXHMUr5p6aobHKJImh4fA5jI3Hs8NJA1exyA7KD6SScblqpKuCupY6qmkEkUo
1mOA3hcfV6MPprrI6mtLKm0mYSuomyNa2RxjLTJhxAyDjeRknO8ZXQaM0U9u0at9FVx8HPBA1j2a
+vh3ndtBboiICIiAiwsoCIiAiIgIiICIiAiIgIvOseZNYhB6RedbYPGhOEHpFhY1iO16EHpFjP8A
+FjJ25wg9IvGvs2LJJQekREBFhZQEREBERAREQEREBERAREQEREBERAREQEREBERAREQEREBERAR
EQEREH//0Psy86o8a9LGUES61D6K01dXGGmSngfK0O3azWkjPiXK0+lV1dTT1LX0tdBBTNqZpYqK
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
ejj7EZnzTwzSPYyMPYx7TqtzjOu923ad2B4l0CAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiIC
IiAiIgIiICIiAue0go6ioq43QwvkaI8EtHjXQrGEHFcmV30SX7pUZ7HRvLHtLXAkEEbfIu/VRFZA
blLV1Ba8OeXMYMn0oI1htckbxWTEsJGGN3ZHOVvvNvnudhqKNkMDJnv12RueSx2rIHAk6uzWxt2H
Ge3hXGFjVCDjqzRavfR6lNHRiSSunnlGuGOLXl2rh+o4jGwEAbQMZwtdu0MqKe3Qx1ApH1UctCeG
GS4NiijY8a2Adpa/G3brdrJXa6o8azqjy+VBwNBoVdYgIZOJxU7TEBGH8J1rQ8YDuDa4N64Ya4ux
zqZbtEqptTb5a6GjdFT8HrxBxkHWQPjyAWgdk4FdiGgLOEHzQWeqt9VS2g0MVTOKihfwxjkJibE9
pdwbtTV1dVrj2TcFzhg5Gejvuj1ZcbnUSwMpnx1UEMRllcRJS6j3PLmAA5J1hja3BaCun1Rs8SFg
JyUHz1ui1wvFFVMbDS0LRV1721AcRJPrzPAa8auxpGCTk5AbsU+36I1UNRxmeOmbJwdSQ2R4nDJH
iJrXbWNB2RuzgDf212YaBuTVHj9KDhbVojdKO509dUMpCYqiB/B8OTgNjmjcW4jaG/1jSGhoB1cb
N6xR6GXKmoaajcKM6op5HVQeeEjdHAyLUaNXa0lnZZGx5BBXd6gzlNUZygoLBYHWepa8R08bDbqa
nc2EYy+PX1ju3HWG1dCsaowsoCIiAiIgxq+VNUALKIMY8qxqhekQYwEwFlEGNUEoQCsogxhMbd5W
UQYxsTCyiDGAhGVlEGMYWURAREQEREBERAREQEREH//U+zIiICIiAiIgIiICIiAiIgIiICIiAiIg
IiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIi
AiIgIiICIiAiIgIiICIiAiIgIiIP/9X7MiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIg
IiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIi
AiIgIiIP/9k=
------=_20050104090854_54440--
