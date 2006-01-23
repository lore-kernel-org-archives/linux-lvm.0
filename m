Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0NN2u111984
	for <linux-lvm@redhat.com>; Mon, 23 Jan 2006 18:02:56 -0500
Received: from out-of-band.media.mit.edu (out-of-band.media.mit.edu
	[18.85.16.22])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0NN2ewa020885
	for <linux-lvm@redhat.com>; Mon, 23 Jan 2006 18:02:40 -0500
Date: Mon, 23 Jan 2006 18:02:39 -0500 (EST)
Message-Id: <200601232302.SAA22735@out-of-band.media.mit.edu>
From: f-lvm@media.mit.edu
In-reply-to: <20060123223516.GN4280@agk.surrey.redhat.com> (message from
	Alasdair G Kergon on Mon, 23 Jan 2006 22:35:16 +0000)
Subject: [linux-lvm] pvcreate can't use entire disk?
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com
Cc: aj@terrascale.com, f-lvm@media.mit.edu

    Date: Mon, 23 Jan 2006 22:35:16 +0000
    From: Alasdair G Kergon <agk@redhat.com>

    On Mon, Jan 23, 2006 at 05:26:00PM -0500, f-lvm@media.mit.edu wrote:
    > "Device /dev/hdd not found."  The disk is surely online:  I can

    > I would have -expected- pvcreate to complain about a partition table
    > existing 

    The currrent internal structure of LVM2 makes that difficult.
    Add -vvvv to commands for more information like that.

    Invalid devices are filtered out at a low level in the libraries
    so tools such as 'pvcreate' never see them.

    If your disk has a partition table, then LVM2 insists you use those
    partitions to reduce the risk of accidents.

Ah.  That's directly contrary to the LVM2 howto at
http://www.tldp.org/HOWTO/LVM-HOWTO/initdisks.html,
which says, "If you get an error that LVM can't initialize
a disk with a partition table on it, ..." etc.

The manpage also doesn't claim that not erasing an existing partition
table will cause pvcreate to simply fail as if the hardware is
offline---pvcreate should warn!  (And, as if obvious from -vvvv (which
is -also- undocumented!  Only -v and --verbose are documented, but not
their repetition to get more info), pvcreate knew damned well what was
going on---but didn't tell -me-.  Well, okay, maybe some library
beneath pvcreate knew and didn't tell pvcreate, but in that case,
we certainly had incomplete and/or misleading documentation in two
places.)

Is this a problem with pvcreate in its original instantiation, or with
a Debian version, or with Ubuntu?  I'm planning on bugreporting this
to Ubuntu anyway, but it'd be nice if it made its way upstream as
expeditiously as possible.  (And I'm CC'ing the HOWTO author
directly.)

[And why was I in this situation?  Because I'm -very- cautious about
things that might wipe entire disks, and I wanted to verify that
pvcreate failed as documented before giving it the go-ahead.
Apparently, though, the documentation mislead me...]

Anyway, thanks!

    > (at which point I would have zeroed it and tried again)

    Did you try that?
    (And then you might need to run 'vgscan'.)

Yes, I tried zeroing the first 1k, and -now- pvcreate apparently works
fine.  vgscan only returned my original VG, but that makes sense,
since I haven't tried to actually instantiate a VG on the new disk
yet.  Transcripts of failing and working case below:

~# pvcreate /dev/hdd
  Device /dev/hdd not found.

~# strings /dev/hdd | head -1
LILO

