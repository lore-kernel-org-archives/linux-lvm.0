Return-Path: <fzzgrr@gmx.net>
Date: Mon, 20 Aug 2001 22:04:05 +0200
From: Ulrich Wiederhold <U.Wiederhold@gmx.net>
Message-ID: <20010820220405.A5266@sky.net>
Mime-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] no volume groups found
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
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

Hello,
I use 2.4.9 with debian unstable and lvm version 0.9.1_beta6. I don=B4t
use devfs and compiled lvm into the kernel.
I created a vg nameed vg01 containing hda2,hdb1,hdd1,sdb1 and sdc1. Then
I created some lv=B4s and made a mkfs.xfs.
I could do a "vgscan -v && vgchange -a y" and mount my lv=B4s.

After a reboot, /etc/rcS.d/S25lvm couldn=B4t find any vg=B4s. So I ran the
script manually and it works.

I had some other problems that need me to reboot and my PC crashed several
times. Now, I can=B4t even run the script manually. I always get this:

home:# vgscan -v
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume
group

home:# vgchange -a y
vgchange -- no volume groups found

home:# vgdisplay
vgdisplay -- no volume groups found

Then I did "man vgcfgrestore" and tryed
home:# vgcfgrestore -n vg01 -l
vgcfgrestore -- ERROR: different structure size stored in
"/etc/lvmconf/vg01.conf" than expected in file vg_cfgrestore.c [line
137]
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
"vg01"

and:
home:# vgcfgrestore -f /etc/lvmconf/vg01.conf.1.old -n vg01 /dev/sdb1
vgcfgrestore -- ERROR: different structure size stored in
"/etc/lvmconf/vg01.conf.1.old" than expected in file vg_cfgrestore.c
[line 137]
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
"vg01"

What "PhysicalVolumePath" should I use with it?

Then I looked in the mail-archive and did a:
home:/home/fzzgrr# vgcfgrestore -v -d -n vg01 /dev/hda2
<1> vg_check_name -- CALLED with VG: vg01
<22> lvm_check_chars -- CALLED with name: "vg01"
<22> lvm_check_chars -- LEAVING with ret: 0
<1> vg_check_name -- LEAVING with ret: 0
<1> pv_check_name -- CALLED with "/dev/hda2"
<22> lvm_check_chars -- CALLED with name: "/dev/hda2"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<333> lvm_check_partitioned_dev -- CALLED
<333> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
<1> vg_check_active -- CALLED with VG: vg01
<22> vg_check_name -- CALLED with VG: vg01
<333> lvm_check_chars -- CALLED with name: "vg01"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- CALLED with VG: vg01
<333> vg_check_name -- CALLED with VG: vg01
<4444> lvm_check_chars -- CALLED with name: "vg01"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- LEAVING with ret: -6
<1> vg_check_active -- LEAVING with ret: -6
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
vgcfgrestore -- locking logical volume manager
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING
vgcfgrestore -- restoring volume group "vg01" from
"/etc/lvmconf/vg01.conf"
<1> vg_cfgrestore -- CALLED
<22> vg_check_name -- CALLED with VG: vg01
<333> lvm_check_chars -- CALLED with name: "vg01"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
vgcfgrestore -- checking existence of "/etc/lvmconf/vg01.conf"
vgcfgrestore -- reading volume group data for "vg01" from
"/etc/lvmconf/vg01.conf"
<22> vg_check_consistency -- CALLED
<333> vg_check_name -- CALLED with VG: vg01
<4444> lvm_check_chars -- CALLED with name: "vg01"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_check_consistency -- LEAVING with ret: 0
vgcfgrestore -- reading physical volume data for "vg01" from
"/etc/lvmconf/vg01.conf"
vgcfgrestore -- ERROR: different structure size stored in
"/etc/lvmconf/vg01.conf" than expected in file vg_cfgrestore.c [line
137]
<1> vg_cfgrestore -- LEAVING with ret: -328
<1> lvm_error -- CALLED with: -328
<1> lvm_error -- LEAVING with: "vg_cfgrestore(): read"
vgcfgrestore -- ERROR "vg_cfgrestore(): read" restoring volume group
"vg01"

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0


So, what else can I do?
I don=B4t want lose my data!
:(

Any hints?
Thanks.
Uli

--=20
'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
