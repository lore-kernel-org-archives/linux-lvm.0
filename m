Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5GFIXZR014367
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 11:18:33 -0400
Received: from zoot.lnxi.com (66.239.25.20.ptr.us.xo.net [66.239.25.20])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5GFIX65002987
	for <linux-lvm@redhat.com>; Fri, 16 Jun 2006 11:18:33 -0400
From: Joshua Aune <luken@omner.org>
Date: Fri, 16 Jun 2006 09:18:07 -0600
Message-Id: <1150471087.30257.393.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Effects of XXremove and then XXcreate on fs
Reply-To: luken@omner.org,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

If an LV is [lv,vg,pv]removed and then re[pv,vg,lv]created not using the
backup file, what are the effects on the old LV?
 is it possible to remove the new created LV/VG/PV and recreate using
  the backup file and still access the volume?
 or is there some on-disk metadata from the original LV that got hosed
  by the creation of the new LV?

I am trying to recover a system that had the above done to it along with
possibly having some other problems, and am trying to weed out possible
causes of failure.  I do have the backup/ file now and will be
attempting this as soon as I can restore the block devices from backups
(another 6 hours).

As far as I can tell the LV/VG/PVs were not resized or changed at all
from the time it was created to the time the underlying hardware
crashed...

Are there any gotcha's trying to do this?

Thanks,
Josh
