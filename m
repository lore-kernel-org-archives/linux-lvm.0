Message-Id: <3.0.6.32.20020408155317.0090b210@pop3.bmlv.gv.at>
From: "Ph. Marek" <marek@bmlv.gv.at>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Subject: [linux-lvm] ext3 on an logical volume - snapshot using how?
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
Date: Mon Apr  8 08:49:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Transfer-Encoding: 7bit
To: ext3-users@redhat.com, linux-lvm@sistina.com

Hi everybody!

I'm using LVM and ext3 and am very satisfied with it.


But now I have the following problem:
I have a filesystem on a LV which is in use -
files are created, modified and so on.
To do a backup I'd like to create a snapshot
of this volume which gets backup'd  and then dropped.

	 # lvcreate -s -L 20M -n snapshot /dev/vg/data
	lvcreate -- WARNING: the snapshot will be automatically disabled once it gets full
	lvcreate -- INFO: using default snapshot chunk size of 64.00 KB for "/dev/vg/snapshot"
	lvcreate -- doing automatic backup of "vg"
	lvcreate -- logical volume "/dev/vg/snapshot" successfully created

So far, so good.
Now I want to mount that filesystem - after all, it's 
possible several GB of which only parts are used.

(statements mixed with output in /var/log/messages ">")

	 # mount /dev/vg/snapshot /mnt/tmp/
	mount: block device /dev/vg/snapshot is write-protected, mounting read-only
	mount: wrong fs type, bad option, bad superblock on /dev/vg/snapshot,
	       or too many mounted file systems
	> EXT2-fs: lvm(58,12): couldn't mount because of unsupported optional features (4).

	 # mount /dev/vg/snapshot /mnt/tmp/ -t ext3
	mount: block device /dev/vg/snapshot is write-protected, mounting read-only
	mount: wrong fs type, bad option, bad superblock on /dev/vg/snapshot,
	       or too many mounted file systems
	> EXT3-fs: INFO: recovery required on readonly filesystem.
	> EXT3-fs: write access unavailable, cannot proceed.

So looking in the kernel sources I find some mount-options ...

	 # mount /dev/vg/snapshot /mnt/tmp/ -t ext3 -o ro,errors=remount-ro
	mount: wrong fs type, bad option, bad superblock on /dev/vg/snapshot,
	       or too many mounted file systems
	> EXT3-fs: INFO: recovery required on readonly filesystem.
	> EXT3-fs: write access unavailable, cannot proceed.

	 # mount /dev/vg/snapshot /mnt/tmp/ -t ext3 -o ro,errors=remount-ro,noload
	mount: wrong fs type, bad option, bad superblock on /dev/vg/snapshot,
	       or too many mounted file systems
	> ext3: No journal on filesystem on lvm(58,12) 

If the snapshot wasn't ro I'd do a tune2fs or e2fsck or something.

So can somebody please drop me a hint?
Is that not possible?


Thanks in advance!!


Regards,

Phil
