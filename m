Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i7BFvSa15628
	for <linux-lvm@redhat.com>; Wed, 11 Aug 2004 11:57:28 -0400
Message-ID: <411A4182.C8A50168@gmx.net>
Date: Wed, 11 Aug 2004 17:55:46 +0200
From: Thomas Meller <thomas.meller@gmx.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] free space for cluster use
Reply-To: thomas.meller@gmx.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: Linux-LVM@Sistina.com

Is there any free sector that can be used by a cluster to store it's last lifesign in case
of a partitioned network?

I once had such a situation with a normal filesystem which was nasty enough.

I plan to write a sektor via dd, containing a flag "in use" and a timestamp to be updated
each minute.
Is there any space left on a pv or a raid1 disk?

I do not expect anyone to support this solution. (Solutions which work don't need support)

I could also use some space behind the MBR instead, but that means to be forced to create
partitions for lvm or raid.

Regards,

Thomas


-- 
Thomas Meller
mailto: thomas.meller@t-systems.ch
mailto: thomas.meller@gmx.net
----
...Our continuing mission: To seek out knowledge of C, to explore strange
UNIX commands, and to boldly code where no man page has ever been seen
