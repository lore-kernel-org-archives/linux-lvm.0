Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6MJOqa22322
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 15:24:52 -0400
Received: from ms-smtp-02-eri0.southeast.rr.com
	(ms-smtp-02-lbl.southeast.rr.com [24.25.9.101])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i6MJOpe1016974
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 15:24:51 -0400
Received: from ZACK2 (rdu163-116-062.nc.rr.com [24.163.116.62])
	by ms-smtp-02-eri0.southeast.rr.com (8.12.10/8.12.7) with ESMTP id
	i6MJOlNs019833
	for <linux-lvm@redhat.com>; Thu, 22 Jul 2004 15:24:49 -0400 (EDT)
Message-ID: <001001c47021$9accc800$6b02a8c0@ZACK2>
From: "Zachary Hamm" <zhamm@nc.rr.com>
References: <001701c46ff1$cdcecc60$6b02a8c0@ZACK2>
	<20040722153408.GG10840@tykepenguin.com>
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2
Date: Thu, 22 Jul 2004 15:25:09 -0400
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

Thanks for the tip.  But "md_component_detection = 1" is already set in my
lvm.conf file.   Any other tips?  Perhaps also linked to sometimes getting
an "out of memory" message when running the user tools?

-----------------------------------
commands/toolcontext.c:139   Logging initialised at Wed Jul 21 13:48:44 2004

commands/toolcontext.c:158   Set umask to 0077
vgscan.c:51 vgscan  Wiping cache of LVM-capable devices
vgscan.c:54 vgscan  Wiping internal cache
vgscan.c:57 vgscan  Reading all physical volumes.  This may take a while...
toollib.c:414 vgscan  Finding all volume groups
toollib.c:330 vgscan  Finding volume group "vg00"
mm/pool-fast.c:224 vgscan  Out of memory.  Requested 3191341076 bytes.
format1/disk-rep.c:364 vgscan  Failed to read extents from /dev/sdb
mm/pool-fast.c:224 vgscan  Out of memory.  Requested 3191341076 bytes.
format1/disk-rep.c:364 vgscan  Failed to read extents from /dev/sdb
mm/pool-fast.c:224 vgscan  Out of memory.  Requested 3191341076 bytes.
format1/disk-rep.c:364 vgscan  Failed to read extents from /dev/sdc
vgscan.c:22 vgscan  Volume group "vg00" not found
toollib.c:330 vgscan  Finding volume group "rootvg"
vgscan.c:37 vgscan  Found volume group "rootvg" using metadata type lvm2
-------------------------------

The partition scheme on all three drives are the same:
--------------------------------------------------
# fdisk -l /dev/sda
Disk /dev/sda: 36.4 GB, 36420075008 bytes
255 heads, 63 sectors/track, 4427 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes
Device Boot      Start         End      Blocks   Id  System
/dev/sda1   *           1          13      104391   fd  Linux raid
autodetect
/dev/sda2              14         144     1052257+  82  Linux swap
/dev/sda3             145        4427    34403197+  fd  Linux raid
autodetect
--------------------------------------------------------------




----- Original Message ----- 
From: "Patrick Caulfield" <pcaulfie@redhat.com>
To: "LVM general discussion and development" <linux-lvm@redhat.com>
Sent: Thursday, July 22, 2004 11:34 AM
Subject: Re: [linux-lvm] LVM2 and RAID 1 not working on Fedora Core 2


> On Thu, Jul 22, 2004 at 09:42:58AM -0400, Zachary Hamm wrote:
> >
> > Hello, I'm running Fedora Core 2 on a Dell Poweredge 1750 with three 36G
> > SCSI drives setup with two volumes, /boot and /, setup with software
RAID 1
> > with online spare.  This was setup at install, which reported no errors.
> > I've done a yum update as well.
> >
> > The problem is that only one of the to volume groups is recognized and
> > mirrored (/boot), as apparently vgscan does not like the the large
drives
> > (which aren't that large...).   Any help is appreciated.
> >
>
> It looks to me like you need to stop LVM looking at the "real" disks, and
make
> it only look at the MD devices.
>
> Either add a filter like "a/md*/" or add "md_component_detection = 1" to
the
> devices section of the lvm.conf file - if you're running a recent lvm2
> userspace.
>
> -- 
>
> patrick
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
