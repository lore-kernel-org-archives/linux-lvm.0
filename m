Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3HCDEj04096
	for <linux-lvm@redhat.com>; Sat, 17 Apr 2004 08:13:14 -0400
Received: from salusa.poochiereds.net (rdu26-93-067.nc.rr.com [66.26.93.67])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i3HCDDJW006317
	for <linux-lvm@redhat.com>; Sat, 17 Apr 2004 08:13:13 -0400
Received: from localhost (localhost [127.0.0.1])
	by salusa.poochiereds.net (Postfix) with ESMTP id 32C00C96F
	for <linux-lvm@redhat.com>; Sat, 17 Apr 2004 08:13:13 -0400 (EDT)
Received: from salusa.poochiereds.net ([127.0.0.1])
	by localhost (salusa [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 19233-10 for <linux-lvm@redhat.com>;
	Sat, 17 Apr 2004 08:13:12 -0400 (EDT)
Received: from tleilax.ix.dyndns.org (tleilax.ix.dyndns.org [192.168.1.3])
	by salusa.poochiereds.net (Postfix) with ESMTP id BBCDB22F0
	for <linux-lvm@redhat.com>; Sat, 17 Apr 2004 08:13:11 -0400 (EDT)
From: Jeff Layton <jtlayton@poochiereds.net>
Message-Id: <1082204021.2403.17.camel@localhost>
Mime-Version: 1.0
Date: Sat, 17 Apr 2004 08:13:42 -0400
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Updated lvm2create_initrd
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
To: linux-lvm@redhat.com

I've committed a new version of the lvm2create_initrd script to my SVN
repository. Mostly these are tiny incremental changes to Miguel's
original version. In particular:

1) Removed the line 'mkdir -p initrd' from the initrd init script. Doing
this would be modifying the initrd image prior to fsck'ing it, and might
be dangerous if there were a corrupted rootfs. It's not necessary for
pivot_root to work, but 

2) Pass $* to the 'exec /sbin/init' call at the end of the script init
script. This is necessary to allow for booting into single-user mode.

3) Added some entries to PATH under /initrd for folks (like me) who
have /usr as a separate filesystem, and who don't have a working chroot
program under /.

I've also updated the README, and added a lvm2udev startup script. See
the README for why this is necessary. Since this seems to be working
pretty well, perhaps it's time to start talking about adding this into
the LVM2 tarballs?
-- 
Jeff Layton <jtlayton@poochiereds.net>
