Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.9])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7P8FH8N001959
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 04:15:17 -0400
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7P8F60H001393
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 04:15:06 -0400
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1OoB8S-0006sM-4L
	for linux-lvm@redhat.com; Wed, 25 Aug 2010 10:15:04 +0200
Received: from rima-00-ser0.ce.ip-plus.net ([164.128.113.126])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 10:15:04 +0200
Received: from alexanders.mailinglists+nospam by rima-00-ser0.ce.ip-plus.net
	with local (Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 25 Aug 2010 10:15:04 +0200
From: Alexander Skwar <alexanders.mailinglists+nospam@gmail.com>
Date: Wed, 25 Aug 2010 08:12:02 +0000 (UTC)
Message-ID: <loom.20100825T100856-592@post.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Can't remove snapshot at first
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

Hi.

I noticed, that rather often, I'm unable to remove an unused
snapshot volume at first command execution. See this:

--($ ~)-- sudo /sbin/lvremove /dev/Sys/Home-Backup_Snapshot 
  Can't remove open logical volume "Home-Backup_Snapshot"

--($ ~)-- sudo /sbin/lvremove /dev/Sys/Home-Backup_Snapshot 
Do you really want to remove active logical volume Home-Backup_Snapshot? [y/n]: 

Between those two commands, I did not do anything at all! I ran the
commands directly after each other in like 5 seconds or so.

Why's that so?

--($ ~)-- sudo /sbin/lvm version
  LVM version:     2.02.70(2) (2010-07-06)
  Library version: 1.02.52 (2010-07-06)
  Driver version:  4.17.0

--($ ~)-- uname -a
Linux winnb000546 2.6.35-ARCH #1 SMP PREEMPT Sat Aug 21 07:23:08 UTC 2010 i686
Intel(R) Core(TM)2 Duo CPU T7300 @ 2.00GHz GenuineIntel GNU/Linux

This is a Arch Linux system.

Thanks,
Alexander
