Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oAUFfYL5032650
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2010 10:41:34 -0500
Received: from smtp12.tagonline.com (nat199.nat.tagonline.com [207.111.79.199])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oAUFfL6p001085
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2010 10:41:22 -0500
Received: from taco.int.tagonline.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain for (8.13.1/8.12.8/muffin_cf_1.0) with ESMTP
	id oAUFfL89015394
	for <linux-lvm@redhat.com>; Tue, 30 Nov 2010 10:41:21 -0500
Received: (from news@localhost)
	by taco.int.tagonline.com (8.13.1/8.13.1/Submit) id oAUFfLIm015393
	for linux-lvm@redhat.com; Tue, 30 Nov 2010 10:41:21 -0500
From: Andrew Gideon <ag2827189@tagmall.com>
Date: Tue, 30 Nov 2010 15:41:21 +0000 (UTC)
Message-ID: <id35v0$32d$1@taco.int.tagonline.com>
References: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>
	<AANLkTimGkMJGiJC+7L+Pu3+yf-J_s0Ex3hM2-g-0+UqQ@mail.gmail.com>
	<4CF3F7A0.2080108@rjl.com>
	<AANLkTim67atrgHEzunBRvp4ij+MUDiTg4vu5t6sbgFLq@mail.gmail.com>
	<4CF4A472.20107@rjl.com>
	<AANLkTing5ApAXM2o0M+pxNvg01mHewNgGGBiUXM3aLzZ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Q: LVM over RAID,
 or plain disks? A:"Yes" = best of both worlds?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Tue, 30 Nov 2010 14:34:05 +0700, hansbkk wrote:

> So here's a summary of steps, please confirm:
>   - create a snapshot of a given volume - create a new RAID1 mdN between
>   that and a physical partition (blank?) - let that get sync'd up -
>   break the RAID (fail the partition?), remove the drive - delete the
>   snapshot

I'm having some difficulty following this thread, so perhaps I've missed 
some other aspect to this.  But the above makes it seem like you simply 
wish to transport snapshots.  Why not use something as straightforward as 
dd for this rather than RAID1?  RAID1 tools (mdadm, drbd, etc.) have the 
benefit of keeping volumes in sync over time.  But the above process 
describes a synchronization over a single instant (the instant of the 
snapshot being taken).  So why bother with the extra work/capability/
complexity?

I'm also puzzled by something you wrote in your very first message on 
this thread: "the hard-linked filesystems on FILER-B require full 
filesystem cloning with block-level tools rather than file-level copying 
or sync'ing."  Why?  rsync -H handles cloning of hard links (though at a 
performance cost).

	- Andrew
