Message-Id: <200209031504.g83F4fD07835@superglide.netfx-2000.net>
Content-Disposition: inline
Mime-Version: 1.0
From: zing@linuxfreemail.com
Subject: [linux-lvm] vgscan limitation:  can't find the real md device/barfs on raid10
 config
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
Date: Tue Sep  3 10:05:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

hello lvm-users,

I have a raid10+lvm config that i just created:

md1: raid 1
md2: raid 1
md3: raid 0 of md1 and md2

md3 is a member of volume group: 'mainvg'

after reboot vgscan gets to md1 and spits out:

<1> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): current PV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "mainvg" from physical volume(s)

... and then stops.

I think I've hit a situation that vgscan cannot handle correctly.  Can someone help me out...

my guess is that if I can get vgscan to skip the "auto-scanning" of md1 and md2, then it will find the volume group 'data' sitting on md3.

thanks,
zing

here is the tail end of the vgscan debug output (i can post the whole thing if needed):

<1> vg_check_exist_all_vg -- checking vg_name: mainvg[0/0]
<1> vg_check_exist_all_vg -- vg_name_ptr[0]: mainvg
<1> vg_check_exist_all_vg -- checking vg_name: mainvg[1/1]
<1> vg_check_exist_all_vg -- LEAVING with 1 VGs
<1> vg_check_active -- CALLED with VG: mainvg
<22> vg_check_name -- CALLED with VG: mainvg
<333> lvm_check_chars -- CALLED with name: "mainvg"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- CALLED with VG: mainvg
<333> vg_check_name -- CALLED with VG: mainvg
<4444> lvm_check_chars -- CALLED with name: "mainvg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- LEAVING with ret: -6
<1> vg_check_active -- LEAVING with ret: -6
<1> vg_check_active -- CALLED with VG: mainvg
<22> vg_check_name -- CALLED with VG: mainvg
<333> lvm_check_chars -- CALLED with name: "mainvg"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- CALLED with VG: mainvg
<333> vg_check_name -- CALLED with VG: mainvg
<4444> lvm_check_chars -- CALLED with name: "mainvg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> vg_status -- LEAVING with ret: -6
<1> vg_check_active -- LEAVING with ret: -6
<1> vg_free -- CALLED
<1> vg_free -- LEAVING with ret: -99
<1> vg_read_with_pv_and_lv -- CALLED
<22> vg_check_name -- CALLED with VG: mainvg
<333> lvm_check_chars -- CALLED with name: "mainvg"
<333> lvm_check_chars -- LEAVING with ret: 0
<22> vg_check_name -- LEAVING with ret: 0
<22> vg_read -- CALLED
<333> vg_check_name -- CALLED with VG: mainvg
<4444> lvm_check_chars -- CALLED with name: "mainvg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "mainvg"
<4444> vg_check_name -- CALLED with VG: mainvg
<55555> lvm_check_chars -- CALLED with name: "mainvg"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv -- CALLED
<4444> pv_read_all_pv -- avoiding multiple entries in case of MD; np: 0
<4444> pv_read_all_pv -- LEAVING with ret: 0
<4444> pv_check_consistency -- CALLED
<55555> pv_check_name -- CALLED with "/dev/md1"
<666666> lvm_check_chars -- CALLED with name: "/dev/md1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> pv_check_name -- LEAVING with ret: 0
<55555> vg_check_name -- CALLED with VG: mainvg
<666666> lvm_check_chars -- CALLED with name: "mainvg"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<55555> pv_check_new -- CALLED
<55555> pv_check_new -- LEAVING with ret: 0
<4444> pv_check_consistency -- LEAVING with ret: 0
<4444> pv_read_uuidlist -- CALLED with /dev/md1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<4444> pv_read_uuidlist -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<22> vg_read -- pv[0]->pv_name: "/dev/md1"
<333> vg_read_from_pv -- CALLED
<4444> pv_check_name -- CALLED with "/dev/md1"
<55555> lvm_check_chars -- CALLED with name: "/dev/md1"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read -- CALLED with /dev/md1
<55555> pv_check_name -- CALLED with "/dev/md1"
<666666> lvm_check_chars -- CALLED with name: "/dev/md1"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_read -- going to read /dev/md1
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 2
<666666> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_copy_from_disk -- CALLED
<55555> pv_copy_from_disk -- LEAVING ret = 0x80585a8
<55555> pv_create_name_from_kdev_t -- CALLED with 9:1
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 2
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: FALSE
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache -- CALLED
<666666> lvm_dir_cache -- LEAVING with ret: 33
<55555> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/md1
<55555> system_id_check_exported -- CALLED
<55555> system_id_check_exported -- LEAVING with ret: 0
<4444> pv_read -- LEAVING with ret: -271
<4444> vg_copy_from_disk -- CALLED
<4444> vg_copy_from_disk -- LEAVING
<333> vg_read_from_pv -- LEAVING with ret: 0
<22> vg_read -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER vg_read;  vg_this->lv_cur: 0
<1> vg_read_with_pv_and_lv -- LEAVING with ret: -367
<1> lvm_error -- CALLED with: -367
<1> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): current PV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): current PV" can't get data of volume group "mainvg" from physical volume(s)
<1> vg_free -- CALLED
<1> vg_free -- LEAVING with ret: -99
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume group

Get your own FREE E-mail address at http://www.linuxfreemail.com
Linux FREE Mail is 100% FREE, 100% Linux, and 100% yours!
