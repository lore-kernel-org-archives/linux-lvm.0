Message-Id: <200401310730.i0V7UVE04207@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
Subject: [linux-lvm] LVM1: vgsplit doesn't seem to work quite as well as expected
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
Date: Sat Jan 31 02:24:02 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

I'm using LVM1 on a multi-boot system with four Linux operating systems.
Each OS uses a regular disk partition for /, and a logical volume each
for the /usr and /var filesystems.

I'm using and lvm 1.0.8 kernel module and lvm 1.0.8 tools on the primary
operating system (Debian 3.0r1) which I (try to) use for all lvm
administration.  The other operating systems may have something like lvm
1.0.3 and one has 0.9.1_beta4/1.0.1-rc2.

Everything was working great with a single volume group and two LVM
partitions, one on each of my two disks in this system.  I wanted to be
able to operate the machine with both disks or when one disk was
missing, so I moved the (/usr and /var) logical volumes of each OS to
the same disk its / filesystem was on and performed a vgsplit of the
sys volume group into sys and vgb volume groups.

When I rebooted into operating system 2 (SuSE 7.3), vgscan activated
sys, but didn't report vgb at all.

When I rebooted into operating system 3 (Aurora 1.0 - Sparc Red Hat 7.3
based), vgscan activated sys, but reported the following concerning vgb:

vgscan - volume group "vgb" reuses an existing logical volume number; please
vgexport/vgimport that VG or use option -f

This operating system has its /var and /usr logical volumes on the vgb
volume group, so this was a bit frustrating.

I when back to operating system 1, where I had done the vgsplit, and it
now reported the same thing as operating system 3 had:

vgscan - volume group "vgb" reuses an existing logical volume number; please
vgexport/vgimport that VG or use option -f

I did vgsplit on this OS (lvm 1.0.8), so why would it assign duplicate
logical volume numbers and activate it right after the vgsplit, but not
after rebooting?

So, I tried vgexport (reported an error see below) and vgimport and vgb
was active again:

# vgexport vgb
vgexport -- ERROR "lvm_tab_vg_remove(): VG doesn't exist" removing volume group\
 "vgb" from "/etc/lvmtab"
vgexport -- volume group "vgb" NOT sucessfully exported

# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "sys"
vgscan -- found exported volume group "vgbPV_EXP"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups

# vgimport vgb /dev/sdb7
vgimport -- doing automatic backup of volume group "vgb"
vgimport -- volume group "vgb" successfully imported and activated

# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "sys"
vgscan -- found active volume group "vgb"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups

#

Now operating systems 1, 3 and 4 activate both volume groups early in
the boot scripts as expected, but operating system 2 still reports only
sys as a volume group (and when I specify vgb, it says it doesn't
exist).

How do I get operating system 2 (SuSE 7.3), to detect and activate both
volume groups?

OS #2 is using the SUSE patched stock 2.2.20-SMP installation kernel
with lvm module 0.9.1_beta4 and the lvm tools are 1.0.1-rc2.  I tried
using the 1.0.8 vgscan, but it also reports nothing about vgb, so it
appears that the lvm module of this kernel may be too old a version to
detect split volume groups?  If I create vgb with vgcreate specifying
its physical volume, the kernel should see what logical volumes are
_already_ stored on the physical volume.  While booting there is the
error (between mounting root and the swap partitions):

lvm lvm_chr_ioctl: unknown command 8004fe0a

I also noticed that the physical volume that I'm having problems with
had its type (accidentally) changed from "Linux LVM" to "Linux native".
I changed it back to "Linux LVM", but the problem with OS #2 still
persists (it doesn't detect volume group vgb).  This might have
something to do with the error reported by vgexport?

I have no doubt that a kernel with a newer lvm module version (at least
1.0.1) would solve the problem, but my purpose in writing this is to
understand how well different versions of the lvm kernel module
inter-operate and what means can be used compensate for the short
comings of early lvm kernel modules and user tools.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
