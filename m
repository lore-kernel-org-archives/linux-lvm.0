Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j6TKuwRm021805
	for <linux-lvm@redhat.com>; Fri, 29 Jul 2005 21:56:58 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1Dybuc-0003Vu-1P
	for linux-lvm@redhat.com; Fri, 29 Jul 2005 21:56:58 +0100
Date: Fri, 29 Jul 2005 21:56:58 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] how to access the partition on LV?
Message-ID: <20050729205658.GQ23710@agk.surrey.redhat.com>
References: <1122563861.9888.1.camel@localhost.localdomain>
	<20050728164523.GF4954@null.msp.redhat.com>
	<1122570830.9888.10.camel@localhost.localdomain>
	<20050728173218.GH4954@null.msp.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050728173218.GH4954@null.msp.redhat.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

> > the problem is that we export a LV via iscsi to a remote box and become
> > a scsi disk. so it is partitioned and utilized. then it does have
> > partition on it. even it is exported to a linux box, u possibly will
> > use /dev/sdx1 instead of directly use /dev/sdx, rite?
 
> dunno if kpartx or some other partitioning tool could do it

Give kpartx a try. It reads a dos partition table and creates partitions
using device-mapper.

You'll find kpartx in multipath-tools (device-mapper-multipath package on Red Hat).
  ftp://sources.redhat.com/pub/dm/multipath-tools/multipath-tools-0.4.5.48.tgz

Alasdair
-- 
agk@redhat.com
