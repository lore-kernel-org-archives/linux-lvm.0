Message-ID: <001801c24786$b722dbe0$0a0a0a0a@wingenbach.org>
From: "John Wingenbach" <lvm@wingenbach.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0015_01C24765.2FD5B980"
Subject: [linux-lvm] lvm 1.1-rc2 - vgscan core dumps
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
Date: Mon Aug 19 08:46:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0015_01C24765.2FD5B980
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I am running into a problem with lvm and a 2.4.19 install.  I have built =
a 2.4.19 box w/ lvm 1.1-rc2.  When I run a vgscan, it core dumps.  When =
I run pvcreate on a lvm partition, I get a warning message saying that I =
need to run it w/ -ff.  Apparently it thinks the partition is in use =
with an existing volume group.  However, none are defined / created. The =
debug shows it working on a VG - rootvg.  However, that vg doesn't =
exist.  At least not on this install.  It used to exist on the previous =
install.  However, the system still thinks it exists somehow. =20

Here's the debug of the vgscan prior to core:

<22> vg_read_with_pv_and_lv -- CALLED for rootvg
<333> vg_check_name -- CALLED with VG: rootvg
<4444> lvm_check_chars -- CALLED with name: "rootvg"
<4444> lvm_check_chars -- LEAVING with ret: 0
<333> vg_check_name -- LEAVING with ret: 0
<333> vg_read -- CALLED
<4444> vg_check_name -- CALLED with VG: rootvg
<55555> lvm_check_chars -- CALLED with name: "rootvg"
<55555> lvm_check_chars -- LEAVING with ret: 0
<4444> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- CALLED with vg_name: "rootvg"
<55555> vg_check_name -- CALLED with VG: rootvg
<666666> lvm_check_chars -- CALLED with name: "rootvg"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> vg_check_name -- LEAVING with ret: 0
<4444> pv_read_all_pv_of_vg -- LEAVING with ret: 0
<4444> vg_read_from_pv -- CALLED
<55555> pv_check_name -- CALLED with "/dev/sdb2"
<666666> lvm_check_chars -- CALLED with name: "/dev/sdb2"
<666666> lvm_check_chars -- LEAVING with ret: 0
<55555> pv_check_name -- LEAVING with ret: 0
<55555> pv_read -- CALLED with /dev/sdb2
<666666> pv_check_name -- CALLED with "/dev/sdb2"
<7777777> lvm_check_chars -- CALLED with name: "/dev/sdb2"
<7777777> lvm_check_chars -- LEAVING with ret: 0
<666666> pv_check_name -- LEAVING with ret: 0
<55555> pv_read -- going to read /dev/sdb2
<666666> lvm_malloc -- CALLED with size 468
<7777777> lvm_realloc -- CALLED with pointer 0, size 468
<7777777> lvm_realloc -- LEAVING with pointer 81538F0
<666666> lvm_malloc -- LEAVING with pointer 81538F0
<666666> lvm_check_dev -- CALLED
<7777777> lvm_check_partitioned_dev -- CALLED
<88888888> lvm_get_device_type called
<88888888> lvm_get_device_type leaving with 1
<7777777> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<666666> lvm_check_dev -- LEAVING with ret: 1
<666666> pv_copy_from_disk -- CALLED
<7777777> lvm_malloc -- CALLED with size 516
<88888888> lvm_realloc -- CALLED with pointer 0, size 516
<88888888> lvm_realloc -- LEAVING with pointer 8153AC8
<7777777> lvm_malloc -- LEAVING with pointer 8153AC8
<666666> pv_copy_from_disk -- LEAVING ret =3D 0x8153ac8
<666666> lvm_free -- CALLED with pointer 81538F0
<666666> lvm_free -- LEAVING
<666666> pv_create_name_from_kdev_t -- CALLED with 8:18
<7777777> lvm_check_dev -- CALLED
<88888888> lvm_check_partitioned_dev -- CALLED
<999999999> lvm_get_device_type called
<999999999> lvm_get_device_type leaving with 1
<88888888> lvm_check_partitioned_dev -- LEAVING with ret: TRUE
<7777777> lvm_check_dev -- LEAVING with ret: 1
<7777777> lvm_dir_cache -- CALLED
<7777777> lvm_dir_cache -- LEAVING with ret: 47
<666666> pv_create_name_from_kdev_t -- LEAVING with dev_name: /dev/sdb2
<666666> system_id_check_exported -- CALLED
<666666> system_id_check_exported -- LEAVING with ret: 0
<55555> pv_read -- LEAVING with ret: 0
<55555> lvm_malloc -- CALLED with size 188
<666666> lvm_realloc -- CALLED with pointer 0, size 188
<666666> lvm_realloc -- LEAVING with pointer 8153CD0
<55555> lvm_malloc -- LEAVING with pointer 8153CD0
<55555> vg_copy_from_disk -- CALLED
<666666> lvm_malloc -- CALLED with size 2484
<7777777> lvm_realloc -- CALLED with pointer 0, size 2484
<7777777> lvm_realloc -- LEAVING with pointer 8153D90
<666666> lvm_malloc -- LEAVING with pointer 8153D90
Segmentation fault (core dumped)

