Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4QLSrLd013266
	for <linux-lvm@redhat.com>; Fri, 26 May 2006 17:28:54 -0400
Received: from pug.qqx.org (pug.qqx.org [69.56.240.250])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4QLSrbI029184
	for <linux-lvm@redhat.com>; Fri, 26 May 2006 17:28:53 -0400
Date: Fri, 26 May 2006 16:28:52 -0500
From: Aaron Schrab <aaron@schrab.com>
Message-ID: <20060526212852.GD5883@pug.qqx.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Expand physical volume?
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi,

At work we have an LVM2 setup on top of software RAID1 on a system
running Debian's testing distribution.  Recently one of the drives
failed, and we decided to replace both drives with larger ones.

I'd like to simply grow the software RAID array, and have the LVM use
that, but I haven't found a way to extend a physical volume.  Is there a
way to do this, or do I need to create a second RAID array and use that
as an additional physical volume for the volume group?  The latter
option sounds rather unclean, especially if we'd migrate to still larger
drives a few more times.

Thanks in advance,
Aaron
