Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7TL2YTw025771
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 17:02:34 -0400
Received: from xyz.pp.se (postfix@xyz.pp.se [212.31.160.244])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k7TL2XGA023696
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 17:02:33 -0400
Received: from localhost (localhost [127.0.0.1])
	by xyz.pp.se (Postfix) with ESMTP id 090471CC136
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 23:02:33 +0200 (CEST)
Received: from xyz.pp.se ([127.0.0.1])
	by localhost (xyz.pp.se [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dVbK72sL5j0y for <linux-lvm@redhat.com>;
	Tue, 29 Aug 2006 23:02:26 +0200 (CEST)
Received: from thomas (33.242.216.81.static.h-borg.siwnet.net [81.216.242.33])
	by xyz.pp.se (Postfix) with ESMTP id 185101CC135
	for <linux-lvm@redhat.com>; Tue, 29 Aug 2006 23:02:26 +0200 (CEST)
From: "Thomas Novin" <thnov@xyz.pp.se>
Subject: RE: [linux-lvm] Ran vgreduce --missing to remove broken disk,
	am I screwed?
Date: Tue, 29 Aug 2006 23:02:36 +0200
Message-ID: <001f01c6cbae$74be1480$0a00000a@thomas>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <000001c6c2d2$b5ceafa0$0a00000a@thomas>
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
To: 'LVM general discussion and development' <linux-lvm@redhat.com>

> I had a disk that stopped working. After booting I could see with
> pvdisplay
> that the disk was missing. After reading everything I could find via
> google
> I thought that you were supposed to run 'vgreduce --remove-missing
> volgrp0'
> to remove the missing disk from the group.
> 
> After this the volume group looks OK but the entire logical volume got
> removed! Am I screwed now or is there any way to salvage the data which is
> on the remaining three disks?

Please someone answer this, is there any solution to this problem? To
clarify:

- Disk failure
- Ran 'vgreduce --remove-missing volgrp0' (probably not such a good idea)
- /dev/volgrp0/ emtpy. 'lvdisplay' doesn't show anything.

So, can I somehow restore my logical volume? The three other physical
disks/partitions are intact.

Thanks in advance,

Thomas Novin
