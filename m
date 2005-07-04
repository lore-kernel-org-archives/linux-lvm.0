Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j64HCpV00435
	for <linux-lvm@redhat.com>; Mon, 4 Jul 2005 13:12:51 -0400
Received: from twinlark.arctic.org (twinlark.arctic.org [207.7.145.18])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j64HCmqa024823
	for <linux-lvm@redhat.com>; Mon, 4 Jul 2005 13:12:49 -0400
Date: Mon, 4 Jul 2005 10:12:43 -0700 (PDT)
From: dean gaudet <dean-list-linux-lvm@arctic.org>
Subject: Re: [linux-lvm] Converting from LVM to LVM on RAID1 (WAS: no subject)
In-Reply-To: <1120421879l.9327l.2l@tangerine>
Message-ID: <Pine.LNX.4.63.0507041005510.26084@twinlark.arctic.org>
References: <1120421879l.9327l.2l@tangerine>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

it's not a good idea, but you could use raid1 without a superblock... did 
i mention it's not a good idea?

normally you want the raid1 superblock... which lives at the end of the 
partition.  you can't blindly convert an LVM pv to a raid1 device without 
ensuring the physical extent at the end of the pv isn't in use.  i don't 
see any way to shrink a pv -- so i don't think you'll be able to convert 
an existing lvm pv to a raid1 device.

however there's nothing stopping you from creating a raid1 device on a 
second disk (and specify "missing" for the other raid device(s)... see 
mdadm man page), creating a pv/vg/lv on top of that raid1, then copying 
the filesystems over... doing grub/lilo/whatever magic... and trying to 
boot it.

if it works, you can convert the old disk into the second component of the 
raid.

there's probably several docs already explaining this sort of procedure 
without lvm involved... (for example there's one supplied with debian 
mdadm at /usr/share/doc/mdadm/rootraiddoc.97.html)

-dean
