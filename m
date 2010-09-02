Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o821p4dl013179
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 21:51:04 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o821oqcS020631
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 21:50:52 -0400
Received: from [192.168.3.140] (Athenae2 [192.168.3.140])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o821ofrn020891
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2010 18:50:43 -0700
Message-ID: <4C7F02F2.3040500@tlinx.org>
Date: Wed, 01 Sep 2010 18:50:42 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lsm space giveth and space taketh away: missing space?
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

I'm running low on space in my /backups partition.  I looked at the
partitions and volumes to see what might be done (besides deleting old
backups), and noticed:

pvs:
  PV         VG         Fmt  Attr PSize  PFree
  /dev/sdb1  Backups    lvm2 a-   10.91T  3.15G

---
So I thought 'cool', I didn't make it the full size, and
I have some left...ok...(I didn't remember what I'd done, its
been a while).

Run lvresize:
lvresize /dev/Backups/Backups -L +3.15G
  Rounding up size to full physical extent 3.15 GB
  Extending logical volume Backups to 10.91 TB
  Logical volume Backups successfully resized

Um...HELLO?  Extending to 10.91?  But it was at 10.91!
pvs:
  PV         VG         Fmt  Attr PSize  PFree
  /dev/sdb1  Backups    lvm2 a-   10.91T     0

Well that was unimpressive.

parted /dev/sdb
p(rint)
Disk /dev/sdb: 12.0TB
Sector size (logical/physical): 512B/512B
Partition Table: gpt

Number  Start   End     Size    File system  Name    Flags
 1      17.4kB  12.0TB  12.0TB               backup  lvm






Ok, now I'm really confused.  10.91T?  14.06T?  (Obviously
this was optimistic reporting if the partition is only 12TB!)

So why does parted show a 12TB disk while lvm shows only a 10.91T
disk and why did lvm show 3.15G free when it wasn't really there?

How do I get my 1.09T back from lvm?  That seems like awfully
high for an overhead number for lvm.  I'd expect more like "0.09T".


Ideas?
Linda
