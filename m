Subject: Re: [linux-lvm] How to migrate data from one Hard Drive to a new
	one
From: Luca Da Col <luca.dacol@tiscali.it>
In-Reply-To: <3F51BF42.6070403@silicide.dk>
References: <1062272914.11039.103.camel@candido>
	 <3F51BF42.6070403@silicide.dk>
Content-Type: multipart/mixed; boundary="=-9X7mM/yFZZpJICzvoI8l"
Message-Id: <1062451252.2391.28.camel@candido>
Mime-Version: 1.0
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
Date: Mon Sep  1 17:04:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-9X7mM/yFZZpJICzvoI8l
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hello LVM mailing list, 

thank you very much for your reply. I could be able to upgrade to a new
120G HD. My second goal was to create 2 new partitions and extend my
/home directory: 

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1        13    104391   83  Linux
/dev/hda2            14        77    514080   8e  Linux LVM
/dev/hda3            78       784   5678977+  8e  Linux LVM

New partitions: 

/dev/hda4           785     14593 110920792+   5  Extended
/dev/hda5           785     13500 102141238+  8e  Linux LVM
/dev/hda6         13501     14593   8779491   86  NTFS volume set


Filesystem           1K-blocks      Used Available Use% Mounted on
/dev/Volume00/LogVol00
                       6047492   4196432   1543860  74% /
/dev/hda1               101089     27212     68658  29% /boot
/dev/Volume00/LogVol02
                      28759040  24646092   2652112  91% /home
none                    386184         0    386184   0% /dev/shm

I then performed: 

1) pvcreate /dev/hda5
2) vgextend Volume00 /dev/hda5
3) lvextend  --size +97.4g /dev/Volume00/LogVol02 /dev/hda5

but my /home is still 28G

I was wondering if it's a  file system issue, because /dev/hda5 has not
been formatted and mke2fs. By the way, I cannot make2fs
/dev/Volume00/LogVol02 because I would destroy all my /home. 

Any idea? 

Thanks 
Rgds,

Luca




On Sun, 2003-08-31 at 11:26, Jon Bendtsen wrote:
> Luca Da Col wrote:
> 
> [cut]
> 
> > I finally decided to upgrade my old 6.5G HD to a new 120G HD; is the procedure described in
> > http://www.tldp.org/HOWTO/LVM-HOWTO/removeadisk.html  a safe way to migrate all my data 
> > from the former to the 120G? I mean, my case is slightly different from the one described 
> > because of /boot partition and LILO in the MBR...
> 
> yes, but if you are worried, you can do it like this:
> mount the new "partition" (real or LV) to /mnt
> cd /the_source, eg. /usr /var /home ...
> find -xdev | cpio -pm /mnt
> umount /mnt
> repeat for the next source.
> 
> The process is described in the software raid howto.
> Remember to edit the new /etc/fstab and new /etc/lilo.conf,
> and run lilo with lilo -r /mnt
> 
> 
> 
> JonB
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Luca Da Col <luca.dacol@tiscali.it>

--=-9X7mM/yFZZpJICzvoI8l
Content-Disposition: attachment; filename=lvm
Content-Type: text/plain; name=lvm; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

[root@candido lvmgui-0.4]# vgdisplay -v
--- Volume group ---
VG Name               Volume00
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                256
Cur LV                3
Open LV               3
MAX LV Size           255.99 GB
Max PV                256
Cur PV                5
Act PV                5
VG Size               131.63 GB
PE Size               4 MB
Total PE              33697
Alloc PE / Size       33693 / 131.61 GB
Free  PE / Size       4 / 16 MB
VG UUID               iS2cXG-EbA3-PfjC-MFLO-39iZ-fhkz-Id9jMF

--- Logical volume ---
LV Name                /dev/Volume00/LogVol00
VG Name                Volume00
LV Write Access        read/write
LV Status              available
LV #                   1
# open                 1
LV Size                5.86 GB
Current LE             1500
Allocated LE           1500
Allocation             next free
Read ahead sectors     1024
Block device           58:0

--- Logical volume ---
LV Name                /dev/Volume00/LogVol02
VG Name                Volume00
LV Write Access        read/write
LV Status              available
LV #                   2
# open                 1
LV Size                125.27 GB
Current LE             32068
Allocated LE           32068
Allocation             next free
Read ahead sectors     1024
Block device           58:1

--- Logical volume ---
LV Name                /dev/Volume00/LogVol01
VG Name                Volume00
LV Write Access        read/write
LV Status              available
LV #                   3
# open                 1
LV Size                500 MB
Current LE             125
Allocated LE           125
Allocation             next free
Read ahead sectors     1024
Block device           58:2


--- Physical volumes ---
PV Name (#)           /dev/hda2 (1)
PV Status             available / allocatable
Total PE / Free PE    124 / 0

PV Name (#)           /dev/hda3 (2)
PV Status             available / allocatable
Total PE / Free PE    1385 / 0

PV Name (#)           /dev/hda5 (5)
PV Status             available / allocatable
Total PE / Free PE    24935 / 0

PV Name (#)           /dev/hdb1 (3)
PV Status             available / allocatable
Total PE / Free PE    4999 / 0

PV Name (#)           /dev/hdb2 (4)
PV Status             available / allocatable
Total PE / Free PE    2254 / 4


[root@candido lvmgui-0.4]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/hda2" of VG "Volume00" [496 MB / 0 free]
pvscan -- ACTIVE   PV "/dev/hda3" of VG "Volume00" [5.41 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hda5" of VG "Volume00" [97.40 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb1" of VG "Volume00" [19.53 GB / 0 free]
pvscan -- ACTIVE   PV "/dev/hdb2" of VG "Volume00" [8.80 GB / 16 MB free]
pvscan -- total: 5 [131.66 GB] / in use: 5 [131.66 GB] / in no VG: 0 [0]


lvextend -- rounding relative size up to physical extent boundary
lvextend -- extending logical volume "/dev/Volume00/LogVol02" to 125.27 GB
lvextend -- doing automatic backup of volume group "Volume00"
lvextend -- logical volume "/dev/Volume00/LogVol02" successfully extended

--=-9X7mM/yFZZpJICzvoI8l--
