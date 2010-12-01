Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oB17eHgY028580
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 02:40:17 -0500
Received: from lo.gmane.org (lo.gmane.org [80.91.229.12])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oB17e5C5005138
	for <linux-lvm@redhat.com>; Wed, 1 Dec 2010 02:40:06 -0500
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gllg-linux-lvm@m.gmane.org>) id 1PNhIK-0001eR-14
	for linux-lvm@redhat.com; Wed, 01 Dec 2010 08:40:04 +0100
Received: from lan-fw.biochem.mpg.de ([141.61.181.2])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 01 Dec 2010 08:40:04 +0100
Received: from johannes_graumann by lan-fw.biochem.mpg.de with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 01 Dec 2010 08:40:04 +0100
From: Johannes Graumann <johannes_graumann@web.de>
Date: Wed, 01 Dec 2010 08:28:43 +0100
Message-ID: <id4tfc$81m$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Subject: [linux-lvm] lvm2 and partition shringkin: superblock/filesystem
	size mismatch
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

Hi,

I'm running debian testing and "/home" is an ext3 fs. I run the following 
order of commands to shrink the fs and the corresponding partition:

	e2fsck -f /dev/mapper/mygroup-home
	resize2fs /dev/mapper/mygroup-home 55329357
	lvreduce -L 208.5g /dev/mapper/mygroup-home

The latter was supposed to be .5g bigger than necessary (paranoia regarding 
the data integrity kicking in).

"e2fck /dev/mapper/mygroup-home" now stops with superblock/filesystem size 
mismatch, but I can't grow the fs into the new partition size, as 
"resize2fs" wants "e2fsck" (stopping with the mismatch) first.

The fs is mountable and everything seems allright otherwise. 

Any pointers on how to update the superblock's size statement?

Thanks, Joh
