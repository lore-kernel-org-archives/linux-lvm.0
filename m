Return-Path: <plamb_98@yahoo.com>
Message-ID: <20010820200942.82753.qmail@web13404.mail.yahoo.com>
Date: Mon, 20 Aug 2001 13:09:42 -0700 (PDT)
From: Pierre Lamb <plamb_98@yahoo.com>
Subject: Re: [linux-lvm] no volume groups found
In-Reply-To: <20010820220405.A5266@sky.net>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: linux-lvm@sistina.com

THATS WHY IT IS CALLED UNSTABLE!!!!!!!!!!!!!!!!!
--- Ulrich Wiederhold <U.Wiederhold@gmx.net> wrote:
> Hello,
> I use 2.4.9 with debian unstable and lvm version
> 0.9.1_beta6. I don�t
> use devfs and compiled lvm into the kernel.
> I created a vg nameed vg01 containing
> hda2,hdb1,hdd1,sdb1 and sdc1. Then
> I created some lv�s and made a mkfs.xfs.
> I could do a "vgscan -v && vgchange -a y" and mount
> my lv�s.
> 
> After a reboot, /etc/rcS.d/S25lvm couldn�t find any
> vg�s. So I ran the
> script manually and it works.
> 
> I had some other problems that need me to reboot and
> my PC crashed several
> times. Now, I can�t even run the script manually. I
> always get this:
> 
> home:# vgscan -v
> vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> vgscan -- creating empty "/etc/lvmtab" and
> "/etc/lvmtab.d"
> vgscan -- reading all physical volumes (this may
> take a while...)
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d"
> successfully created
> vgscan -- WARNING: This program does not do a VGDA
> backup of your volume
> group
> 
> home:# vgchange -a y
> vgchange -- no volume groups found
> 
> home:# vgdisplay
> vgdisplay -- no volume groups found
> 
> Then I did "man vgcfgrestore" and tryed
> home:# vgcfgrestore -n vg01 -l
> vgcfgrestore -- ERROR: different structure size
> stored in
> "/etc/lvmconf/vg01.conf" than expected in file
> vg_cfgrestore.c [line
> 137]
> vgcfgrestore -- ERROR "vg_cfgrestore(): read"
> restoring volume group
> "vg01"
> 
> and:
> home:# vgcfgrestore -f /etc/lvmconf/vg01.conf.1.old
> -n vg01 /dev/sdb1
> vgcfgrestore -- ERROR: different structure size
> stored in
> "/etc/lvmconf/vg01.conf.1.old" than expected in file
> vg_cfgrestore.c
> [line 137]
> vgcfgrestore -- ERROR "vg_cfgrestore(): read"
> restoring volume group
> "vg01"
> 
> What "PhysicalVolumePath" should I use with it?
> 
> Then I looked in the mail-archive and did a:
> home:/home/fzzgrr# vgcfgrestore -v -d -n vg01
> /dev/hda2
> <1> vg_check_name -- CALLED with VG: vg01
> <22> lvm_check_chars -- CALLED with name: "vg01"
> <22> lvm_check_chars -- LEAVING with ret: 0
> <1> vg_check_name -- LEAVING with ret: 0
> <1> pv_check_name -- CALLED with "/dev/hda2"
> <22> lvm_check_chars -- CALLED with name:
> "/dev/hda2"
> <22> lvm_check_chars -- LEAVING with ret: 0
> <22> lvm_check_dev -- CALLED
> <333> lvm_check_partitioned_dev -- CALLED
> <333> lvm_check_partitioned_dev -- LEAVING with ret:
> TRUE
> <22> lvm_check_dev -- LEAVING with ret: 1
> <1> pv_check_name -- LEAVING with ret: 0
> <1> vg_check_active -- CALLED with VG: vg01
> <22> vg_check_name -- CALLED with VG: vg01
> <333> lvm_check_chars -- CALLED with name: "vg01"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> vg_status -- CALLED with VG: vg01
> <333> vg_check_name -- CALLED with VG: vg01
> <4444> lvm_check_chars -- CALLED with name: "vg01"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <22> vg_status -- LEAVING with ret: -6
> <1> vg_check_active -- LEAVING with ret: -6
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> <1> lvm_get_iop_version -- LEAVING with ret: 10
> vgcfgrestore -- locking logical volume manager
> <1> lvm_lock -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_lock -- LEAVING with ret: 0
> <1> lvm_dont_interrupt -- CALLED
> <1> lvm_dont_interrupt -- LEAVING
> vgcfgrestore -- restoring volume group "vg01" from
> "/etc/lvmconf/vg01.conf"
> <1> vg_cfgrestore -- CALLED
> <22> vg_check_name -- CALLED with VG: vg01
> <333> lvm_check_chars -- CALLED with name: "vg01"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> vgcfgrestore -- checking existence of
> "/etc/lvmconf/vg01.conf"
> vgcfgrestore -- reading volume group data for "vg01"
> from
> "/etc/lvmconf/vg01.conf"
> <22> vg_check_consistency -- CALLED
> <333> vg_check_name -- CALLED with VG: vg01
> <4444> lvm_check_chars -- CALLED with name: "vg01"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <22> vg_check_consistency -- LEAVING with ret: 0
> vgcfgrestore -- reading physical volume data for
> "vg01" from
> "/etc/lvmconf/vg01.conf"
> vgcfgrestore -- ERROR: different structure size
> stored in
> "/etc/lvmconf/vg01.conf" than expected in file
> vg_cfgrestore.c [line
> 137]
> <1> vg_cfgrestore -- LEAVING with ret: -328
> <1> lvm_error -- CALLED with: -328
> <1> lvm_error -- LEAVING with: "vg_cfgrestore():
> read"
> vgcfgrestore -- ERROR "vg_cfgrestore(): read"
> restoring volume group
> "vg01"
> 
> <1> lvm_unlock -- CALLED
> <1> lvm_unlock -- LEAVING with ret: 0
> 
> 
> So, what else can I do?
> I don�t want lose my data!
> :(
> 
> Any hints?
> Thanks.
> Uli
> 
> -- 
> 'The box said, 'Requires Windows 95 or better', so i
> installed Linux - TKK 5
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at
http://www.sistina.com/lvm/Pages/howto.html


__________________________________________________
Do You Yahoo!?
Make international calls for as low as $.04/minute with Yahoo! Messenger
http://phonecard.yahoo.com/
