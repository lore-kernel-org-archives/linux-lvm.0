Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i81LKS307354
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 17:20:28 -0400
Received: from main.gmane.org (main.gmane.org [80.91.224.249])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i81LKPS0007773
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 17:20:25 -0400
Received: from root by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1C2cWm-0001DD-00
	for <linux-lvm@redhat.com>; Wed, 01 Sep 2004 23:20:24 +0200
Received: from adsl-214-28-210.asm.bellsouth.net ([68.214.28.210])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 01 Sep 2004 23:20:24 +0200
Received: from ecashin by adsl-214-28-210.asm.bellsouth.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 01 Sep 2004 23:20:24 +0200
From: Ed L Cashin <ecashin@coraid.com>
Date: Wed, 01 Sep 2004 17:10:14 -0400
Message-ID: <87k6vdhf0p.fsf@coraid.com>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] LVM2 configure options for CLVM with GFS
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi.  The example at ...

  http://gfs.wikidev.net/Installation

... shows this command line for LVM2 configuration:

  ./configure --with-clvmd --with-cluster=shared \
     --with-kernel-source=/path/to/patched/kernel

I see there are more options that look to me like they should be set
to "shared" for using CLVMD with GFS:

  --with-pool=TYPE        GFS pool read-only support: internal/shared/none
                          TYPE=internal
  --with-cluster=TYPE     Cluster LVM locking support: internal/shared/none
                          TYPE=internal
  --with-snapshots=TYPE   Snapshot support: internal/shared/none
                          TYPE=internal
  --with-mirrors=TYPE     Mirror support: internal/shared/none
                          TYPE=internal

If I'm already running the patched kernel that I plan to use, should I
configure LVM2 like this?

  ./configure --with-clvmd --with-cluster=shared \
    --with-pool=shared \
    --with-snapshots=shared \
    --with-mirrors=shared


-- 
  Ed L Cashin <ecashin@coraid.com>
