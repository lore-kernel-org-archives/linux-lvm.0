Date: Tue, 3 Jun 2008 15:26:41 -0400 (EDT)
From: Mikulas Patocka <mpatocka@redhat.com>
Message-ID: <Pine.LNX.4.64.0806031516380.20514@engineering.redhat.com>
MIME-Version: 1.0
Subject: [linux-lvm] ANNOUNCE: an experimental implementation of snapshot
	merging
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: Alasdair G Kergon <agk@redhat.com>, Milan Broz <mbroz@redhat.com>

Hi

Here I release the first experimental implementation of snapshot merging. 
Merging allows you to copy data in snapshot back to the origin device. 
Once merging starts, it runs on background. When the merging finishes (you 
see "0%" with "lvs" command), you should remove the merging snapshot with 
lvremove command.

The userspace will still be changed, the kernel is already finished (there 
are no known bugs in the kernel, I'm curious about the unknown ones :)

Merging is initiated with "lvconvert -M vg/lv_snapshot" command. When you 
initiate merging, make sure that the origin device is not mounted. 
Snapshot can be mounted while it's merging is initiated.

During merging, aby reads and writes to the origin device are identical to 
accesses to the merging snapshots.

There may be multiple snapshots while one of them is being merged --- 
exceptions in other snapshots are being allocated and there snapshots are 
kept stable.

Don't try to concurrently merge more than one snapshot (the kernel refuses 
to do it, the userspace tools don't know about it --- the userspace will 
be rewritten anyway).

The patches are at:
http://people.redhat.com/mpatocka/patches/
The patches are for 2.6.26-rc4

(besides merging, there are some other bugfixes, I made for the kernel)

Mikulas
