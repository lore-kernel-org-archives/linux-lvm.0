Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7D6AAa27005
	for <linux-lvm@redhat.com>; Fri, 13 Aug 2004 02:10:10 -0400
Received: from chaos.ao.net (root@chaos.ao.net [208.5.40.6])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i7D6A5e1011035
	for <linux-lvm@redhat.com>; Fri, 13 Aug 2004 02:10:10 -0400
Received: from chaos.ao.net (harik@localhost [127.0.0.1])
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) with ESMTP id i7D69wGK025805
	for <linux-lvm@redhat.com>; Fri, 13 Aug 2004 02:09:58 -0400
Received: (from harik@localhost)
	by chaos.ao.net (8.12.9/8.12.9/Debian-5) id i7D69wDV025804
	for linux-lvm@redhat.com; Fri, 13 Aug 2004 02:09:58 -0400
Date: Fri, 13 Aug 2004 02:09:58 -0400
From: Dan Merillat <dmerillat@sequiam.com>
Message-ID: <20040813060957.GA2920@chaos.ao.net>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2 + dm-mirror
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

Now that the snapshot and mirror targets are in the stock kernel, is it
possible to use LVM tools to setup a LVM-based RAID1?  I know how to do
it via dmsetup, but that's just not very clean.

I'd prefer to have the LV mirrored on multiple PVs, as it lets me scale
the mirrored slice as large as I want, rather then making a fixed RAID1
and putting the PV+LV on top of it.

This will also be nice to have when dm-raid[456] get added to the
kernel.  Imagine adding 2 drives, then doing a pmove to turn a
single-drive setup into a raid5.  That's the kind of thing that's 
handled very-well userspace: create a 'missing disk' raid-5, begin
writing to it, once you read enough out, start remapping the beginning
sectors to an optimal raid-5 config, with the mirror target making sure
any writes to the block device end up in the appropriate place.

--Dan
