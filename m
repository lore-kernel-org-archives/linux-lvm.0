From: Lewis Bergman <lbergman@abi.tconline.net>
Subject: Re: [linux-lvm] Re: HELP changing md-device's partition-type to LVM(or may be LV's partition id)
Date: Fri, 31 Aug 2001 08:23:43 -0500
References: <3B8E3F0E.8050609@st-peter.stw.uni-erlangen.de> <3B8EC633.40202@st-peter.stw.uni-erlangen.de> <3B8F4C57.1080405@st-peter.stw.uni-erlangen.de>
In-Reply-To: <3B8F4C57.1080405@st-peter.stw.uni-erlangen.de>
MIME-Version: 1.0
Message-Id: <01083108234302.03926@lewis.abi.tconline.net>
Content-Transfer-Encoding: 8bit
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

I had a hard time following this thread but it sounds similiar to what I am 
doing.
I have 2 SCSI disks on an AIC7899 controller channel's A and B. They are 
partioned like so.
   Device Boot    Start       End    Blocks   Id  System
/dev/sda1   *         1         8     64228+  fd  Linux raid autodetect
/dev/sda2             9       136   1028160   fd  Linux raid autodetect
/dev/sda3           137       201    522112+  fd  Linux raid autodetect
/dev/sda4           202      2247  16434495   fd  Linux raid autodetect

   Device Boot    Start       End    Blocks   Id  System
/dev/sdb1   *         1         8     64228+  fd  Linux raid autodetect
/dev/sdb2             9       136   1028160   fd  Linux raid autodetect
/dev/sdb3           137       201    522112+  fd  Linux raid autodetect
/dev/sdb4           202      2247  16434495   fd  Linux raid autodetect

The md's look like this:
[root@portal /etc]# cat raidtab
raiddev             /dev/md0
raid-level                  1
nr-raid-disks               2
chunk-size                  64k
persistent-superblock       1
#nr-spare-disks     0
    device          /dev/sda1
    raid-disk     0
    device          /dev/sdb1
    raid-disk     1
raiddev             /dev/md1
raid-level                  1
nr-raid-disks               2
chunk-size                  64k
persistent-superblock       1
#nr-spare-disks     0
    device          /dev/sda2
    raid-disk     0
    device          /dev/sdb2
    raid-disk     1
raiddev             /dev/md2
raid-level                  1
nr-raid-disks               2
chunk-size                  64k
persistent-superblock       1
#nr-spare-disks     0
    device          /dev/sda3
    raid-disk     0
    device          /dev/sdb3
    raid-disk     1
raiddev             /dev/md3
raid-level                  1
nr-raid-disks               2
chunk-size                  64k
persistent-superblock       1
#nr-spare-disks     0
    device          /dev/sda4
    raid-disk     0
    device          /dev/sdb4
    raid-disk     1

On top of these I built some ext2, and LVM's on which I placed reiserfs's.
Finally, the lvm stuff look like this:
[root@portal /etc]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/md3" of VG "mainlvm" [15.67 GB / 4.18 GB free]
pvscan -- total: 1 [15.67 GB] / in use: 1 [15.67 GB] / in no VG: 0 [0]
 
[root@portal /etc]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "mainlvm"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group
 
[root@portal /etc]# lvscan
lvscan -- ACTIVE            "/dev/mainlvm/home" [500.00 MB]
lvscan -- ACTIVE            "/dev/mainlvm/usr" [3.00 GB]
lvscan -- ACTIVE            "/dev/mainlvm/usrlocal" [5.00 GB]
lvscan -- ACTIVE            "/dev/mainlvm/var" [3.00 GB]
lvscan -- 4 logical volumes with 11.49 GB total in 1 volume group
lvscan -- 4 active logical volumes

I have no idea if this is the right way to do it or not. I get no segfaults 
and have not noticed any fs corruption. I think software raid pretty much 
stinks but sometimes you have to go with what you have, not what you wished 
you had.

Sorry if this was a waste of your time.
-- 
Lewis Bergman
Texas Communications
4309 Maple St.
Abilene, TX 79602-8044
915-695-6962
