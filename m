From: Ben <kf4wbx@hamsnet.net>
Content-Transfer-Encoding: 7bit
Message-Id: <1006830259.2791.23.camel@outback.key>
Mime-Version: 1.0
Subject: [linux-lvm] Help!! VG Corrupted?
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
Date: Mon Nov 26 21:04:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: ben.klang@transchannel.com

Hello,

I am running Mandrake 8.1 which installs Linux LVM 0.9.  I've read posts
that mention that 0.9 is "bad for your health."  While I'm not totally
sure why or how, it seems to be the case for me as well.

I installed the OS and ran find with one IDE HD partition dedicated
(/dev/hda9, one VG on one PV) to LVM and two LV's (/usr and /var).
Yesterday, I added another partition (/dev/hda7) and added its PEs to
the VG.  I thhen added the newly added PE's to the /usr LV.  Everything
was great.  Then I rebooted.  Upon reboot, I got:
[root@cray]# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- scanning for all active volume group(s) first
vgscan -- found inactive volume group "vg0"
vgscan -- reading data of volume group "vg0" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "vg0" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"
[root@cray]#

I then tried the vgcfgrestore, which ran sucessfully.  Now I get vgscan
reporting no volumes.  Found a reference on how to fix this (using dd
and reading uuids from pv's, then writing them back to the disk).  That
procedure brings me back to the starting point.

It seems the data is there because pvscan reports:

[root@cray]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/ide0/host0/bus0/target0/lun0/part7" is
associated to an unknown VG (run vgscan)
pvscan -- inactive PV "/dev/ide0/host0/bus0/target0/lun0/part9" is
associated to an unknown VG (run vgscan)
pvscan -- total 2 [12.02 GB] / in use: 2 [12.02 GB] / in no VG: 0 [0]
[root@cray]#

One more note of interest:  My partitions on disk are out of order.
hda7 occupies cylinders 2848-3736 and hda9 occupies cylinders 2168-2847.

[root@cray]# fdisk /dev/hda
Command (m for help): p

Disk /dev/hda: 255 heads, 63 sectors, 3763 cylinders
Units = cylinders of 16065 * 512 bytes

   Device Boot     Start       End      Blocks    Id  System
/dev/hda1  *           1       934     7502323+    b  Win95 FAT32
/dev/hda2            935      3736    22507065     5  Extended
/dev/hda5  *         935      1874     7550518+    7  HPFS/NTFS
/dev/hda6           1875      2135     2096451    83  Linux
/dev/hda7           2848      3736     7140861    8e  Linux LVM
/dev/hda8           2136      2167      256977    82  Linux swap
/dev/hda9           2168      2847     5462037    8e  Linux LVM

Partition table entries are not in disk order




So, can anyone help me?  Would recreating the VG and adding the PV's to
it restore access to my data?  Or would I just blow it all away in the
attempt?



Thanks for any help!
-Ben K
kf4wbx@hamsnet.net
