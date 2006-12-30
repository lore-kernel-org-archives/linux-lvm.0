Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBU6JVPn023835
	for <linux-lvm@redhat.com>; Sat, 30 Dec 2006 01:19:31 -0500
Received: from irobot.com (smtp1.irobot.com [66.238.211.203])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBU6JVjS031241
	for <linux-lvm@redhat.com>; Sat, 30 Dec 2006 01:19:31 -0500
Message-ID: <459604DF.9050404@hacksaw.org>
Date: Sat, 30 Dec 2006 01:19:11 -0500
From: Hacksaw <hacksaw@hacksaw.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Hot backup for boot/root disk
References: <45942F64.9050502@hacksaw.org> <4595CC40.2040500@adelphia.net>
In-Reply-To: <4595CC40.2040500@adelphia.net>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Toby Bluhm wrote:
>
> Some people like using LVM for system/OS disks - I don't. So I would
> ditch the LVM and use software raid1. I don't understand why you
> wouldn't want the disks to be constantly in sync. What if they're out of
> sync when a disk dies? However, you could break and rebuild the mirror
> at your whim when using sw raid.
>
With the scheme where the main data (user dir's and databases) are on 
the data disks, the OS shouldn't change very often. The more likely 
scenario is that something really dumb has been perpetrated on the OS 
disk, and you'd like to be able to recover from that. With continuous 
syncing, what you have is two volumes messed up in the same way.

With the data volume, I'd actually have mirror or at least RAID it, and 
have snapshots. At least, that the plan.
