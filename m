Message-ID: <B8E11CED6182E246A9A427A68A9F640670E58B@OA4-SERVER.oa.oclc.org>
From: "Fought,Tom" <foughtt@oclc.org>
Date: Tue, 16 Oct 2001 14:57:32 -0400
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C15674.697B2E00"
Subject: [linux-lvm] pv problem?
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
To: "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

------_=_NextPart_001_01C15674.697B2E00
Content-Type: text/plain;
	charset="iso-8859-1"

Just started working with LVM.
I have 2 6GB IDE drives. Had test logical volumes working.
Destroyed and attempted to create new PVs, VGs, LVs.
I can create PVs, and VGs but I get a segmentation violation/core dump
when trying to create LVs.
 
I have /dev/hdb1 and /dev/hdb2 assigned to a VG. 
When I try to create an LV with lvcreate it errors out.
 
The curious thing for me is the pvdisplay.. the PVs have a 
status of NOT Available. I am trying to determine why this would be.
 
Here is what I have:
vgdisplay -v
--- Volume group ---
VG Name               testvg
VG Access             read/write
VG Status             available/resizable
VG #                  0
MAX LV                255
Cur LV                0
Open LV               0
MAX LV Size           255.99 GB
Max PV                255
Cur PV                2
Act PV                2
VG Size               3.80 GB
PE Size               4.00 MB
Total PE              974
Alloc PE / Size       0 / 0
Free  PE / Size       974 / 3.80 GB
VG UUID               yawi5j-Trcb-fYu0-7xFZ-A467-63hW-MTJzMM
 
--- No logical volumes defined in "testvg" ---
 

