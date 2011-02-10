Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p1AMsMxg006456
	for <linux-lvm@redhat.com>; Thu, 10 Feb 2011 17:54:22 -0500
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p1AMsEbu013590
	for <linux-lvm@redhat.com>; Thu, 10 Feb 2011 17:54:14 -0500
Date: Thu, 10 Feb 2011 16:53:25 -0600
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110210165325.27b346b5@bettercgi.com>
In-Reply-To: <4D54552E.6070202@Yahoo.com>
References: <4D54552E.6070202@Yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Cannot access logical volume (open count=1)
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Peter_Flass@yahoo.com

  Check whether the LV has a partition on it.
(fdisk -l /dev/vg*/home)  If so, use kpartx -dvv 
to close it.

> The disk (sdb) has one vg and three lv's on it
> /proc/mounts shows /dev/sdb1 mounted

  If /dev/sdb1 is mounted, does that mean there's 
a /dev/sdb2 which is a PV?
-- 
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Thu, 10 Feb 2011 16:14:22 -0500
Peter Flass <Peter_Flass@yahoo.com> wrote:

> I'm truly sorry to bother the developers' list with this question,
> but I've searched and can't find an ansewr that works.  A system
> crash seems to have corrupted something in my fedora system.  I boot
> to a rescue CD and look thru LVM.  The disk (sdb) has one vg and
> three lv's on it. Call the vg vg_xxx, the lv's are lv_boot (ext3, I
> believe), lv_swap (no fs) and lv_home (ext4).  I can't fsck (e2fsck)
> lv_home or do anything else with it, LVM says it's open count=1 where
> the open count of the other two lv's is zero.
> 
> I can't find who has it open.  /proc/mounts shows /dev/sdb1 mounted
> on /media/usb0, when I umount  it (either by mount point or device)
> it disappears, but the lv still shows open, and as a result I am
> unable to do anything with it.  lsof also shows nothing open that
> resembles this lv.  I can inactivate the other two lvs in this vg,
> but not lv_home.
> 
> What can I do to fix this problem?
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
