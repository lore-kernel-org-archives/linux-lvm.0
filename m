Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i38IIej16390
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 14:18:40 -0400
Received: from smtp-relay.dca.net (smtp-relay.dca.net [216.158.48.66])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i38IIaMC026642
	for <linux-lvm@redhat.com>; Thu, 8 Apr 2004 14:18:36 -0400
Received: from earth.solarsys.private
	(adsl-216-158-52-153.cust.oldcity.dca.net [216.158.52.153])
	by smtp-relay.dca.net (Postfix) with ESMTP id E52B9317D22
	for <linux-lvm@redhat.com>; Thu,  8 Apr 2004 14:18:10 -0400 (EDT)
Date: Thu, 8 Apr 2004 14:18:35 -0400
From: "Mark M. Hoffman" <mhoffman@lightlink.com>
Message-ID: <20040408181835.GA11818@earth.solarsys.private>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] snapshots and reiserfs
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello:

Sometimes, but not always, I am unable to mount a snapshot.
When it fails, I see the following lines in my logs...

kernel: reiserfs: checking transaction log (device 3a:06) ...
kernel: clm-2076: device is readonly, unable to replay log
kernel: Replay Failure, unable to mount
kernel: reiserfs_read_super: unable to initialize journal space

I am using RedHat 9 with the following stock packages:

kernel-smp-2.4.20-30.9
lvm-1.0.3-12
reiserfs-utils-3.6.4-5

I have not tried the combination of snapshots & reiserfs with
earlier RedHat packages so I don't know if this is a regression.

After some STFW, I thought I might need a "VFS lock" patch.
However, it looks like this was already included by RedHat...
in kernel-smp-2.4.20-30.9.src.rpm there is already this patch:
linux-2.4.18-lvm-VFSlock.patch.

Is there anything else I can try or look at?

Also, is it necessary that the filesystem be quiescent in order to
create a snapshot?  I could temporarily remount readonly to create
the snapshot, but I would like not to have to do that.

Thanks and regards,

-- 
Mark M. Hoffman
mhoffman@lightlink.com
