From: Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
Content-Transfer-Encoding: 7bit
Message-Id: <1054888476.11446.8.camel@lupin>
Mime-Version: 1.0
Subject: [linux-lvm] ext3 slash
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
Date: Fri Jun  6 03:35:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi

I have installed a machine with a /boot in a normal partition and all
other partitions including / on ext3 logical volumes.
(Red Hat 9/lvm 1.0.3).

I want to snapshot dump these partitions but I didn't realise at the
time of the install that I would have to patch the kernel to be able to
do this with ext3 filing systems.
I don't want to have to do this so I migrated the partitions to ext2
using tune2fs and changed fstab.

In the case of / and /var I booted into rescue mode from cd to run
tune2fs against those volumes read-only.

When I rebooted the machine I got a panic because there was no journal
found on /. Rebooting into rescue mode and restoring the journal on
slash cures this problem.

How can I change the slash volume from ext3 to ext2? As I mentioned I
edited fstab so there must be some other record somewhere telling the
kernel that slash is ext3 but what? Do I need to make a new initrd.img?

Many thanks
-- 
Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
