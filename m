From: Donald Thompson <dlt@lunanet.biz>
Message-Id: <Pine.LNX.4.44.0203242158260.19733-100000@junior.luna.home>
MIME-Version: 1.0
Subject: [linux-lvm] Mounting ext3 snapshots
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
Date: Sun Mar 24 23:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm trying to mount ext3 snapshot LV's, and having a bit of trouble. I
could have sworn I read this become possible awhile back on one of the
lists (maybe that was reiserfs?). Anyways I've attempted the following:

mount -t ext3 /dev/SCSI/home_test /mnt
dmesg reports:
	EXT3-fs: INFO: recovery required on readonly filesystem.
	EXT3-fs: write access unavailable, cannot proceed.

mount -o noload -t ext3 /dev/SCSI/home_test /mnt
dmesg reports:
	ext3: No journal on filesystem on lvm(58,17)

Attempting to mount as -t ext2 doesn't help.

But non of them allow me to mount the snapshots.

Attempting to mount a -t ext2 doesn't help.

I'm using:
debian 3.0
mount 2.11n (debian package)
LVM 1.0.1
Kernel 2.4.18-pre7

I'm guessing I just have the wrong mount options...anyone have any
pointers? TIA.

-Don
