Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r6LKYwH5017577
	for <linux-lvm@redhat.com>; Sun, 21 Jul 2013 16:34:58 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6LKYupK011484
	for <linux-lvm@redhat.com>; Sun, 21 Jul 2013 16:34:57 -0400
Received: from compute1.internal (compute1.nyi.mail.srv.osa [10.202.2.41])
	by gateway1.nyi.mail.srv.osa (Postfix) with ESMTP id DE0D9204F9
	for <linux-lvm@redhat.com>; Sun, 21 Jul 2013 16:34:55 -0400 (EDT)
Message-Id: <1374438895.27222.9223372036855387565.0F08A743@webmail.messagingengine.com>
From: darx@sent.com
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Sun, 21 Jul 2013 13:34:55 -0700
Subject: [linux-lvm] resize of LV causing superblock corruption ( Bad magic
 number ). how to prevent/fix?
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
To: linux-lvm@redhat.com

I have three LVs

	lvs | grep test
		test_boot   VGTEST -wi-a---- 200.00m                     
		test_root   VGTEST -wi-a----   4.00g                     
		test_swap   VGTEST -wi-a---- 512.00m           

They contain healthy/usable ext4 partitions, and are routinely,
successfully used as disks in launching a Xen guest

	cat test.cfg
		name = 'test'
		...
		disk = [ 'phy:/dev/VGTEST/test_boot,xvda,w',
		'phy:/dev/VGTEST/test_swap,xvdb,w',
		'phy:/dev/VGTEST/test_root,xvdc,w', ]
		...

	xl create test.cfg
	xl list
		Name          ID   Mem VCPUs      State   Time(s)
		Domain-0       0   985     4     r-----     101.2
		test           3  1024     2     -b----       7.6

	xl console test
		test login: darx
		Password: #######
	uname -a
		Linux test.lan 3.7.10-1.16-xen #1 SMP Fri May 31
		20:21:23 UTC 2013 (97c14ba) x86_64 x86_64 x86_64
		GNU/Linux

I need to grow one of the LVs, /dev/VGTEST/test_root by 8G.

To do that I 1st verify that it's healthy,

	kpartx -av /dev/VGTEST/test_root
	e2fsck -f /dev/mapper/VGTEST-test_root1
		e2fsck 1.42.6 (21-Sep-2012)
		Pass 1: Checking inodes, blocks, and sizes
		Pass 2: Checking directory structure
		Pass 3: Checking directory connectivity
		Pass 4: Checking reference counts
		Pass 5: Checking group summary information
		/dev/mapper/VGTEST-test_root1: 84121/262144 files (0.3%
		non-contiguous), 753868/1048320 blocks
	kpartx -dv /dev/VGTEST/test_root

then extend the partition,

	lvextend -L+8G /dev/VGTEST/test_root
	  Extending logical volume test_root to 12.00 GiB
	  Logical volume test_root successfully resized

	fdisk -l /dev/VGTEST/test_root | grep Linux
		/dev/VGTEST/test_root1            2048     8388607    
		4193280   83  Linux

delete the current partition, and re-add it as a new partition using
100% of the new/expanded available space

	cfdisk /dev/VGTEST/test_root/
		...
	fdisk -l /dev/VGTEST/test_root | grep Linux
		/dev/VGTEST/test_root1              32    25165823   
		12582896   83  Linux

then prepare to resize the FS on the grown partition

	kpartx -av /dev/VGTEST/test_root
		add map VGTEST-test_root1 (253:13): 0 25165792 linear
		/dev/VGTEST/test_root 32

and FSCK to be safe.  BUT, here it fails:

	e2fsck -f /dev/mapper/VGTEST-test_root1
		e2fsck -f /dev/mapper/VGTEST-test_root1
		e2fsck 1.42.6 (21-Sep-2012)
		ext2fs_open2: Bad magic number in super-block
		e2fsck: Superblock invalid, trying backup blocks...
		e2fsck: Bad magic number in super-block while trying to
		open /dev/mapper/VGTEST-test_root1

		The superblock could not be read or does not describe a
		correct ext2
		filesystem.  If the device is valid and it really
		contains an ext2
		filesystem (and not swap or ufs or something else), then
		the superblock
		is corrupt, and you might try running e2fsck with an
		alternate superblock:
		    e2fsck -b 8193 <device>

at this step I *used* to (a year or so ago, when I last did this) get a
good FSCK result, before then proceeding with

	resize2fs /dev/mapper/VGTEST-test_root1
	kpartx -dv /dev/mapper/VGTEST-test_root

to complete the resize.

What's likely causing this new/current superblock corruption, and how do
I prevent it?

Thanks.

darx
