Return-Path: <Heinz.Mauelshagen@t-online.de>
Date: Tue, 28 Nov 2000 01:31:49 +0000
From: Heinz J. Mauelshagen <Heinz.Mauelshagen@t-online.de>
Message-ID: <20001128013149.I20735@srv.t-online.de>
References: <Pine.OSF.4.21.0011271135360.25631-100000@lazy.accessus.net>
Mime-Version: 1.0
In-Reply-To: <Pine.OSF.4.21.0011271135360.25631-100000@lazy.accessus.net>; from jay@lazy.accessus.net on Mon, Nov 27, 2000 at 11:41:20AM -0600
Subject: [linux-lvm] Re: LVM 0.9 Problem
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jay Weber <jay@lazy.accessus.net>
Cc: linux-lvm@sistina.com

On Mon, Nov 27, 2000 at 11:41:20AM -0600, Jay Weber wrote:
> Hi,
> 
> I've just managed to pull an Oops out of LVM.  Scenario is that I had a
> seperate raid5 array setup with lvm 0.8final in past.  Switched over to
> using 0.9 kernelside and utils.  That seemed to work out okay and no
> problems.
> 
> Today I reinstalled the root filesystem (which means /etc/lvmtab* go
> bye-bye).  Now, after bootup (which runs vgscan && vgchange -ay) the
> volume tells me it's inactive with using vgdisplay -D.

"vgdisplay -D" always tell's you that, because the active flag is never
set on disk.

> When I ran
> vgchange -ay again (which say's it's already active) the Oops showed up.

If your first "vgscan && vgchange -ay" went o.k. the "it's already active"
message is o.k. as well.
The Oops nevertheless isn't ;-(

Anyway: you didn't tell if you are still able to access your VG after
        an initial boot time "vgscan && vgchange -ay"?

With one of my recent mails I submitted a patch to lvm.c which fixes
tampering the name of the PV.
Maybe this flaw triggeres the problem you see too.

Could you please test that patch as well and report if it helps.

Thanks,
Heinz

