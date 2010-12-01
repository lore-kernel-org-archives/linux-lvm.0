Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB1ABAO1019471
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 05:11:10 -0500
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB1AB19o007871
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 05:11:02 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1PNjeP-00022g-3M
	for linux-lvm@redhat.com; Wed, 01 Dec 2010 11:11:01 +0100
Received: from lan-fw.biochem.mpg.de ([141.61.181.2])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 01 Dec 2010 11:11:01 +0100
Received: from johannes_graumann by lan-fw.biochem.mpg.de with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 01 Dec 2010 11:11:01 +0100
From: Johannes Graumann <johannes_graumann@web.de>
Date: Wed, 01 Dec 2010 11:10:47 +0100
Message-ID: <id56v8$fc4$1@dough.gmane.org>
References: <id4tfc$81m$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Subject: [linux-lvm] [SOLVED]: lvm2 and partition shringkin:
	superblock/filesystem size mismatch
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

mke2fs -b 4096 -t ext3 -S /dev/mapper/mygroup-home

on the unmounted file system solved my issue.

Joh

Johannes Graumann wrote:

> Hi,
> 
> I'm running debian testing and "/home" is an ext3 fs. I run the following
> order of commands to shrink the fs and the corresponding partition:
> 
> e2fsck -f /dev/mapper/mygroup-home
> resize2fs /dev/mapper/mygroup-home 55329357
> lvreduce -L 208.5g /dev/mapper/mygroup-home
> 
> The latter was supposed to be .5g bigger than necessary (paranoia
> regarding the data integrity kicking in).
> 
> "e2fck /dev/mapper/mygroup-home" now stops with superblock/filesystem size
> mismatch, but I can't grow the fs into the new partition size, as
> "resize2fs" wants "e2fsck" (stopping with the mismatch) first.
> 
> The fs is mountable and everything seems allright otherwise.
> 
> Any pointers on how to update the superblock's size statement?
> 
> Thanks, Joh
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
