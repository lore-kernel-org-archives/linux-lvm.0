From: "Sandhya Suman" <sandhya.suman@patni.com>
Date: Thu, 6 Jan 2005 11:12:22 +0530
Message-ID: <016601c4f3b2$7f338e70$9961a8c0@pcp41107>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="----=_NextPart_000_0167_01C4F3E0.98EBCA70"
Subject: [linux-lvm] FW: Problem while migrating form environment SD-LVM to
	SD-MD-LVM
Reply-To: sandhya.suman@patni.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com
Cc: santosh.rokade@patni.com, mauelshagen@sistina.com

This is a multi-part message in MIME format...

------=_NextPart_000_0167_01C4F3E0.98EBCA70
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

Please reply to below mail.We need this information urgently.Its very
critical for us.

Thanks Regards
Sandhya

-----Original Message-----
From: Santosh Rokade [mailto:santosh.rokade@patni.com]
Sent: Tuesday, January 04, 2005 7:39 PM
To: linux-lvm@redhat.com
Cc: sandhya.suman@patni.com; martin.george@patni.com
Subject: Problem while migrating form environment SD-LVM to SD-MD-LVM


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

http://www.patni.com
World-Wide Partnerships. World-Class Solutions.
_____________________________________________________________________

This e-mail message may contain proprietary, confidential or legally
privileged information for the sole use of the person or entity to
whom this message was originally addressed. Any review, e-transmission
dissemination or other use of or taking of any action in reliance upon
this information by persons or entities other than the intended
recipient is prohibited. If you have received this e-mail in error
kindly delete  this e-mail from your records. If it appears that this
mail has been forwarded to you without proper authority, please notify
us immediately at netadmin@patni.com and delete this mail. 
_____________________________________________________________________

------=_NextPart_000_0167_01C4F3E0.98EBCA70
Content-Type: image/pjpeg;
	name="clip_image002.jpg"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="clip_image002.jpg"

