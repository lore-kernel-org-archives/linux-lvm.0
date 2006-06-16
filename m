Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5G7a34D021338
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 03:36:03 -0400
Received: from conterra.de (vvv.conterra.de [212.124.44.162])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5G7a15k020373
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 03:36:02 -0400
Received: from localhost (unknown [127.0.0.1])
	by conterra.de (-) with ESMTP id 7B8321F4017
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 09:35:50 +0200 (CEST)
Received: from conterra.de ([127.0.0.1])
	by localhost (vvv.conterra.de [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 03057-10 for <linux-lvm@redhat.com>;
	Fri, 16 Jun 2006 09:35:45 +0200 (CEST)
Message-ID: <44925F50.2000108@conterra.de>
Date: Fri, 16 Jun 2006 09:35:44 +0200
From: =?ISO-8859-1?Q?Dieter_St=FCken?= <stueken@conterra.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Change from one Linux Distro to another,	keeping
	data on LVM
References: <uoodwu7bzl.fsf@impertigo.lkpg.cendio.se>
In-Reply-To: <uoodwu7bzl.fsf@impertigo.lkpg.cendio.se>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Erik Forsberg wrote:
> I'm about to change Linux distribution on a NFS file server for a
> customer. They are currently running Fedora Core 3/2.6.12, and wants
> to run either Suse 9.3 or Suse 10.
> 
> The filesystem served resides on an ext3 file system located on a LVM2
> LV, with the volume group having two PVs. 
> 
> Are there anything special I need to think about when doing this? My
> plan is something like this:
> 
> 1) Make sure I have an updated copy of /etc/lvm available somewhere
>    else. 
> 2) Boot upp the installer for Suse and erase the partitions on the
>    first physical disk (well, actually on the first hardware RAID unit) that
>    are not used as a PV, and install Suse on that area of the disk. 
> 
> Hopefully, the suse partitioner will not do anything stupid with my
> PVs, my VG or my LV. It's probably best to create a new VG for the
> operating system, and then mount the old LV from the old VG once the
> OS is in place.
> 
> Any comments/experience on this kind of operation? 

I performed a similar procedure with SuSE 10.1 last week.
The SuSE installer recognized all my LVM setups correctly.
But I wanted to install even root and swap on LVM and only
/boot on a tiny native partition. The SuSE installer
disliked this by default and proposed to erase all the
disk and to repartition it completely. But this was just
a proposal. After I explicitly configured how to use
my existing LVM configuration, the SuSE installer accepted
this (with a warning about root on LVM) but it worked well.

So I think, the installer won't do any bad things without asking
you. As I remember, this is true for 9.3, too. 

Apropos LVM: I suggest to use SuSE 10.1. With a SuSE 10.0 system
I again run into problems with its 2.6.13-15.8 kernel.
Under special conditions PVmove hung up. I had to reset/reboot and
"pvmove --abort" to recover the data. I observed this with some
SuSE 9.? last year, too.

Dieter.
