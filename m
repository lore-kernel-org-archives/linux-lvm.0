Message-ID: <3E4295C1.9010802@motorola.com>
From: Tom Georgoulias <tom.georgoulias@motorola.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] cannot create a volume group named the same as one already removed
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
Date: Thu Feb  6 11:05:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

I'm using lvm 1.0.3 that came with my Red Hat 7.3 system, with kernel 
2.4.18-24.7.x.  When I try to create a volume group that has the same 
name as one that existed in the past but was removed, I get an error 
stating that the volume group already exists and to use a different 
name.  What can I do to fix this?

I appreciate any tips.  Most of the command outputs are below to help 
illustrate what I'm seeing/doing.

Tom

[root@mom root]# vgcreate volgrp2 /dev/hdg
vgcreate -- volume group directory or file already exists
vgcreate -- please choose a different name

[root@mom root]# vgremove volgrp2
vgremove -- volume group "volgrp2" doesn't exist

Before I tried recreating this group, I removed all of the LVs from it:

[root@mom root]# df -hl
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda3             9.6G  1.3G  7.8G  15% /
/dev/hda1             144M   17M  120M  12% /boot
none                  503M     0  503M   0% /dev/shm
/dev/hda2             6.4G   33M  6.0G   1% /usr/local
/dev/hda6            1011M  273M  687M  29% /var
/dev/volgrp1/lvol1     36G   32G  1.9G  95% /volumes/v01
/dev/volgrp1/lvol2     36G   29G  5.2G  85% /volumes/v02
/dev/volgrp1/lvol3     36G   25G  9.4G  73% /volumes/v03
/dev/volgrp2/lvol1     36G   31G  3.0G  92% /volumes/v10
/dev/volgrp2/lvol2     36G   18G   16G  51% /volumes/v11
/dev/volgrp2/lvol3     36G  915M   32G   3% /volumes/v12
/dev/volgrp3/lvol1     36G  2.5G   31G   8% /volumes/v20
/dev/volgrp3/lvol2    1.9G  208M  1.6G  12% /volumes/v21
[root@mom /]# umount /volumes/v10
[root@mom /]# umount /volumes/v11
[root@mom /]# umount /volumes/v12
[root@mom /]# lvremove /dev/volgrp2/lvol1
lvremove -- do you really want to remove "/dev/volgrp2/lvol1"? [y/n]: y
lvremove -- doing automatic backup of volume group "volgrp2"
lvremove -- logical volume "/dev/volgrp2/lvol1" successfully removed

[root@mom /]# lvremove /dev/volgrp2/lvol2
lvremove -- do you really want to remove "/dev/volgrp2/lvol2"? [y/n]: y
lvremove -- doing automatic backup of volume group "volgrp2"
lvremove -- logical volume "/dev/volgrp2/lvol2" successfully removed

[root@mom /]# lvremove /dev/volgrp2/lvol3
lvremove -- do you really want to remove "/dev/volgrp2/lvol3"? [y/n]: y
lvremove -- doing automatic backup of volume group "volgrp2"
lvremove -- logical volume "/dev/volgrp2/lvol3" successfully removed

The new disk was been initialized:
[root@mom root]# pvdisplay /dev/hdg
pvdisplay -- "/dev/hdg" is a new physical volume of 114.50 GB

And volgrp2 isn't active:
[root@mom root]# vgdisplay
--- Volume group ---
VG Name               volgrp1
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               3
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               114.49 GB
PE Size               4 MB
Total PE              29310
Alloc PE / Size       27786 / 108.54 GB
Free  PE / Size       1524 / 5.95 GB
VG UUID               5sIM7c-KUYL-O1fc-wjdX-A8fj-v7RG-Fj4ssE

--- Volume group ---
VG Name               volgrp3
VG Access             read/write
VG Status             available/resizable
VG #                  2
MAX LV                256
Cur LV                3
Open LV               3
MAX LV Size           255.99 GB
Max PV                256
Cur PV                1
Act PV                1
VG Size               114.49 GB
PE Size               4 MB
Total PE              29310
Alloc PE / Size       18750 / 73.24 GB
Free  PE / Size       10560 / 41.25 GB
VG UUID               kIC7Td-UXGl-oJSx-AXRV-YzHE-DYFN-CBVCFb
