Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5D4rH007522
	for <linux-lvm@redhat.com>; Sun, 13 Jun 2004 00:53:17 -0400
Received: from pd3mo2so.prod.shaw.ca (shawidc-mo1.cg.shawcable.net
	[24.71.223.10])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5D4rGi5019227
	for <linux-lvm@redhat.com>; Sun, 13 Jun 2004 00:53:16 -0400
Received: from pd4mr6so.prod.shaw.ca (pd4mr6so-qfe3.prod.shaw.ca [10.0.141.69])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0HZ80039UCW5NN@l-daemon> for linux-lvm@redhat.com; Sat,
	12 Jun 2004 22:38:29 -0600 (MDT)
Received: from pn2ml5so.prod.shaw.ca ([10.0.121.149])
	by pd4mr6so.prod.shaw.ca (Sun ONE Messaging Server 6.0 HotFix 1.01
	(built Mar
	15 2004)) with ESMTP id <0HZ800GFOCW11SJ0@pd4mr6so.prod.shaw.ca> for
	linux-lvm@redhat.com; Sat, 12 Jun 2004 22:38:30 -0600 (MDT)
Received: from tyler (S010600485485bc00.cg.shawcable.net [68.146.152.115])
	by l-daemon (iPlanet Messaging Server 5.2 HotFix 1.18 (built Jul 28
	2003))
	with ESMTP id <0HZ80040NCW16I@l-daemon> for linux-lvm@redhat.com; Sat,
	12 Jun 2004 22:38:25 -0600 (MDT)
Date: Sat, 12 Jun 2004 22:38:25 -0600
From: Tyler <tyler@tylercentral.com>
Subject: RE: [linux-lvm] Stripes and PE's
In-reply-to: <40CAAD06.2010106@dgreaves.com>
Message-id: <0HZ80040OCW16I@l-daemon>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

Unfortunately, that didn't work.

cluster6 root # lvcreate -Cn -i4 -I16 -l3560 -nstorage group
  Insufficient allocatable extents suitable for parallel use for logical
volume storage: 3560 required
cluster6 root # lvcreate -i4 -I16 -l3560 -nstorage group
  Insufficient allocatable extents suitable for parallel use for logical
volume storage: 3560 required

Any other suggestions?

Tyler

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On
Behalf Of David Greaves
Sent: Saturday, June 12, 2004 1:13 AM
To: LVM general discussion and development
Subject: Re: [linux-lvm] Stripes and PE's

I had a similar problem.

I fixed it by turning off contiguous
  http://www.redhat.com/archives/linux-lvm/2004-April/msg00050.html

Can't say anyone was particularly helpful about enlightening me <shrug>  :)

Maybe you could create a non-striped contiguous over a  striped md array?

David


Tyler wrote:

>I'm having problems creating a logical volume on a 4 disk SCSI volume
group.
>I want to use the entire space as 1 LV that is striped, but can't seem to
do
>it.
>
>I get an error telling me I don't have enough Physical Extents, when I
>clearly do.
>
>livecd root # vgdisplay
>  --- Volume group ---
>  VG Name               group
>  System ID
>  Format                lvm2
>  Metadata Areas        4
>  Metadata Sequence No  1
>  VG Access             read/write
>  VG Status             resizable
>  MAX LV                255
>  Cur LV                0
>  Open LV               0
>  Max PV                255
>  Cur PV                4
>  Act PV                4
>  VG Size               13.91 GB
>  PE Size               4.00 MB
>  Total PE              3560
>  Alloc PE / Size       0 / 0
>  Free  PE / Size       3560 / 13.91 GB
>  VG UUID               DjxWid-oxqx-zol9-Lu8a-CO94-AsBn-c7k3le
>
>livecd root # lvcreate -i4 -I16 -l3560 -nstorage group
>  Insufficient allocatable extents suitable for striping for logical volume
>storage: 3560 required
>livecd root # lvcreate -i4 -I16 -l3000 -nstorage group
>  Insufficient allocatable extents suitable for striping for logical volume
>storage: 3000 required
>
>Even if I try to use less space then it says I have, it still wont let me.
>
>I've had this error before, but never found a solution.  I also have not
>found the solution on the mailing list archives either.  I can create a
>contiguous LV, but without striping.  I'd like to have it striped if I
>could.
>
>What am I doing wrong?
>
>Tyler
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>

_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
