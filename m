Message-ID: <3D77B43B.7000506@domdv.de>
From: Andreas Steinmetz <ast@domdv.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] 2.4.20pre5 CONFIG_BLK_STATS breaks LVM tools
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
Date: Thu Sep  5 16:55:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-kernel <linux-kernel@vger.kernel.org>, Linux-LVM@sistina.com

If CONFIG_BLK_STATS is enabled in 2.4.20pre5 this breaks at least the
LVM tools. The symptom on a system running initrd to do vgscan/vgchange
to be able to boot is that after

RAMDISK: Compressed image found at block 0
Freeing initrd memory: 734k freed
VFS: Mounted root (ext2 filesystem).

the system hangs with the CPU under load. It is difficult for me to
investigate this further as both systems I do have available run a
LVM/reiserfs only setup and thus I can't have a look at the layout of
/proc/partitions in the CONFIG_BLK_STATS enabled page.

It would, however, be worth a word of warning in Configure.help that
this option can break userspace tools that may be important for system
boot and other system functions.
-- 
Andreas Steinmetz
D.O.M. Datenverarbeitung GmbH
