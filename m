Return-Path: <mauelshagen@sistina.com>
Date: Wed, 25 Jul 2001 15:47:50 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] vgscan fails to find VGs
Message-ID: <20010725154750.A25906@sistina.com>
References: <996061897.15463.19.camel@pc-16> <20010725142143.A25531@sistina.com> <996065793.15458.32.camel@pc-16>
Mime-Version: 1.0
In-Reply-To: <996065793.15458.32.camel@pc-16>; from terje.eggestad@scali.no on Wed, Jul 25, 2001 at 02:56:32PM +0200
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
To: Terje Eggestad <terje.eggestad@scali.no>
Cc: linux-lvm@sistina.com, "Heinz J . Mauelshagen" <mauelshagen@sistina.com>

On Wed, Jul 25, 2001 at 02:56:32PM +0200, Terje Eggestad wrote:
> Yes I've have a hda partition lvm, hda6 to be exact. 
> 
> with the cdrom closed (with a cd) vgscan also completes almost
> immediatly:
> 

Strange, output shows that in this case /dev/hda6 is not even tried :-(

Anyone out there, who can share this experience (2 IDE attached drives,
1HD and 1 CDROM) that vgscan doesn't find any VGs, while a CD is in the drive?

Heinz

> [root@pc-16 te]# time vgscan 
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- found active volume group "vgroot"
> vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
> vgscan -- WARNING: This program does not do a VGDA backup of your volume
> group
> 
> 25.280u 15.510s 0:48.81 83.5%   0+0k 0+0io 900364pf+0w
> [root@pc-16 te]# time vgscan
> vgscan -- reading all physical volumes (this may take a while...)
> vgscan -- no volume groups found
> 
> 0.010u 0.000s 0:00.02 50.0%     0+0k 0+0io 163pf+0w
> [root@pc-16 te]#
> 
> 
> Well, here is the complete vgscan -d:
> 
> [root@pc-16 te]# time vgscan -d
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> <1> lvm_get_iop_version -- LEAVING with ret: 10
> <1> lvm_lock -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_lock -- LEAVING with ret: 0
> <1> lvm_dont_interrupt -- CALLED
> <1> lvm_interrupt -- LEAVING
> <1> lvm_remove_recursive -- CALLED with dir: /etc/lvmtab.d
> <1> lvm_remove_recursive -- LEAVING with ret: 0
> vgscan -- reading all physical volumes (this may take a while...)
> <1> vg_check_exist_all_vg -- CALLED
> <22> pv_read_all_pv -- CALLED
> <22> pv_read_all_pv -- calling lvm_dir_cache
> <333> lvm_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 0
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <333> lvm_dir_cache -- LEAVING with ret: 1
> <22> pv_read_all_pv -- calling stat with "/dev/hdc"
> <333> pv_read -- CALLED with /dev/hdc
> <4444> pv_check_name -- CALLED with "/dev/hdc"
> <55555> lvm_check_chars -- CALLED with name: "/dev/hdc"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> pv_read_already_red -- CALLED
> <4444> pv_read_already_red -- LEAVING with ret: 0
> <4444> pv_flush -- CALLED to flush /dev/hdc
> <55555> pv_check_name -- CALLED with "/dev/hdc"
> <666666> lvm_check_chars -- CALLED with name: "/dev/hdc"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_name -- LEAVING with ret: 0
> <4444> pv_flush -- LEAVING with ret: 0
> <333> pv_read -- going to read /dev/hdc
> <333> pv_read -- LEAVING with ret: -282
> <22> pv_read_all_pv -- pv_read returned: -282
> <22> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
> <22> pv_read_all_pv -- LEAVING with ret: -282
> <1> vg_check_exist_all_vg -- LEAVING with (null)
> <1> lvm_tab_create -- CALLED
> <22> lvm_tab_write -- CALLED
> <22> lvm_tab_write -- LEAVING with ret: 0
> <1> lvm_tab_create -- LEAVING
> <1> lvm_interrupt -- CALLED
> <1> lvm_interrupt -- LEAVING
> <1> lvm_unlock -- CALLED
> <1> lvm_unlock -- LEAVING with ret: 0
> vgscan -- no volume groups found
> 
> <1> lvm_unlock -- CALLED
> <1> lvm_unlock -- LEAVING with ret: -104
> 0.010u 0.000s 0:00.01 100.0%    0+0k 0+0io 166pf+0w
> [root@pc-16 te]# 
> 
> 
> Den 25 Jul 2001 14:21:43 +0200, skrev Heinz J . Mauelshagen:
> > On Wed, Jul 25, 2001 at 01:51:37PM +0200, Terje Eggestad wrote:
> > > NB: I'm using 0.9.1 B2 in case this problem is already fixed!
> > > (also RH 7.1 with stock 2.4.3).
> > > 
> > > But since At the bottom of http://www.sistina.com/lvm/doc/KNOWN_BUGS
> > > is says:
> > > 
> > > - there still seems to be a rare condition when vgscan(8) fails
> > >   to find your VGs.
> > >   Basically you only need to run vgscan if your disk
> > >   configuration changed or your lost your /etc/lvmtab* entries.
> > > 
> > > So it still may not be fixed.
> > > 
> > > Anyway i figured out that vgscan fails if there is a CD in the CD
> > > player, doesn't matter if's a audio or iso9660 CD.
> > > 
> > 
> > That error is only returned, if the read from the device fails (the CD ro drive)
> > and pv_read_all_pv() continues with looping through all found device specials.
> > 
> > After the loop the return code is zeroed *if* at least one PV has been found,
> > which should be the case (I assume you use a partition on hda as a PV).
> > 
> > Shouldn't make it fail.
> > 
> > In regard to your debug output:
> > 
> > What is XXX in the lines 
> > "pv_read_all_pv -- avoiding multiple entries"
> > in case of MD; np: XXX"? (np is the number of found PVs before deleting multiple
> > entries in the list of PVs).
> > 
> > What is YYY in the line "pv_read_all_pv -- LEAVING with ret: YYY"?
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> > > if you run vgscan -d 
> > > you get way down:
> > > <333> pv_read -- going to read /dev/hdc
> > > <333> pv_read -- LEAVING with ret: -282
> > > <22> pv_read_all_pv -- pv_read returned: -282
> > > 
> > > I only have hda and hdc, no scsi. 
> > > 
> > > TJ
> > > 
> > > --
> > > _________________________________________________________________________
> > > 
> > > Terje Eggestad                  terje.eggestad@scali.no
> > > Scali Scalable Linux Systems    http://www.scali.com
> > > 
> > > Olaf Helsets Vei 6              tel:    +47 22 62 89 61 (OFFICE)
> > > P.O.Box 70 Bogerud                      +47 975 31 574  (MOBILE)
> > > N-0621 Oslo                     fax:    +47 22 62 89 51
> > > NORWAY            
> > > _________________________________________________________________________
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> --
> _________________________________________________________________________
> 
> Terje Eggestad                  terje.eggestad@scali.no
> Scali Scalable Linux Systems    http://www.scali.com
> 
> Olaf Helsets Vei 6              tel:    +47 22 62 89 61 (OFFICE)
> P.O.Box 70 Bogerud                      +47 975 31 574  (MOBILE)
> N-0621 Oslo                     fax:    +47 22 62 89 51
> NORWAY            
> _________________________________________________________________________

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
