Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id iBCHCVH6023058
	for <linux-lvm@redhat.com>; Sun, 12 Dec 2004 17:12:31 GMT
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1CdXGo-0002CZ-UG
	for linux-lvm@redhat.com; Sun, 12 Dec 2004 17:12:30 +0000
Date: Sun, 12 Dec 2004 17:12:30 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] duplicate pv.
Message-ID: <20041212171230.GL11338@agk.surrey.redhat.com>
References: <20041211114213.76916.qmail@web52508.mail.yahoo.com>
	<20041211131829.GA10829@ppc.in-berlin.de>
	<20041211223855.GJ11338@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20041211223855.GJ11338@agk.surrey.redhat.com>
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

On Sat, Dec 11, 2004 at 10:38:56PM +0000, Alasdair G Kergon wrote:
> On Sat, Dec 11, 2004 at 02:18:29PM +0100, Philipp Schmidt wrote:
> > look t your /etc/lvm/lvm.conf, have you set md_component_detection = 1?
> > i wonder why this isn't set by default, who needs to use md compnents as
> > singel pv?
> It *is* set to 1 by default i.e. if you don't specify 
> a different value for it in the conf file.
 
I believe the Debian distribution may have set it to 0 at one point because
of problems in certain configurations: these cases should be fixed by 2.00.29.


Another cause of problems could be if people created a whole-disk PV 
on a device that actually held a partition table - i.e. they
ignored the partition table, even though the kernel would still be using it.

From 2.00.29, lvm2 tries to detect partitioned devices and stop you
using them directly as PVs unless you remove the partition table first.
(i.e. if it's partitioned, only the partitions can be PVs, not the whole
disk device)

Alasdair
-- 
agk@redhat.com
