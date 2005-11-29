Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jATIfAV21363
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:41:10 -0500
Received: from ramoth.dragonhold.org (ramoth.dragonhold.org [80.229.192.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jATIf1E9004761
	for <linux-lvm@redhat.com>; Tue, 29 Nov 2005 13:41:02 -0500
Received: from gwood by ramoth.dragonhold.org with local (Exim 4.50)
	id 1EhAPC-0000Xd-AK
	for linux-lvm@redhat.com; Tue, 29 Nov 2005 18:40:42 +0000
Date: Tue, 29 Nov 2005 18:40:42 +0000
From: Graham Wood <clvm@spam.dragonhold.org>
Subject: Re: [linux-lvm] Enterprise Backup Software with good support for LVM
Message-ID: <20051129184042.GC29763@dragonhold.org>
References: <dmi544$ckg$1@sea.gmane.org>
	<5493D77C6E101BAEDC2747FF@dhcp-2-206.wgops.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5493D77C6E101BAEDC2747FF@dhcp-2-206.wgops.com>
Sender: <gwood@dragonhold.org>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Nov 29, 2005 at 11:29:19AM -0700, Michael Loftis wrote:
> LVM provides a block level device.  However you don't want to back up there 
> anyway, you'll just end up with corrupt garbage.  You need to back up at 
> the filesystem level unless you're using your LVM LVs for Oracle or 
> something similar in which case the backup software needs to support that 
> by putting Oracle or the related application into the correct hot backup 
> mode before attempting to directly read the LVM data, as well as backing up 
> the transaction/redo logs.

Surely by using snapshots, a block level backup could be "OK".  You'd
need to (ideally) tell the file-system layer to put the machine into a
fit state to be snapshotted (quick & dirty, obviously issues with it,
you could remount it readonly, snapshot, and then mount read-write
again).  It's also going to backup dead space, which is going to waste
backup media (e.g. tape) at best, and leak information at worst.

If you have a journalling filesystem, then taking a snapshot of the
active device would probably be acceptable...  Not ideal, but depending
on the relative importance of getting a perfect backup/restore and
reducing the load on the system while the backup is being done, it might
be acceptable to most people.

Obviously if your backup solution can tie into the filesystem's own
backup utilities then you're going to get a better result, but for some
people that's not the important thing (and not an option in backup
utilities for others).

I know that dump/restore on solaris is unsafe to use on live partitions,
I can't see any reference within the dump man pages to see if the same
applies to linux, and have never used it in anger on an active
filesystem - old habits die hard, so I do my best to keep it inactive
when using it.

Graham