~# dd if=/dev/hdd bs=512 count=1
[ . . . random garbage deleted so it won't gronk your mailreader . . . ]
1+0 records in
1+0 records out
512 bytes transferred in 0.000133 seconds (3846551 bytes/sec)

~# pvcreate --version
  LVM version:     2.01.04 (2005-02-09)
  Library version: 1.01.03 (2005-06-13)
  Driver version:  4.4.0

~# pvcreate -vvvv /dev/hdd
#lvmcmdline.c:835         Processing: pvcreate -vvvv /dev/hdd
#lvmcmdline.c:838         O_DIRECT will be used
#config/config.c:773       Setting global/locking_type to 1
#config/config.c:758       Setting global/locking_dir to /var/lock/lvm
#locking/locking.c:137       File-based locking enabled.
#locking/file_locking.c:162       Locking /var/lock/lvm/P_orphans WB
#device/dev-cache.c:206         /dev/hdd: Added to device cache
#device/dev-io.c:376         Opened /dev/hdd RO
#device/dev-io.c:250       /dev/hdd: size is 390721968 sectors
#device/dev-io.c:308         WARNING: /dev/hdd already opened read-only
#device/dev-io.c:407         Closed /dev/hdd
#device/dev-io.c:376         Opened /dev/hdd RW
#device/dev-io.c:134         /dev/hdd: block size is 4096 bytes
#filters/filter.c:109         /dev/hdd: Skipping: Partition table signature found
#metadata/metadata.c:834         <backtrace>
#filters/filter-persistent.c:216         /dev/hdd: Skipping (cached)
#pvcreate.c:81   Device /dev/hdd not found.
#locking/file_locking.c:59       Unlocking /var/lock/lvm/P_orphans
#device/dev-io.c:407         Closed /dev/hdd

~# dd if=/dev/hdd of=hdd.1k bs=1k count=1
1+0 records in
1+0 records out
1024 bytes transferred in 0.004259 seconds (240427 bytes/sec)

~# dd if=/dev/zero of=/dev/hdd bs=1k count=1
1+0 records in
1+0 records out
1024 bytes transferred in 0.000137 seconds (7478965 bytes/sec)

~# blockdev --rereadpt /dev/hdd

~# pvcreate -vvvv /dev/hdd
#lvmcmdline.c:835         Processing: pvcreate -vvvv /dev/hdd
#lvmcmdline.c:838         O_DIRECT will be used
#config/config.c:773       Setting global/locking_type to 1
#config/config.c:758       Setting global/locking_dir to /var/lock/lvm
#locking/locking.c:137       File-based locking enabled.
#locking/file_locking.c:162       Locking /var/lock/lvm/P_orphans WB
#device/dev-cache.c:206         /dev/hdd: Added to device cache
#device/dev-io.c:376         Opened /dev/hdd RO
#device/dev-io.c:250       /dev/hdd: size is 390721968 sectors
#device/dev-io.c:308         WARNING: /dev/hdd already opened read-only
#device/dev-io.c:407         Closed /dev/hdd
#device/dev-io.c:376         Opened /dev/hdd RW
#device/dev-io.c:134         /dev/hdd: block size is 4096 bytes
#filters/filter-composite.c:31         Using /dev/hdd
#label/label.c:186       /dev/hdd: No label detected
#label/label.c:278         <backtrace>
#device/dev-io.c:250       /dev/hdd: size is 390721968 sectors
#config/config.c:778       metadata/pvmetadatasize not found in config: defaulting to 255
#config/config.c:778       metadata/pvmetadatacopies not found in config: defaulting to 1
#device/dev-io.c:250       /dev/hdd: size is 390721968 sectors
#device/dev-io.c:535         Wiping /dev/hdd at sector 4 length 8 sectors
#pvcreate.c:207     Set up physical volume for "/dev/hdd" with 390721584 available sectors
#label/label.c:209       Scanning for labels to wipe from /dev/hdd
#pvcreate.c:216     Zeroing start of device /dev/hdd
#device/dev-io.c:535         Wiping /dev/hdd at sector 0 length 4 sectors
#pvcreate.c:227       Writing physical volume data to disk "/dev/hdd"
#format_text/format-text.c:1039         Creating metadata area on /dev/hdd at sector 4 size 380 sectors
#label/label.c:326       /dev/hdd: Writing label to sector 1
  Physical volume "/dev/hdd" successfully created
#locking/file_locking.c:59       Unlocking /var/lock/lvm/P_orphans
#device/dev-io.c:407         Closed /dev/hdd

~# 
