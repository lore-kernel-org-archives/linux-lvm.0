Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l2TGtrrN031193
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 12:55:54 -0400
Received: from goose.ntrg.com (goose.ehsco.com [207.65.203.98])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l2TGtlh7010500
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 12:55:47 -0400
Received: from [207.65.71.19] (pool-72-75-36-189.washdc.east.verizon.net
	[72.75.36.189])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client did not present a certificate)
	by goose.ntrg.com (Postfix ) with ESMTP id 75C0D239F3
	for <linux-lvm@redhat.com>; Thu, 29 Mar 2007 10:55:45 -0600 (CST)
Message-ID: <460BEF90.60900@ehsco.com>
Date: Thu, 29 Mar 2007 11:55:44 -0500
From: "Eric A. Hall" <ehall@ehsco.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM questions
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
To: linux-lvm@redhat.com


Hi guys,

I'm putting together a storage server for NAS and iSCSI purposes and am
looking to use LVM for some or all of this. I've read up on LVM but I
still have some basic newbie questions for this.

I've got a bunch of Raptor 150 ADFD drives and a 3Ware 9650SE board
providing the basic back-end storage (currently RAID-5 but will move to
RAID-6 soon, with estimated capacity of approx 800-900 GB, although the
entire array may shrink or grow as projects demand). The opsys root
partition will be about 40 GB XFS, with another 4GB swap partition, and
the NAS/storage pool will be about 300 GB XFS, with the remainder of the
space being used by the iSCSI volumes (about another 300 GB, divvied up
among different iSCSI LUNs). I want to be able to shrink and expand these
by about 10 GB per (although swap may only change by +/-4GB) so I figure
I'll use LVM for all of the partitions. A couple of other considerations
here: I need to align the partitions on page boundaries for iSCSI
performance reasons, and I am also thinking about managing blockdev
read-ahead differently for each of the final volumes.

I assume that a single physical extent across /dev/sda will work as well
as anything else here. Will having more partitions make it easier to
shrink and expand the whole RAID if that ever becomes necessary? Anything
else I should take into consideration?

Should I create a single volume group or should I create multiple volume
groups, or does it even matter? What are the issues?

I have seen some people talk about creating hundreds of small partitions
and using those for moving and resizing. Is this needed, desirable, or
just a stupid human trick?

Anything else I should take into consideration here would be appreciated

Thanks!
