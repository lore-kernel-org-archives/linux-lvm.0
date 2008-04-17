Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3HEwQWj026139
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2008 10:58:26 -0400
Received: from exprod7og106.obsmtp.com (exprod7og106.obsmtp.com [64.18.2.165])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3HEwDDR014358
	for <linux-lvm@redhat.com>; Thu, 17 Apr 2008 10:58:13 -0400
Received: from stephane by ant.artesyncp.com with local (Exim 4.69)
	(envelope-from <stephane@artesyncp.com>) id 1JmVYv-0007nv-Hz
	for linux-lvm@redhat.com; Thu, 17 Apr 2008 15:58:09 +0100
Date: Thu, 17 Apr 2008 15:58:09 +0100
From: Stephane Chazelas <stephane.chazelas@emerson.com>
Message-ID: <chaz20080417145809.GA20413@artesyncp.com>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] snapshotting to a different volume group
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

Hiya,

I hope you could help me on this:


in short:

is it possible to create a snapshot LV of an original LV
but in a different volume group?

or alternatively, what's the best way to bring up a LV in a VG
that is missing a PV (as in a disk crash) if that LV has all its
extents on still sane PVs?


in long:

basically, this is what I would like to do:

I have two disks, not as much as I would like, and I want:
  - to have 100GB of data mirrored (using Linux software raid
    (mdadm)) on 2 disks so that it survives disk crashs
  - to make a number of frequent snapshots of that data to
    be able to restore things in case of human errors.
  - (and I also want to have some "striped" storage space for
    worthless data).

BUT, I don't want to have the snapshot volumes mirrored.

My initial idea was to have 2 volume groups: a "safe" one with
only one /dev/md0 PV and an "unsafe" one with the striped LVs
and the snapshots.

However I couldn't find how to create snapshots of the LVs in
"safe" into the "unsafe" VG. It seems to me that it should be
possible, shouldn't it?

Anyway, then I merged the two "safe" and "unsafe" VGs into one
"vol" VG. Now I can make snapshots of the LV physically located
on /dev/md0 into the "unsafe" area.

But if one of the disks fails, /dev/md0 will still be available
but the "vol" VG won't be able to come up because of the other
missing PVs.

If such a thing happen, I can happily live with the missing
snapshots and "unsafe" storage for a while until I buy a
replacement HD, but how should I do about making sure that the
/dev/md0 filesystem is still available in the mean time?

Or is there a more straightforward way to achieve this that I
haven't thought of?

TIA,
Stephane
