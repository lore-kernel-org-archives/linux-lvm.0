Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kABD3sWW001994
	for <linux-lvm@redhat.com>; Sat, 11 Nov 2006 08:03:54 -0500
Received: from bluewhale.planbit.co.uk (82-71-36-240.dsl.in-addr.zen.co.uk
	[82.71.36.240])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kABD3p0R026470
	for <linux-lvm@redhat.com>; Sat, 11 Nov 2006 08:03:52 -0500
Received: from wolverine (unknown [192.168.1.127])
	by bluewhale.planbit.co.uk (Postfix) with ESMTP id D3F6F12EE1
	for <linux-lvm@redhat.com>; Sat, 11 Nov 2006 13:03:42 +0000 (GMT)
From: "Roger Lucas" <roger@planbit.co.uk>
Date: Sat, 11 Nov 2006 13:05:41 -0000
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20061111130342.D3F6F12EE1@bluewhale.planbit.co.uk>
Subject: [linux-lvm] Contents of read-only LVM snapshot change
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
To: linux-lvm@redhat.com

Hi,

I am seeing the (very) unexpected behaviour where the contents of a read-only snapshot change.

I am running a Debian-based system, mostly Sarge, but with an updated Kernel and LVM as below:
 
dromedary:~# lvm version
  LVM version:     2.02.07 (2006-07-17)
  Library version: 1.02.08 (2006-07-17)
  Driver version:  4.5.0
dromedary:~# uname -a
Linux dromedary 2.6.16.20.rwl2 #1 Wed Jul 26 12:52:43 BST 2006 i686 GNU/Linux
dromedary:~#

I am taking a snapshot of a LV (/dev/store/backupimage) on which is stacked dmcrypt (/dev/mapper/cryptdisk) and then reiser3.

dromedary:~# mount
<snip>
/dev/mapper/cryptdisk on /mnt/cryptdisk type reiserfs (rw,noatime,acl)
dromedary:~#

I make a whole loads of writes to the Reiser3 mounted partition then I do the following:

	mount -o remount,ro /mnt/cryptodisk
	sync
	dmsetup suspend /dev/mapper/cryptodisk 
	dmsetup resume /dev/mapper/cryptodisk
	lvchange -p r /dev/store/backupimage
	lvcreate -L1G -p r -s -n snapdisk /dev/store/backupimage

If I understand this correctly, this should remount the disk read-only so it cannot change any more, sync the Reiser disk contents
to the device below, flush any changes through the dmcrypt device, make the LV itself read-only and finally create a read-only
snapshot.

At this point, everything should be locked down hard....

BUT:

I am seeing changes on the LV snapshot within a 64KB block at offset 313CA0000.

After running the above commands, I then do:

dromedary# dd if=/dev/store/backupimage bs=65536 skip=201674 count=1 | openssl sha1
1+0 records in
1+0 records out
65536 bytes transferred in 0.074199 seconds (883248 bytes/sec)
cc6f4e68d6f28513f22efcb4012af8165d0d9e2f

dromedary# dd if=/dev/store/snapdisk bs=65536 skip=201674 count=1 | openssl sha1
1+0 records in
1+0 records out
65536 bytes transferred in 0.017019 seconds (3850756 bytes/sec)
2cb7aa5a75e823027bd2151951091e27f9b65e17

dromedary# run_a_script_that_copies_the_disk_image_elsewhere.sh

((We now copy the 20GB disk image elsewhere.  This is a lot of disk activity so I expect that it will flush any existing cached disk
data as there will be >20GB of new disk read traffic))

dromedary# dd if=/dev/store/backupimage bs=65536 skip=201674 count=1 | openssl sha1
1+0 records in
1+0 records out
65536 bytes transferred in 0.015872 seconds (4129033 bytes/sec)
cc6f4e68d6f28513f22efcb4012af8165d0d9e2f

dromedary# dd if=/dev/store/snapdisk bs=65536 skip=201674 count=1 | openssl sha1
1+0 records in
1+0 records out
65536 bytes transferred in 0.005131 seconds (12772596 bytes/sec)
cc6f4e68d6f28513f22efcb4012af8165d0d9e2f


?HUH?

I don't mind if there is a slight difference between the disk and its snapshot images.  I don't know how it could be, given that I
make the backupimage read-only *before* I take the snapshot, but I will let that pass for the moment...

What I do *not* understand is how the contents of a read-only snapshot can change.  The first time I check the snapshot SHA1
checksum, I get 2cb7..... but when I re-run the after lots of data copies elsewhere, I get cc6f.... which matches the image
underneath it.

Can anyone offer any help on this?

At the moment, I have it consistently repeatable at this block offset on one machine. So I can run some more tests.  I haven't
rebooted the machine to "try to make it go away" as I want to get to the bottom of the problem.  I haven't seen it on a different
machine (yet) but this is a very small amount of data to see changing and it seems time dependent, so I am not surprised by that.

Thanks,

Roger
