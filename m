Return-Path: <jamesp@foobarhouse.com>
Date: Fri, 27 Jul 2001 17:31:38 +0100 (BST)
From: James Pattinson <jamesp@foobarhouse.com>
Message-ID: <Pine.LNX.4.33.0107271727460.16916-100000@greebo.foobarhouse.com>
MIME-Version: 1.0
Subject: [linux-lvm] snapshots & reiserfs
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi

Im sure this is a FAQ but I can't find it.

I want to be able to use snapshots on my beta8 / reiserfs (stock 2.5.7)
system. I can create a snapshot OK, but when I try to mount it I get an
error saying we can't replay the logs since we are mounted read only.

Also, i've just noticed this in my dmesg:

lvm -- _pv_get_number failed for rdev = 0
lvm -- giving up to snapshot /dev/vg00/lvol6 on /dev/vg00/greebo_snap:
couldn't prepare kiovec blocks (start probably isn't block aligned)
lvm - lvm_map: ll_rw_blk for inactive LV /dev/vg00/greebo_snap
lvm - lvm_map: ll_rw_blk for inactive LV /dev/vg00/greebo_snap
read_super_block: unable to read superblock on dev 3a:0f
read_old_super_block: try to find super block in old location
lvm - lvm_map: ll_rw_blk for inactive LV /dev/vg00/greebo_snap
read_old_super_block: unable to read superblock on dev 3a:0f
lvm - lvm_map: ll_rw_blk for inactive LV /dev/vg00/greebo_snap
FAT bread failed

Any ideas? snapshots seem really cool, and i want to play :)

James
