Message-ID: <00ef01c2a91a$b85b4bf0$e96e80d1@bill>
From: "Bill Wester" <bill@tagboard.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_00EC_01C2A8D7.AA274310"
Subject: [linux-lvm] help! system crash ...
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
Date: Sat Dec 21 11:59:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_00EC_01C2A8D7.AA274310
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi everyone it seems im in a pinch.

my system crashed last night... system disk dead!  So i replaced it, =
unfortunately i lost all of the /etc/lvm data.

I rebuilt my system.. (RH 8.0) and it seemed to go well.  For some =
reason when i try to bring my LVM back up  it croaks and dies.

Here is the output... it looks like somehow /dev/hdc got messed up and =
has no PE's on it anymore.  How can i get it back?  Remember i dont have =
any of the backups because my system hard drive was wasted!

can i just re-create it? it was just one big disk, with a very simple =
layout.  How can i do that and keep the integrity of the other PV's?

any help would be VERY appreciated...=20

bill


<<55555> lvm_check_uuid -- LEAVING with ret: -1
<55555> lvm_check_uuid -- CALLED with uuidstr: ""
<55555> lvm_check_uuid -- LEAVING with ret: -1
<4444> pv_read_uuidlist -- LEAVING with ret: 4
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<22> vg_read -- pv[0]->pv_name: "/dev/hdg"
<22> vg_read -- pv[1]->pv_name: "/dev/hde1"
<22> vg_read -- pv[2]->pv_name: "/dev/hdc"
<22> vg_read -- pv[3]->pv_name: "/dev/hdd"
<333> vg_read_from_pv -- CALLED
<4444> pv_check_name -- CALLED with "/dev/hdg"
<55555> lvm_check_chars -- CALLED with name: "/dev/hdg"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> pv_check_name -- LEAVING with ret: 0
<4444> pv_read -- CALLED with /dev/hdg
<55555> pv_check_name -- CALLED with "/dev/hdg"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdg"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> pv_check_name -- LEAVING with ret: 0
<4444> pv_read -- going to read /dev/hdg
<55555> lvm_check_dev -- CALLED
<666666> lvm_check_partitioned_dev -- CALLED
<7777777> lvm_get_device_type called
<7777777> lvm_get_device_type leaving with 0
<666666> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<55555> lvm_check_dev -- LEAVING with ret: 1
<55555> pv_copy_from_disk -- CALLED
<55555> pv_copy_from_disk -- LEAVING ret =3D 0x804d088
<55555> pv_create_name_from_kdev_t -- CALLED with 34:0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> lvm_dir_cache -- CALLED
<666666> lvm_dir_cache -- LEAVING with ret: 17
<55555> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdg
<55555> system_id_check_exported -- CALLED
<55555> system_id_check_exported -- LEAVING with ret: 0
<4444> pv_read -- LEAVING with ret: 0
<4444> vg_copy_from_disk -- CALLED
<55555> vg_check_vg_disk_t_consistency -- CALLED
<666666> vg_check_name -- CALLED with VG:
<7777777> lvm_check_chars -- CALLED with name: ""
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> vg_check_name -- LEAVING with ret: 0
<55555> vg_check_vg_disk_t_consistency -- LEAVING with ret: 0
<4444> vg_copy_from_disk -- LEAVING
<333> vg_read_from_pv -- LEAVING with ret: 0
<22> vg_read -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER vg_read;  vg_this->lv_cur: 1
<22> pv_read_all_pv_of_vg -- CALLED with vg_name: "hotline"
<333> vg_check_name -- CALLED with VG: hotline
<4444> lvm_check_chars -- CALLED with name: "hotline"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<22> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER pv_read_all_pv_of_vg
<22> pv_read_all_pe_of_vg -- CALLED
<333> vg_check_name -- CALLED with VG: hotline
<4444> lvm_check_chars -- CALLED with name: "hotline"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "hotline"
<4444> vg_check_name -- CALLED with VG: hotline
<55555> lvm_check_chars -- CALLED with name: "hotline"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- pv_count: 4
<333> pv_read_pe -- CALLED with /dev/hdg and 3052
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/hdg with 3052 PE at address 804F078
<333> pv_read_pe -- CALLED with /dev/hde1 and 2383
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/hde1 with 2383 PE at address 804F07C
<333> pv_read_pe -- CALLED with /dev/hdc and 0
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/hdc with 0 PE at address 804F080
<333> pv_read_pe -- CALLED with /dev/hdd and 2441
<4444> pe_copy_from_disk -- CALLED
<4444> pe_copy_from_disk -- LEAVING
<333> pv_read_pe -- ret: 0
<333> pv_read_pe -- LEAVING with ret: 0
<22> pv_read_all_pe_of_vg -- /dev/hdd with 2441 PE at address 804F084
<22> pv_read_all_pe_of_vg -- AFTER LOOP of pv_read_pe
<22> pv_read_all_pe_of_vg -- /dev/hdg with 3052 PE at 805D960 for PV #0
<22> pv_read_all_pe_of_vg -- /dev/hde1 with 2383 PE at 8060918 for PV #1
<22> pv_read_all_pe_of_vg -- /dev/hdc with 0 PE at 0 for PV #2           =
                  <-----------------------------PROBLEM!!!
