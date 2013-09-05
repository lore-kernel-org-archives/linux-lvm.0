Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r851oVS5021915
	for <linux-lvm@redhat.com>; Wed, 4 Sep 2013 21:50:32 -0400
Received: from mail-ob0-f181.google.com (mail-ob0-f181.google.com
	[209.85.214.181])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r851oUUZ028318
	for <linux-lvm@redhat.com>; Wed, 4 Sep 2013 21:50:30 -0400
Received: by mail-ob0-f181.google.com with SMTP id dn14so1318948obc.12
	for <linux-lvm@redhat.com>; Wed, 04 Sep 2013 18:50:29 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 4 Sep 2013 18:50:29 -0700
Message-ID: <CAP6YiSoMLa4OY2dcuHk3ju1mMiVRa-K031gfYwTuJ-rahb_8dw@mail.gmail.com>
From: David Lowe <j.david.lowe@gmail.com>
Subject: [linux-lvm] lvremove failing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Howdy -

I'm trying to get to the bottom of a nasty bug which is affecting our
production servers.

First, the problem. What we observe is that servers eventually fail
during lvremove, like so:

device-mapper: message ioctl on failed: Operation not permitted
 Unable to deactivate open lxc-lxc--pool_tdata (252:1)
 Unable to deactivate open lxc-lxc--pool_tmeta (252:0)
 Failed to deactivate lxc-lxc--pool-tpool
 Failed to resume lxc-pool.
 Failed to update thin pool lxc-pool.

Subsequent lvremove attempts fail ("One or more specified logical
volume(s) not found.") and subsequent attempts to lvcreate new
snapshots with the same origin fail similarly:

device-mapper: message ioctl on failed: Input/output error
 Unable to deactivate open lxc-lxc--pool_tdata (252:1)
 Unable to deactivate open lxc-lxc--pool_tmeta (252:0)
 Failed to deactivate lxc-lxc--pool-tpool
 Failed to resume lxc-pool.

At the same time, we see scary-looking device-mapper and filesystem
errors in syslog:

kernel: [23888.424530] Buffer I/O error on device dm-9, logical block 0
kernel: [23888.443368] attempt to access beyond end of device
kernel: [23888.497838] device-mapper: thin: process_bio:
dm_thin_find_block() failed: error = -5
kernel: [23888.550378] attempt to access beyond end of device

and:

kernel: [24123.428600] attempt to access beyond end of device
kernel: [24123.428843] attempt to access beyond end of device
kernel: [24123.428942] attempt to access beyond end of device
kernel: [24123.440876] attempt to access beyond end of device
kernel: [24123.442232] dm-0: rw=0, want=2150520, limit=491520)

I have not (so far) been able to reproduce this problem in isolation,
which is extremely frustrating... I'm hoping someone here will have a
clue what might be going on.

More information: the servers are ubuntu 13.04 (linux 3.8.0-29-generic) and lvm:
  LVM version:     2.02.98(2) (2012-10-15)
  Library version: 1.02.77 (2012-10-15)
  Driver version:  4.23.1

We had the same problems with LVM 2.02.95 (the one ubuntu packages for
raring) and we now build 2.02.98 from source, but the problem
persists.

Also interesting: this problem first appeared when we upgraded from
ubuntu 12.04 (lvm 2.02.66) to 13.04 (lvm 2.02.95). We haven't changed
the way we create/destroy volumes. (It is plausible that the problem
existed before the upgrades, but with very very different
symptoms...?)

Speaking of which, here's what we do:

(stuff to make a tmpfs-backed block device in /dev/loop0)

pvcreate /dev/loop0
vgcreate lxc /dev/loop0
lvcreate --extents "99%VG" --poolmetadatasize "240M" --thinpool lxc-pool lxc
lvcreate --name slave-image --virtualsize "20GB" --thin lxc/lxc-pool

(stuff to populate an ext4 filesystem into slave-image)

resize2fs /dev/lxc/slave-image
lvchange --permission r lxc/slave-image

... and then many many many instances of:

sync
lvcreate --name box${n} --snapshot lxc/lxc-pool
mkdir -p /mnt/box${n}
mount /dev/lxc/box${n} /mnt/box${n} -o noatime

(stuff to start lxc container mounting /mnt/box${n} and run arbitrary
code inside the lxc container... then, some minutes later, shut down
lxc and...)

umount -l /mnt/box${n}
lvremove -f /dev/lxc/box${n}

We do this several thousand times daily across dozens of servers.
About 2-3 times/day, we see the errors I originally described.

So, questions... is this a reasonable place to ask? Any ideas what
might be going wrong, or how I could go about reproducing the issue?
Any glaring flaws in the way we manage the volumes? Any further
information I can provide, or diagnostics I can run, or... well,
anything?

Thanks,
David Lowe
