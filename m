From: Eike Bernhardt <eike@unorganized.net>
Message-Id: <20020406160419.GA8506@unorganized.homeip.net>
References: <20020405172933.GA71085@unorganized.homeip.net>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="a8Wt8u1KmwUX3Y2C"
Content-Disposition: inline
In-Reply-To: <20020405172933.GA71085@unorganized.homeip.net>
Subject: [linux-lvm] Re: Known Issues with FreeBSD Slices on Disks?
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
Date: Sat Apr  6 10:03:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello!

On Fri Apr  5 19:29:33 2002 CEST Eike Bernhardt wrote:

> lvcreate -- ERROR "Operation not permitted" opening logical volume
> "/dev/pile/test"
> 
> (Attached is a Logfile which shows this in Context, and more Info)

*arg* OK, so this time with the Log attached ...

Bye, Eike
-- 
Eike Bernhardt              http://unorganized.net/                ICQ: 11256658
     "PEOPLE'S WHOLE LIVES DO PASS IN FRONT OF THEIR EYES BEFORE THEY DIE.
THE PROCESS IS CALLED 'LIVING'."  Death -- (Terry Pratchett, The Last Continent

--a8Wt8u1KmwUX3Y2C
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvmlog.txt"

root@teefax:~ # fdisk -l /dev/hda

Disk /dev/hda: 255 heads, 63 sectors, 7297 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot    Start       End    Blocks   Id  System
/dev/hda1   *         1       765   6144831    b  Win95 FAT32
/dev/hda2           766      2040  10241437+  a5  FreeBSD
/dev/hda3          2041      3315  10241437+   c  Win95 FAT32 (LBA)
/dev/hda4          3316      7297  31985415   8e  Linux LVM
root@teefax:~ # pvcreate -v /dev/hda4
pvcreate -- locking logical volume manager
pvcreate -- checking physical volume name "/dev/hda4"
pvcreate -- getting physical volume size
pvcreate -- checking maximum physical volume size
pvcreate -- checking partition type
pvcreate -- checking volume group name
pvcreate -- creating new physical volume
pvcreate -- setting up physical volume for /dev/hda4 with 63970830 sectors
pvcreate -- writing physical volume data to disk "/dev/hda4"
pvcreate -- physical volume "/dev/hda4" successfully created
pvcreate -- unlocking logical volume manager

root@teefax:~ # vgdisplay pile
--- Volume group ---
VG Name               pile 
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           255.99 GB
Max PV                256
Cur PV                2
Act PV                2
VG Size               85.52 GB
PE Size               4 MB
Total PE              21892
Alloc PE / Size       21892 / 85.52 GB
Free  PE / Size       0 / 0
VG UUID               7F14se-04WD-dxtR-gHMd-PpLz-oGqw-Ceh56p

root@teefax:~ # vgextend pile /dev/hda4
vgextend -- INFO: maximum logical volume size is 255.99 Gigabyte
vgextend -- creating archive of volume group "pile" in "/etc/lvmconf"
vgextend -- volume group "pile" successfully extended

root@teefax:~ # vgdisplay pile
Max PV                256
Cur PV                3
Act PV                3
VG Size               116.01 GB
PE Size               4 MB
Total PE              29699
Alloc PE / Size       21892 / 85.52 GB
Free  PE / Size       7807 / 30.50 GB
VG UUID               7F14se-04WD-dxtR-gHMd-PpLz-oGqw-Ceh56p


root@teefax:~ # lvcreate -v -n test -L 100 pile
--- Volume group ---
VG Name               pile 
VG Access             read/write
VG Status             available/resizable
VG #                  1
MAX LV                256
Cur LV                1
Open LV               1
MAX LV Size           255.99 GBlvcreate -- checking volume group name "pile"
lvcreate -- reading volume group data of volume group "pile" from disk(s)
lvcreate -- checking volume group activity
lvcreate -- checking logical volume path "/dev/pile/test"
lvcreate -- checking stripe count
lvcreate -- checking stripe size
lvcreate -- locking logical volume manager
lvcreate -- getting volume group status from VGDA in kernel
lvcreate -- checking stripe size against volume group physical extent size
lvcreate -- checking logical volume maximum size
lvcreate -- checking volume group free space
lvcreate -- checking stripe count against physical volume count
lvcreate -- checking for maximum logical volume count
lvcreate -- setting up logical volume
lvcreate -- setting read ahead sectors
lvcreate -- creating logical volume VGDA in kernel
lvcreate -- storing logical volume VGDA on disk(s)
lvcreate -- creating device special file
lvcreate -- opening logical volume "/dev/pile/test" for init
lvcreate -- ERROR "Operation not permitted" opening logical volume "/dev/pile/test"
root@teefax:~ # 

--a8Wt8u1KmwUX3Y2C--
