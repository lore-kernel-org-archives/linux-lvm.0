Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5C7DO012099
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2004 03:13:24 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5C7DIXn020949
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2004 03:13:18 -0400
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id 98F25E6D66
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2004 08:10:58 +0100 (BST)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 31392-19 for <linux-lvm@redhat.com>;
	Sat, 12 Jun 2004 08:10:58 +0100 (BST)
Received: from oak.dgreaves.com (modem-3437.kawau.dialup.pol.co.uk
	[81.78.157.109]) by mail.ukfsn.org (Postfix) with ESMTP id C6B93E6D5D
	for <linux-lvm@redhat.com>; Sat, 12 Jun 2004 08:10:57 +0100 (BST)
Received: from ash.dgreaves.com ([10.0.0.126])
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1BZ2jD-0001QW-IP
	for linux-lvm@redhat.com; Sat, 12 Jun 2004 08:14:59 +0100
Message-ID: <40CAAD06.2010106@dgreaves.com>
Date: Sat, 12 Jun 2004 08:13:10 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Stripes and PE's
References: <0HZ600B8D5NVF4@l-daemon>
In-Reply-To: <0HZ600B8D5NVF4@l-daemon>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I had a similar problem.

I fixed it by turning off contiguous
  http://www.redhat.com/archives/linux-lvm/2004-April/msg00050.html

Can't say anyone was particularly helpful about enlightening me <shrug>  :)

Maybe you could create a non-striped contiguous over a  striped md array?

David


Tyler wrote:

>I'm having problems creating a logical volume on a 4 disk SCSI volume group.
>I want to use the entire space as 1 LV that is striped, but can't seem to do
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
