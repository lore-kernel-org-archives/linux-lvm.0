Return-Path: <gobo@gimle.nu>
Message-ID: <20010206183505.7773.qmail@fraggle.cs.uit.no>
From: gobo@gimle.nu
Mime-Version: 1.0
Date: Tue, 06 Feb 2001 19:35:05 +0100
Subject: [linux-lvm] Help! Problems finding VG after reboot.
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi all.

I'm running beta3 on a 2.4.0 kernel. I recently had to reboot my computer 
due to an error with the network device. When the computer came back up I 
couldn't get to the LVM partition any more.

Running vgscan I got the following message:

# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "widow"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get 
data of volume group "widow" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating 
"/etc/lvmtab" and "/etc/lvmtab.d"

Running PVscan yielded:

# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hda3"  is associated to an unknown VG (run 
vgscan)
pvscan -- inactive PV "/dev/hdb1"  is associated to an unknown VG (run 
vgscan)
pvscan -- inactive PV "/dev/hdc1"  is associated to an unknown VG (run 
vgscan)
pvscan -- inactive PV "/dev/hdd1"  is associated to an unknown VG (run 
vgscan)
pvscan -- inactive PV "/dev/hde1"  is associated to an unknown VG (run 
vgscan)
pvscan -- inactive PV "/dev/hdf1"  is associated to an unknown VG (run 
vgscan)
pvscan -- total: 6 [100.96 GB] / in use: 6 [100.96 GB] / in no VG: 0 [0]

After reading through the mailing list I got the impression that the 
thing to do to solve my problems would be to run vgcfgrestore on each 
partition. So I ran the following command on all 6 partitions:
# vgcfgrestore -n widow /dev/hdf1
vgcfgrestore -- VGDA for "widow" successfully restored to physical volume 
"/dev/hdf1"

Now when I run vgscan I get:
# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- no volume groups found

and pvscan yields the exact same result as above.

If anyone have an idea on how I can get my filesystem back I'd very much 
appreciate it.

Frank Ronny Larsen
-- 
"I'll carry your books, I'll carry a tune, I'll carry on, carry over,
carry forward, Cary Grant, cash & carry, Carry Me Back To Old
Virginia, I'll even Hara Kari if you show me how, but I will *not*
carry a gun."                                      -- Hawkeye, M*A*S*H
