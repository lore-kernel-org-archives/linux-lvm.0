Message-Id: <F888C30C3021D411B9DA00B0D0209BE8038F94D4@cvo-exchange.cvo.roguewave.com>
From: Poul Petersen <petersp@roguewave.com>
MIME-Version: 1.0
Subject: [linux-lvm] Problem with pvmove (LVM 1.0.4 Kernel 2.4.18)
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
Date: Tue May  7 19:57:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

	I have a dual P-II 400 running RedHat 7.2 and the 2.4.18 kernel.
I've installed LVM-1.0.4 from source  and I have two version of the 2.4.18
kernel installed:

	1) Stock 2.4.18 kernel
	2) 2.4.18 with the LVM 1.0.4 PATCHES/Makefile generated patch
applied

	What I've been doing is creating a simple volume group with two
disks and creating a small logical volume, small enough that all PEs are
allocated in the first PV. I then issue a pvmove to move all the PEs to the
second PV. If I boot into kernel #1 from above, everyhing works fine. If I
use kernel #2, the pvmove hangs while moving the second PE (I'm using pvmove
-v, so I can see each PE as it is moved). Notice that I am trying to move
the PEs without even creating a filesystem in the LV, so there is not an
issue with the LV being mounted. I've tried strace'ing the process, but
there is no activity. It would seem that applying the Makefile generated
patch is the *right* thing to do, but it is breaking pvmove...

	Now, using the first kernel, I create an ext2 partition in the LV,
mount it and export it via NFS and start some activity from a client using
dd. I can then pvmove the PEs back and forth between the disks without any
problems. If however, I use an ext3 filesystem, I get the following:

kernel: journal_bmap_Rsmp_785a3b98: journal block not found at offset 268 on
lvm(58,0)
kernel: Aborting journal on device lvm(58,0).
kernel: ext3_abort called.
kernel: EXT3-fs abort (device lvm(58,0)): ext3_journal_start: Detected
aborted journal
kernel: Remounting filesystem read-only
kernel: EXT3-fs error (device lvm(58,0)) in start_transaction: Journal has
aborted

	So, what am I missing here and what can I try next?

Thanks,

-poul
