Return-Path: <Heinz.Mauelshagen@Sistina.com>
Date: Tue, 24 Jul 2001 16:36:27 +0200
From: "Heinz J . Mauelshagen" <mge@Sistina.com>
Subject: Re: [linux-lvm] vgextend problems?
Message-ID: <20010724163627.A19059@sistina.com>
References: <3B5D85ED.93779A30@berbee.com>
Mime-Version: 1.0
In-Reply-To: <3B5D85ED.93779A30@berbee.com>; from pichelma@berbee.com on Tue, Jul 24, 2001 at 09:27:57AM -0500
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
To: linux-lvm@Sistina.com

Scott,

that should be (crossing fingers ;-) fixed.

Please test with LVM 0.9.1 Beta 8 which will be announced on this list soon.

Regards,
Heinz    -- The LVM Guy --


On Tue, Jul 24, 2001 at 09:27:57AM -0500, Scott P wrote:
> Hi!
> 
> I apologize if am sending this to the wrong address or if this was fixed
> in the newest 0.9.1 beta 7!
> 
> Please examine the debug output from the attached file, thank-you very,
> very much!!!
> 
> ****WE are trying to add a pv to an existing vg w/ the "vgextend" cmd...
> 
> -Scott
> 

>    vgextend -d exp300_2 /dev/sdb1
> <1> lvm_get_iop_version -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> <1> lvm_get_iop_version -- LEAVING with ret: 10
> <1> lvm_lock -- CALLED
> <22> lvm_check_special -- CALLED
> <22> lvm_check_special -- LEAVING
> <1> lvm_lock -- LEAVING with ret: 0
> <1> pv_create_kdev_t -- CALLED with "exp300_2"
> <22> pv_check_name -- CALLED with "exp300_2"
> <22> pv_check_name -- LEAVING with ret: -226
> <1> pv_create_kdev_t -- LEAVING with ret: 0
> <1> vg_check_name -- CALLED
> <1> vg_check_name -- vg_name: "exp300_2"
> <22> lvm_check_chars -- CALLED with name: "exp300_2"
> <22> lvm_check_chars -- LEAVING with ret: 0
> <1> vg_check_name -- LEAVING with ret: 0
> <1> lvm_tab_vg_check_exist -- CALLED with vg_name: "exp300_2"
> <22> vg_check_name -- CALLED
> <22> vg_check_name -- vg_name: "exp300_2"
> <333> lvm_check_chars -- CALLED with name: "exp300_2"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> lvm_tab_read -- CALLED
> <22> lvm_tab_read -- LEAVING with ret: 0  data: 804BD10  size: 9
> <22> vg_cfgrestore -- CALLED
> <333> vg_check_name -- CALLED
> <333> vg_check_name -- vg_name: "exp300_2"
> <4444> lvm_check_chars -- CALLED with name: "exp300_2"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- CALLED
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "exp300_2"
> <55555> lvm_check_chars -- CALLED with name: "exp300_2"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/sdc1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "exp300_2"
> <55555> lvm_check_chars -- CALLED with name: "exp300_2"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/exp300_2/exp300_lv2"
> <55555> lvm_check_chars -- CALLED with name: "/dev/exp300_2/exp300_lv2"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "exp300_2"
> <666666> lvm_check_chars -- CALLED with name: "exp300_2"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "exp300_2"
> <55555> lvm_check_chars -- CALLED with name: "exp300_2"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> vg_check_consistency_with_pv_and_lv -- CALLED
> <4444> vg_check_consistency -- CALLED
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "exp300_2"
> <666666> lvm_check_chars -- CALLED with name: "exp300_2"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> vg_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- CALLED
> <55555> vg_check_consistency -- CALLED
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "exp300_2"
> <7777777> lvm_check_chars -- CALLED with name: "exp300_2"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> vg_check_consistency -- LEAVING with ret: 0
> <55555> pv_check_consistency -- CALLED
> <666666> pv_check_name -- CALLED with "/dev/sdc1"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "exp300_2"
> <7777777> lvm_check_chars -- CALLED with name: "exp300_2"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_new -- CALLED
> <666666> pv_check_new -- LEAVING with ret: 0
> <55555> pv_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
> <4444> lv_check_consistency_all_lv -- vg->lv[0]: 8059B98  name: /dev/exp300_2/exp300_lv2
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/exp300_2/exp300_lv2"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/exp300_2/exp300_lv2"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED
> <7777777> vg_check_name -- vg_name: "exp300_2"
> <88888888> lvm_check_chars -- CALLED with name: "exp300_2"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "exp300_2"
> <7777777> lvm_check_chars -- CALLED with name: "exp300_2"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
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
> <1> vg_check_active -- CALLED
> <22> vg_check_name -- CALLED
> <22> vg_check_name -- vg_name: "exp300_2"
> <333> lvm_check_chars -- CALLED with name: "exp300_2"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> vg_status -- CALLED
> <333> vg_check_name -- CALLED
> <333> vg_check_name -- vg_name: "exp300_2"
> <4444> lvm_check_chars -- CALLED with name: "exp300_2"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <22> vg_status -- LEAVING with ret: 0
> <1> vg_check_active -- LEAVING with ret: 1
> <1> lvm_tab_vg_read_with_pv_and_lv -- CALLED vg_name: exp300_2
> <22> vg_check_name -- CALLED
> <22> vg_check_name -- vg_name: "exp300_2"
> <333> lvm_check_chars -- CALLED with name: "exp300_2"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> vg_cfgrestore -- CALLED
> <333> vg_check_name -- CALLED
> <333> vg_check_name -- vg_name: "exp300_2"
> <4444> lvm_check_chars -- CALLED with name: "exp300_2"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- CALLED
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "exp300_2"
> <55555> lvm_check_chars -- CALLED with name: "exp300_2"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/sdc1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "exp300_2"
> <55555> lvm_check_chars -- CALLED with name: "exp300_2"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_new -- CALLED
> <4444> pv_check_new -- LEAVING with ret: 0
> <333> pv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency -- CALLED
> <4444> lv_check_name -- CALLED with lv_name: "/dev/exp300_2/exp300_lv2"
> <55555> lvm_check_chars -- CALLED with name: "/dev/exp300_2/exp300_lv2"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "exp300_2"
> <666666> lvm_check_chars -- CALLED with name: "exp300_2"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_name -- LEAVING with ret: 0
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "exp300_2"
> <55555> lvm_check_chars -- CALLED with name: "exp300_2"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> lv_check_consistency -- LEAVING with ret: 0
> <333> vg_check_consistency_with_pv_and_lv -- CALLED
> <4444> vg_check_consistency -- CALLED
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "exp300_2"
> <666666> lvm_check_chars -- CALLED with name: "exp300_2"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> vg_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- CALLED
> <55555> vg_check_consistency -- CALLED
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "exp300_2"
> <7777777> lvm_check_chars -- CALLED with name: "exp300_2"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> vg_check_consistency -- LEAVING with ret: 0
> <55555> pv_check_consistency -- CALLED
> <666666> pv_check_name -- CALLED with "/dev/sdc1"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "exp300_2"
> <7777777> lvm_check_chars -- CALLED with name: "exp300_2"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> pv_check_new -- CALLED
> <666666> pv_check_new -- LEAVING with ret: 0
> <55555> pv_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency_all_pv -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
> <4444> lv_check_consistency_all_lv -- vg->lv[0]: 805A550  name: /dev/exp300_2/exp300_lv2
> <55555> lv_check_consistency -- CALLED
> <666666> lv_check_name -- CALLED with lv_name: "/dev/exp300_2/exp300_lv2"
> <7777777> lvm_check_chars -- CALLED with name: "/dev/exp300_2/exp300_lv2"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- CALLED
> <7777777> vg_check_name -- vg_name: "exp300_2"
> <88888888> lvm_check_chars -- CALLED with name: "exp300_2"
> <88888888> lvm_check_chars -- LEAVING with ret: 0
> <7777777> vg_check_name -- LEAVING with ret: 0
> <666666> lv_check_name -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "exp300_2"
> <7777777> lvm_check_chars -- CALLED with name: "exp300_2"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_consistency -- LEAVING with ret: 0
> <4444> lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
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
> <1> lvm_show_size -- CALLED
> <1> lvm_show_size -- LEAVING
> vgextend -- INFO: maximum logical volume size is 1 Terabyte
> <1> pv_read_all_pv -- CALLED
> <1> pv_read_all_pv -- calling lvm_dir_cache
> <22> lvm_dir_cache -- CALLED
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 0
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 0
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 0
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 0
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 0
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 0
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 0
> <333> lvm_add_dir_cache -- LEAVING
> <333> lvm_add_dir_cache -- CALLED
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache_hit -- CALLED
> <4444> lvm_dir_cache_hit -- LEAVING with ret: 0
> <333> lvm_add_dir_cache -- LEAVING
> <22> lvm_dir_cache -- LEAVING with ret: 8
> <1> pv_read_all_pv -- calling stat with "/dev/sda"
> <22> pv_read -- CALLED with /dev/sda
> <333> pv_check_name -- CALLED with "/dev/sda"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sda"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_read_already_red -- CALLED
> <333> pv_read_already_red -- LEAVING with ret: 0
> <333> pv_flush -- CALLED to flush /dev/sda
> <4444> pv_check_name -- CALLED with "/dev/sda"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sda"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <333> pv_flush -- LEAVING with ret: 0
> <22> pv_read -- going to read /dev/sda
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_copy_from_disk -- CALLED
> <333> pv_copy_from_disk -- LEAVING
> <333> pv_create_name_from_kdev_t -- CALLED with 8:0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda
> <22> pv_read -- LEAVING with ret: -268
> <1> pv_read_all_pv -- pv_read returned: -268
> <1> pv_read_all_pv -- calling stat with "/dev/sda1"
> <22> pv_read -- CALLED with /dev/sda1
> <333> pv_check_name -- CALLED with "/dev/sda1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sda1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_read_already_red -- CALLED
> <333> pv_read_already_red -- LEAVING with ret: 0
> <333> pv_flush -- CALLED to flush /dev/sda1
> <4444> pv_check_name -- CALLED with "/dev/sda1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sda1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <333> pv_flush -- LEAVING with ret: 0
> <22> pv_read -- going to read /dev/sda1
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_copy_from_disk -- CALLED
> <333> pv_copy_from_disk -- LEAVING
> <333> pv_create_name_from_kdev_t -- CALLED with 8:1
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda1
> <22> pv_read -- LEAVING with ret: -268
> <1> pv_read_all_pv -- pv_read returned: -268
> <1> pv_read_all_pv -- calling stat with "/dev/sda2"
> <22> pv_read -- CALLED with /dev/sda2
> <333> pv_check_name -- CALLED with "/dev/sda2"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sda2"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_read_already_red -- CALLED
> <333> pv_read_already_red -- LEAVING with ret: 0
> <333> pv_flush -- CALLED to flush /dev/sda2
> <4444> pv_check_name -- CALLED with "/dev/sda2"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sda2"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <333> pv_flush -- LEAVING with ret: 0
> <22> pv_read -- going to read /dev/sda2
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_copy_from_disk -- CALLED
> <333> pv_copy_from_disk -- LEAVING
> <333> pv_create_name_from_kdev_t -- CALLED with 8:2
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda2
> <22> pv_read -- LEAVING with ret: -268
> <1> pv_read_all_pv -- pv_read returned: -268
> <1> pv_read_all_pv -- calling stat with "/dev/sda4"
> <22> pv_read -- CALLED with /dev/sda4
> <333> pv_check_name -- CALLED with "/dev/sda4"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sda4"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_read_already_red -- CALLED
> <333> pv_read_already_red -- LEAVING with ret: 0
> <333> pv_flush -- CALLED to flush /dev/sda4
> <4444> pv_check_name -- CALLED with "/dev/sda4"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sda4"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <333> pv_flush -- LEAVING with ret: 0
> <22> pv_read -- going to read /dev/sda4
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_copy_from_disk -- CALLED
> <333> pv_copy_from_disk -- LEAVING
> <333> pv_create_name_from_kdev_t -- CALLED with 8:4
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sda4
> <22> pv_read -- LEAVING with ret: -268
> <1> pv_read_all_pv -- pv_read returned: -268
> <1> pv_read_all_pv -- calling stat with "/dev/sdb"
> <22> pv_read -- CALLED with /dev/sdb
> <333> pv_check_name -- CALLED with "/dev/sdb"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdb"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_read_already_red -- CALLED
> <333> pv_read_already_red -- LEAVING with ret: 0
> <333> pv_flush -- CALLED to flush /dev/sdb
> <4444> pv_check_name -- CALLED with "/dev/sdb"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdb"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <333> pv_flush -- LEAVING with ret: 0
> <22> pv_read -- going to read /dev/sdb
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_copy_from_disk -- CALLED
> <333> pv_copy_from_disk -- LEAVING
> <333> pv_create_name_from_kdev_t -- CALLED with 8:16
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdb
> <22> pv_read -- LEAVING with ret: -268
> <1> pv_read_all_pv -- pv_read returned: -268
> <1> pv_read_all_pv -- calling stat with "/dev/sdb1"
> <22> pv_read -- CALLED with /dev/sdb1
> <333> pv_check_name -- CALLED with "/dev/sdb1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_read_already_red -- CALLED
> <333> pv_read_already_red -- LEAVING with ret: 0
> <333> pv_flush -- CALLED to flush /dev/sdb1
> <4444> pv_check_name -- CALLED with "/dev/sdb1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <333> pv_flush -- LEAVING with ret: 0
> <22> pv_read -- going to read /dev/sdb1
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_copy_from_disk -- CALLED
> <333> pv_copy_from_disk -- LEAVING
> <333> pv_create_name_from_kdev_t -- CALLED with 8:17
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdb1
> <333> system_id_check_exported -- CALLED
> <333> system_id_check_exported -- LEAVING with ret: 0
> <22> pv_read -- LEAVING with ret: 0
> <22> pv_get_size -- CALLED with /dev/sdb1 and 7FFFFA9C
> <333> pv_check_name -- CALLED with "/dev/sdb1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_check_part -- CALLED with /dev/sdb1
> <4444> pv_check_name -- CALLED with "/dev/sdb1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> lvm_dir_cache_find -- CALLED
> <55555> pv_check_name -- CALLED with "/dev/sdb1"
> <666666> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_name -- LEAVING with ret: 0
> <55555> lvm_dir_cache -- CALLED
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <55555> lvm_dir_cache -- LEAVING with ret: 8
> <4444> lvm_dir_cache_find -- LEAVING
> <4444> lvm_partition_count -- CALLED
> <4444> lvm_partition_count -- LEAVING with ret: 16
> <333> pv_check_part -- LEAVING with 1
> <333> lvm_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <333> lvm_dir_cache -- LEAVING with ret: 8
> <333> lvm_dir_cache_find -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/sdb1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> lvm_dir_cache_find -- LEAVING
> <333> lvm_check_partitioned_dev -- CALLED
> <333> lvm_check_partitioned_dev -- LEAVING
> <333> lvm_partition_count -- CALLED
> <333> lvm_partition_count -- LEAVING with ret: 16
> <22> pv_get_size -- BEFORE llseek 0:0
> <22> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 924243453
> <22> pv_get_size -- first == 1
> <22> pv_get_size -- part_i == part_i_tmp
> <22> pv_get_size -- LEAVING with ret: 924243453
> <22> pv_check_volume -- CALLED  dev_name: "/dev/sdb1"  pv: 805B968
> <333> pv_check_name -- CALLED with "/dev/sdb1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_check_new -- CALLED
> <333> pv_check_new -- LEAVING with ret: 1
> <22> pv_check_volume -- LEAVING with ret: 1
> <1> pv_read_all_pv: allocating for /dev/sdb1
> <1> pv_read_all_pv -- calling stat with "/dev/sdc"
> <22> pv_read -- CALLED with /dev/sdc
> <333> pv_check_name -- CALLED with "/dev/sdc"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdc"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_read_already_red -- CALLED
> <333> pv_read_already_red -- LEAVING with ret: 0
> <333> pv_flush -- CALLED to flush /dev/sdc
> <4444> pv_check_name -- CALLED with "/dev/sdc"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdc"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <333> pv_flush -- LEAVING with ret: 0
> <22> pv_read -- going to read /dev/sdc
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_copy_from_disk -- CALLED
> <333> pv_copy_from_disk -- LEAVING
> <333> pv_create_name_from_kdev_t -- CALLED with 8:32
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdc
> <22> pv_read -- LEAVING with ret: -268
> <1> pv_read_all_pv -- pv_read returned: -268
> <1> pv_read_all_pv -- calling stat with "/dev/sdc1"
> <22> pv_read -- CALLED with /dev/sdc1
> <333> pv_check_name -- CALLED with "/dev/sdc1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_read_already_red -- CALLED
> <333> pv_read_already_red -- LEAVING with ret: 0
> <333> pv_flush -- CALLED to flush /dev/sdc1
> <4444> pv_check_name -- CALLED with "/dev/sdc1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <333> pv_flush -- LEAVING with ret: 0
> <22> pv_read -- going to read /dev/sdc1
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_copy_from_disk -- CALLED
> <333> pv_copy_from_disk -- LEAVING
> <333> pv_create_name_from_kdev_t -- CALLED with 8:33
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdc1
> <333> system_id_check_exported -- CALLED
> <333> system_id_check_exported -- LEAVING with ret: 0
> <22> pv_read -- LEAVING with ret: 0
> <22> pv_get_size -- CALLED with /dev/sdc1 and 7FFFFA9C
> <333> pv_check_name -- CALLED with "/dev/sdc1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_check_part -- CALLED with /dev/sdc1
> <4444> pv_check_name -- CALLED with "/dev/sdc1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> lvm_dir_cache_find -- CALLED
> <55555> pv_check_name -- CALLED with "/dev/sdc1"
> <666666> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_name -- LEAVING with ret: 0
> <55555> lvm_dir_cache -- CALLED
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <55555> lvm_dir_cache -- LEAVING with ret: 8
> <4444> lvm_dir_cache_find -- LEAVING
> <4444> lvm_partition_count -- CALLED
> <4444> lvm_partition_count -- LEAVING with ret: 16
> <333> pv_check_part -- LEAVING with 1
> <333> lvm_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <333> lvm_dir_cache -- LEAVING with ret: 8
> <333> lvm_dir_cache_find -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/sdc1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> lvm_dir_cache_find -- LEAVING
> <333> lvm_check_partitioned_dev -- CALLED
> <333> lvm_check_partitioned_dev -- LEAVING
> <333> lvm_partition_count -- CALLED
> <333> lvm_partition_count -- LEAVING with ret: 16
> <22> pv_get_size -- BEFORE llseek 0:0
> <22> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 924243453
> <22> pv_get_size -- first == 1
> <22> pv_get_size -- part_i == part_i_tmp
> <22> pv_get_size -- LEAVING with ret: 924243453
> <22> pv_check_volume -- CALLED  dev_name: "/dev/sdc1"  pv: 805C180
> <333> pv_check_name -- CALLED with "/dev/sdc1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_check_new -- CALLED
> <333> pv_check_new -- LEAVING with ret: 0
> <333> vg_check_name -- CALLED
> <333> vg_check_name -- vg_name: "exp300_2"
> <4444> lvm_check_chars -- CALLED with name: "exp300_2"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <22> pv_check_volume -- LEAVING with ret: 1
> <1> pv_read_all_pv: allocating for /dev/sdc1 exp300_2
> <1> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 2
> <1> pv_read_all_pv -- LEAVING with ret: 0
> <1> vg_setup_for_extend -- CALLED
> <22> pv_check_name -- CALLED with "/dev/sdb1"
> <333> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <22> pv_check_name -- LEAVING with ret: 0
> <1> vgextend -- checking for maximum physical volume count of exp300_2
> <1> vgextend -- getting size of physical volume /dev/sdb1
> <22> pv_get_size -- CALLED with /dev/sdb1 and 0
> <333> pv_check_name -- CALLED with "/dev/sdb1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_check_part -- CALLED with /dev/sdb1
> <4444> pv_check_name -- CALLED with "/dev/sdb1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> lvm_dir_cache_find -- CALLED
> <55555> pv_check_name -- CALLED with "/dev/sdb1"
> <666666> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_name -- LEAVING with ret: 0
> <55555> lvm_dir_cache -- CALLED
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <55555> lvm_dir_cache -- LEAVING with ret: 8
> <4444> lvm_dir_cache_find -- LEAVING
> <4444> lvm_partition_count -- CALLED
> <4444> lvm_partition_count -- LEAVING with ret: 16
> <333> pv_check_part -- LEAVING with 1
> <333> lvm_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <333> lvm_dir_cache -- LEAVING with ret: 8
> <333> lvm_dir_cache_find -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/sdb1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> lvm_dir_cache_find -- LEAVING
> <333> lvm_check_partitioned_dev -- CALLED
> <333> lvm_check_partitioned_dev -- LEAVING
> <333> lvm_partition_count -- CALLED
> <333> lvm_partition_count -- LEAVING with ret: 16
> <22> pv_get_size -- BEFORE llseek 0:0
> <22> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 924243453
> <22> pv_get_size -- first == 1
> <22> pv_get_size -- part_i == part_i_tmp
> <22> pv_get_size -- LEAVING with ret: 924243453
> <1> vgextend -- checking physical volume /dev/sdb1 against volume group exp300_2
> <1> vgextend -- checking for new physical volume /dev/sdb1
> <22> pv_check_new -- CALLED
> <22> pv_check_new -- LEAVING with ret: 1
> <22> pv_get_size -- CALLED with /dev/sdb1 and 0
> <333> pv_check_name -- CALLED with "/dev/sdb1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> pv_check_part -- CALLED with /dev/sdb1
> <4444> pv_check_name -- CALLED with "/dev/sdb1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> lvm_dir_cache_find -- CALLED
> <55555> pv_check_name -- CALLED with "/dev/sdb1"
> <666666> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_name -- LEAVING with ret: 0
> <55555> lvm_dir_cache -- CALLED
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <666666> lvm_add_dir_cache -- CALLED
> <7777777> lvm_check_dev -- CALLED
> <7777777> lvm_check_dev -- LEAVING with ret: 1
> <7777777> lvm_dir_cache_hit -- CALLED
> <7777777> lvm_dir_cache_hit -- LEAVING with ret: 1
> <666666> lvm_add_dir_cache -- LEAVING
> <55555> lvm_dir_cache -- LEAVING with ret: 8
> <4444> lvm_dir_cache_find -- LEAVING
> <4444> lvm_partition_count -- CALLED
> <4444> lvm_partition_count -- LEAVING with ret: 16
> <333> pv_check_part -- LEAVING with 1
> <333> lvm_dir_cache -- CALLED
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <4444> lvm_add_dir_cache -- CALLED
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> lvm_dir_cache_hit -- CALLED
> <55555> lvm_dir_cache_hit -- LEAVING with ret: 1
> <4444> lvm_add_dir_cache -- LEAVING
> <333> lvm_dir_cache -- LEAVING with ret: 8
> <333> lvm_dir_cache_find -- CALLED
> <4444> pv_check_name -- CALLED with "/dev/sdb1"
> <55555> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <4444> pv_check_name -- LEAVING with ret: 0
> <4444> lvm_dir_cache -- CALLED
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <55555> lvm_add_dir_cache -- CALLED
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <666666> lvm_dir_cache_hit -- CALLED
> <666666> lvm_dir_cache_hit -- LEAVING with ret: 1
> <55555> lvm_add_dir_cache -- LEAVING
> <4444> lvm_dir_cache -- LEAVING with ret: 8
> <333> lvm_dir_cache_find -- LEAVING
> <333> lvm_check_partitioned_dev -- CALLED
> <333> lvm_check_partitioned_dev -- LEAVING
> <333> lvm_partition_count -- CALLED
> <333> lvm_partition_count -- LEAVING with ret: 16
> <22> pv_get_size -- BEFORE llseek 0:0
> <22> pv_get_size -- part[0].sys_ind: 8E  part[0].nr_sects: 924243453
> <22> pv_get_size -- first == 1
> <22> pv_get_size -- part_i == part_i_tmp
> <22> pv_get_size -- LEAVING with ret: 924243453
> <22> pv_create_kdev_t -- CALLED with "/dev/sdb1"
> <333> pv_check_name -- CALLED with "/dev/sdb1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <22> pv_create_kdev_t -- LEAVING with ret: 811
> <1> vg_setup_for_extend -- LEAVING with 1
> <1> lvm_dont_interrupt -- CALLED
> <1> lvm_interrupt -- LEAVING
> <1> vg_extend_reduce -- CALLED
> <22> vg_check_name -- CALLED
> <22> vg_check_name -- vg_name: "exp300_2"
> <333> lvm_check_chars -- CALLED with name: "exp300_2"
> <333> lvm_check_chars -- LEAVING with ret: 0
> <22> vg_check_name -- LEAVING with ret: 0
> <22> pv_check_consistency -- CALLED
> <333> pv_check_name -- CALLED with "/dev/sdb1"
> <4444> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <4444> lvm_check_dev -- CALLED
> <4444> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_name -- LEAVING with ret: 0
> <333> vg_check_name -- CALLED
> <333> vg_check_name -- vg_name: "exp300_2"
> <4444> lvm_check_chars -- CALLED with name: "exp300_2"
> <4444> lvm_check_chars -- LEAVING with ret: 0
> <333> vg_check_name -- LEAVING with ret: 0
> <333> lvm_check_dev -- CALLED
> <333> lvm_check_dev -- LEAVING with ret: 1
> <333> pv_check_new -- CALLED
> <333> pv_check_new -- LEAVING with ret: 0
> <22> pv_check_consistency -- LEAVING with ret: 0
> <22> vg_check_consistency_with_pv_and_lv -- CALLED
> <333> vg_check_consistency -- CALLED
> <4444> vg_check_name -- CALLED
> <4444> vg_check_name -- vg_name: "exp300_2"
> <55555> lvm_check_chars -- CALLED with name: "exp300_2"
> <55555> lvm_check_chars -- LEAVING with ret: 0
> <4444> vg_check_name -- LEAVING with ret: 0
> <333> vg_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency_all_pv -- CALLED
> <4444> vg_check_consistency -- CALLED
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "exp300_2"
> <666666> lvm_check_chars -- CALLED with name: "exp300_2"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> vg_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency -- CALLED
> <55555> pv_check_name -- CALLED with "/dev/sdc1"
> <666666> lvm_check_chars -- CALLED with name: "/dev/sdc1"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_name -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "exp300_2"
> <666666> lvm_check_chars -- CALLED with name: "exp300_2"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_new -- CALLED
> <55555> pv_check_new -- LEAVING with ret: 0
> <4444> pv_check_consistency -- LEAVING with ret: 0
> <4444> pv_check_consistency -- CALLED
> <55555> pv_check_name -- CALLED with "/dev/sdb1"
> <666666> lvm_check_chars -- CALLED with name: "/dev/sdb1"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <666666> lvm_check_dev -- CALLED
> <666666> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_name -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "exp300_2"
> <666666> lvm_check_chars -- CALLED with name: "exp300_2"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <55555> lvm_check_dev -- CALLED
> <55555> lvm_check_dev -- LEAVING with ret: 1
> <55555> pv_check_new -- CALLED
> <55555> pv_check_new -- LEAVING with ret: 0
> <4444> pv_check_consistency -- LEAVING with ret: 0
> <333> pv_check_consistency_all_pv -- LEAVING with ret: 0
> <333> lv_check_consistency_all_lv -- CALLED vg->lv_max: 256
> <333> lv_check_consistency_all_lv -- vg->lv[0]: 805A550  name: /dev/exp300_2/exp300_lv2
> <4444> lv_check_consistency -- CALLED
> <55555> lv_check_name -- CALLED with lv_name: "/dev/exp300_2/exp300_lv2"
> <666666> lvm_check_chars -- CALLED with name: "/dev/exp300_2/exp300_lv2"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- CALLED
> <666666> vg_check_name -- vg_name: "exp300_2"
> <7777777> lvm_check_chars -- CALLED with name: "exp300_2"
> <7777777> lvm_check_chars -- LEAVING with ret: 0
> <666666> vg_check_name -- LEAVING with ret: 0
> <55555> lv_check_name -- LEAVING with ret: 0
> <55555> vg_check_name -- CALLED
> <55555> vg_check_name -- vg_name: "exp300_2"
> <666666> lvm_check_chars -- CALLED with name: "exp300_2"
> <666666> lvm_check_chars -- LEAVING with ret: 0
> <55555> vg_check_name -- LEAVING with ret: 0
> <4444> lv_check_consistency -- LEAVING with ret: 0
> <333> lv_check_consistency_all_lv -- vg->lv[1]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[2]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[3]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[4]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[5]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[6]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[7]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[8]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[9]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[10]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[11]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[12]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[13]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[14]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[15]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[16]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[17]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[18]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[19]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[20]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[21]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[22]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[23]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[24]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[25]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[26]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[27]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[28]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[29]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[30]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[31]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[32]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[33]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[34]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[35]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[36]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[37]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[38]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[39]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[40]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[41]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[42]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[43]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[44]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[45]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[46]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[47]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[48]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[49]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[50]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[51]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[52]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[53]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[54]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[55]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[56]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[57]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[58]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[59]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[60]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[61]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[62]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[63]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[64]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[65]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[66]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[67]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[68]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[69]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[70]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[71]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[72]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[73]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[74]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[75]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[76]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[77]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[78]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[79]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[80]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[81]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[82]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[83]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[84]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[85]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[86]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[87]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[88]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[89]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[90]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[91]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[92]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[93]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[94]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[95]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[96]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[97]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[98]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[99]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[100]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[101]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[102]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[103]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[104]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[105]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[106]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[107]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[108]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[109]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[110]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[111]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[112]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[113]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[114]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[115]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[116]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[117]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[118]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[119]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[120]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[121]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[122]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[123]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[124]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[125]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[126]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[127]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[128]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[129]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[130]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[131]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[132]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[133]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[134]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[135]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[136]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[137]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[138]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[139]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[140]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[141]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[142]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[143]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[144]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[145]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[146]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[147]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[148]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[149]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[150]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[151]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[152]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[153]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[154]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[155]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[156]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[157]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[158]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[159]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[160]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[161]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[162]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[163]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[164]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[165]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[166]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[167]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[168]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[169]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[170]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[171]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[172]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[173]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[174]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[175]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[176]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[177]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[178]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[179]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[180]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[181]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[182]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[183]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[184]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[185]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[186]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[187]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[188]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[189]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[190]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[191]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[192]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[193]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[194]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[195]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[196]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[197]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[198]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[199]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[200]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[201]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[202]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[203]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[204]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[205]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[206]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[207]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[208]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[209]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[210]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[211]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[212]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[213]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[214]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[215]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[216]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[217]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[218]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[219]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[220]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[221]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[222]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[223]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[224]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[225]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[226]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[227]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[228]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[229]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[230]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[231]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[232]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[233]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[234]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[235]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[236]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[237]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[238]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[239]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[240]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[241]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[242]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[243]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[244]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[245]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[246]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[247]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[248]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[249]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[250]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[251]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[252]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[253]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[254]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- vg->lv[255]: 0  name: (null)
> <333> lv_check_consistency_all_lv -- LEAVING with ret: 0
> <22> vg_check_consistency_with_pv_and_lv -- LEAVING with ret: 0
> <1> vg_extend_reduce -- IOCTL
> Segmentation fault

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
