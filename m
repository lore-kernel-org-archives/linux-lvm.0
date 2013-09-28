Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r8SKTYkB023692
	for <linux-lvm@redhat.com>; Sat, 28 Sep 2013 16:29:34 -0400
Received: from Ishtar.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8SKTV3o016989
	for <linux-lvm@redhat.com>; Sat, 28 Sep 2013 16:29:32 -0400
Received: from [192.168.4.12] (Athenae [192.168.4.12])
	by Ishtar.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	r8SKTOUX001856
	for <linux-lvm@redhat.com>; Sat, 28 Sep 2013 13:29:28 -0700
Message-ID: <52473C24.5060606@tlinx.org>
Date: Sat, 28 Sep 2013 13:29:24 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Bug: 'cow' partitions for old active snapshots are not
	reliably removed.
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I create snapshots of my Home partition.  After a day, I create a new snapshot, 
and use rsync to determine the diffs that occurred since the last snapshot, 
then remove the 'active snapshot', and copy the diffs to a new, static
partition that is sized for the size of the diffs that were found.  This 
leaves me with a partition that holds changes for the given date.

A "cow" is created for each active snap.  When I stop the active shapshot
and later delete it (replacing it with a normal, non-active partition
by the same name), I notice that none of the "cow" partitions are deleted
when I remove the old 'active' the old snapshot. It seems this is an
oversight -- i.e. -- the 'cow' partitions are no longer needed since there
is no active snapshot.  What's worse that 'dm' reuses old active snap names,
so some of the old 'cow' partitions point to new partitions that are unrelated
to the old active snap.

In addition, old snapshots are "pruned" based on age.  They are not pruned via
a simple "delete oldest", but by some number of snaps that I wish to keep for
a given age

Example:
...
lrwxrwxrwx 1       7 Sep 28 05:09 HnS-Home -> ../dm-3 (origin; static)
lrwxrwxrwx 1       8 Sep  4 08:55 HnS-Home--2013.08.28--04.07.02 -> ../dm-20 (reused)
lrwxrwxrwx 1       7 Sep  6 04:07 HnS-Home--2013.09.04--04.07.03-cow -> ../dm-4 (reused)
lrwxrwxrwx 1       8 Sep  7 04:07 HnS-Home--2013.09.06--04.07.03-cow -> ../dm-19 (reused)
lrwxrwxrwx 1       8 Sep  8 04:07 HnS-Home--2013.09.07--04.07.03-cow -> ../dm-21 (reused)
lrwxrwxrwx 1       8 Sep  9 04:07 HnS-Home--2013.09.08--04.07.02-cow -> ../dm-19 (reused)
lrwxrwxrwx 1       8 Sep 10 05:29 HnS-Home--2013.09.09--04.07.03 -> ../dm-21 (static)
lrwxrwxrwx 1       8 Sep 10 04:07 HnS-Home--2013.09.09--04.07.03-cow -> ../dm-23 (reused)
lrwxrwxrwx 1       8 Sep 11 04:07 HnS-Home--2013.09.10--04.07.02-cow -> ../dm-26 (reused)
lrwxrwxrwx 1       8 Sep 13 04:07 HnS-Home--2013.09.12--04.07.03-cow -> ../dm-26 (reused)
lrwxrwxrwx 1       7 Sep 14 05:00 HnS-Home--2013.09.13--04.07.03 -> ../dm-4 (static)
lrwxrwxrwx 1       8 Sep 14 04:07 HnS-Home--2013.09.13--04.07.03-cow -> ../dm-24 (invalid)
lrwxrwxrwx 1       8 Sep 16 06:13 HnS-Home--2013.09.15--04.07.03 -> ../dm-14 (static)
lrwxrwxrwx 1       8 Sep 17 04:07 HnS-Home--2013.09.16--04.07.03-cow -> ../dm-26 (reused)
lrwxrwxrwx 1       8 Sep 18 05:22 HnS-Home--2013.09.17--04.07.04 -> ../dm-16 (static)
lrwxrwxrwx 1       8 Sep 18 04:07 HnS-Home--2013.09.17--04.07.04-cow -> ../dm-24 (invalid)
lrwxrwxrwx 1       8 Sep 19 04:07 HnS-Home--2013.09.18--04.07.03-cow -> ../dm-26 (reused)
lrwxrwxrwx 1       8 Sep 20 04:58 HnS-Home--2013.09.19--04.07.03 -> ../dm-19 (static)
lrwxrwxrwx 1       8 Sep 20 04:07 HnS-Home--2013.09.19--04.07.03-cow -> ../dm-24 (invalid)
lrwxrwxrwx 1       8 Sep 21 05:02 HnS-Home--2013.09.20--04.07.03 -> ../dm-25 (static)
lrwxrwxrwx 1       8 Sep 21 04:07 HnS-Home--2013.09.20--04.07.03-cow -> ../dm-26 (reused)
lrwxrwxrwx 1       8 Sep 22 05:00 HnS-Home--2013.09.21--04.07.03 -> ../dm-18 (static)
lrwxrwxrwx 1       8 Sep 22 04:07 HnS-Home--2013.09.21--04.07.03-cow -> ../dm-24 (invalid)
.....
The ones marked 'invalid' are dangling symlinks.  The ones marked 'reused', 
exist and usually point to some other non-cow partition (a static partition).
FWIW, the names are in Vol/subvol-date-time format (a format that works
with MS's snapshot names and allows a user to find previous versions of files that
have changed since that date.

While cow partitions are not normally mounted, they seem to be potential future
problems and at best, are dangling symlinks that aren't cleaned up and sometimes 
point to new, valid data.

How is it that they are not deleted when I close and delete the active snapshot that
corresponds to them.  I can modify my "snapper" to manually delete 'cow' 
partitions, but this seems like a "hack" that should be unnecessary.

I'm assuming these "should" not be there, as they are no longer valid?

Thanks!
