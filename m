Return-Path: <dmeyer@dmeyer.net>
Date: Mon, 15 Jan 2001 06:59:25 -0500
Message-Id: <200101151159.GAA17960@yendi.dmeyer.net>
From: <dmeyer@dmeyer.net>
Subject: [linux-lvm] hard-lock seems to have caused serious LVM problems
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Last night, my machine (running Linux-2.4.0, LVM-0.9, and the 0.9
utilities) locked up hard.  On reboot, vgscan can only find one of my
VGs.  vgscan results in:

# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "main_vg"
vgscan -- found inactive volume group "misc_vg"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get data of volume group "misc_vg" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV"
creating "/etc/lvmtab" and "/etc/lvmtab.d"

The LV on main_vg works just fine, but I can't get at anything in
misc_vg.

vgcfgrestore isn't helping.  I get:
# vgcfgrestore -v -f ./lvmconf/misc_vg.conf -n misc_vg -l
vgcfgrestore -- locking logical volume manager
vgcfgrestore -- restoring volume group "misc_vg" from "./lvmconf/misc_vg.conf"
vgcfgrestore -- checking existence of "./lvmconf/misc_vg.conf"
vgcfgrestore -- reading volume group data for "misc_vg" from "./lvmconf/misc_vg.conf"
vgcfgrestore -- ERROR: different structure size stored in "./lvmconf/misc_vg.conf" than expected in file vg_cfgrestore.c [line 120]
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group "misc_vg"

Hacking in some extra debugging code, it looks like the first
VGCFG_READ in vgcfgrestore() is expecting a vg_t to be 2484 bytes, but
the actual struct on-disk is only 2248 bytes.

All other diagnostic output is going to be too long for the list, so
please look at http://www.dmeyer.net/~dmeyer/lvm for files I reference
below. 

As far as I can tell (which isn't very far, really), the PVs
themselves are OK - I can run pvdata and get nothing that looks (to
me, at least) horribly suspicious.  I put the results from pvdata -a
for all 5 PVs in pvdata.<partition>.

vgscan -d seg faults.  However, by adding

   if (uuidstr[0] != '/') {
     return -1;
   }

to the beginning of lvm_check_uuid in lvm_uuid.c, I managed to keep
vgscan from dying on me.  Anyway, the results from vgscan -d are also
on my web page.  There are actually 4 versions:  0.9 and 0.9.1-beta1,
and both patched (i.e. with the code above) and unpatched.

I've also dd'd the first 32k of each of the 5 file partitions, in case
that might help.  Also, /etc/lvm* from the previous night's backups
are also there.

If anyone can suggest a course of action, I'd really appreciate it.

     Dave
