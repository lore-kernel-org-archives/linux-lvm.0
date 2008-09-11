Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m8BELODv007204
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 10:21:25 -0400
Received: from lists.geoinf.fu-berlin.de (lists.geoinf.fu-berlin.de
	[160.45.89.23])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m8BELCSR028330
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 10:21:13 -0400
Received: from [160.45.89.15] (callisto.geoinf.fu-berlin.de [160.45.89.15])
	by lists.geoinf.fu-berlin.de (Postfix) with ESMTP id E279518359
	for <linux-lvm@redhat.com>; Thu, 11 Sep 2008 16:21:11 +0200 (CEST)
Message-ID: <48C92937.9090506@fu-berlin.de>
Date: Thu, 11 Sep 2008 16:20:39 +0200
From: Sebastian Walter <sebastian.walter@fu-berlin.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] pvmove abort
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dear list,

I have a problem recovering from an aborted pvmove process. I have a
volume group called storage consisting of 2 partitions (PV's) with 2 TB
each (let's call them A and B). I added a third partition (let's call it
C) using vgextend. Now I did a pvmove A to move A's content to C but
recognized that it would take a long time so I canceled the pvmove
pressing ctrl-c.

After that I saw that some data was already written on the formerly
empty PV C. I tried to pvmove this new pv out of the volume group, but
pvmove refuses to work with the following error:

Skipping locked LV storage
Skipping mirror LV pvmove0
No data to move for storage

There is an additional LV on the VG now called pvmove0. I dont
understand what pvmove does, but this LV seems to be a mirror. Does this
mean that everything is still on the old PV and I can delete the LV
pvmove0? The VG in total seems to be ok.

How can I unlock the volume and free the pv? Any help is greatly
appreciated.

Best regards,
Sebastian
