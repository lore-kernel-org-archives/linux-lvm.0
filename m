Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0UJdm126125
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 14:39:48 -0500
Received: from rwcrmhc11.comcast.net (rwcrmhc11.comcast.net [204.127.192.81])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0UJdVGj016456
	for <linux-lvm@redhat.com>; Mon, 30 Jan 2006 14:39:36 -0500
Received: from seb (helo=highlab.com)
	by highlab.com with local-esmtp (Exim 4.50) id 1F3esb-0001Wr-7x
	for linux-lvm@redhat.com; Mon, 30 Jan 2006 12:40:01 -0700
Date: Mon, 30 Jan 2006 12:40:01 -0700
From: Sebastian Kuzminsky <seb@highlab.com>
Message-Id: <E1F3esb-0001Wr-7x@highlab.com>
Subject: [linux-lvm] while file system?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm building a disk server for a small company.  I'm using the standard
"RAID-array-as-PV" setup, and planning to grow the filesystem as needs
demand.  I'd like to use a filesystem that supports online grow and
online shrink.

XFS, JFS, and Reiser3 all support unlimited online grow but no shrink
at all.

Looks like Ext3 supports online grow, but only up to +16 GB, which
makes it useless on modern disks, much less arrays of modern disks....
Looks like offline grow & shrink are unlimited, which is good.  Lots of
old (unmaintained?) tools and kernel patches here, but lots of recent
activity too.  What's the current status?


-- 
Sebastian Kuzminsky
