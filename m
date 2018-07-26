Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6867A60933
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2018 16:31:51 +0000 (UTC)
Received: from mail1.merlins.org (magic.merlins.org [209.81.13.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3D47D30001DB
	for <linux-lvm@redhat.com>; Thu, 26 Jul 2018 16:31:50 +0000 (UTC)
Date: Thu, 26 Jul 2018 09:31:45 -0700
From: Marc MERLIN <marc@merlins.org>
Message-ID: <20180726163145.pywehjailovwjv2a@merlins.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Why use thin_pool_autoextend_threshold < 100 ?
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Still learning about thin volumes.
Why do I want my thin pool to get auto extended? Does "extended" mean
resized? 
Why would I want to have thin_pool_autoextend_threshold below 100 and
have it auto extend as needed vs having all of them be at 100, knowing
that underlying block allocation will fail if I run out of physical
blocks underneath?


Details:
I have a 14TB bcache block device.
On top, I'd like to put multiple btrfs filesystems.
There is however an issue with btrfs where it gets more unsafe (and
slower) to use if you have too many snapshots (over 50, and especially
over 100).
The fix around this is sadly to have multiple separate filesystems,
which kind of negates the nice part where you make subvolumes and let
them grow independently.

So, I'm going to make about 10 thin volumes, one for each of my btrfs
subvolumes so that they are all separate filesystems.
However, my plan is to make them all 14TB in size so that I never have
to resize the filesystem with the full understanding of course that the
sum of all is still going to be 14TiB underneath.

Right now, I'm getting this:
gargamel:~# lvcreate -V14TiB -T vgds2/thinpool2 -n debian64
  Using default stripesize 64.00 KiB.
  WARNING: Sum of all thin volume sizes (28.00 TiB) exceeds the size of thin pool vgds2/thinpool2 and the size of whole volume group (14.55 TiB).
  WARNING: You have not turned on protection against thin pools running out of space.
  WARNING: Set activation/thin_pool_autoextend_threshold below 100 to trigger automatic extension of thin pools before they get full.
  Logical volume "debian64" created.

I'm looking at lvm.conf, and I'll be honest that it's not clear
# Configuration option activation/thin_pool_autoextend_threshold.
# Auto-extend a thin pool when its usage exceeds this percent.
# Setting this to 100 disables automatic extension.
# The minimum value is 50 (a smaller value is treated as 50.)
# Also see thin_pool_autoextend_percent.
# Automatic extension requires dmeventd to be monitoring the LV.
# 
# Example
# Using 70% autoextend threshold and 20% autoextend size, when a 1G
# thin pool exceeds 700M, it is extended to 1.2G, and when it exceeds
# 840M, it is extended to 1.44G:
# thin_pool_autoextend_threshold = 70
# 
thin_pool_autoextend_threshold = 100

What's the downside of just leaving it at 100?

Thanks
Marc
-- 
"A mouse is a device used to point at the xterm you want to type in" - A.S.R.
Microsoft is to operating systems ....
                                      .... what McDonalds is to gourmet cooking
Home page: http://marc.merlins.org/                       | PGP 7F55D5F27AAF9D08
