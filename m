From: Martin Keegan <mk270@cam.ac.uk>
Message-ID: <Pine.LNX.3.96.1040127145056.14634T-100000@ooh.amtp.cam.ac.uk>
MIME-Version: 1.0
Subject: [linux-lvm] vg inconsistency between 2.4 and 2.6
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
Date: Wed Jan 28 10:46:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi,

I have an LVM system with several Linux installations on it across a large
number of logical volumes, within a single volume group, called VG, on a
single partition, /dev/hda1, which takes up the whole disk. The metadata
flavour is reported as lvm1. I can no longer use 2.4 series kernels with
this volume group, only 2.6 series kernels, though I used to be able to
use either.

What seems to have changed is that I performed an lvextend or lvcreate
operation (or lvremove?) under 2.6. Since then, no 2.4 kernel has been
able to access the volume group. 2.6 kernels can access it fine.
I seem to have two sets of tools installed, which Debian calls lvm10 and
lvm2, and am pretty sure that the only ones I have been using are the lvm2
set.

Has anyone any idea how I can repair my system so that 2.4 can see it
again?

Cheers,

Mk

Here's the output of the system under Knoppix's 2.4.20 kernel:

root@tty1[etc]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hda1"  is associated to unknown VG "VG" (run vgscan)
pvscan -- total: 1 [34.47 GB] / in use: 1 [34.47 GB] / in no VG: 0 [0]
root@tty1[etc]# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- reading data of volume group "VG" from physical volume(s)
vgscan -- found inactive volume group "VG"
vgscan -- getting block device numbers for logical volumes

vgscan -- checking block device numbers of logical volumes

vgscan -- inserting "VG" into lvmtab
vgscan -- backing up volume group "VG"
vgscan -- checking volume group name "VG"
vgscan -- checking volume group consistency of "VG"
vgscan -- ERROR "pv_check_consistency_all_pv(): PE" volume group "VG" is inconsistent
vgscan -- ERROR: unable to do a backup of volume group "VG"
vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group "VG" from "/etc/lvmtab"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group
