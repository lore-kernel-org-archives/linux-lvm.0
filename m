From: ej_external@bigfoot.com
Message-ID: <HMEIJJCJJMDMOBLPBABOMEHDCDAA.ej_external@bigfoot.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm oddities seen
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
Date: Wed Nov  6 13:53:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Can anyone explain this for me?  I added a new hard drive to my LVM and
while lvdisplay of the LVM shows the full size of all disks/partitions in
the LVM, df -k does not:

[root@bergamo sbin]# lvscan
lvscan -- ACTIVE            "/dev/lvm01/1" [176.76 GB]
lvscan -- 1 logical volumes with 176.76 GB total in 1 volume group
lvscan -- 1 active logical volumes

[root@bergamo sbin]# lvdisplay /dev/lvm01/1
--- Logical volume ---
LV Name                /dev/lvm01/1
VG Name                lvm01
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                176.76 GB
Current LE             45251
Allocated LE           45251
Allocation             next free
Read ahead sectors     120
Block device           58:0



[root@bergamo sbin]# df -k
Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/hda6             10317796   3808332   5985348  39% /
/dev/hda1                62193     17850     41132  31% /boot
none                     95628         0     95628   0% /dev/shm
/dev/lvm01/1         115382824  63615676  47078212  58% /mnt/lvm01.01


So while lvm shows the lvm size to be 176.76G, df -k shows the filesystem to
be about 115G.  What is happening with this?



Another issue that I seem to be having is that the new PV that I created
from /dev/hdd shows only 8G free from pvscan/pvdisplay:

[root@bergamo sbin]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hdd"  of VG "lvm01" [111.79 GB / 8 MB free]
pvscan -- ACTIVE   PV "/dev/hda5" of VG "lvm01" [26.82 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb1" of VG "lvm01" [38.16 GB / 0 free]
pvscan -- total: 3 [176.78 GB] / in use: 3 [176.78 GB] / in no VG: 0 [0]

[root@bergamo sbin]# pvdisplay /dev/hdd
--- Physical volume ---
PV Name               /dev/hdd
VG Name               lvm01
PV Size               111.79 GB [234441648 secs] / NOT usable 4.25 MB [LVM:
235 KB]
PV#                   3
PV Status             available
Allocatable           yes
Cur LV                1
PE Size (KByte)       4096
Total PE              28617
Free PE               2
Allocated PE          28615
PV UUID               wF1oDQ-XM4S-GfAV-xoir-l5m5-9HZC-QECX9g


[root@bergamo sbin]#



Obviously I'm doing something wrong here - but I can't figure it out.

Does anyone have any suggestions?  At this point, I'd be willing to yank
/dev/hdd out of the volume group, but I can't find out how to do that
either.

Thanks, Ed Jackson
