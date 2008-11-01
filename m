Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mA1ARfKF007386
	for <linux-lvm@redhat.com>; Sat, 1 Nov 2008 06:27:41 -0400
Received: from odzwierny0.comarch.com (inptr-69-8.comarch.com [217.74.69.8])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mA1ARUEw014883
	for <linux-lvm@redhat.com>; Sat, 1 Nov 2008 06:27:31 -0400
Received: from localhost (localhost [127.0.0.1])
	authenticated as marcin.kaluza@comarch.pl
	by odzwierny0.comarch.com with esmtpa (ComArch ESMTP)
	id 1KwDhZ-000Coo-Rd
	for linux-lvm@redhat.com; Sat, 01 Nov 2008 11:27:29 +0100
Message-ID: <34299.89.200.148.101.1225535249.squirrel@wmail.comarch.com>
In-Reply-To: <490929E0.30301@hidden.domain.name>
References: <490678BE.1070700@hidden.domain.name>
	<08781647-26E4-46F3-B148-A64933B84363@redhat.com>
	<4907AF21.4030808@hidden.domain.name>
	<FDC38507-D7B2-4876-ABD5-3D595692EAC1@redhat.com>
	<490929E0.30301@hidden.domain.name>
Date: Sat, 1 Nov 2008 11:27:29 +0100 (CET)
From: marcin.kaluza@comarch.pl
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] snapshot cloning
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
To: LVM general discussion and development <linux-lvm@redhat.com>

There's another subject I'd like to raise here - snapshot cloning.
Since we use snapshots for copying our (large) oracle databases for
development and crash-test(especially crash test:) purposes, we needed to
come up with a way to clone snapshots.

By the way - it's a cool way to copy databases and it's being used in
solaris/zfs. For devel/(crash)testing it is great, because at little
storage expense you can very quickly copy very large databases (we
actually create snaps of live oracle databases(no archivelogs) and it
works;) I wonder why it's so rarely mentioned here - everybody seem to use
them as temporary backup snapshots only...

I haven't found a way to do it via lvm, but two ways without it. Both
assume than origin (vg00/test) and cloned snapshot(vg00/snap) are not
mounted or written to in any way.

I. the crude but simple way:

1) lvcreate -s -L orig_snap_size -n snapclone vg00/snap
Create a cloning target

2) dd if=/dev/mapper/vg00-snap-cow of=/dev/mapper/vg00-snapclone-cow bs=1M
count=percent_used
Copy the cow table from old to new snapshot. I assume, that since snapshot
cow tables are filled up incrementally,it'll be sufficient to copy just
the meaningful beginning instead of all useless data. This makes cloning a
30GB snapshot that is only 5% full very fast. Correct me if I'm wrong on
this.

3) lvchange -an vg00/test; lvchange -ay vg00/test
Make lvm reload new data for the cloned snapshot. I haven't found other
way to do it so far, so if you know any please let me know.

Done;)

The biggest drawback of this is than lvchange takes off line all other
snapshots as well (so all cloned DB's would have to be closed), and this
is evil;)

II. More elegant way. I've found a perl scipt posted on this list that was
used to restore the origin from a snapshot. It simply reads cow table
offsets and creates a set of dd commands to copy them from cow to the
origin. However replacing the origin with another just-made snapshot of it
creates a clone of the first one.

The drawback is that it uses dd's, so it launches enormous amount of
processes and creates a lot of scattered reads/writes for an actually
continuous area. And this'll probably be slow. But this can probably be
optimized.

However both origin and snapshot still have to be unmounted there's no
need to reload cow tables, so when the script is done, the clone is ready
to use.

III. Finally - the ultimate way ;) It's just an idea - how I imagine it
could work. Create clones on live snaps/lvs in a similar way pvmove works.

1) replace the cow-lv with a mirror target, that will create a copy of the
cow table and still allow it to be used during the operation. If possible,
mirror just enough from the beginnig, so that big snapshots with low %
usage clone quickly.
2) when it's done, suspend the origin and cloned snap to ensure data
cosistency
3) separate the mirrors
4) add a new snapshot entry with cow table on the just-mirrored lv.
5) resume normal operation

done:)

Am I wrong and it's not that simple? I don't know lvm/devmapper internals
yet... However, if it's the right way to go, I might try to write
something like this when I have some time to spare.

I think it's simpler than making snapshots of snapshots (from
implementation's point of view)

What do you think about it?
Martin
