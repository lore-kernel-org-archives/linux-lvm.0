Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5MHXF6O001945
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2009 13:33:15 -0400
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5MHWx64001222
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2009 13:33:00 -0400
Received: from tp.knebb.de (i5DB520F3.pool.tripleplugandplay.com
	[93.181.32.243])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.knebb.de (Postfix) with ESMTP id A777D7012B
	for <linux-lvm@redhat.com>; Mon, 22 Jun 2009 19:32:54 +0200 (CEST)
Message-ID: <4A3FC045.1080709@knebb.de>
Date: Mon, 22 Jun 2009 19:32:53 +0200
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] recovering data from inside a partitioned lv
References: <104D56B6-A5AA-44BC-A1A6-EDCF2FC098A8@merit.edu>
In-Reply-To: <104D56B6-A5AA-44BC-A1A6-EDCF2FC098A8@merit.edu>
Content-Transfer-Encoding: 7bit
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

Hi,

> Server has been rebooted, and now only /dev/vg1/lv1 is shown.  parted
> can open the lv and shows 1 partition inside, but doesn't understand
> ext3 volumes, so can't copy the partition to another disk.  tune2fs
> can't see /dev/vg1/lv1p1, or I'd use that to change the fs type to ext2.
I think the partition entry under /dev is missing. After the initial
fdisk it was created.
So two ways to recover:
-Open fdisk on the lv. Do not do any changes, but leave and (w)rite. I'd
say the entries lv1p1 will be re-created then. Mount it, copy the data
and get rid of partition.
-Use loop device. This is much more complicated but will work, though:
losetup -o$[512*63] /dev/loop1 /dev/vg1/lv1
So it will create a loop device /dev/loop1 from lv1 with an offset of
512*63 (default blocksize and partitioning schema, may vary thought) .
And then simply mount the loop device with the "-o loop" option for
mount. Copy and get rid of partition.

Hope this helps, let us know if it does.
GReetings

Christian