<22> pv_read_all_pe_of_vg -- /dev/hdd with 2441 PE at 8062E58 for PV #3
<22> pv_read_all_pe_of_vg -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER pv_read_all_pe_of_vg
<22> lv_read_all_lv -- CALLED
<333> vg_check_name -- CALLED with VG: hotline
<4444> lvm_check_chars -- CALLED with name: "hotline"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED with VG: hotline
<55555> lvm_check_chars -- CALLED with name: "hotline"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "hotline"
<55555> vg_check_name -- CALLED with VG: hotline
<666666> lvm_check_chars -- CALLED with name: "hotline"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> vg_read -- pv[0]->pv_name: "/dev/hdg"
<333> vg_read -- pv[1]->pv_name: "/dev/hde1"
<333> vg_read -- pv[2]->pv_name: "/dev/hdc"
<333> vg_read -- pv[3]->pv_name: "/dev/hdd"
<4444> vg_read_from_pv -- CALLED
<55555> pv_check_name -- CALLED with "/dev/hdg"
<666666> lvm_check_chars -- CALLED with name: "/dev/hdg"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> pv_check_name -- LEAVING with ret: 0
<55555> pv_read -- CALLED with /dev/hdg
<666666> pv_check_name -- CALLED with "/dev/hdg"
<7777777> lvm_check_chars -- CALLED with name: "/dev/hdg"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> pv_check_name -- LEAVING with ret: 0
<55555> pv_read -- going to read /dev/hdg
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 0
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_copy_from_disk -- CALLED
<666666> pv_copy_from_disk -- LEAVING ret =3D 0x804f0a8
<666666> pv_create_name_from_kdev_t -- CALLED with 34:0
<7777777> lvm_check_dev -- CALLED
<88888888> lvm_check_partitioned_dev -- CALLED
<999999999> lvm_get_device_type called
<999999999> lvm_get_device_type leaving with 0
<88888888> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache -- CALLED
<7777777> lvm_dir_cache -- LEAVING with ret: 17
<666666> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/hdg
<666666> system_id_check_exported -- CALLED
<666666> system_id_check_exported -- LEAVING with ret: 0
<55555> pv_read -- LEAVING with ret: 0
<55555> vg_copy_from_disk -- CALLED
<666666> vg_check_vg_disk_t_consistency -- CALLED
<7777777> vg_check_name -- CALLED with VG:
<88888888> lvm_check_chars -- CALLED with name: ""
<88888888> lvm_check_chars -- LEAVING with ret: 0
<7777777> vg_check_name -- LEAVING with ret: 0
<666666> vg_check_vg_disk_t_consistency -- LEAVING with ret: 0
<55555> vg_copy_from_disk -- LEAVING
<4444> vg_read_from_pv -- LEAVING with ret: 0
<333> vg_read -- LEAVING with ret: 0
<22> lv_read_all_lv -- lv_max: 256
<22> lv_read_all_lv -- BEFORE pv_read_all_pv_of_vg
<333> pv_read_all_pv_of_vg -- CALLED with vg_name: "hotline"
<4444> vg_check_name -- CALLED with VG: hotline
<55555> lvm_check_chars -- CALLED with name: "hotline"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<333> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<333> lv_copy_from_disk -- CALLED
<333> lv_copy_from_disk -- LEAVING
<22> lv_read_all_lv -- l: 256  nl: 1  vg_this->lv_cur: 1
<22> lv_read_all_lv -- LEAVING with ret: 0
<1> vg_read_with_pv_and_lv -- AFTER lv_read_all_lv; vg_this->pv_cur: 4  =
vg_this-
>pv_max: 256  ret: 0
<1> vg_read_with_pv_and_lv -- BEFORE for PE
<1> vg_read_with_pv_and_lv -- AFTER for PE
<1> vg_read_with_pv_and_lv -- BEFORE for LV
<1> vg_read_with_pv_and_lv -- vg_this->lv[0]->lv_allocated_le: 11180
vgscan -- only found 7518 of 11180 LEs for LV /dev/hotline/vol1 (0)
<1> vg_read_with_pv_and_lv -- LEAVING with ret: -365
<1> lvm_error -- CALLED with: -365
<1> lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated LE =
of LV"
vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" can't get =
data of
 volume group "hotline" from physical volume(s)
