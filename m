Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9EIIwr08028
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 14:18:58 -0400
Received: from mail2.swivel.net (mail2.swivel.net [216.187.102.8])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i9EIIlkL019048
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 14:18:48 -0400
Received: from [172.17.17.17] (S010600c0261186f5.vc.shawcable.net
	[24.81.141.89])
	by mail2.swivel.net (Postfix) with ESMTP id 088522BA78
	for <linux-lvm@redhat.com>; Thu, 14 Oct 2004 18:08:09 +0000 (GMT)
From: Liam Helmer <lists@strongboxlinux.com>
In-Reply-To: <416E3889.3090207@cru.fr>
References: <416E3889.3090207@cru.fr>
Date: Thu, 14 Oct 2004 11:18:41 -0700
Message-Id: <1097777922.15920.77.camel@vdesktop.fast1.strongboxlinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshot Support
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I'm seeing a lot of messages about snapshots sort of working... I should
relay my experience here.

I did some testing with Snapshots in 2.6.8.1, and came up with variable
results. Here's some stuff I found:

reiserfs works badly with read/write snapshots: writing to both the main
filesystem and the snapshot hangs the filesystems permanently (even
after writing stops), and stops LVM from being able to assign more
snapshots/space/etc until a full reboot.

ext3 works OK, albeheit with a definite CPU hit. I tried low-level loads
and it didn't crash, which was certainly better than with reiserfs.

I didn't try a whole lot of other filesystems though. Generally, it
didn't seem quite stable enough, so I decided to wait a few iterations
before working with it seriously. Does anyone know the status of work in
this area? Or if there's some more patches waiting in -mm?

Cheers,
Liam

-- 

StrongBox Linux
http://www.strongboxlinux.com
"Making Security Friendly"
