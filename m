Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i31JToj16649
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 14:29:50 -0500
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i31JTnjj004721
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 14:29:49 -0500
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id D7C8FB450
	for <linux-lvm@redhat.com>; Thu,  1 Apr 2004 14:29:48 -0500 (EST)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 22521-08 for <linux-lvm@redhat.com>;
	Thu, 1 Apr 2004 14:29:48 -0500 (EST)
Received: from localhost (salusa.ix.dyndns.org [192.168.1.2])
	by salusa.poochiereds.net (Postfix) with ESMTP id 29F743673
	for <linux-lvm@redhat.com>; Thu,  1 Apr 2004 14:29:48 -0500 (EST)
Subject: Re: [linux-lvm] Migration of linux 2.4/LVM1 to linux 2.6/LVM2 with
	root fs in LVM
From: Jeffrey Layton <jtlayton@poochiereds.net>
In-Reply-To: <406C3010.2040103@shoenix.net>
References: <406C3010.2040103@shoenix.net>
Message-Id: <1080847790.3404.74.camel@tesla.mmt.bellhowell.com>
Mime-Version: 1.0
Date: Thu, 01 Apr 2004 14:29:50 -0500
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

Hi Martin,
   You're right -- that was a lot of text :-). I haven't done an
2.4/LVM1-2.6/LVM2 conversion yet, but am going to have to at some point
in the not too distant future. I _have_ however, set up a 2.6/LVM2
root-on-LVM-on-MD setup. Here's some comments for ya (and anyone else
looking at this), roughly corresponding to your questions:

10) You might want to have a look at the lvm2create_initrd script that's
been bandied about here. (I have a fairly recent copy at:
http://poochiereds.net/svn/lvm2create_initrd). It has a number of
features that are helpful -- in particular a lvm2rescue mode, which
brings up a shell prior to the pivot_root. Also the old lvmcreate_initrd
script uses the deprecated change_root function.

8) yes, the DM control device numbers can (and do) change.

7) You're quite correct about the problems with major/minor numbers on
dm devices. In fact its even worse than you know, since a kernel upgrade
or rebuild can now cause your DM major/minor numbers to change
(depending on how drivers get loaded).

The best way to handle it (as far as I can see) is to use udev (the
replacement for devfs). Under Debian (probably other distribs too), it
mounts a ramdisk over /dev early in rcS.d. This means you need a startup
script that happens after /dev getting mounted and before root gets
fsck'ed that runs a vgscan --mknodes.

We considered trying to make the initrd image fix the device entries on
the root filesystem, but that's dangerous since you're mucking with the
rootfs before it's been fscked. So at this point using udev is _highly_
recommended for root-on-LVM2 setups (prob. for root on EVMS setups etc
too), as it gets around the whole problem of invalid devices on the
rootfs.

There are prob. a lot of things I'm forgetting too, but I'm glad you got
your setup transitioned without data loss!!!

Cheers,
Jeff