<1> vg_free -- CALLED
<1> vg_free -- LEAVING with ret: -99
<1> lvm_interrupt -- CALLED
<1> lvm_interrupt -- LEAVING
<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume =
group

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: -104
[root@blackbird root]#
[root@blackbird root]# pvdata /dev/hdc
--- NEW Physical volume ---
PV Name               /dev/hdc
VG Name               hotline
PV Size               30.94 MB [63360 secs]
PV#                   3
PV Status             available
Allocatable           NO
Cur LV                0
PE Size (KByte)       0
Total PE              0
Free PE               0
Allocated PE          0
PV UUID               s8Gp0j-WWq2-yT9m-UnCz-qU7m-TnCG-tHwVaI

--- Volume group ---
VG Name
VG Access             read/write
VG Status             NOT available/resizable
VG #                  0
MAX LV                256
Cur LV                1
Open LV               0
MAX LV Size           2 TB
Max PV                256
Cur PV                4
Act PV                4
VG Size               360.56 GB
PE Size               32 MB
Total PE              11538
Alloc PE / Size       11180 / 349.38 GB
Free  PE / Size       358 / 11.19 GB
VG UUID               snZQHp-EWmO-aeox-1Cbi-8Guy-UPaU-l4UdJm

--- List of logical volumes ---

pvdata -- logical volume "/dev/hotline/vol1" at offset   0
pvdata -- logical volume struct at offset   1 is empty
...
pvdata -- logical volume struct at offset 255 is empty
--- List of physical volume UUIDs ---

001: ZLU9xB-hy6U-I7UF-Fd9C-3lTW-wKMX-9nhxcY
002: UGmBIH-LfYd-JQdV-xT2A-oSqj-8prs-ezsRLO
003: s8Gp0j-WWq2-yT9m-UnCz-qU7m-TnCG-tHwVaI
004: MFAGC5-zznc-n0xn-T5rT-Cluh-b9qR-6v7oge