> 
> I ran vgchange -d -ay afterwards but am unsure if it will have the desired
> results.  It is still claming it's already active, but if I run vgdisplay
> it says it is NOT active.
> 
> Any clues?  I've attached the output logs below.
> 
> Thanks.
> ----
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: Unable to handle kernel NULL pointer dereference at virtual address 000001b0 
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: current->tss.cr3 = 38a1b000, %cr3 = 38a1b000 
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: *pde = 00000000 
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: Oops: 0000 
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: CPU:    0 
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: EIP:    0010:[lvm_pv_get_number+63/72] 
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: EFLAGS: 00010246 
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: eax: 00000000   ebx: 00000400   ecx: 00000100   edx: 00000000 
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: esi: 0000ffff   edi: fbfc4000   ebp: f8950000   esp: f8bafb54 
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: ds: 0018   es: 0018   ss: 0018 
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: Process vgchange (pid: 1253, process nr: 88, stackpage=f8baf000) 
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: Stack: 0000ffff 00000001 fbfc4000 f9e8fe00 00000004 00000000 00000000 f9e8fe00  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        00000293 00000000 00000000 0000ffff 00000000 c01c0dfb fbfc4000 f9e8fe00  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        00000000 0805ce9c 00000000 f8bafc24 00000001 00000001 f9e8fe00 fbfc44c4  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: Call Trace: [<0000ffff>] [<00000001>] [<00000004>] [<00000000>] [<00000000>] [<00000293>] [<00000000>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000000>] [<0000ffff>] [<00000000>] [lvm_do_lv_create+1451/1924] [<00000000>] [<00000000>] [<00000001>] [<00000001>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000100>] [<00000004>] [<00000000>] [<00000001>] [lvm_do_vg_create+1059/1140] [<00000000>] [<00000000>] [<00000400>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000065>] [<00000194>] [<000003fc>] [<00000000>] [<00000001>] [<00000000>] [<00000000>] [<00000000>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 last message repeated 2 times
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000000>] [<00000000>] [<00000000>] [<00306776>] [<00000000>] [<00000000>] [<00000000>] [<00000000>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 last message repeated 2 times
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000000>] [<00000000>] [<00000000>] [<00000005>] [<00000001>] [<00000000>] [<00003a01>] [<00000001>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000000>] [<00000000>] [<00000000>] [<00080000>] [<00000004>] [<00000004>] [<00000001>] [<00000000>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000000>] [<00000000>] [<00000000>] [<00000078>] [<00000000>] [<00000000>] [<00000000>] [<00000001>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000ffc>] [<00000080>] [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>] [<00000000>] [lvm_chr_ioctl+791/1992] [<00000000>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000002>] [<00000000>] [<00000001>] [<00000000>] [<00000000>] [data_none_cmds.565+46129/46641] [<00000001>] [<0000000a>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000002>] [<00000001>] [<00000000>] [<00000000>] [data_none_cmds.565+46129/46641] [<00000000>] [<00000002>] [<00000003>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000000>] [<00000001>] [ide_hwif_to_major+15587/16965] [ide_hwif_to_major+15586/16965] [<0000000a>] [vsprintf+907/968] [<00000000>] [<00000001>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [do_follow_link+120/132] [lookup_dentry+351/488] [<00000003>] [permission+39/44] [get_chrfops+30/36] [<0000006d>] [<00000000>] [<000000ff>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [tvecs+11324/15520] [chrdev_open+63/76] [<00000000>] [sys_ioctl+441/484] [<00000004>] [free_pages+36/40] [sys_open+130/172] [system_call+52/56]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<00000004>] [<00000004>] [<00000036>] [<0000002b>] [<0000002b>] [<00000036>] [<00000023>] [<00000246>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel:        [<0000002b>]  
> Nov 27 09:30:40 dhcp-net10-3-sw2-231 kernel: Code: 8b 80 b0 01 00 00 c3 89 f6 83 ec 14 55 57 56 53 8b 4c 24 34  
> 
> ----
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> <1> lvm_get_iop_version -- LEAVING with ret: 10
> <1> lvm_lock -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_lock -- LEAVING with ret: 0
> <1> lvm_tab_vg_check_exist_all_vg -- CALLED
> <22> lvm_tab_read -- CALLED
> <22> lvm_tab_read -- LEAVING with ret: 0  data: 804D6C0  size: 4
> <1> lvm_tab_vg_check_exist_all_vg -- LEAVING with ret: 0
> <1> vg_check_name -- CALLED
> <1> vg_check_name -- vg_name: "vg0"
> <22> lvm_check_chars -- CALLED with name: "vg0"
> <22> lvm_check_chars -- LEAVING with ret: 0
> <1> vg_check_name -- LEAVING with ret: 0
> <1> lvm_tab_vg_check_exist -- CALLED with vg_name: "vg0"
> <22> vg_check_name -- CALLED
> <22> vg_check_name -- vg_name: "vg0"
> <333> lvm_check_chars -- CALLED with name: "vg0"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> lvm_tab_read -- CALLED
> <22> lvm_tab_read -- LEAVING with ret: 0  data: 804D6E0  size: 4
> <22> vg_cfgrestore -- CALLED
> <333> vg_check_name -- CALLED
> <333> vg_check_name -- vg_name: "vg0"
> <4444> lvm_check_chars -- CALLED with name: "vg0"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- CALLED
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/rd/c0d1p1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rd/c0d1p1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/vg0/lv0"
> <55555> lvm_check_chars -- CALLED with name: "/dev/vg0/lv0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "vg0"
> <666666> lvm_check_chars -- CALLED with name: "vg0"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/vg0/foo"
> <55555> lvm_check_chars -- CALLED with name: "/dev/vg0/foo"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "vg0"
> <666666> lvm_check_chars -- CALLED with name: "vg0"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> vg_check_consistency_with_pv_and_lv -- CALLED
> <4444> vg_check_consistency -- CALLED
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "vg0"
> <666666> lvm_check_chars -- CALLED with name: "vg0"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> vg_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- CALLED
> <55555> vg_check_consistency -- CALLED
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "vg0"
> <7777777> lvm_check_chars -- CALLED with name: "vg0"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> vg_check_consistency -- LEAVING with ret: 0
> <55555> pv_check_consistency -- CALLED
> <666666> pv_check_name -- CALLED with "/dev/rd/c0d1p1"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rd/c0d1p1"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "vg0"
> <7777777> lvm_check_chars -- CALLED with name: "vg0"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_new -- CALLED
> <666666> pv_check_new -- LEAVING with ret: 0
> <55555> pv_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
> <4444> lv_check_consistency_all_lv -- vg->lv[0]: 8050958  name: /dev/vg0/lv0
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/vg0/lv0"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/vg0/lv0"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED
> <7777777> vg_check_name -- vg_name: "vg0"
> <88888888> lvm_check_chars -- CALLED with name: "vg0"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "vg0"
> <7777777> lvm_check_chars -- CALLED with name: "vg0"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[1]: 805CD08  name: /dev/vg0/foo
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/vg0/foo"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/vg0/foo"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED
> <7777777> vg_check_name -- vg_name: "vg0"
> <88888888> lvm_check_chars -- CALLED with name: "vg0"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "vg0"
> <7777777> lvm_check_chars -- CALLED with name: "vg0"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- LEAVING with ret: 0
> <333> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
> <22> vg_cfgrestore -- LEAVING with ret: 0
> <1> lvm_tab_vg_check_exist -- before vg.pv_cur check with vg.pv_cur: 1  pv_count: 1
> <22> vg_free -- CALLED
> <22> vg_free -- entering PV loop
> <22> vg_free -- entering LV loop
> <22> vg_free -- LEAVING with ret: 0
> <1> lvm_tab_vg_check_exist -- LEAVING with ret: 1
> <1> lvm_tab_vg_read_with_pv_and_lv -- CALLED vg_name: vg0
> <22> vg_check_name -- CALLED
> <22> vg_check_name -- vg_name: "vg0"
> <333> lvm_check_chars -- CALLED with name: "vg0"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> vg_cfgrestore -- CALLED
> <333> vg_check_name -- CALLED
> <333> vg_check_name -- vg_name: "vg0"
> <4444> lvm_check_chars -- CALLED with name: "vg0"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- CALLED
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/rd/c0d1p1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rd/c0d1p1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/vg0/lv0"
> <55555> lvm_check_chars -- CALLED with name: "/dev/vg0/lv0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "vg0"
> <666666> lvm_check_chars -- CALLED with name: "vg0"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/vg0/foo"
> <55555> lvm_check_chars -- CALLED with name: "/dev/vg0/foo"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "vg0"
> <666666> lvm_check_chars -- CALLED with name: "vg0"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> vg_check_consistency_with_pv_and_lv -- CALLED
> <4444> vg_check_consistency -- CALLED
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "vg0"
> <666666> lvm_check_chars -- CALLED with name: "vg0"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> vg_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- CALLED
> <55555> vg_check_consistency -- CALLED
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "vg0"
> <7777777> lvm_check_chars -- CALLED with name: "vg0"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> vg_check_consistency -- LEAVING with ret: 0
> <55555> pv_check_consistency -- CALLED
> <666666> pv_check_name -- CALLED with "/dev/rd/c0d1p1"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/rd/c0d1p1"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "vg0"
> <7777777> lvm_check_chars -- CALLED with name: "vg0"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_new -- CALLED
> <666666> pv_check_new -- LEAVING with ret: 0
> <55555> pv_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
> <4444> lv_check_consistency_all_lv -- vg->lv[0]: 8050958  name: /dev/vg0/lv0
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/vg0/lv0"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/vg0/lv0"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED
> <7777777> vg_check_name -- vg_name: "vg0"
> <88888888> lvm_check_chars -- CALLED with name: "vg0"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "vg0"
> <7777777> lvm_check_chars -- CALLED with name: "vg0"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[1]: 805CD08  name: /dev/vg0/foo
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/vg0/foo"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/vg0/foo"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED
> <7777777> vg_check_name -- vg_name: "vg0"
> <88888888> lvm_check_chars -- CALLED with name: "vg0"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "vg0"
> <7777777> lvm_check_chars -- CALLED with name: "vg0"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
> <4444> lv_check_consistency_all_lv -- LEAVING with ret: 0
> <333> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
> <22> vg_cfgrestore -- LEAVING with ret: 0
> <1> lvm_tab_vg_read_with_pv_and_lv -- LEAVING with ret: 0
> <1> vg_check_consistency_with_pv_and_lv -- CALLED
> <22> vg_check_consistency -- CALLED
> <333> vg_check_name -- CALLED
> <333> vg_check_name -- vg_name: "vg0"
> <4444> lvm_check_chars -- CALLED with name: "vg0"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <22> vg_check_consistency -- LEAVING with ret: 0
> <22> pv_check_consistency_all_pv -- CALLED
> <333> vg_check_consistency -- CALLED
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/rd/c0d1p1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/rd/c0d1p1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <22> pv_check_consistency_all_pv -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
> <22> lv_check_consistency_all_lv -- vg->lv[0]: 8050958  name: /dev/vg0/lv0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/vg0/lv0"
> <55555> lvm_check_chars -- CALLED with name: "/dev/vg0/lv0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "vg0"
> <666666> lvm_check_chars -- CALLED with name: "vg0"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[1]: 805CD08  name: /dev/vg0/foo
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/vg0/foo"
> <55555> lvm_check_chars -- CALLED with name: "/dev/vg0/foo"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "vg0"
> <666666> lvm_check_chars -- CALLED with name: "vg0"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "vg0"
> <55555> lvm_check_chars -- CALLED with name: "vg0"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <22> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
> <22> lv_check_consistency_all_lv -- LEAVING with ret: 0
> <1> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
> <1> lvm_dont_interrupt -- CALLED
> <1> lvm_interrupt -- LEAVING
> <1> vg_create_remove -- CALLED
> <22> vg_check_name -- CALLED
> <22> vg_check_name -- vg_name: "vg0"
> <333> lvm_check_chars -- CALLED with name: "vg0"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <1> vg_create_remove -- IOCTL
> <1> vg_create_remove -- IOCTL returned: -6
> <1> vg_create_remove -- LEAVING with ret: -6
> vgchange -- vg_remove returned: -6
> vgchange -- volume group "vg0" isn't active
> <1> vg_free -- CALLED
> <1> vg_free -- entering PV loop
> <1> vg_free -- entering LV loop
> <1> vg_free -- LEAVING with ret: 0
> <1> lvm_unlock -- CALLED
> <1> lvm_unlock -- LEAVING with ret: 0
> <1> lvm_unlock -- CALLED
> <1> lvm_unlock -- LEAVING with ret: -104
> 

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Bartningstr. 12
                                                  64289 Darmstadt
                                                  Germany
Mauelshagen@Sistina.com                           +49 6151 7103 86
                                                       FAX 7103 96
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