------=_NextPart_000_0015_01C24765.2FD5B980
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 5.50.4916.2300" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>I am running into a problem with lvm =
and a 2.4.19=20
install.&nbsp; I have built a 2.4.19 box w/ lvm 1.1-rc2.&nbsp; When I =
run a=20
vgscan, it core dumps.&nbsp; When I run pvcreate on a lvm partition, I =
get a=20
warning message saying that I need to run it w/ -ff.&nbsp; Apparently it =
thinks=20
the partition is in use with an existing volume group.&nbsp; However, =
none are=20
defined / created. </FONT><FONT face=3DArial size=3D2>The debug shows it =
working on=20
a VG - rootvg.&nbsp; However, that vg doesn't exist.&nbsp; At least not =
on this=20
install.&nbsp; It used to exist on the previous install.&nbsp; However, =
the=20
system still thinks it exists somehow.&nbsp; </FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Here's the debug of the vgscan prior to =

core:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&lt;22&gt; vg_read_with_pv_and_lv -- =
CALLED for=20
rootvg<BR>&lt;333&gt; vg_check_name -- CALLED with VG: =
rootvg<BR>&lt;4444&gt;=20
lvm_check_chars -- CALLED with name: "rootvg"<BR>&lt;4444&gt; =
lvm_check_chars --=20
LEAVING with ret: 0<BR>&lt;333&gt; vg_check_name -- LEAVING with ret:=20
0<BR>&lt;333&gt; vg_read -- CALLED<BR>&lt;4444&gt; vg_check_name -- =
CALLED with=20
VG: rootvg<BR>&lt;55555&gt; lvm_check_chars -- CALLED with name:=20
"rootvg"<BR>&lt;55555&gt; lvm_check_chars -- LEAVING with ret: =
0<BR>&lt;4444&gt;=20
vg_check_name -- LEAVING with ret: 0<BR>&lt;4444&gt; =
pv_read_all_pv_of_vg --=20
CALLED with vg_name: "rootvg"<BR>&lt;55555&gt; vg_check_name -- CALLED =
with VG:=20
rootvg<BR>&lt;666666&gt; lvm_check_chars -- CALLED with name:=20
"rootvg"<BR>&lt;666666&gt; lvm_check_chars -- LEAVING with ret:=20
0<BR>&lt;55555&gt; vg_check_name -- LEAVING with ret: 0<BR>&lt;4444&gt;=20
pv_read_all_pv_of_vg -- LEAVING with ret: 0<BR>&lt;4444&gt; =
vg_read_from_pv --=20
CALLED<BR>&lt;55555&gt; pv_check_name -- CALLED with=20
"/dev/sdb2"<BR>&lt;666666&gt; lvm_check_chars -- CALLED with name:=20
"/dev/sdb2"<BR>&lt;666666&gt; lvm_check_chars -- LEAVING with ret:=20
0<BR>&lt;55555&gt; pv_check_name -- LEAVING with ret: 0<BR>&lt;55555&gt; =
pv_read=20
-- CALLED with /dev/sdb2<BR>&lt;666666&gt; pv_check_name -- CALLED with=20
"/dev/sdb2"<BR>&lt;7777777&gt; lvm_check_chars -- CALLED with name:=20
"/dev/sdb2"<BR>&lt;7777777&gt; lvm_check_chars -- LEAVING with ret:=20
0<BR>&lt;666666&gt; pv_check_name -- LEAVING with ret: =
0<BR>&lt;55555&gt;=20
pv_read -- going to read /dev/sdb2<BR>&lt;666666&gt; lvm_malloc -- =
CALLED with=20
size 468<BR>&lt;7777777&gt; lvm_realloc -- CALLED with pointer 0, size=20
468<BR>&lt;7777777&gt; lvm_realloc -- LEAVING with pointer=20
81538F0<BR>&lt;666666&gt; lvm_malloc -- LEAVING with pointer=20
81538F0<BR>&lt;666666&gt; lvm_check_dev -- CALLED<BR>&lt;7777777&gt;=20
lvm_check_partitioned_dev -- CALLED<BR>&lt;88888888&gt; =
lvm_get_device_type=20
called<BR>&lt;88888888&gt; lvm_get_device_type leaving with =
1<BR>&lt;7777777&gt;=20
lvm_check_partitioned_dev -- LEAVING with ret: TRUE<BR>&lt;666666&gt;=20
lvm_check_dev -- LEAVING with ret: 1<BR>&lt;666666&gt; pv_copy_from_disk =
--=20
CALLED<BR>&lt;7777777&gt; lvm_malloc -- CALLED with size =
516<BR>&lt;88888888&gt;=20
lvm_realloc -- CALLED with pointer 0, size 516<BR>&lt;88888888&gt; =
lvm_realloc=20
-- LEAVING with pointer 8153AC8<BR>&lt;7777777&gt; lvm_malloc -- LEAVING =
with=20
pointer 8153AC8<BR>&lt;666666&gt; pv_copy_from_disk -- LEAVING ret =3D=20
0x8153ac8<BR>&lt;666666&gt; lvm_free -- CALLED with pointer=20
81538F0<BR>&lt;666666&gt; lvm_free -- LEAVING<BR>&lt;666666&gt;=20
pv_create_name_from_kdev_t -- CALLED with 8:18<BR>&lt;7777777&gt; =
lvm_check_dev=20
-- CALLED<BR>&lt;88888888&gt; lvm_check_partitioned_dev --=20
CALLED<BR>&lt;999999999&gt; lvm_get_device_type =
called<BR>&lt;999999999&gt;=20
lvm_get_device_type leaving with 1<BR>&lt;88888888&gt; =
lvm_check_partitioned_dev=20
-- LEAVING with ret: TRUE<BR>&lt;7777777&gt; lvm_check_dev -- LEAVING =
with ret:=20
1<BR>&lt;7777777&gt; lvm_dir_cache -- CALLED<BR>&lt;7777777&gt; =
lvm_dir_cache --=20
LEAVING with ret: 47<BR>&lt;666666&gt; pv_create_name_from_kdev_t -- =
LEAVING=20
with dev_name: /dev/sdb2<BR>&lt;666666&gt; system_id_check_exported --=20
CALLED<BR>&lt;666666&gt; system_id_check_exported -- LEAVING with ret:=20
0<BR>&lt;55555&gt; pv_read -- LEAVING with ret: 0<BR>&lt;55555&gt; =
lvm_malloc --=20
CALLED with size 188<BR>&lt;666666&gt; lvm_realloc -- CALLED with =
pointer 0,=20
size 188<BR>&lt;666666&gt; lvm_realloc -- LEAVING with pointer=20
8153CD0<BR>&lt;55555&gt; lvm_malloc -- LEAVING with pointer=20
8153CD0<BR>&lt;55555&gt; vg_copy_from_disk -- CALLED<BR>&lt;666666&gt;=20
lvm_malloc -- CALLED with size 2484<BR>&lt;7777777&gt; lvm_realloc -- =
CALLED=20
with pointer 0, size 2484<BR>&lt;7777777&gt; lvm_realloc -- LEAVING with =
pointer=20
8153D90<BR>&lt;666666&gt; lvm_malloc -- LEAVING with pointer=20
8153D90<BR>Segmentation fault (core =
dumped)<BR></FONT></DIV></BODY></HTML>

------=_NextPart_000_0015_01C24765.2FD5B980--
