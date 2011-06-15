Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p5FHQ9GL016268
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2011 13:26:10 -0400
Received: from lxme02.infocamere.it (lxme02.infocamere.it [80.82.3.213])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p5FHQ8J1031086
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2011 13:26:09 -0400
Received: from lxm07.intra.infocamere.it (lxm07.intra.infocamere.it [1.5.72.7])
	by lxme02.infocamere.it (8.14.3/8.14.3) with ESMTP id p5FHQ7S5024879
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2011 19:26:08 +0200
Received: from [1.5.28.70] (ic2301012.ic.intra.infocamere.it [1.5.28.70])
	(authenticated bits=0)
	by lxm07.intra.infocamere.it (8.14.3/8.14.3) with ESMTP id
	p5FHQ7Zq011070
	for <linux-lvm@redhat.com>; Wed, 15 Jun 2011 19:26:07 +0200
Message-ID: <4DF8EB19.6030106@infocamere.it>
Date: Wed, 15 Jun 2011 19:25:45 +0200
From: Enrico Ferro <enrico.ferro@infocamere.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Meaning of LV -missing_<x>_<x> devices
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi all,

after the extention of a logical volume (mysqld1) a new "ghost" logical volume
appeared with a <missing> suffix:

brw-rw---- 1 root disk 253, 38 Feb 15 20:53 vgmysql-mysqld1
brw-rw---- 1 root disk 253, 44 Jun 1 10:21 vgmysql-mysqld1-missing_4_0

Before performing this LV we partitioned and added a new LUN to the existing
vgmysql volume group (again, no errors reported).

We did not discovered this strange device immediately (the lvextend
command did not reported errors), only after resizing the file system.
The ext2fs operation aborted and so we started with investigation.

Commands like vgdisplay reported errors like:

# vgdisplay -s
/dev/mapper/vgmysql-mysqld1-missing_4_0: read failed after 0 of 4096 at 0: 
Input/output error
"vg00" 132.59 GB [28.78 GB used / 103.81 GB free]
"vgmysql" 811.95 GB [793.00 GB used / 18.95 GB free]

So online resize of the FS failed, we unmounted the LV, extended with
(apparent) success the filesystems and lived happy for a few days. Only
while a deep corruption of the FS appeared. :-(

A reboot cleaned up the strange "missing" LV, it is no more present.

The point is: what is the meaning of -missing_* device? When are they
generated (and why there are no warnings reported?)

thank your for your suggestions,
best regards,
-- 
Enrico
