Return-Path: <jure@literal.si>
Message-ID: <3AC5F9E1.2F6AA35A@literal.si>
Date: Sat, 31 Mar 2001 17:38:09 +0200
From: Jure Simsic <jure.simsic@literal.si>
MIME-Version: 1.0
Subject: Re: [linux-lvm] vgchange -- ERROR: can't get name(s) of physical volumes
References: <200103302127.f2ULRi728029@webber.adilger.int>
Content-Type: multipart/mixed;
 boundary="------------C05BFA688740E357FD97C209"
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
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------C05BFA688740E357FD97C209
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Managed to recompile the kernel without devfs (a bit tricky since my
/usr is on LVM ;-)

Now I get vgchange say:
lvm -- lvm_chr_ioctl: unknown command 4004fe0a

vgchange -day attached,,

do you have any ideas what next (or what's the cause of all this). 
Btw, do you think my data is still alive on this disks?

Thanx,

Jure
p.s. Perhaps some recovery guidelines would be good in the HOWTO:
-what is the proper course of action when recovering LVM
-a note on devfs perhaps (or did I miss one)



Andreas Dilger wrote:
> 
> Jure writes:
> > at boot I get vgscan detect my VGs (eg. home and lvm-tmp), but then i
> > get vgchange -ay report the above message:
> >
> >  vgchange -- ERROR: can't get name(s) of physical volumes
> >  vgchange -- ERROR: Please check, if /proc is mounted
> >
> > The curious thing is, that the only devices that the output mentions is
> > /dev/hdc (by pv_get_size, pv_check_name, lvm_check_chars, pv_check_part
> > and so), which is in fact my cdrom. No mention of any hda's or hdb's..
> 
> You have devfs compiled into the kernel, but not mounted.  Look into
> /proc/partitions to see why it is broken. I would suggest that you remove
> the devfs configuration from your kernel and recompile.  The support for
> devfs is not super good right now.
>
--------------C05BFA688740E357FD97C209
Content-Type: text/plain; charset=us-ascii;
 name="vgchange-day"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="vgchange-day"

<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> lvm_tab_vg_check_exist_all_vg -- CALLED
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804D520  size: 13
<1> lvm_tab_vg_check_exist_all_vg -- LEAVING with ret: 0
<1> vg_check_name -- CALLED
<1> vg_check_name -- vg_name: "home"
<22> lvm_check_chars -- CALLED with name: "home"
<22> lvm_check_chars -- LEAVING with ret: 0
<1> vg_check_name -- LEAVING with ret: 0
<1> lvm_tab_vg_check_exist -- CALLED with vg_name: "home"
<22> vg_check_name -- CALLED
<22> vg_check_name -- vg_name: "home"
<333> lvm_check_chars -- CALLED with name: "home"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804D548  size: 13
<22> vg_cfgrestore -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "home"
<4444> lvm_check_chars -- CALLED with name: "home"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "home"
<55555> lvm_check_chars -- CALLED with name: "home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency -- CALLED
<4444> pv_check_name -- CALLED with "/dev/hda2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "home"
<55555> lvm_check_chars -- CALLED with name: "home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<333> pv_check_consistency -- LEAVING with ret: 0
<333> lv_check_consistency -- CALLED
<4444> lv_check_name -- CALLED with lv_name: "/dev/home/home"
<55555> lvm_check_chars -- CALLED with name: "/dev/home/home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "home"
<666666> lvm_check_chars -- CALLED with name: "home"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "home"
<55555> lvm_check_chars -- CALLED with name: "home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_consistency -- LEAVING with ret: 0
<333> vg_setup_pointers_for_snapshots -- CALLED
<333> vg_setup_pointers_for_snapshots -- LEAVING
<333> vg_check_consistency_with_pv_and_lv -- CALLED
<4444> vg_check_consistency -- CALLED
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "home"
<666666> lvm_check_chars -- CALLED with name: "home"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> vg_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency_all_pv -- CALLED
<55555> vg_check_consistency -- CALLED
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "home"
<7777777> lvm_check_chars -- CALLED with name: "home"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> vg_check_consistency -- LEAVING with ret: 0
<55555> pv_check_consistency -- CALLED
<666666> pv_check_name -- CALLED with "/dev/hda2"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hda2"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "home"
<7777777> lvm_check_chars -- CALLED with name: "home"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_new -- CALLED
<666666> pv_check_new -- LEAVING with ret: 0
<55555> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency_all_pv -- LEAVING with ret: 0
<4444> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
<4444> lv_check_consistency_all_lv -- vg->lv[0]: 804DD60  name: /dev/home/home
<55555> lv_check_consistency -- CALLED
<666666> lv_check_name -- CALLED with lv_name: "/dev/home/home"
<7777777> lvm_check_chars -- CALLED with name: "/dev/home/home"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> vg_check_name -- CALLED
<7777777> vg_check_name -- vg_name: "home"
<88888888> lvm_check_chars -- CALLED with name: "home"
<88888888> lvm_check_chars -- LEAVING with ret: 0
<7777777> vg_check_name -- LEAVING with ret: 0
<666666> lv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "home"
<7777777> lvm_check_chars -- CALLED with name: "home"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> lv_check_consistency -- LEAVING with ret: 0
<4444> lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- LEAVING with ret: 0
<333> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
<22> vg_cfgrestore -- LEAVING with ret: 0
<1> lvm_tab_vg_check_exist -- before vg.pv_cur check with vg.pv_cur: 1  pv_count: 1
<22> vg_free -- CALLED
<22> vg_free -- entering PV loop
<22> vg_free -- entering LV loop
<22> vg_free -- LEAVING with ret: 0
<1> lvm_tab_vg_check_exist -- LEAVING with ret: 1
<1> lvm_tab_vg_read_with_pv_and_lv -- CALLED vg_name: home
<22> vg_check_name -- CALLED
<22> vg_check_name -- vg_name: "home"
<333> lvm_check_chars -- CALLED with name: "home"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_cfgrestore -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "home"
<4444> lvm_check_chars -- CALLED with name: "home"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "home"
<55555> lvm_check_chars -- CALLED with name: "home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency -- CALLED
<4444> pv_check_name -- CALLED with "/dev/hda2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "home"
<55555> lvm_check_chars -- CALLED with name: "home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<333> pv_check_consistency -- LEAVING with ret: 0
<333> lv_check_consistency -- CALLED
<4444> lv_check_name -- CALLED with lv_name: "/dev/home/home"
<55555> lvm_check_chars -- CALLED with name: "/dev/home/home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "home"
<666666> lvm_check_chars -- CALLED with name: "home"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "home"
<55555> lvm_check_chars -- CALLED with name: "home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_consistency -- LEAVING with ret: 0
<333> vg_setup_pointers_for_snapshots -- CALLED
<333> vg_setup_pointers_for_snapshots -- LEAVING
<333> vg_check_consistency_with_pv_and_lv -- CALLED
<4444> vg_check_consistency -- CALLED
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "home"
<666666> lvm_check_chars -- CALLED with name: "home"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> vg_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency_all_pv -- CALLED
<55555> vg_check_consistency -- CALLED
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "home"
<7777777> lvm_check_chars -- CALLED with name: "home"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> vg_check_consistency -- LEAVING with ret: 0
<55555> pv_check_consistency -- CALLED
<666666> pv_check_name -- CALLED with "/dev/hda2"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hda2"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "home"
<7777777> lvm_check_chars -- CALLED with name: "home"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_new -- CALLED
<666666> pv_check_new -- LEAVING with ret: 0
<55555> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency_all_pv -- LEAVING with ret: 0
<4444> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
<4444> lv_check_consistency_all_lv -- vg->lv[0]: 804DD60  name: /dev/home/home
<55555> lv_check_consistency -- CALLED
<666666> lv_check_name -- CALLED with lv_name: "/dev/home/home"
<7777777> lvm_check_chars -- CALLED with name: "/dev/home/home"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> vg_check_name -- CALLED
<7777777> vg_check_name -- vg_name: "home"
<88888888> lvm_check_chars -- CALLED with name: "home"
<88888888> lvm_check_chars -- LEAVING with ret: 0
<7777777> vg_check_name -- LEAVING with ret: 0
<666666> lv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "home"
<7777777> lvm_check_chars -- CALLED with name: "home"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> lv_check_consistency -- LEAVING with ret: 0
<4444> lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- LEAVING with ret: 0
<333> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
<22> vg_cfgrestore -- LEAVING with ret: 0
<1> lvm_tab_vg_read_with_pv_and_lv -- LEAVING with ret: 0
<1> vg_check_consistency_with_pv_and_lv -- CALLED
<22> vg_check_consistency -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "home"
<4444> lvm_check_chars -- CALLED with name: "home"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_check_consistency -- LEAVING with ret: 0
<22> pv_check_consistency_all_pv -- CALLED
<333> vg_check_consistency -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "home"
<55555> lvm_check_chars -- CALLED with name: "home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency -- CALLED
<4444> pv_check_name -- CALLED with "/dev/hda2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "home"
<55555> lvm_check_chars -- CALLED with name: "home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<333> pv_check_consistency -- LEAVING with ret: 0
<22> pv_check_consistency_all_pv -- LEAVING with ret: 0
<22> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
<22> lv_check_consistency_all_lv -- vg->lv[0]: 804DD60  name: /dev/home/home
<333> lv_check_consistency -- CALLED
<4444> lv_check_name -- CALLED with lv_name: "/dev/home/home"
<55555> lvm_check_chars -- CALLED with name: "/dev/home/home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "home"
<666666> lvm_check_chars -- CALLED with name: "home"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "home"
<55555> lvm_check_chars -- CALLED with name: "home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_consistency -- LEAVING with ret: 0
<22> lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
<22> lv_check_consistency_all_lv -- LEAVING with ret: 0
<1> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> vg_check_online_all_pv -- CALLED
<22> vg_check_consistency_with_pv_and_lv -- CALLED
<333> vg_check_consistency -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "home"
<55555> lvm_check_chars -- CALLED with name: "home"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency_all_pv -- CALLED
<4444> vg_check_consistency -- CALLED
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "home"
<666666> lvm_check_chars -- CALLED with name: "home"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> vg_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED with "/dev/hda2"
<666666> lvm_check_chars -- CALLED with name: "/dev/hda2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "home"
<666666> lvm_check_chars -- CALLED with name: "home"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency_all_pv -- LEAVING with ret: 0
<333> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
<333> lv_check_consistency_all_lv -- vg->lv[0]: 804DD60  name: /dev/home/home
<4444> lv_check_consistency -- CALLED
<55555> lv_check_name -- CALLED with lv_name: "/dev/home/home"
<666666> lvm_check_chars -- CALLED with name: "/dev/home/home"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "home"
<7777777> lvm_check_chars -- CALLED with name: "home"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> lv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "home"
<666666> lvm_check_chars -- CALLED with name: "home"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_consistency -- LEAVING with ret: 0
<333> lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
<333> lv_check_consistency_all_lv -- LEAVING with ret: 0
<22> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
<1> vg_check_online_all_pv -- before pv_read for /dev/hda2
<22> pv_read -- CALLED with /dev/hda2
<333> pv_check_name -- CALLED with "/dev/hda2"
<4444> lvm_check_chars -- CALLED with name: "/dev/hda2"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/hda2
<4444> pv_check_name -- CALLED with "/dev/hda2"
<55555> lvm_check_chars -- CALLED with name: "/dev/hda2"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hda2
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 3:2
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 0
<55555> lvm_add_dir_cache -- LEAVING
<55555> lvm_add_dir_cache -- CALLED
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache_hit -- CALLED
<666666> lvm_dir_cache_hit -- LEAVING with ret: 1
<55555> lvm_add_dir_cache -- LEAVING
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hda2
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<22> pv_read -- LEAVING with ret: 0
<1> vg_check_online_all_pv -- LEAVING with ret: 0
<1> vg_create_remove -- CALLED
<22> vg_check_name -- CALLED
<22> vg_check_name -- vg_name: "home"
<333> lvm_check_chars -- CALLED with name: "home"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_check_consistency -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "home"
<4444> lvm_check_chars -- CALLED with name: "home"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_check_consistency -- LEAVING with ret: 0
<1> vg_create_remove -- IOCTL
<1> vg_create_remove -- IOCTL returned: -22
<1> vg_create_remove -- LEAVING with ret: -22
<> vgchange -- vg_create returned: -22
<1> lvm_error -- CALLED with: -22
<1> lvm_error -- LEAVING with: "Invalid argument"
vgchange -- ERROR "Invalid argument" activating volume group "home"
<1> vg_check_name -- CALLED
<1> vg_check_name -- vg_name: "lvm-tmp"
<22> lvm_check_chars -- CALLED with name: "lvm-tmp"
<22> lvm_check_chars -- LEAVING with ret: 0
<1> vg_check_name -- LEAVING with ret: 0
<1> lvm_tab_vg_check_exist -- CALLED with vg_name: "lvm-tmp"
<22> vg_check_name -- CALLED
<22> vg_check_name -- vg_name: "lvm-tmp"
<333> lvm_check_chars -- CALLED with name: "lvm-tmp"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> lvm_tab_read -- CALLED
<22> lvm_tab_read -- LEAVING with ret: 0  data: 804F480  size: 13
<22> vg_cfgrestore -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "lvm-tmp"
<4444> lvm_check_chars -- CALLED with name: "lvm-tmp"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "lvm-tmp"
<55555> lvm_check_chars -- CALLED with name: "lvm-tmp"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency -- CALLED
<4444> pv_check_name -- CALLED with "/dev/hdb3"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdb3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "lvm-tmp"
<55555> lvm_check_chars -- CALLED with name: "lvm-tmp"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<333> pv_check_consistency -- LEAVING with ret: 0
<333> lv_check_consistency -- CALLED
<4444> lv_check_name -- CALLED with lv_name: "/dev/lvm-tmp/transit"
<55555> lvm_check_chars -- CALLED with name: "/dev/lvm-tmp/transit"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "lvm-tmp"
<666666> lvm_check_chars -- CALLED with name: "lvm-tmp"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "lvm-tmp"
<55555> lvm_check_chars -- CALLED with name: "lvm-tmp"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_consistency -- LEAVING with ret: 0
<333> vg_setup_pointers_for_snapshots -- CALLED
<333> vg_setup_pointers_for_snapshots -- LEAVING
<333> vg_check_consistency_with_pv_and_lv -- CALLED
<4444> vg_check_consistency -- CALLED
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "lvm-tmp"
<666666> lvm_check_chars -- CALLED with name: "lvm-tmp"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> vg_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency_all_pv -- CALLED
<55555> vg_check_consistency -- CALLED
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "lvm-tmp"
<7777777> lvm_check_chars -- CALLED with name: "lvm-tmp"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> vg_check_consistency -- LEAVING with ret: 0
<55555> pv_check_consistency -- CALLED
<666666> pv_check_name -- CALLED with "/dev/hdb3"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hdb3"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "lvm-tmp"
<7777777> lvm_check_chars -- CALLED with name: "lvm-tmp"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_new -- CALLED
<666666> pv_check_new -- LEAVING with ret: 0
<55555> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency_all_pv -- LEAVING with ret: 0
<4444> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
<4444> lv_check_consistency_all_lv -- vg->lv[0]: 80505A0  name: /dev/lvm-tmp/transit
<55555> lv_check_consistency -- CALLED
<666666> lv_check_name -- CALLED with lv_name: "/dev/lvm-tmp/transit"
<7777777> lvm_check_chars -- CALLED with name: "/dev/lvm-tmp/transit"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> vg_check_name -- CALLED
<7777777> vg_check_name -- vg_name: "lvm-tmp"
<88888888> lvm_check_chars -- CALLED with name: "lvm-tmp"
<88888888> lvm_check_chars -- LEAVING with ret: 0
<7777777> vg_check_name -- LEAVING with ret: 0
<666666> lv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "lvm-tmp"
<7777777> lvm_check_chars -- CALLED with name: "lvm-tmp"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> lv_check_consistency -- LEAVING with ret: 0
<4444> lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- LEAVING with ret: 0
<333> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
<22> vg_cfgrestore -- LEAVING with ret: 0
<1> lvm_tab_vg_check_exist -- before vg.pv_cur check with vg.pv_cur: 1  pv_count: 1
<22> vg_free -- CALLED
<22> vg_free -- entering PV loop
<22> vg_free -- entering LV loop
<22> vg_free -- LEAVING with ret: 0
<1> lvm_tab_vg_check_exist -- LEAVING with ret: 1
<1> vg_free -- CALLED
<1> vg_free -- entering PV loop
<1> vg_free -- entering LV loop
<1> vg_free -- LEAVING with ret: 0
<1> lvm_tab_vg_read_with_pv_and_lv -- CALLED vg_name: lvm-tmp
<22> vg_check_name -- CALLED
<22> vg_check_name -- vg_name: "lvm-tmp"
<333> lvm_check_chars -- CALLED with name: "lvm-tmp"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_cfgrestore -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "lvm-tmp"
<4444> lvm_check_chars -- CALLED with name: "lvm-tmp"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "lvm-tmp"
<55555> lvm_check_chars -- CALLED with name: "lvm-tmp"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency -- CALLED
<4444> pv_check_name -- CALLED with "/dev/hdb3"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdb3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "lvm-tmp"
<55555> lvm_check_chars -- CALLED with name: "lvm-tmp"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<333> pv_check_consistency -- LEAVING with ret: 0
<333> lv_check_consistency -- CALLED
<4444> lv_check_name -- CALLED with lv_name: "/dev/lvm-tmp/transit"
<55555> lvm_check_chars -- CALLED with name: "/dev/lvm-tmp/transit"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "lvm-tmp"
<666666> lvm_check_chars -- CALLED with name: "lvm-tmp"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "lvm-tmp"
<55555> lvm_check_chars -- CALLED with name: "lvm-tmp"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_consistency -- LEAVING with ret: 0
<333> vg_setup_pointers_for_snapshots -- CALLED
<333> vg_setup_pointers_for_snapshots -- LEAVING
<333> vg_check_consistency_with_pv_and_lv -- CALLED
<4444> vg_check_consistency -- CALLED
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "lvm-tmp"
<666666> lvm_check_chars -- CALLED with name: "lvm-tmp"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> vg_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency_all_pv -- CALLED
<55555> vg_check_consistency -- CALLED
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "lvm-tmp"
<7777777> lvm_check_chars -- CALLED with name: "lvm-tmp"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> vg_check_consistency -- LEAVING with ret: 0
<55555> pv_check_consistency -- CALLED
<666666> pv_check_name -- CALLED with "/dev/hdb3"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hdb3"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> lvm_check_dev -- CALLED
<7777777> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "lvm-tmp"
<7777777> lvm_check_chars -- CALLED with name: "lvm-tmp"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_check_new -- CALLED
<666666> pv_check_new -- LEAVING with ret: 0
<55555> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency_all_pv -- LEAVING with ret: 0
<4444> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
<4444> lv_check_consistency_all_lv -- vg->lv[0]: 804E568  name: /dev/lvm-tmp/transit
<55555> lv_check_consistency -- CALLED
<666666> lv_check_name -- CALLED with lv_name: "/dev/lvm-tmp/transit"
<7777777> lvm_check_chars -- CALLED with name: "/dev/lvm-tmp/transit"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<7777777> vg_check_name -- CALLED
<7777777> vg_check_name -- vg_name: "lvm-tmp"
<88888888> lvm_check_chars -- CALLED with name: "lvm-tmp"
<88888888> lvm_check_chars -- LEAVING with ret: 0
<7777777> vg_check_name -- LEAVING with ret: 0
<666666> lv_check_name -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "lvm-tmp"
<7777777> lvm_check_chars -- CALLED with name: "lvm-tmp"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> lv_check_consistency -- LEAVING with ret: 0
<4444> lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
<4444> lv_check_consistency_all_lv -- LEAVING with ret: 0
<333> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
<22> vg_cfgrestore -- LEAVING with ret: 0
<1> lvm_tab_vg_read_with_pv_and_lv -- LEAVING with ret: 0
<1> vg_check_consistency_with_pv_and_lv -- CALLED
<22> vg_check_consistency -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "lvm-tmp"
<4444> lvm_check_chars -- CALLED with name: "lvm-tmp"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_check_consistency -- LEAVING with ret: 0
<22> pv_check_consistency_all_pv -- CALLED
<333> vg_check_consistency -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "lvm-tmp"
<55555> lvm_check_chars -- CALLED with name: "lvm-tmp"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency -- CALLED
<4444> pv_check_name -- CALLED with "/dev/hdb3"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdb3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "lvm-tmp"
<55555> lvm_check_chars -- CALLED with name: "lvm-tmp"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_new -- CALLED
<4444> pv_check_new -- LEAVING with ret: 0
<333> pv_check_consistency -- LEAVING with ret: 0
<22> pv_check_consistency_all_pv -- LEAVING with ret: 0
<22> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
<22> lv_check_consistency_all_lv -- vg->lv[0]: 804E568  name: /dev/lvm-tmp/transit
<333> lv_check_consistency -- CALLED
<4444> lv_check_name -- CALLED with lv_name: "/dev/lvm-tmp/transit"
<55555> lvm_check_chars -- CALLED with name: "/dev/lvm-tmp/transit"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "lvm-tmp"
<666666> lvm_check_chars -- CALLED with name: "lvm-tmp"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_name -- LEAVING with ret: 0
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "lvm-tmp"
<55555> lvm_check_chars -- CALLED with name: "lvm-tmp"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> lv_check_consistency -- LEAVING with ret: 0
<22> lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
<22> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
<22> lv_check_consistency_all_lv -- LEAVING with ret: 0
<1> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> vg_check_online_all_pv -- CALLED
<22> vg_check_consistency_with_pv_and_lv -- CALLED
<333> vg_check_consistency -- CALLED
<4444> vg_check_name -- CALLED
<4444> vg_check_name -- vg_name: "lvm-tmp"
<55555> lvm_check_chars -- CALLED with name: "lvm-tmp"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> vg_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency_all_pv -- CALLED
<4444> vg_check_consistency -- CALLED
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "lvm-tmp"
<666666> lvm_check_chars -- CALLED with name: "lvm-tmp"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> vg_check_consistency -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED with "/dev/hdb3"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdb3"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "lvm-tmp"
<666666> lvm_check_chars -- CALLED with name: "lvm-tmp"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<333> pv_check_consistency_all_pv -- LEAVING with ret: 0
<333> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
<333> lv_check_consistency_all_lv -- vg->lv[0]: 804E568  name: /dev/lvm-tmp/transit
<4444> lv_check_consistency -- CALLED
<55555> lv_check_name -- CALLED with lv_name: "/dev/lvm-tmp/transit"
<666666> lvm_check_chars -- CALLED with name: "/dev/lvm-tmp/transit"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- CALLED
<666666> vg_check_name -- vg_name: "lvm-tmp"
<7777777> lvm_check_chars -- CALLED with name: "lvm-tmp"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> lv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED
<55555> vg_check_name -- vg_name: "lvm-tmp"
<666666> lvm_check_chars -- CALLED with name: "lvm-tmp"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> lv_check_consistency -- LEAVING with ret: 0
<333> lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
<333> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
<333> lv_check_consistency_all_lv -- LEAVING with ret: 0
<22> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
<1> vg_check_online_all_pv -- before pv_read for /dev/hdb3
<22> pv_read -- CALLED with /dev/hdb3
<333> pv_check_name -- CALLED with "/dev/hdb3"
<4444> lvm_check_chars -- CALLED with name: "/dev/hdb3"
<4444> lvm_check_chars -- LEAVING with ret: 0
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<333> pv_check_name -- LEAVING with ret: 0
<333> pv_read_already_red -- CALLED
<333> pv_read_already_red -- LEAVING with ret: 0
<333> pv_flush -- CALLED to flush /dev/hdb3
<4444> pv_check_name -- CALLED with "/dev/hdb3"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdb3"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<333> pv_flush -- LEAVING with ret: 0
<22> pv_read -- going to read /dev/hdb3
<333> lvm_check_dev -- CALLED
<333> lvm_check_dev -- LEAVING with ret: 1
<333> pv_copy_from_disk -- CALLED
<333> pv_copy_from_disk -- LEAVING
<333> pv_create_name_from_kdev_t -- CALLED with 3:67
<4444> lvm_check_dev -- CALLED
<4444> lvm_check_dev -- LEAVING with ret: 1
<4444> lvm_dir_cache -- CALLED
<4444> lvm_dir_cache -- LEAVING with ret: 12
<333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdb3
<333> system_id_check_exported -- CALLED
<333> system_id_check_exported -- LEAVING with ret: 0
<22> pv_read -- LEAVING with ret: 0
<1> vg_check_online_all_pv -- LEAVING with ret: 0
<1> vg_create_remove -- CALLED
<22> vg_check_name -- CALLED
<22> vg_check_name -- vg_name: "lvm-tmp"
<333> lvm_check_chars -- CALLED with name: "lvm-tmp"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_check_consistency -- CALLED
<333> vg_check_name -- CALLED
<333> vg_check_name -- vg_name: "lvm-tmp"
<4444> lvm_check_chars -- CALLED with name: "lvm-tmp"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_check_consistency -- LEAVING with ret: 0
<1> vg_create_remove -- IOCTL
<1> vg_create_remove -- IOCTL returned: -22
<1> vg_create_remove -- LEAVING with ret: -22
<> vgchange -- vg_create returned: -22
<1> lvm_error -- CALLED with: -22
<1> lvm_error -- LEAVING with: "Invalid argument"
vgchange -- ERROR "Invalid argument" activating volume group "lvm-tmp"
<1> vg_free -- CALLED
<1> vg_free -- entering PV loop
<1> vg_free -- entering LV loop
<1> vg_free -- LEAVING with ret: 0
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104


--------------C05BFA688740E357FD97C209--