--- Physical volumes ---
PV Name (#)           /dev/hdb1 (1)
PV Status             available / allocatable
Total PE / Free PE    487 / 487
 
PV Name (#)           /dev/hdb2 (2)
PV Status             available / allocatable
Total PE / Free PE    487 / 487

 
 
pvdisplay /dev/hdb1
--- Physical volume ---
PV Name               /dev/hdb1
VG Name               testvg
PV Size               1.91 GB / NOT usable 5.18 MB [LVM: 125.00 KB]
PV#                   1
PV Status             NOT available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              487
Free PE               487
Allocated PE          0
PV UUID               CwulSL-NPB0-Bega-3tTP-S0qR-Nlcu-T3wYQb
 
pvdisplay /dev/hdb2
--- Physical volume ---
PV Name               /dev/hdb2
VG Name               testvg
PV Size               1.91 GB / NOT usable 5.21 MB [LVM: 125.00 KB]
PV#                   2
PV Status             NOT available
Allocatable           yes
Cur LV                0
PE Size (KByte)       4096
Total PE              487
Free PE               487
Allocated PE          0
PV UUID               FyLY4F-odGj-1iHA-KRnD-YVhV-Mf8O-jlhB4z
 
 
trying to create the lv... just the last part of debug included..
lvcreate -d -v -L1G -n testlv testvg
 
<4444> pv_check_consistency -- LEAVING with ret: 0
<333> lv_check_on_pv -- LEAVING with ret: 1
<22> pv_reserve_pe -- LEAVING with ret: 0
<1> lv_setup_for_create -- pv_reserve_pe returned: 0   pe_last: 256  pe: 0
<1> lv_setup_for_create -- pe: 0
<1> lv_setup_for_create -- LEAVING with ret: 0
lvcreate -- setting read ahead sectors
<1> lvm_dont_interrupt -- CALLED
<1> lvm_dont_interrupt -- LEAVING
lvcreate -- creating logical volume VGDA in kernel
Segmentation fault (core dumped)
 

------_=_NextPart_001_01C15674.697B2E00
Content-Type: text/html;
	charset="iso-8859-1"

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=iso-8859-1">


<META content="MSHTML 5.50.4134.600" name=GENERATOR></HEAD>
<BODY>
<DIV><FONT face="Courier New" size=2><SPAN class=258133218-16102001>Just started 
working with LVM.</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=258133218-16102001>I have 2 6GB 
IDE drives. Had test logical volumes working.</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=258133218-16102001>Destroyed 
and attempted to create new PVs, VGs, LVs.</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=258133218-16102001>I can create 
PVs, and VGs but I get a segmentation violation/core dump</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=258133218-16102001>when trying 
to create LVs.</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN 
class=258133218-16102001></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=258133218-16102001>I have 
/dev/hdb1 and /dev/hdb2 assigned to a VG. </SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=258133218-16102001>When I try 
to create an LV with lvcreate it errors out.</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN 
class=258133218-16102001></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=258133218-16102001>The curious 
thing for me is the pvdisplay.. the PVs have a </SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2><SPAN class=258133218-16102001>status of 
NOT Available. I am trying to determine why this would be.</SPAN></FONT></DIV>
<DIV><FONT face="Courier New" size=2></FONT>&nbsp;</DIV>
<DIV><SPAN class=258133218-16102001><FONT face="Courier New" size=2>Here is what 
I have:</FONT></SPAN></DIV>
<DIV><SPAN class=258133218-16102001><FONT face="Courier New" size=2>vgdisplay 
-v<BR>--- Volume group ---<BR>VG 
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
testvg<BR>VG 
Access&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
read/write<BR>VG 
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
available/resizable<BR>VG 
#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0<BR>MAX 
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
255<BR>Cur 
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0<BR>Open 
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0<BR>MAX LV Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
255.99 GB<BR>Max 
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
255<BR>Cur 
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
2<BR>Act 
PV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
2<BR>VG 
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
3.80 GB<BR>PE 
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
4.00 MB<BR>Total 
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
974<BR>Alloc PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 0 / 0<BR>Free&nbsp; 
PE / Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 974 / 3.80 GB<BR>VG 
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
yawi5j-Trcb-fYu0-7xFZ-A467-63hW-MTJzMM</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV>
<DIV><SPAN class=258133218-16102001><FONT face="Courier New" size=2>--- No 
logical volumes defined in "testvg" ---</FONT></SPAN></DIV>
<DIV>&nbsp;</DIV><SPAN class=258133218-16102001><FONT face="Courier New" size=2>
<DIV><BR>--- Physical volumes ---<BR>PV Name 
(#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /dev/hdb1 
(1)<BR>PV 
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
available / allocatable<BR>Total PE / Free PE&nbsp;&nbsp;&nbsp; 487 / 487</DIV>
<DIV>&nbsp;</DIV>
<DIV>PV Name (#)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
/dev/hdb2 (2)<BR>PV 
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
available / allocatable<BR>Total PE / Free PE&nbsp;&nbsp;&nbsp; 487 / 
487<BR></FONT></SPAN></DIV>
<DIV><SPAN class=258133218-16102001></SPAN>&nbsp;</DIV>
<DIV><FONT face="Courier New" size=2></FONT>&nbsp;</DIV>
<DIV><FONT face="Courier New" size=2>pvdisplay /dev/hdb1<BR>--- Physical volume 
---<BR>PV 
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
/dev/hdb1<BR>VG 
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
testvg<BR>PV 
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
1.91 GB / NOT usable 5.18 MB [LVM: 125.00 
KB]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
1<BR>PV 
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
NOT 
available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
yes<BR>Cur 
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<BR>Total 
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
487<BR>Free 
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
487<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0<BR>PV 
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
CwulSL-NPB0-Bega-3tTP-S0qR-Nlcu-T3wYQb</FONT></DIV>
<DIV><FONT face="Courier New" size=2></FONT>&nbsp;</DIV>
<DIV><FONT face="Courier New" size=2>pvdisplay /dev/hdb2<BR>--- Physical volume 
---<BR>PV 
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
/dev/hdb2<BR>VG 
Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
testvg<BR>PV 
Size&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
1.91 GB / NOT usable 5.21 MB [LVM: 125.00 
KB]<BR>PV#&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
2<BR>PV 
Status&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
NOT 
available<BR>Allocatable&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
yes<BR>Cur 
LV&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0<BR>PE Size (KByte)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4096<BR>Total 
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
487<BR>Free 
PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
487<BR>Allocated PE&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
0<BR>PV 
UUID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
FyLY4F-odGj-1iHA-KRnD-YVhV-Mf8O-jlhB4z</FONT></DIV>
<DIV><FONT face="Courier New" size=2></FONT>&nbsp;</DIV>
<DIV><FONT face="Courier New" size=2></FONT>&nbsp;</DIV>
<DIV><SPAN class=258133218-16102001><FONT face="Courier New" size=2>trying to 
create the lv... just the last part of debug included..</FONT></SPAN></DIV>
<DIV><SPAN class=258133218-16102001><FONT face="Courier New" size=2>lvcreate -d 
-v -L1G -n testlv testvg</FONT></SPAN></DIV>
<DIV><SPAN class=258133218-16102001><FONT face="Courier New" 
size=2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=258133218-16102001><FONT face="Courier New" size=2>&lt;4444&gt; 
pv_check_consistency -- LEAVING with ret: 0<BR>&lt;333&gt; lv_check_on_pv -- 
LEAVING with ret: 1<BR>&lt;22&gt; pv_reserve_pe -- LEAVING with ret: 
0<BR>&lt;1&gt; lv_setup_for_create -- pv_reserve_pe returned: 0&nbsp;&nbsp; 
pe_last: 256&nbsp; pe: 0<BR>&lt;1&gt; lv_setup_for_create -- pe: 0<BR>&lt;1&gt; 
lv_setup_for_create -- LEAVING with ret: 0<BR>lvcreate -- setting read ahead 
sectors<BR>&lt;1&gt; lvm_dont_interrupt -- CALLED<BR>&lt;1&gt; 
lvm_dont_interrupt -- LEAVING<BR>lvcreate -- creating logical volume VGDA in 
kernel<BR>Segmentation fault (core dumped)</FONT></SPAN></DIV>
<DIV><SPAN class=258133218-16102001><FONT face="Courier New" 
size=2></FONT></SPAN>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C15674.697B2E00--
