Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAHGoPr10848
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 11:50:25 -0500
Received: from ms-smtp-05-eri0.texas.rr.com (ms-smtp-05.texas.rr.com
	[24.93.47.44])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAHGoJuR010401
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 11:50:19 -0500
Received: from tor.tx.mcbf.net (cs68203212-84.rgv.rr.com [68.203.212.84])
	by ms-smtp-05-eri0.texas.rr.com (8.12.10/8.12.7) with ESMTP id
	iAHGoGPa009404
	for <linux-lvm@redhat.com>; Wed, 17 Nov 2004 10:50:16 -0600 (CST)
Received: from adler.tx.mcbf.net ([10.10.10.11])
	by tor.tx.mcbf.net with esmtp (Exim 4.34) id 1CUT0Z-0004s7-Tv
	for linux-lvm@redhat.com; Wed, 17 Nov 2004 10:50:15 -0600
Subject: Re: [linux-lvm] Software RAID 5 Resizing and LVM
From: David Mohr <damailings@mcbf.net>
In-Reply-To: <1100647794.419a8d72734bb@webmail.slackguy.net>
References: <1100647794.419a8d72734bb@webmail.slackguy.net>
Date: Wed, 17 Nov 2004 10:49:50 -0600
Message-Id: <1100710190.311.44.camel@adler>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hi,

On Wed, 2004-11-17 at 09:29 +1000, adam@slackguy.net wrote:
> I've been playing around with adding disks to a software RAID 5 array, and it
> works fine.  However, i have LVM running over the top of that and i can't
> figure out how to enlarge the Phisical Volume to encompass the newly added
> capacity on the raid device.  Has anyone achieved this at all?
Please look through the archive, just a couple of days ago there was a
thread started about this topic (expanding a PV on a hardware raid).

> Am I barking up the wrong tree here? If so, how would you go about adding drives
> to a software RAID 5 device, and actually adding the new space to the filesystem
> inside the RAID device?
Resizing the filesystem is completely LVM unrelated and depends on the
actual filesystem used (resize2fs, resize_reiserfs, ...)

~David
