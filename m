Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id v1F0h2kf019345
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 14 Feb 2017 19:43:03 -0500
Received: from mail.jabberwocky.com (walrus.jabberwocky.com [173.9.29.57])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7ABA61D2F
	for <linux-lvm@redhat.com>; Wed, 15 Feb 2017 00:43:01 +0000 (UTC)
Received: from grover.home.jabberwocky.com (grover.home.jabberwocky.com
	[172.24.84.28])
	by mail.jabberwocky.com (Postfix) with ESMTPSA id 3B58E20715E3
	for <linux-lvm@redhat.com>; Tue, 14 Feb 2017 19:33:48 -0500 (EST)
From: David Shaw <dshaw@jabberwocky.com>
Mime-Version: 1.0 (Mac OS X Mail 10.2 \(3259\))
Message-Id: <3008DC9C-0686-4582-9A58-0BD1B5F7ACC2@jabberwocky.com>
Date: Tue, 14 Feb 2017 19:33:47 -0500
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM thin pool advice
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
To: linux-lvm@redhat.com

Hello,

I'm currently using regular non-thin snapshots for a backup project.  I'm looking for some advice on using thin snapshots, as I want to get the benefit of the performance improvements of thin snapshots.

For my usage, it's a single volume that has at most one snapshot at a time, and so plan is to have a thin pool with a single thin volume in it.  The volume virtual size will always be less than the thin pool size.

My concerns are around the behavior when/if the pool runs out of space.  The goal is to never prevent writes to the main volume.  I'm fine if the snapshot fails in some manner (I'm used to that from when the COW space runs out in the non-thin snapshots), but I don't want to ever block new writes to the main volume.

Is there some way to cap the amount of data that the snapshot can allocate from the pool?  Also, is there some way to allocate enough metadata space that it can't run out?  By way of analogy, using the old snapshot system, if the COW is sufficiently large (larger than the volume being snapshotted), it cannot overflow because even if every block of the original volume is dirtied, the COW can handle all of it.  Is there some similar way to size the metadata space of a thin pool such that overflow is "impossible"?

I'm using Centos 7.3, so:

# lvm version
  LVM version:     2.02.166(2)-RHEL7 (2016-11-16)
  Library version: 1.02.135-RHEL7 (2016-11-16)
  Driver version:  4.34.0

# uname -r
3.10.0-514.6.1.el7.x86_64

Thanks for any advice,

David
