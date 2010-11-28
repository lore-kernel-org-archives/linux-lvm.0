Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oASFVtue008988
	for <linux-lvm@redhat.com>; Sun, 28 Nov 2010 10:31:55 -0500
Received: from mail-ww0-f46.google.com (mail-ww0-f46.google.com [74.125.82.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oASFVLOi006907
	for <linux-lvm@redhat.com>; Sun, 28 Nov 2010 10:31:52 -0500
Received: by mail-ww0-f46.google.com with SMTP id 28so3577030wwb.27
	for <linux-lvm@redhat.com>; Sun, 28 Nov 2010 07:31:51 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>
References: <AANLkTimTYse7vnqZydc1Z5z60vNuQw3juj7J_W7+bQEm@mail.gmail.com>
Date: Sun, 28 Nov 2010 22:31:51 +0700
Message-ID: <AANLkTimGkMJGiJC+7L+Pu3+yf-J_s0Ex3hM2-g-0+UqQ@mail.gmail.com>
From: hansbkk@gmail.com
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Q: LVM over RAID,
	or plain disks? A:"Yes" = best of both worlds?
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

�- - - - - - My abject apologies to all for improper addressing in my
previous messages (thanks to all those who set me straight :)

Hope you're all still willing to consider my request for feedback.
Start with a bit of context:

- SAN/NAS (call it FILER-A) hosting say a dozen TB and servicing a few
dozen client machines and servers, mostly virtual hosts. Another,
larger (FILER-B - still just tens of TB) host's drives are used for
storing backup sets, via not only Amanda, but also filesystems
comprising gazillions of hard-linked archive sets created by (eg)
rdiff-backup, rsnapshot and BackupPC. We're on a very limited budget,
therefore no tape storage for backups.

- I plan to run LVM over RAID (likely RAID1 or RAID10) for IMO an
ideal combination of fault tolerance, performance and flexibility.

- I am not at this point overly concerned about performance issues -
reliability/redundancy and ease of recovery are my main priorities.


Problem:

For off-site data rotation, the hard-linked filesystems on FILER-B
require full filesystem cloning with block-level tools rather than
file-level copying or sync'ing. My current plan is to swap out disks
mirrored via RAID, marking them as "failed" and then rebuilding using
the (re-initialized) incoming rotation set.

HOWEVER - the use of LVM (and possibly RAID10) adds complexity to the
filesystems, which makes disaster recovery from the detached disk sets
much more difficult than regular partitions on physical disks.


Theoretical solution:

Use RAID1 on the "top layer" to mirror the data stored in an LVM (set
of) disk(s) on the one hand (call it TopRAID1) to ***regular
partitions*** on actual physical disks on the other (call this the
TopRAID2 side).


(ASCII art best viewed with a monospaced font)

"TopRAID1" side
�______________________________________
| � � � � � � � �LVM VG � � � � � � � �|
| �_____ � _____________ � __________ �|
| | LV1 | | � � LV2 � � | | � �LV3 � | |
| | � � | | � � � � � � | | � � � � �| |
| | � � | | � � � � � � | | � � � � �| |
| | � � | | � � � � � � | | � � � � �| |
| | � � | | � � � � � � | | � � � � �| |
| | � � | | � � � � � � | | � � � � �| |
| |_____| |_____________| |__________| |
|____v___________v______________v______|
� � v � � � � � v � � � � � � �v
� � v � � � � � v � � � � � � �v
� RAID1 � � � RAID1 � � � � �RAID1
� � v � � � � � v � � � � � � �v
� __v__ � ______v______ � _____v____
�| HD1 | | � � HD2 � � | | � �HD3 � |
�| � � | | � � � � � � | | � � � � �|
�| � � | | � � � � � � | | � � � � �|
�| � � | | � � � � � � | | � � � � �|
�| � � | | � � � � � � | | � � � � �|
�| � � | | � � � � � � | | � � � � �|
�|_____| |_____________| |__________|

"TopRAID2" side

The mirroring at the top level would be set up between the individual
LVs on the TopRAID1 side and regular filesystem partitions (no RAID or
LVM) on the TopRAID2 side. In the event of a massive host failure, the
filesystems on the TopRAID2 side could be easily mounted for data
recovery and/or service resumption on another machine, and the
TopRAID1 disk set rebuilt from scratch and then re-mirrored from the
TopRAID2 disks.

One design goal would be to not allow any LV to get so large that it
won't fit on a single physical disk on the TopRAID2 side. If this is
not possible, then the corresponding TopRAID2 side would need to
comprise a multiple disk set, perhaps striped by RAID0 - not as
straightforward to recover as single disks, but at least without the
LVM layer.

Remember, the main purpose of this arrangement is so that the disks in
the TopRAID2 set can be rotated out for offsite storage. Ideally this
would be done by using an extra identical set (TopRAID2a and
TopRAID2b) to minimize the time windows when the live data is running
on TopRAID1 only.

Note that on the TopRAID1 side the LVM layers could be running on top
of another set of RAID disks (call it the BottomRAID), again either
RAID1 or perhaps RAID10 mirroring at the lowest layer. This disk set
could be allowed to grow in both size and complexity, with an
expectation that in the event of massive failure I won't even attempt
to rebuild/recover it, just tear it down and set it up again from
scratch, then mirror the data back from TopRAID2.

At this point this is all idle speculation on my part, and although I
think the technology makes it possible, I don't know whether it is a
practical scheme.

An enhancement of this idea would be to implement the "TopRAID" with a
full-server mirror using drdb and heartbeat, perhaps eliminating the
need for intra-server disk mirroring. In this case the TopRAID1 server
would have the flexibile disk space allocation of LVM, while the
TopRAID2 server's disks would all be just regular partitions (no LVM),
again, easily swapped out for offsite rotation.

Any feedback on these ideas would be most appreciated.
