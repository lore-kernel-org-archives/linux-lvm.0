Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0F2cOO05390
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2005 21:38:24 -0500
Received: from e-liberty.pl (yh226.internetdsl.tpnet.pl [80.55.241.226])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0F2cMF9003294
	for <linux-lvm@redhat.com>; Fri, 14 Jan 2005 21:38:23 -0500
Received: from PIW (mizzar.multicon.pl [81.219.100.2])
	by e-liberty.pl (Postfix) with ESMTP id 9659D497DC
	for <linux-lvm@redhat.com>; Sat, 15 Jan 2005 05:02:56 +0100 (CET)
Date: Sat, 15 Jan 2005 03:38:04 +0100
From: Piw <piw@e-liberty.pl>
Message-ID: <415694421.20050115033804@e-liberty.pl>
Subject: Re: [linux-lvm] understanding large LVM volumes
In-Reply-To: <1266458715.20050114224006@free.fr>
References: <41E80382.1000403@svs.gsfc.nasa.gov>
	<1266458715.20050114224006@free.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

NiHao Stephane,

>> How does the Physical Extent size affect the maximum VG size?
>> How does one go about chosing a PE size for a VG?

> The PE Size does not affect VG size, but it's affect the maximum
> size of a logical volume.

> extract of the vgcreate man page :

> --
> To limit kernel memory usage, there is a limit of 65536 physical
> extents (PE) per logical volume,  so
>        the  PE  size determines the maximum logical volume size. 
> The default PE size of 4MB limits a single
>        logical volume to 256GB (see the -s option to raise that
> limit).  There is also (as of Linux  2.4)  a
>        kernel limitation of 2TB per block device.
> --

> So, to limit the size of the mapping between the physical extend (PE)
> and the real physical location of the data, gods say that you can't
> use more than 65536 PE for a logical volume.

and...

> So if you want to make logicals volumes as big a 1TB each, you need to
> change the size of the PE to, at least : 1024*1024 MB /65536 = 16 MB
> Of course, stick to the limit so much seems not really secure, so
> I advive you to choose at least 32 MB for the PE size in this case
> (or even more). I read that the maximum size for the physical extend
> is 16 GB, so choosing a big value here (128 MB ?) is not a problem.

Those limits (65536 LE per LV) does not apply to LVM 2 and 2.6 kernel.
Your LV can have MUCH more LE (I dont know if there is even reachable
limit  for  this).  One  and only feedback (if you can notice this) is
that  userspace  programs for managing LVM works _little_ slower, when
there is enormous number od LE to administrate.
I tested it with 4GB LV on 16MB LE (but I didnt see difference)

> Also note that with a 32 bit kernel, you have a limit of 2TB per
> logical volume, I don't know if this limit disappear with a 64 bit
> kernel.

About kerenel. Limit od 2GB per block device is also an antique.
You  can  easly  "bypass" this limit by setting (in make menuconfig)
Devices Drivers->Block Devices->Support for Large Block Devices.

> But think hard about it....
> Are you sure you can't "logicaly" split it ? and that the 10 TB of
> data will concern the same software or pool of user and so on ?
> Are you sure you will not have to move only a part of the data one day ?
> (add a new server and need to export some of the data to import it
> to the new server ?)
> Also think about how you will (if you need) backup the whole thing...

When  I  create  logical structure of my LVM diskspace, I always think
about those things:

1) Never assign ALL your disks at once between VGs.
You can ALWAYS add disk later to vg, according to your needs. Removing
involves  pvmove,  whitch is more stressing then vgextend. (of course,
if  U  have  more, then 5-6 disks). And almost all filesystems support
extending of FS, but not all like shrinking.

2) Never create BIG vg, unless they are base on raid disks.
Damage of one disk whitch is not in RAID, damages VG (of course, U
can  recreate  structure of vg by clonig PV ID, but filesystems will be
damaged - mabye in more then one LV.)

3) Always try to have some space left in vg.
It helps you extend LV when needed, and create snapshots of LV.
Generaly,  when  you  have  lower then 20% (of biggest LV in VG) free
space  in VG, think about extendig VG. If you have no spare PVs, think
about  buying  some  disks. In there is no room for disks, thing about
another disks enclosure. If no.... etc. etc.

> Well, again, all this post is just guessing and a quick look
> at the man page, so you should wait for a answer from someone
> who really know it anyway :o)

Unfortunatly man pages R not 100% compilant with latest of LVM.
Buy hey, they are not right about limits, so we should be happy ;]

--
Piw
Jabb with me at piwATe-liberty.pl M0r3 1nf0 4t http://www.jabberpl.org/
