Return-Path: <shanu@exocore.com>
Date: Tue, 22 May 2001 10:34:59 +0530
From: Shanker Balan <shanu@exocore.com>
Subject: Re: [linux-lvm] LVM and multiple distributions
Message-ID: <20010522103459.A6179@monster.exocore.com>
References: <20010521112841.A28340@monster.exocore.com> <20010521145304.A10599@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20010521145304.A10599@sistina.com>; from Mauelshagen@sistina.com on Mon, May 21, 2001 at 02:53:04PM +0000
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

Hello:

Heinz J. Mauelshagen wrote,
> Did you run vgscan in order to read the metadata?
> "vgchange -ay" afterwards.

Yes i did, but does not look like it found something. It does not seem
to scan for LVM metadata /dev/hda.

~# vgscan -v -d
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING
<1> lvm_remove_recursive -- CALLED with dir: /etc/lvmtab.d
<1> lvm_remove_recursive -- LEAVING with ret: 0
<1> lvm_tab_create -- CALLED
<22> lvm_tab_write -- CALLED
<22> lvm_tab_write -- LEAVING with ret: 0
<1> lvm_tab_create -- LEAVING with ret: 0
<1> vg_check_exist_all_vg -- CALLED
<22> pv_read_all_pv -- CALLED
<22> pv_read_all_pv -- calling lvm_dir_cache
<333> lvm_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 0
<4444> lvm_add_dir_cache -- LEAVING
<4444> lvm_add_dir_cache -- CALLED
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> lvm_dir_cache_hit -- CALLED
<55555> lvm_dir_cache_hit -- LEAVING with ret: 1
<4444> lvm_add_dir_cache -- LEAVING
<333> lvm_dir_cache -- LEAVING with ret: 1
<22> pv_read_all_pv -- calling stat with "/dev/hdc"
<333> pv_read -- CALLED with /dev/hdc
<4444> pv_check_name -- CALLED with "/dev/hdc"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdc"
<55555> lvm_check_chars -- LEAVING with ret: 0
<55555> lvm_check_dev -- CALLED
<55555> lvm_check_dev -- LEAVING with ret: 1
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read_already_red -- CALLED with PV /dev/hdc
<4444> pv_read_already_red -- LEAVING with ret: 0
<4444> pv_flush -- CALLED to flush /dev/hdc
<55555> pv_check_name -- CALLED with "/dev/hdc"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdc"
<666666> lvm_check_chars -- LEAVING with ret: 0
<666666> lvm_check_dev -- CALLED
<666666> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_flush -- LEAVING with ret: 0
<333> pv_read -- going to read /dev/hdc
<333> pv_read -- LEAVING with ret: -282
<22> pv_read_all_pv -- pv_read returned: -282
<22> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<22> pv_read_all_pv -- LEAVING with ret: -282
<1> vg_check_exist_all_vg -- LEAVING with 0 VGs
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104
vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- creating empty "/etc/lvmtab" and "/etc/lvmtab.d"
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

-- Shanu

 -   -   -   -   -   -   -   -   -   -  - ( Shanu )  -  -
 Shanker Balan							shanu@exocore.com