[root@blackbird root]#
------=_NextPart_000_00EC_01C2A8D7.AA274310
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1126" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi everyone it seems im in a =
pinch.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>my system crashed last night... system =
disk=20
dead!&nbsp; So i replaced it, unfortunately i lost all of the /etc/lvm=20
data.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I rebuilt my system.. (RH 8.0) and it =
seemed to go=20
well.&nbsp; For some reason when i try to bring my LVM back up&nbsp; it =
croaks=20
and dies.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here is the output... it looks like =
somehow=20
/dev/hdc got messed up and has no PE's on it anymore.&nbsp; How can i =
get it=20
back?&nbsp; Remember i dont have any of the backups because my system =
hard drive=20
was wasted!</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>can i just re-create it? it was just =
one big disk,=20
with a very simple layout.&nbsp; How can i do that and keep the =
integrity of the=20
other PV's?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>any help would be VERY appreciated... =
</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>bill</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&lt;&lt;55555&gt; lvm_check_uuid -- =
LEAVING with=20
ret: -1<BR>&lt;55555&gt; lvm_check_uuid -- CALLED with uuidstr:=20
""<BR>&lt;55555&gt; lvm_check_uuid -- LEAVING with ret: =
-1<BR>&lt;4444&gt;=20
pv_read_uuidlist -- LEAVING with ret: 4<BR>&lt;333&gt; =
pv_read_all_pv_of_vg --=20
LEAVING with ret: 0<BR>&lt;22&gt; vg_read -- pv[0]-&gt;pv_name:=20
"/dev/hdg"<BR>&lt;22&gt; vg_read -- pv[1]-&gt;pv_name: =
"/dev/hde1"<BR>&lt;22&gt;=20
vg_read -- pv[2]-&gt;pv_name: "/dev/hdc"<BR>&lt;22&gt; vg_read --=20
pv[3]-&gt;pv_name: "/dev/hdd"<BR>&lt;333&gt; vg_read_from_pv --=20
CALLED<BR>&lt;4444&gt; pv_check_name -- CALLED with =
"/dev/hdg"<BR>&lt;55555&gt;=20
lvm_check_chars -- CALLED with name: "/dev/hdg"<BR>&lt;55555&gt; =
lvm_check_chars=20
-- LEAVING with ret: 0<BR>&lt;4444&gt; pv_check_name -- LEAVING with =
ret:=20
0<BR>&lt;4444&gt; pv_read -- CALLED with /dev/hdg<BR>&lt;55555&gt; =
pv_check_name=20
-- CALLED with "/dev/hdg"<BR>&lt;666666&gt; lvm_check_chars -- CALLED =
with name:=20
"/dev/hdg"<BR>&lt;666666&gt; lvm_check_chars -- LEAVING with ret:=20
0<BR>&lt;55555&gt; pv_check_name -- LEAVING with ret: 0<BR>&lt;4444&gt; =
pv_read=20
-- going to read /dev/hdg<BR>&lt;55555&gt; lvm_check_dev --=20
CALLED<BR>&lt;666666&gt; lvm_check_partitioned_dev -- =
CALLED<BR>&lt;7777777&gt;=20
lvm_get_device_type called<BR>&lt;7777777&gt; lvm_get_device_type =
leaving with=20
0<BR>&lt;666666&gt; lvm_check_partitioned_dev -- LEAVING with ret:=20
TRUE<BR>&lt;55555&gt; lvm_check_dev -- LEAVING with ret: =
1<BR>&lt;55555&gt;=20
pv_copy_from_disk -- CALLED<BR>&lt;55555&gt; pv_copy_from_disk -- =
LEAVING ret =3D=20
0x804d088<BR>&lt;55555&gt; pv_create_name_from_kdev_t -- CALLED with=20
34:0<BR>&lt;666666&gt; lvm_check_dev -- CALLED<BR>&lt;7777777&gt;=20
lvm_check_partitioned_dev -- CALLED<BR>&lt;88888888&gt; =
lvm_get_device_type=20
called<BR>&lt;88888888&gt; lvm_get_device_type leaving with =
0<BR>&lt;7777777&gt;=20
lvm_check_partitioned_dev -- LEAVING with ret: TRUE<BR>&lt;666666&gt;=20
lvm_check_dev -- LEAVING with ret: 1<BR>&lt;666666&gt; lvm_dir_cache --=20
CALLED<BR>&lt;666666&gt; lvm_dir_cache -- LEAVING with ret: =
17<BR>&lt;55555&gt;=20
pv_create_name_from_kdev_t -- LEAVING with dev_name: =
/dev/hdg<BR>&lt;55555&gt;=20
system_id_check_exported -- CALLED<BR>&lt;55555&gt; =
system_id_check_exported --=20
LEAVING with ret: 0<BR>&lt;4444&gt; pv_read -- LEAVING with ret:=20
0<BR>&lt;4444&gt; vg_copy_from_disk -- CALLED<BR>&lt;55555&gt;=20
vg_check_vg_disk_t_consistency -- CALLED<BR>&lt;666666&gt; vg_check_name =
--=20
CALLED with VG:<BR>&lt;7777777&gt; lvm_check_chars -- CALLED with name:=20
""<BR>&lt;7777777&gt; lvm_check_chars -- LEAVING with ret: =
0<BR>&lt;666666&gt;=20
vg_check_name -- LEAVING with ret: 0<BR>&lt;55555&gt;=20
vg_check_vg_disk_t_consistency -- LEAVING with ret: 0<BR>&lt;4444&gt;=20
vg_copy_from_disk -- LEAVING<BR>&lt;333&gt; vg_read_from_pv -- LEAVING =
with ret:=20
0<BR>&lt;22&gt; vg_read -- LEAVING with ret: 0<BR>&lt;1&gt;=20
vg_read_with_pv_and_lv -- AFTER vg_read;&nbsp; vg_this-&gt;lv_cur:=20
1<BR>&lt;22&gt; pv_read_all_pv_of_vg -- CALLED with vg_name:=20
"hotline"<BR>&lt;333&gt; vg_check_name -- CALLED with VG:=20
hotline<BR>&lt;4444&gt; lvm_check_chars -- CALLED with name:=20
"hotline"<BR>&lt;4444&gt; lvm_check_chars -- LEAVING with ret: =
0<BR>&lt;333&gt;=20
vg_check_name -- LEAVING with ret: 0<BR>&lt;22&gt; pv_read_all_pv_of_vg =
--=20
LEAVING with ret: 0<BR>&lt;1&gt; vg_read_with_pv_and_lv -- AFTER=20
pv_read_all_pv_of_vg<BR>&lt;22&gt; pv_read_all_pe_of_vg -- =
CALLED<BR>&lt;333&gt;=20
vg_check_name -- CALLED with VG: hotline<BR>&lt;4444&gt; lvm_check_chars =
--=20
CALLED with name: "hotline"<BR>&lt;4444&gt; lvm_check_chars -- LEAVING =
with ret:=20
0<BR>&lt;333&gt; vg_check_name -- LEAVING with ret: 0<BR>&lt;333&gt;=20
pv_read_all_pv_of_vg -- CALLED with vg_name: "hotline"<BR>&lt;4444&gt;=20
vg_check_name -- CALLED with VG: hotline<BR>&lt;55555&gt; =
lvm_check_chars --=20
CALLED with name: "hotline"<BR>&lt;55555&gt; lvm_check_chars -- LEAVING =
with=20
ret: 0<BR>&lt;4444&gt; vg_check_name -- LEAVING with ret: =
0<BR>&lt;333&gt;=20
pv_read_all_pv_of_vg -- LEAVING with ret: 0<BR>&lt;22&gt; =
pv_read_all_pe_of_vg=20
-- pv_count: 4<BR>&lt;333&gt; pv_read_pe -- CALLED with /dev/hdg and=20
3052<BR>&lt;4444&gt; pe_copy_from_disk -- CALLED<BR>&lt;4444&gt;=20
pe_copy_from_disk -- LEAVING<BR>&lt;333&gt; pv_read_pe -- ret: =
0<BR>&lt;333&gt;=20
pv_read_pe -- LEAVING with ret: 0<BR>&lt;22&gt; pv_read_all_pe_of_vg -- =
/dev/hdg=20
with 3052 PE at address 804F078<BR>&lt;333&gt; pv_read_pe -- CALLED with =

