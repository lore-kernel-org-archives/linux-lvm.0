From: R Dicaire <rdicaire@kritek.net>
Message-Id: <1075147677.15213.44.camel@ws.rdb.linux-help.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problems mounting snapshots
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
Date: Mon Jan 26 15:09:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

First the specs:

Linux kernel 2.4.23-xfs patched with LVM 1.0.8
lvm tools 1.0.8
Slackware 9.1
gcc -v
Reading specs from /usr/lib/gcc-lib/i486-slackware-linux/3.2.3/specs
Configured with: ../gcc-3.2.3/configure --prefix=/usr --enable-shared
--enable-threads=posix --enable-__cxa_atexit --disable-checking
--with-gnu-ld --verbose --target=i486-slackware-linux
--host=i486-slackware-linux
Thread model: posix
gcc version 3.2.3

The problem:

Various errors trying to mount snapshots using ext3/xfs/reiserfs

xfs: 
mount -t xfs /dev/vg0/snap_home /mnt/hd -o ro
mount: wrong fs type, bad option, bad superblock on /dev/vg0/snap_home,
       or too many mounted file systems

Jan 26 14:50:26 rdb kernel: XFS: Filesystem lvm(58,8) has duplicate UUID
- can't mount

ext3: 
mount -t ext3 /dev/vg0/snap_tmp /mnt/hd -o ro
mount: wrong fs type, bad option, bad superblock on /dev/vg0/snap_tmp,
       or too many mounted file systems

Jan 26 15:00:59 rdb kernel: EXT3-fs: INFO: recovery required on readonly
filesystem.
Jan 26 15:00:59 rdb kernel: EXT3-fs: write access unavailable, cannot
proceed.

reiserfs:
It'll mount but complains:
Jan 26 15:03:09 rdb kernel: reiserfs: found format "3.6" with standard
journal
Jan 26 15:03:09 rdb kernel: reiserfs: checking transaction log (device
lvm(58,8)) ...
Jan 26 15:03:09 rdb kernel: for (lvm(58,8))
Jan 26 15:03:09 rdb kernel: Can't write to read-only device 3a:08
Jan 26 15:03:09 rdb last message repeated 6 times
Jan 26 15:03:09 rdb kernel: reiserfs: replayed 3 transactions in 0
seconds
Jan 26 15:03:09 rdb kernel: lvm(58,8):Using tea hash to sort names
------------------------------------------------------------------
I uograded to 1.0.8 to try and fix this mount issue, to no avail.

Have I missed something? Any help would be greatly appreciated, thanks.

-- 
      aRDy Music
http://www.ardynet.com
