Message-ID: <20021112105453.GA16681@reti>
Mime-Version: 1.0
Content-Disposition: inline
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
Subject: [linux-lvm] New 2.5-stable patches for dm
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
Date: Tue Nov 12 04:56:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com, lvm-devel@sistina.com
Cc: Alan Cox <alan@redhat.com>, Alexander Viro <viro@math.psu.edu>

These are the latest dm patches for 2.5.47:

01_dm_vcalloc.patch
02_dm_disk.patch
03_minor_bitset.patch
04_devfs_symlink.patch
05_remove_compatmac.patch
06_constants_to_dm_ioctl.patch

I've given up pushing vcalloc and instead made it a static function in
dm-table.


Seperate patches here:
  http://people.sistina.com/~thornber/patches/2.5-stable/2.5.47/2.5.47-dm-2/

or patchball here:
  http://people.sistina.com/~thornber/patches/2.5-stable/2.5.47/2.5.47-dm-2.tar.bz2

- Joe
