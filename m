Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3RD6mO10118
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 09:06:48 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j3RD6Z66018088
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 09:06:36 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DQm8q-0002Dh-Mi
	for linux-lvm@redhat.com; Wed, 27 Apr 2005 14:59:48 +0200
Received: from 76.80-203-227.nextgentel.com ([80.203.227.76])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 14:59:48 +0200
Received: from mru by 76.80-203-227.nextgentel.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 14:59:48 +0200
From: =?iso-8859-1?q?M=E5ns_Rullg=E5rd?= <mru@inprovide.com>
Date: Wed, 27 Apr 2005 15:03:47 +0200
Message-ID: <yw1xwtqoqslo.fsf@ford.inprovide.com>
References: <20050427043822.GI15110@monhost.curriculum.edu.au>
	<yw1xacnkseqo.fsf@ford.inprovide.com>
	<20050427124027.GP15110@monhost.curriculum.edu.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: LVM2 on RAID
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

cpurn@cpurn.net (Christian Purnomo) writes:

> Thanks,
>
> I have tried changing the partitions type to 0xFD and the auto
> detects kicked in and LVM still worked like a charm.
>
> However I found this from mailling list archive
>
> /* start quote */
>
> From: Luca Berra <bluca comedia it> 
> To: linux-lvm redhat com 
> Subject: Re: [linux-lvm] Re: putting lvm autodetect into the kernel ala md 
> Date: Fri, 1 Apr 2005 19:41:22 +0200 
>
> quote Neil Brown back in july 2001
>
> "autorun/autodetect just doesn't belong in the kernel.  It should be
> done in user space.  The only time the kernel should assemble a raid
> array itself is for the root device, and this is best done with
> md=0,/dev/whatever,etc
>
> If I could start with a clean slate, I would rip out the autodetect
> stuff completely.  But lots of people are depending on it so I cannot."
>
> anyway the major issues are:
> 1) raid autodetect uses only the minor number stored in the superblock
> to identify the array components, move a disk from a different machine
> to yours and reboot it to enjoy the show

Is this really true?  My kernel log has messages like these:

md: Autodetecting RAID arrays.
md: autorun ...
md: considering sdb3 ...
md:  adding sdb3 ...
md: sdb1 has different UUID to sdb3
md:  adding sda3 ...
md: sda1 has different UUID to sdb3
md: created md2

If it uses the UUID, there should be little risk of misdetection.

A problem I have run into with LVM, was disks from different machines,
using the same VG names.

> 2) raid autodetect will try to start everything it finds, it will not
> scale with shared storage, or other complex configurations
>
> /* end quote */
>
> Can anyone conclude that passing the parameter md=0,/dev/* to kernel
> parameter is a better approach than using auto detect? I don't have
> a problem with having a rather long parameters in my
> grub.conf/lilo.conf.

As usual, both ways have their own advantages and disadvantages.  What
I like about autodetection, is that things just work, even if I
shuffle my disks for some reason.  

-- 
M�ns Rullg�rd
mru@inprovide.com
