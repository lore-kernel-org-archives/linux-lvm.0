Return-Path: <lukasz@hq.nawigator.pl>
Message-Id: <20010309233105.B29DEFAD7@hq.nawigator.pl>
Date: Sat, 10 Mar 2001 00:31:05 +0100 (CET)
From: Lukasz Trabinski <lukasz@hq.nawigator.pl>
Subject: [linux-lvm] Problems with vgscan
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-lvm@sistina.com

Hello

I have problems with the vgscan ( Linux, kernel 2.4.2 and 2.4.1)

[root@xxx tools]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "test"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "test" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"

I have appled patch from posted to this list (diff -u -r1.3.2.3
tools/lib/pv_read_all_pv_of_vg.c)

Comments line from the

#if 0
 /* in case this PV already holds a uuid list: check against this  list */

to line:

#endif
      /* avoid multiple access pathes */


Recompiled all tools from LVM (0.9 version), and I have done

[root@xxx /root]# vgcfgrestore /dev/hdh1 -n test
vgcfgrestore -- VGDA for "mp3" successfully restored to physical volume
"/dev/hdh1"

[root@xxx /root]# vgcfgrestore /dev/hdg1 -n test
vgcfgrestore -- VGDA for "mp3" successfully restored to physical volume
"/dev/hdg1"

And I have still problems with the vgscan:

[root@xxx tools]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found inactive volume group "test"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get
data of volume group "test" from physical volume(s)
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" creating
"/etc/lvmtab" and "/etc/lvmtab.d"

[root@xxx tools]# vgdisplay
vgdisplay -- ERROR: "/etc/lvmtab" doesn't exist; please run vgscan

[root@xxx tools]# pvscan
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- inactive PV "/dev/hdg1"  is associated to an unknown VG (run
vgscan)
pvscan -- inactive PV "/dev/hdh1"  is associated to an unknown VG (run
vgscan)
pvscan -- total: 2 [65.89 GB] / in use: 2 [65.89 GB] / in no VG: 0 [0]


Any sugestions? Have I lost my all data from 65.89 GB?!



--
*[ �ukasz Tr�bi�ski ]*
SysAdmin @polvoice.com
