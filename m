Return-Path: <jamesp@foobarhouse.com>
Date: Sat, 28 Jul 2001 15:14:23 +0100 (BST)
From: James Pattinson <jamesp@foobarhouse.com>
Message-ID: <Pine.LNX.4.33.0107281511250.5058-100000@greebo.foobarhouse.com>
MIME-Version: 1.0
Subject: [linux-lvm] more snapshot probs
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

I've applied the recommended patches to 2.4.7 - beta8, VFS lock, and patch
in previous emails.

Now, when I create a snapshot LV:

lvcreate -s -L500 -nsnap /dev/vg00/lvol6
(where /dev/vg00/lvol6 is 3GB striped across 2 PVs)

I get these 2 messages in my logs a few seconds later:

Jul 28 15:10:05 greebo kernel: lvm -- _pv_get_number failed for rdev = 0
Jul 28 15:10:05 greebo kernel: lvm -- giving up to snapshot
/dev/vg00/lvol6 on /dev/vg00/snap: couldn't prepare kiovec blocks (start
probably isn't block aligned)

THen when I try to mount:

[root@greebo /root]# mount /dev/vg00/snap /mnt/homesnap/
/dev/vg00/snap: Input/output error
mount: permission denied

And in the log:

Jul 28 15:13:28 greebo kernel: lvm - lvm_map: ll_rw_blk for inactive LV
/dev/vg00/snap

Any ideas?

Cheers!

James
