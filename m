Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6RNWta11257
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 19:32:55 -0400
Received: from ms-smtp-04-eri0.southeast.rr.com
	(ms-smtp-04-lbl.southeast.rr.com [24.25.9.103])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6RNWnXn008150
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 19:32:49 -0400
Received: from ZACK2 (rdu163-116-062.nc.rr.com [24.163.116.62])
	by ms-smtp-04-eri0.southeast.rr.com (8.12.10/8.12.7) with ESMTP id
	i6RNWjVw001370
	for <linux-lvm@redhat.com>; Tue, 27 Jul 2004 19:32:47 -0400 (EDT)
Message-ID: <001e01c47432$0ec64c40$6b02a8c0@ZACK2>
From: "Zachary Hamm" <zhamm@nc.rr.com>
References: <001701c46ff1$cdcecc60$6b02a8c0@ZACK2>
	<20040722153408.GG10840@tykepenguin.com>
	<001001c47021$9accc800$6b02a8c0@ZACK2>
	<20040723065607.GB9681@tykepenguin.com>
	<003701c47363$bb61ec90$6b02a8c0@ZACK2>
	<20040727071817.GA14648@tykepenguin.com>
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2
Date: Tue, 27 Jul 2004 19:33:00 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Ahh.  Okay, here's my config files:

/etc/raidtab:
----------------------------------
raiddev             /dev/md1
raid-level                  1
nr-raid-disks               2
chunk-size                  256
persistent-superblock       1
nr-spare-disks              1
    device          /dev/sda3
    raid-disk     0
    device          /dev/sdb3
    raid-disk     1
    device          /dev/sdc3
    spare-disk     0
raiddev             /dev/md0
raid-level                  1
nr-raid-disks               2
chunk-size                  256
persistent-superblock       1
nr-spare-disks              1
    device          /dev/sda1
    raid-disk     0
    device          /dev/sdb1
    raid-disk     1
    device          /dev/sdc1
    spare-disk     0
----------------------------------

/etc/fstab:
------------------------------------
/dev/rootvg/LogVol00    /                       ext3    defaults        1 1
/dev/md0                /boot                   ext3    defaults        1 2
none                    /dev/pts                devpts  gid=5,mode=620  0 0
none                    /dev/shm                tmpfs   defaults        0 0
none                    /proc                   proc    defaults        0 0
none                    /sys                    sysfs   defaults        0 0
/dev/sdc2               swap                    swap    defaults        0 0
/dev/sdb2               swap                    swap    defaults        0 0
/dev/sda2               swap                    swap    defaults        0 0
/dev/cdrom              /mnt/cdrom              udf,iso9660
noauto,owner,kudzu,ro 0 0
/dev/fd0                /mnt/floppy             auto    noauto,owner,kudzu 0
0
----------------------------------------------------------------------------
-

vgscan says:
--------------------------------------------------
Logging initialised at Tue Jul 27 19:32:00 2004

Set umask to 0077
vgscan    Wiping cache of LVM-capable devices
vgscan    Wiping internal cache
vgscan  Reading all physical volumes.  This may take a while...
vgscan    Finding all volume groups
vgscan    Finding volume group "vg00"
vgscan  Read size too large: 3191341056
vgscan  Failed to read extents from /dev/sdb
vgscan  Read size too large: 3191341056
vgscan  Failed to read extents from /dev/sdb
vgscan  Read size too large: 3191341056
vgscan  Failed to read extents from /dev/sdc
vgscan  Volume group "vg00" not found
vgscan    Finding volume group "rootvg"
vgscan  Found volume group "rootvg" using metadata type lvm2
----------------------------------------------------------------




Anything else I should be posting?  BTW, are you here in Raleigh?

Thanks!

Zack






----- Original Message ----- 
From: "Patrick Caulfield" <pcaulfie@redhat.com>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Tuesday, July 27, 2004 3:18 AM
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2


> On Mon, Jul 26, 2004 at 06:56:04PM -0400, Zachary Hamm wrote:
> >
> > Changed the filter directed as suggested, no joy.  I still get the same
> > errors.  Any other suggestions, or should I post more config
information?
> > There has to be something I'm missing.
> >
>
> Can you tell me which drives are making up the MD devices and which (if
any)
> are to be used by LVM directly?
>
> Its possible that it's just the filter that needs more work. maybe
something
> like:
>
>   filter = [ "a/md.*/", "r/.*/" ]
> -- 
>
> patrick
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
