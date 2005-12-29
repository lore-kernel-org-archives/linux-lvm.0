Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBTICB111692
	for <linux-lvm@redhat.com>; Thu, 29 Dec 2005 13:12:11 -0500
Received: from rwcrmhc12.comcast.net (rwcrmhc13.comcast.net [204.127.198.39])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBTIC1SC030997
	for <linux-lvm@redhat.com>; Thu, 29 Dec 2005 13:12:05 -0500
Received: from [192.168.1.3] (silvio.localnet [192.168.1.3])
	by furio.localnet (8.13.4/8.13.4) with ESMTP id jBTIC6IX011058
	for <linux-lvm@redhat.com>; Thu, 29 Dec 2005 13:12:06 -0500
Message-ID: <43B426E9.7080400@mattgillen.net>
Date: Thu, 29 Dec 2005 13:11:53 -0500
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] How can I expand a physical volume ?
References: <43B39A85.7060107@email.it>
In-Reply-To: <43B39A85.7060107@email.it>
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

Massimiliano wrote:
> Hi !
> My first post here !
> I've recently added a fourth Scsi Hard disk to my
> Proliant ML350 configured as follow :
> SmartArray Controller 641 with 3 72Gb Scsi h.disks.(raid5)
> I installed on my Centos 4.2 the HP Array configuration Utility and did
> the following steps:
> 1) Expanded my array
> 2) Expanded my logical Volume
> Everything ok . Now I can see 4 physical drives
> and a new total space increased of 72gb(obviously..)
> The problem is that the operating doesen't seem to recognize the new
> free space .

If by "operating system", you mean that the filesystem isn't any bigger,
then all you need to do is re-size the filesystem (using 'resize2fs') to
take advantage of the new space.

> **********************************
> root@mail init.d]# pvdisplay
> --- Physical volume ---
> PV Name /dev/cciss/c0d0p2
> VG Name VolGroup00
> PV Size 135,53 GB / not usable 0
Ok.

> [root@mail init.d]# vgdisplay -v
> Finding all volume groups
> Finding volume group "VolGroup00"
> --- Volume group ---
> VG Name VolGroup00
> Alloc PE / Size 4336 / 135,50 GB
> Free PE / Size 1 / 32,00 MB
So all your PE's are allocated, and I think you're all set to do the
filesystem re-size.  I don't think you want to be messing with pvresize.

--Matt
