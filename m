Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q6UKQWCU016781
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 16:26:32 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q6UKQV3T009794
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 16:26:31 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id q6UKQUVv025054
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 16:26:30 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by bmsred.bmsi.com (8.14.4/8.14.4) with ESMTP id q6UKPk4I023517
	for <linux-lvm@redhat.com>; Mon, 30 Jul 2012 16:25:46 -0400
Date: Mon, 30 Jul 2012 16:25:46 -0400 (EDT)
From: Stuart D Gathman <stuart@bmsi.com>
In-Reply-To: <5016DD33.3050000@profihost.ag>
Message-ID: <alpine.LRH.2.02.1207301618430.23442@bmsred.bmsi.com>
References: <5016DD33.3050000@profihost.ag>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how to online resize pv?
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Jul 30, Stefan Priebe transmitted in part:

> Number  Start   End     Size    File system  Name       Flags
> 1      1049kB  2097kB  1049kB               GRUB_BOOT  bios_grub
> 2      2097kB  32,2GB  32,2GB               Linux LVM  lvm
>
> If i delete 2 and recreate it starting at the same sector i can't reread the 
> part. table.
>
> Is there a way todo online resizing?

Only when no partition is open.  That is one reason why LVM is an
improvement over partition tables.  You don't have to use a partition
table, just use the entire device as a PV.  However, most admins use a
partition table with a single partition so that other OSes will
recognize the disk as in use (and hopefully not overwrite without
warning if accidentally presented).

If you have multiple drives, you might be able to migrate stuff off,
remove the PV, resize, add the PV back to the VG.

I use software RAID1/RAID10.  You can remove the partition from the RAID
array, resize, then add it back and resync.  Repeat for other mirror
legs to actually use the space.
