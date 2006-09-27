Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8R2vOt0000899
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 22:57:24 -0400
Received: from grunt6.ihug.co.nz (grunt6.ihug.co.nz [203.109.254.46])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8R2vMhi019118
	for <linux-lvm@redhat.com>; Tue, 26 Sep 2006 22:57:23 -0400
Date: Wed, 27 Sep 2006 14:57:16 +1200
From: Nick Wright <nick@lsd.net.nz>
Message-ID: <20060927025716.GB10619@highgate.net.nz>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Examining a snapshot
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

Hi all,

I have a backup strategy in place where I use snapshots to determine
the difference between yesterday and today. I then copy those blocks
that have changed to a target machine and apply the difference to a
remote copy of the entire block device. 

Currently this involves doing a complete comparison between a logical
volume and its snapshot to find the blocks that have changed. I know
that internally, LVM already has the information about which blocks
have been altered -- these are what are stored in the snapshot after
all.

Is it possible for me to get that information somehow? Some pointers
getting me started on this would be of great help to me -- especially
if theres a simple way to do so already in place before I go delving
into source code etc...



Thanks


Nick