/dev/hde1 and 2383<BR>&lt;4444&gt; pe_copy_from_disk -- =
CALLED<BR>&lt;4444&gt;=20
pe_copy_from_disk -- LEAVING<BR>&lt;333&gt; pv_read_pe -- ret: =
0<BR>&lt;333&gt;=20
pv_read_pe -- LEAVING with ret: 0<BR>&lt;22&gt; pv_read_all_pe_of_vg --=20
/dev/hde1 with 2383 PE at address 804F07C<BR>&lt;333&gt; pv_read_pe -- =
CALLED=20
with /dev/hdc and 0<BR>&lt;4444&gt; pe_copy_from_disk -- =
CALLED<BR>&lt;4444&gt;=20
pe_copy_from_disk -- LEAVING<BR>&lt;333&gt; pv_read_pe -- ret: =
0<BR>&lt;333&gt;=20
pv_read_pe -- LEAVING with ret: 0<BR>&lt;22&gt; pv_read_all_pe_of_vg -- =
/dev/hdc=20
with 0 PE at address 804F080<BR>&lt;333&gt; pv_read_pe -- CALLED with =
/dev/hdd=20
and 2441<BR>&lt;4444&gt; pe_copy_from_disk -- CALLED<BR>&lt;4444&gt;=20
pe_copy_from_disk -- LEAVING<BR>&lt;333&gt; pv_read_pe -- ret: =
0<BR>&lt;333&gt;=20
pv_read_pe -- LEAVING with ret: 0<BR>&lt;22&gt; pv_read_all_pe_of_vg -- =
/dev/hdd=20
with 2441 PE at address 804F084<BR>&lt;22&gt; pv_read_all_pe_of_vg -- =
AFTER LOOP=20
of pv_read_pe<BR>&lt;22&gt; pv_read_all_pe_of_vg -- /dev/hdg with 3052 =
PE at=20
805D960 for PV #0<BR>&lt;22&gt; pv_read_all_pe_of_vg -- /dev/hde1 with =
2383 PE=20
at 8060918 for PV #1<BR>&lt;22&gt; pv_read_all_pe_of_vg -- /dev/hdc with =
0 PE at=20
0 for PV=20
#2&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;=20
&lt;-----------------------------PROBLEM!!!<BR>&lt;22&gt; =
pv_read_all_pe_of_vg=20
-- /dev/hdd with 2441 PE at 8062E58 for PV #3<BR>&lt;22&gt; =
pv_read_all_pe_of_vg=20
-- LEAVING with ret: 0<BR>&lt;1&gt; vg_read_with_pv_and_lv -- AFTER=20
pv_read_all_pe_of_vg<BR>&lt;22&gt; lv_read_all_lv -- =
CALLED<BR>&lt;333&gt;=20
vg_check_name -- CALLED with VG: hotline<BR>&lt;4444&gt; lvm_check_chars =
--=20
CALLED with name: "hotline"<BR>&lt;4444&gt; lvm_check_chars -- LEAVING =
with ret:=20
0<BR>&lt;333&gt; vg_check_name -- LEAVING with ret: 0<BR>&lt;333&gt; =
vg_read --=20
CALLED<BR>&lt;4444&gt; vg_check_name -- CALLED with VG: =
hotline<BR>&lt;55555&gt;=20
lvm_check_chars -- CALLED with name: "hotline"<BR>&lt;55555&gt; =
lvm_check_chars=20
-- LEAVING with ret: 0<BR>&lt;4444&gt; vg_check_name -- LEAVING with =
ret:=20
0<BR>&lt;4444&gt; pv_read_all_pv_of_vg -- CALLED with vg_name:=20
"hotline"<BR>&lt;55555&gt; vg_check_name -- CALLED with VG:=20
hotline<BR>&lt;666666&gt; lvm_check_chars -- CALLED with name:=20
"hotline"<BR>&lt;666666&gt; lvm_check_chars -- LEAVING with ret:=20
0<BR>&lt;55555&gt; vg_check_name -- LEAVING with ret: 0<BR>&lt;4444&gt;=20
pv_read_all_pv_of_vg -- LEAVING with ret: 0<BR>&lt;333&gt; vg_read --=20
pv[0]-&gt;pv_name: "/dev/hdg"<BR>&lt;333&gt; vg_read -- =
pv[1]-&gt;pv_name:=20
"/dev/hde1"<BR>&lt;333&gt; vg_read -- pv[2]-&gt;pv_name:=20
"/dev/hdc"<BR>&lt;333&gt; vg_read -- pv[3]-&gt;pv_name:=20
"/dev/hdd"<BR>&lt;4444&gt; vg_read_from_pv -- CALLED<BR>&lt;55555&gt;=20
pv_check_name -- CALLED with "/dev/hdg"<BR>&lt;666666&gt; =
lvm_check_chars --=20
CALLED with name: "/dev/hdg"<BR>&lt;666666&gt; lvm_check_chars -- =
LEAVING with=20
ret: 0<BR>&lt;55555&gt; pv_check_name -- LEAVING with ret: =
0<BR>&lt;55555&gt;=20
pv_read -- CALLED with /dev/hdg<BR>&lt;666666&gt; pv_check_name -- =
CALLED with=20
"/dev/hdg"<BR>&lt;7777777&gt; lvm_check_chars -- CALLED with name:=20
"/dev/hdg"<BR>&lt;7777777&gt; lvm_check_chars -- LEAVING with ret:=20
0<BR>&lt;666666&gt; pv_check_name -- LEAVING with ret: =
0<BR>&lt;55555&gt;=20
pv_read -- going to read /dev/hdg<BR>&lt;666666&gt; lvm_check_dev --=20
CALLED<BR>&lt;7777777&gt; lvm_check_partitioned_dev --=20
CALLED<BR>&lt;88888888&gt; lvm_get_device_type =
called<BR>&lt;88888888&gt;=20
lvm_get_device_type leaving with 0<BR>&lt;7777777&gt; =
lvm_check_partitioned_dev=20
-- LEAVING with ret: TRUE<BR>&lt;666666&gt; lvm_check_dev -- LEAVING =
with ret:=20
1<BR>&lt;666666&gt; pv_copy_from_disk -- CALLED<BR>&lt;666666&gt;=20
pv_copy_from_disk -- LEAVING ret =3D 0x804f0a8<BR>&lt;666666&gt;=20
pv_create_name_from_kdev_t -- CALLED with 34:0<BR>&lt;7777777&gt; =
lvm_check_dev=20
-- CALLED<BR>&lt;88888888&gt; lvm_check_partitioned_dev --=20
CALLED<BR>&lt;999999999&gt; lvm_get_device_type =
called<BR>&lt;999999999&gt;=20
lvm_get_device_type leaving with 0<BR>&lt;88888888&gt; =
lvm_check_partitioned_dev=20
-- LEAVING with ret: TRUE<BR>&lt;7777777&gt; lvm_check_dev -- LEAVING =
with ret:=20
1<BR>&lt;7777777&gt; lvm_dir_cache -- CALLED<BR>&lt;7777777&gt; =
lvm_dir_cache --=20
LEAVING with ret: 17<BR>&lt;666666&gt; pv_create_name_from_kdev_t -- =
LEAVING=20
with dev_name: /dev/hdg<BR>&lt;666666&gt; system_id_check_exported --=20
CALLED<BR>&lt;666666&gt; system_id_check_exported -- LEAVING with ret:=20
0<BR>&lt;55555&gt; pv_read -- LEAVING with ret: 0<BR>&lt;55555&gt;=20
vg_copy_from_disk -- CALLED<BR>&lt;666666&gt; =
vg_check_vg_disk_t_consistency --=20
CALLED<BR>&lt;7777777&gt; vg_check_name -- CALLED with =
VG:<BR>&lt;88888888&gt;=20
lvm_check_chars -- CALLED with name: ""<BR>&lt;88888888&gt; =
lvm_check_chars --=20
LEAVING with ret: 0<BR>&lt;7777777&gt; vg_check_name -- LEAVING with =
ret:=20
0<BR>&lt;666666&gt; vg_check_vg_disk_t_consistency -- LEAVING with ret:=20
0<BR>&lt;55555&gt; vg_copy_from_disk -- LEAVING<BR>&lt;4444&gt; =
vg_read_from_pv=20
-- LEAVING with ret: 0<BR>&lt;333&gt; vg_read -- LEAVING with ret:=20
0<BR>&lt;22&gt; lv_read_all_lv -- lv_max: 256<BR>&lt;22&gt; =
lv_read_all_lv --=20
BEFORE pv_read_all_pv_of_vg<BR>&lt;333&gt; pv_read_all_pv_of_vg -- =
CALLED with=20
vg_name: "hotline"<BR>&lt;4444&gt; vg_check_name -- CALLED with VG:=20
hotline<BR>&lt;55555&gt; lvm_check_chars -- CALLED with name:=20
"hotline"<BR>&lt;55555&gt; lvm_check_chars -- LEAVING with ret:=20
0<BR>&lt;4444&gt; vg_check_name -- LEAVING with ret: 0<BR>&lt;333&gt;=20
pv_read_all_pv_of_vg -- LEAVING with ret: 0<BR>&lt;333&gt; =
lv_copy_from_disk --=20
CALLED<BR>&lt;333&gt; lv_copy_from_disk -- LEAVING<BR>&lt;22&gt; =
lv_read_all_lv=20
-- l: 256&nbsp; nl: 1&nbsp; vg_this-&gt;lv_cur: 1<BR>&lt;22&gt; =
lv_read_all_lv=20
-- LEAVING with ret: 0<BR>&lt;1&gt; vg_read_with_pv_and_lv -- AFTER=20
lv_read_all_lv; vg_this-&gt;pv_cur: 4&nbsp; vg_this-<BR>&gt;pv_max: =
256&nbsp;=20
ret: 0<BR>&lt;1&gt; vg_read_with_pv_and_lv -- BEFORE for PE<BR>&lt;1&gt; =

