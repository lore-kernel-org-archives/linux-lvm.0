Return-Path: <lars@larsshack.org>
Date: Fri, 16 Mar 2001 19:43:15 -0500 (EST)
From: Lars Kellogg-Stedman <lars@larsshack.org>
In-Reply-To: <20010316142244.A5505@sistina.com>
Message-ID: <Pine.LNX.4.30.0103161936340.4654-100000@flowers.house.larsshack.org>
MIME-Version: 1.0
Subject: [linux-lvm] LVM vs. /proc/partitions
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I suspect that this has been covered before, but after searching through
the FAQ and the mailing list archives I haven't found a good answer.

I have a single logical volume configured on my system.  I'm running 2.4.2
w/ lvm 0.9.1beta6, devfs, and SGI's xfs patches.  /proc/partition looks
like this (I've only included the first four columns for brevity):

  9 0 8887040 md0
  58 0 8884224 lvma
  8 0 4444462 scsi/host0/bus0/target1/lun0/disc
  8 16 4444462 scsi/host0/bus0/target2/lun0/disc
  [...]

The problem here is obvious -- there isn't a device file, anywhere, called
'lvma'.  There is, on the other hand, /dev/vg0/vol0.  Would making the
value displayed in /proc/partitions match the (devfs) device node require
significant work?

Incidentally, you'll not that the raid code has the same problem -- "md0"
should be "md/0", but at least with the md stuff it's possible to
automatically create compatability entries in /dev.

Other than that, my xfs on top of LVM on top of raid5 has been working
smoothly now for several days.  Great work!

-- Lars

-- 
Lars Kellogg-Stedman <lars@larsshack.org>