/9j/4AAQSkZJRgABAQEAYABgAAD//gAcU29mdHdhcmU6IE1pY3Jvc29mdCBP
ZmZpY2X/2wBDAAoHBwgHBgoICAgLCgoLDhgQDg0NDh0VFhEYIx8lJCIfIiEm
KzcvJik0KSEiMEExNDk7Pj4+JS5ESUM8SDc9Pjv/2wBDAQoLCw4NDhwQEBw7
KCIoOzs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7Ozs7
Ozs7Ozs7Ozv/wAARCAGrAhgDASIAAhEBAxEB/8QAGwABAAIDAQEAAAAAAAAA
AAAAAAQFAQMGAgf/xABYEAABAwMABAUPCQQIBAUDBQABAAIDBAURBhIhMRMU
FVHRFiIyQVNVVmFxcpGTlLHTNDVUdIGSorPBNnWhtCMzQlJic5WyJCXS8CZD
Y4LhB2TxREVlo6T/xAAUAQEAAAAAAAAAAAAAAAAAAAAA/8QAFBEBAAAAAAAA
AAAAAAAAAAAAAP/dAAQAKP/aAAwDAQACEQMRAD8A+zIiICjGtGs4CJ51SQd3
aPlUlVw3vH+N/vKCRxwdxk/D0pxwdxk/D0rQiDfxwdxk/D0pxwdxk/D0rQiD
fxwdxk/D0pxwdxk/D0rQvE0oggfK4ZDGlxxzAIJXHB3GT8PSnHB3GT8PSudp
r1dauliqYtH5DHKwPaTVRjYQCO2tnKd48H3e1xoL7jg7jJ+HpTjg7jJ+HpVD
ynePB93tcacp3jwfd7XGgvuODuMn4elOODuMn4elUPKd48H3e1xpynePB93t
caC+44O4yfh6U44O4yfh6VQ8p3jwfd7XGnKd48H3e1xoL7jg7jJ+HpTjg7jJ
+HpVDynePB93tcacp3jwfd7XGgvuODuMn4elOODuMn4elU1vus1VXz0NVb30
k0MTJQDI14c1znN3tz22lWSDfxwdxk/D0pxwdxk/D0rQiDfxwdxk/D0pxwdx
k/D0rQiDfxwdxk/D0rZDNwzXO1S3Bxg+RRFvouwk8/8AQIJKIiAiIgLVNNwL
Q7VLsnAA8i2qNW9jH5/6FA44O4yfh6U44O4yfh6VoRBv44O4yfh6U44O4yfh
6VoRBv44O4yfh6U44O4yfh6VoRBv44O4yfh6U44O4yfh6VoRBv44O4yfh6U4
4O4yfh6Vz0d7r6l8/E7K+eKKd8IkNQxusWuLSceUL3ynePB93tcaC+44O4yf
h6U44O4yfh6VQ8p3jwfd7XGnKd48H3e1xoL7jg7jJ+HpTjg7jJ+HpVDynePB
93tcacp3jwfd7XGgvuODuMn4elOODuMn4elUPKd48H3e1xpynePB93tcaC+4
4O4yfh6U44O4yfh6VQ8p3jwfd7XGnKd48H3e1xoL7jg7jJ+HpTjg7jJ+HpVD
T3irdc4KKstT6U1DXlj+GY8dbvGxW6Dfxwdxk/D0pxwdxk/D0rQiDfxwdxk/
D0pxwdxk/D0rQiDfxwdxk/D0pxwdxk/D0rQiCRHVh8jWcG5pdz46VIUCL5TF
5T7ip6AiIgIiICIiAiIgKuHZP893vKsVXDsn+e73lBlERAREQFHr/m6p/wAp
/uKkKPX/ADdU/wCS/wBxQaLD+z9t+qRf7Ap+3nPpUCw/s/bfqkX+wKeg/9D6
tt5z6U2859KIgrKHSChrbfHWGYQtfqtLXna1xbrAH/27V5bpJbpn04ppxUMm
kewuiJOpqsc/JG/c3Zz5yqsaFMfAymmrCYDQOppGsZjWeQ5gkHMdWSQY8Y5l
JptHqoXiG611ZDLPG4azYoDG0tbHIxuwknP9ITv3YHaQWloubLvb21scU0LX
SPZqTDVc3Ue5hyO1taVM2859KhWuhNupHwmQSa080wcG42SSOeB9mt71NQNv
OfSm3nPpREFRDs0xrP3fT/mTK3VRD+2NZ+76f8yZW6AiIgIiIC30XYSef+gW
hb6LsJPP/QIJKIiAiIgKNW9jH5/6FSVGrexj8/8AQoNCIiAiIgIiICIiCo0c
+SVn7wqvzXK32859KqNHPklZ+8Kr81yt0Dbzn0pt5z6URBXQ32jkfWMkl4I0
b3Nk1j/ZH9oeJa5tJLczWENS2okZPFC6OJwJBfK2LPjAc7bjdu3qJLowZa5t
RxrVHHHTyM1OzjJY4M+9FGc82edR26I1BNLHJXxuioXMFMGwFrgwTxSkPOdp
/ogARjtnagubbd4rpNWRwxzM4pMIiZG6uuS0OBHi64YJ39rnU/bzn0qHR0Jp
q64VLpA7jczZA0A5aBG1hB5+xz9qmIG3nPpTbzn0oiCouO3SW0Z29ZUb9v8A
ZardVFw/aW0eZP8A7Wq3QEREBERAREQZi+UxeU+4qeoEXymLyn3FT0BERARE
QEREBERAVcOyf57veVYquHZP893vKDKIiAiIgLTVRumo5ombXPjc0eUrcmEH
P22uulFbKSlk0cri+CBkbi2anIJa3BP9YpPLFy8Gq/11N8VW/wBp9KIKjli5
eDVf66m+KnLFy8Gq/wBdTfFVuiCo5YuPg1X+upvirTTaRVdUZeA0dr3cBKYp
P6WnGHjBI/rFeqpsBOvddp2XCTG3xNQY5YuPg1cPXU/xU5YuXg1X+upviq3R
BUcsXLwar/XU3xU5YuXg1X+upviq3RBTW1tbUX6quFTb5qKN9LDCxsr2Oc4t
dI4nrHO7TgrlMIgIiIP/0fqyIiAt9F2Enn/oFoW+i7CTz/0CCSiIgIiICjVv
Yx+f+hUlRq3sY/P/AEKDQiIgIiICIiAiIg56gmuds41ByFV1DX1c8rJYpoNV
zXPc4bHSA7vEpXLFy8Gq/wBdTfFVvjtIgqOWLl4NV/rqb4qcsXLwar/XU3xV
bogqOV7j4NV/rqb4q0s0iq5KyajZo7XmaFjXPbwtP1rXZ1f/ADP8DvQr1VNI
T1W3TadlJS427uumQY5YuPg1cPXU/wAVOWLl4NV/rqb4qt0QVHLFy8Gq/wBd
TfFTli5eDVf66m+KrdEFE11wuF+oKiSz1NHDTRy675pInDLg0AYY9x/gr1Mf
b5dqICIiAiIgIiIMxfKYvKfcVPUCL5TF5T7ip6AiIgIiICIiAiIgKuHZP893
vKsVXDsn+e73lBlERAREQFjOzJ3DaT9iyo9eP+XVJ/8ASefJsKDTy5adn/NK
Pbu/4hnSnLdp76UXtDelRrHb6F1gtxdRU5LqWIkmJpydQeJTuTaD6FT+qCDV
y3ae+lF7Q3pTlu099KL2hvStvJtB9Cp/VBOTaH6FT+qCDVy3ae+lF7Q3pVVY
rxbGPuetcaRutXvIzO3aCG7d6uuTaD6FT+qavJobcHhhpKbWO3Go3JQeOW7T
30ovaG9Kct2nvpRe0N6VtFut5JAo6bLdhAjGw9rtJybQfQqf1QQauW7T30ov
aG9Kct2nvpRe0N6Vt5NoPoVP6oJybQfQqf1QQeqaupKzW4rVQz6mNbg5GvLc
7s4Jx21vVLSQQwaX1rIYWRNNBA4tY0NGTJMM7PsV0gIiICIiAt9F2Enn/oFo
W+i7CTz/ANAgkoiICIiAo1b2Mfn/AKFSVGrexj8/9Cg0IiIP/9L6siIgIiIC
IiCHJeLZFI6OS40jHsOHNdO0EHtg7di88t2nvpRe0N6VAsNHSzU9Y+Wmikdy
hVZc9gJP9K5WnJtB9Cp/VBBq5btPfSi9ob0py3ae+lF7Q3pW3k2g+hU/qgnJ
tB9Cp/VBBq5btPfSi9ob0qqpbxbBpVcnm40ga6lpg08O3BIdLkb+1kelXXJ1
B2qOn9WOheXUNua8MNJTBztgHBtyT20Hjlu099KL2hvSnLdp76UXtDelbOT7
fkjidNkdrgxnxbMdtZ5NoPoVP6oINXLdp76UXtDelOW7T30ovaG9K28m0H0K
n9UE5NoPoVP6oIFPcqGrk4KmraeeTGdWKVrzjnwFJVHV0tPBpNaTDBHHlk+d
RgGzVbsV4gIiICIiAiIgzF8pi8p9xU9QIvlMXlPuKnoCIiAiIgIiICIiAq4d
k/z3e8qxVcOyf57veUGUREBERAUev+bqn/Jf7ipCj1/zdU/5L/cg0WH9n7b9
Ui/2BT1AsWywW0f/AGkW/Z/YCnoC11EbpaeSNkhic9hAkbvaT2/KtieNBxXK
l3nbTzV09bb4JNdjuLQa72yRtaMY1TsdIZcHG3VZt24UG1a9dT0VTVwSTXmp
lt9RBV8CSTDqQmTDwMNGybLc/wBr/Ft7e4WqhugYK2nbNwedUkkEZGCMjbg4
GR2+2pTGNjY2ONoa1oAa1owB2tiCn0dpOJVF5iaJdU3DWY6RxcX5hiycnbgu
1v44wrpYWUBERBUQ/tjWfu+n/MmVuqiH9sawjaOT6fb2v6yZW6AiIgIiIC30
XYSef+gWhb6LsJPP/QIJKIiAiIgKNW9jH5/6FSVGrexj8/8AQoNCIiAiIgIi
ICIiCo0c+SVn7wqvzXK3VRo58krP3hVfnOVugIiIOMmr7w0iKoqKuClpqhtJ
PURx5e5uHvMgAB3gQgkA9k7mVSHPuFtrJK5lRXVk1M+G1Ty0xLmytnnDTsbh
jhiInOOxH91fQK630lygENZCJWB+u3aQWu5wRtBwTtG3atlNTQ0lOynpomxR
RjDWNGwDG0ened+1B//T7y3UnFtK7vI0SkTw07i57i4F2ZQQM7gBq7Bs3K6W
FlAREQVFw/aW0eZP/tardVFw/aS0H/BP6NVu1W6AiIgIiICIiDMXymLyn3FT
1Ai+UxeU+4qegIiICIiAiIgIiICrh2T/AD3e8qxVcOyf57veUGUREBERAWHN
DmlrhkHeCsp70FT1JaNeD1r27/8Ago/+lOpLRrwetfscfQrbKZQVPUlo14PW
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
TrtyBjtEKAzTCzyVcsTKyJ0cUIldMDlu12qAO2c9rG/tLbbbEKBtQx9TJUMm
gih1n9nhjNXJPbJ35VJLoPWVMcLai6QvNLBFDTalO6MYYcjXw/JyNh1S3xYQ
dHDfLdPEZYquN7AWDIO4ucWNHlLgW45wRvWil0ltlSaWPjkInqYWytjDs4Dm
6/ZYx2O0dsgZUCi0RFLUW6YzxjiznuqI4oiGVDi5zmdk4nrHOJGSckrRQaH1
VDb+TBc4zQyxRsqWinHCOcyFsWWuJIaCGB20E79qD//T+sUF4oLo17qGqjnE
eNbVO7O4+Q9o7jhTlz+jejj7EZnzTwzSPYyMPYx7TqtzjOu923ad2B4l0CAi
IgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAue0go6ioq43
QwvkaI8EtHjXQrGEHFcmV30SX7pUZ7HRvLHtLXAkEEbfIu/VRFZAblLV1Ba8
OeXMYMn0oI1htckbxWTEsJGGN3ZHOVvvNvnudhqKNkMDJnv12RueSx2rIHAk
6uzWxt2HGe3hXGFjVCDjqzRavfR6lNHRiSSunnlGuGOLXl2rh+o4jGwEAbQM
Zwtdu0MqKe3Qx1ApH1UctCeGGS4NiijY8a2Adpa/G3brdrJXa6o8azqjy+VB
wNBoVdYgIZOJxU7TEBGH8J1rQ8YDuDa4N64Ya4uxzqZbtEqptTb5a6GjdFT8
HrxBxkHWQPjyAWgdk4FdiGgLOEHzQWeqt9VS2g0MVTOKihfwxjkJibE9pdwb
tTV1dVrj2TcFzhg5Gejvuj1ZcbnUSwMpnx1UEMRllcRJS6j3PLmAA5J1hja3
BaCun1Rs8SFgJyUHz1ui1wvFFVMbDS0LRV1721AcRJPrzPAa8auxpGCTk5Ab
sU+36I1UNRxmeOmbJwdSQ2R4nDJHiJrXbWNB2RuzgDf212YaBuTVHj9KDhbV
ojdKO509dUMpCYqiB/B8OTgNjmjcW4jaG/1jSGhoB1cbN6xR6GXKmoaajcKM
6op5HVQeeEjdHAyLUaNXa0lnZZGx5BBXd6gzlNUZygoLBYHWepa8R08bDbqa
nc2EYy+PX1ju3HWG1dCsaowsoCIiAiIgxq+VNUALKIMY8qxqhekQYwEwFlEG
NUEoQCsogxhMbd5WUQYxsTCyiDGAhGVlEGMYWURAREQEREBERAREQEREH//U
+zIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAi
IgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAi
IgIiICIiAiIgIiIP/9X7MiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIi
AiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIi
AiIgIiICIiAiIgIiICIiAiIgIiIP/9k=

------=_NextPart_000_0167_01C4F3E0.98EBCA70--
