From: Alexy Khrabrov <alexy@kalevala.nj.nec.com>
Message-Id: <200201212303.g0LN3Kj14175@kalevala.nj.nec.com>
Subject: [linux-lvm] lvm and changing root partitions
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
Date: Mon Jan 21 16:58:02 2002
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linux-LVM@Sistina.com

Dear Heinz --

I'm delighted with LVM for Linux.  I installed all
of my SuSE 7.2 systems with root partition on LVM
also.  I noticed one glitch and a more serious
technical issue.

The glitch is, the root partition on LVM does not
let vgchange -an deactivate everything on
shutdown.  Although SuSE 7.2 /etc/init.d/boot
script seems to provision the root partition being
on LVM, shutdown still compplains that it can't
deactivate the partition in use.  Is it possible
at all to deactivate it?  And is it safe to keep
doing shutdowns without it fully deactivated?

Second issue is more important, and it taught me
about vgcfgbackup.  I lost my initial LVM install
when I deleted some /dev/hdaN partitions in the
middle, shifting the physical volume names.  I
couldn't restore the system after that, even after
trying al kinds of restoring commands.  So I
reinstalled a Red Hat with a regular root
partition, to be able to always boot up regardless
of LVM, and created LVM from that Red Hat.  The
original /etc/lvmtab* files where created there.

Then I installed SuSE onto the LVM, and started to
boot into the root partition of SuSE.  But I
couldn't change LVM logical volumes since their
config was still stored on the older root
partition.  I copied it physically to the new
root, recreating /dev/ files with mknod.  It seems
to work, but I wonder if that's the right way to
move LVM config from one root partition to
another?

Regards,
Alexy