vg_read_with_pv_and_lv -- AFTER for PE<BR>&lt;1&gt; =
vg_read_with_pv_and_lv --=20
BEFORE for LV<BR>&lt;1&gt; vg_read_with_pv_and_lv --=20
vg_this-&gt;lv[0]-&gt;lv_allocated_le: 11180<BR>vgscan -- only found =
7518 of=20
11180 LEs for LV /dev/hotline/vol1 (0)<BR>&lt;1&gt; =
vg_read_with_pv_and_lv --=20
LEAVING with ret: -365<BR>&lt;1&gt; lvm_error -- CALLED with: =
-365<BR>&lt;1&gt;=20
lvm_error -- LEAVING with: "vg_read_with_pv_and_lv(): allocated LE of=20
LV"<BR>vgscan -- ERROR "vg_read_with_pv_and_lv(): allocated LE of LV" =
can't get=20
data of<BR>&nbsp;volume group "hotline" from physical =
volume(s)<BR>&lt;1&gt;=20
vg_free -- CALLED<BR>&lt;1&gt; vg_free -- LEAVING with ret: =
-99<BR>&lt;1&gt;=20
lvm_interrupt -- CALLED<BR>&lt;1&gt; lvm_interrupt -- =
LEAVING<BR>&lt;1&gt;=20
lvm_unlock -- CALLED<BR>&lt;1&gt; lvm_unlock -- LEAVING with ret: =
0<BR>vgscan --=20
"/etc/lvmtab" and "/etc/lvmtab.d" successfully created<BR>vgscan -- =
WARNING:=20
This program does not do a VGDA backup of your volume group</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&lt;1&gt; lvm_unlock -- =
CALLED<BR>&lt;1&gt;=20
lvm_unlock -- LEAVING with ret: -104<BR>[root@blackbird =
root]#</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>[root@blackbird root]# pvdata =
/dev/hdc<BR>--- NEW=20
Physical volume ---<BR>PV=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
/dev/hdc<BR>VG=20
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
hotline<BR>PV=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
30.94 MB [63360=20
secs]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
3<BR>PV=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;=20
NO<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
0<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
0<BR>Free=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
0<BR>PV=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
s8Gp0j-WWq2-yT9m-UnCz-qU7m-TnCG-tHwVaI</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- Volume group ---<BR>VG Name<BR>VG=20
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
read/write<BR>VG=20
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;=20
NOT available/resizable<BR>VG=20
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
0<BR>MAX=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
1<BR>Open=20
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;=20
0<BR>MAX LV =
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2=20
TB<BR>Max=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
256<BR>Cur=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
4<BR>Act=20
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;=20
4<BR>VG=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
360.56 GB<BR>PE=20
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
32 MB<BR>Total=20
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;=20
11538<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 11180 / =
349.38=20
GB<BR>Free&nbsp; PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 358 / =
11.19=20
GB<BR>VG=20
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;=20
snZQHp-EWmO-aeox-1Cbi-8Guy-UPaU-l4UdJm</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>--- List of logical volumes =
---</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>pvdata -- logical volume =
"/dev/hotline/vol1" at=20
offset&nbsp;&nbsp; 0<BR>pvdata -- logical volume struct at =
offset&nbsp;&nbsp; 1=20
is empty<BR>...<BR>pvdata -- logical volume struct at offset 255 is =
empty<BR>---=20
List of physical volume UUIDs ---</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>001: =
ZLU9xB-hy6U-I7UF-Fd9C-3lTW-wKMX-9nhxcY<BR>002:=20
UGmBIH-LfYd-JQdV-xT2A-oSqj-8prs-ezsRLO<BR>003:=20
s8Gp0j-WWq2-yT9m-UnCz-qU7m-TnCG-tHwVaI<BR>004:=20
MFAGC5-zznc-n0xn-T5rT-Cluh-b9qR-6v7oge</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@blackbird =
root]#</FONT></DIV></BODY></HTML>

------=_NextPart_000_00EC_01C2A8D7.AA274310--
