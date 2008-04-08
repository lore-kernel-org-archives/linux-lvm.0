Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m38BPL9L009835
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:25:21 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m38BPAdA012171
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:25:11 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id m38BP5Ro005225
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:25:05 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id m38BP5a0023786
	for <linux-lvm@redhat.com>; Tue, 8 Apr 2008 07:25:05 -0400
Date: Tue, 8 Apr 2008 07:25:05 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM mirroring questions...
In-Reply-To: <69649d440804080414qba1bb21waa98de61c11876f8@mail.gmail.com>
Message-ID: <Pine.LNX.4.44.0804080716300.23698-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 8 Apr 2008, Jess Bromley wrote:

> Also does the fact that software RAID doesn't use a disk log mean that
> LVM is actually better/faster than RAID at correctly recovering from
> crashes that leave the mirrored disks out of sync?

The md driver doesn't track which blocks are out of sync.  It recovers
from a crash by copying the entire partition.  On recent versions, it
tracks how far it has gotten on the resync in the md superblock, so that it
doesn't have to start from scratch on a reboot.

The md driver keeps its superblock at the *end* of the partition.  This
means that you can mount any filesystem/pv as the raw partition.
This requires that LVM give md devices preference when scanning for
PVs to work correctly :-)

Mounting without md can be done deliberately (and carefully!) in
certain situations to work around other bugs.  For instance, if grub
won't work with md devices, just fail all but one of the mirrors of the
boot partition, mount /boot as normal parition.  Run grub-install.  Then
umount /boot, remount as md, and add back mirrors.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
