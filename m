Message-ID: <005001c3722d$aedeaef0$762daf96@netadp.local>
From: =?iso-8859-1?Q?Javier_Ca=F1amero?= <javier.canamero@adpclearing.org>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0047_01C37214.6CF87340"
Subject: [linux-lvm] Segmentation fault in lvcreate
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
Date: Wed Sep  3 14:08:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0047_01C37214.6CF87340
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

After creating successfully 210 logical volumes in different volume =
groups, lvcreate gives me a segmentation fault and displays the =
following message:

[root@bcnbackup1 root]# lvcreate -L 2000 -n datos01_fvs ifxdisco2_fvs
lvcreate -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please =
run vgscan

vgscan also gives me a segmentation fault:

vgscan -- reading all physical volumes (this may take a while...)
Segmentation fault

vgscan -d returns this:

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
vgscan -- reading all physical volumes (this may take a while...)
<1> vg_check_exist_all_vg -- CALLED
<22> pv_read_all_pv -- CALLED
<22> pv_read_all_pv -- calling lvm_dir_cache
<333> lvm_dir_cache -- CALLED
Segmentation fault.

I've tried rebooting the system after modifying /etc/rc.sysinit to avoid =
vgchange.
I'm working on Red Hat 7.2 with LVM 1.0.7.
What should I do?
Thanks in Advance,
Javier.

------=_NextPart_000_0047_01C37214.6CF87340
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2800.1141" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hello,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>After creating successfully 210 logical =
volumes in=20
different volume groups, lvcreate gives me a segmentation fault and =
displays the=20
following message:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>[root@bcnbackup1 root]# lvcreate -L =
2000 -n=20
datos01_fvs ifxdisco2_fvs<BR>lvcreate -- ERROR: VGDA in kernel and =
lvmtab are=20
NOT consistent; please run vgscan</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>vgscan also gives me a segmentation=20
fault:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>vgscan -- reading all physical volumes =
(this may=20
take a while...)<BR>Segmentation fault</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>vgscan -d returns this:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&lt;1&gt; lvm_get_iop_version --=20
CALLED<BR>&lt;22&gt; lvm_check_special -- CALLED<BR>&lt;22&gt; =
lvm_check_special=20
-- LEAVING<BR>&lt;1&gt; lvm_get_iop_version -- AFTER ioctl ret: =
0<BR>&lt;1&gt;=20
lvm_get_iop_version -- LEAVING with ret: 10<BR>&lt;1&gt; lvm_lock --=20
CALLED<BR>&lt;22&gt; lvm_check_special -- CALLED<BR>&lt;22&gt; =
lvm_check_special=20
-- LEAVING<BR>&lt;1&gt; lvm_lock -- LEAVING with ret: 0<BR>&lt;1&gt;=20
lvm_dont_interrupt -- CALLED<BR>&lt;1&gt; lvm_dont_interrupt --=20
LEAVING<BR>&lt;1&gt; lvm_remove_recursive -- CALLED with dir:=20
/etc/lvmtab.d<BR>&lt;1&gt; lvm_remove_recursive -- LEAVING with ret:=20
0<BR>&lt;1&gt; lvm_tab_create -- CALLED<BR>&lt;22&gt; lvm_tab_write --=20
CALLED<BR>&lt;22&gt; lvm_tab_write -- LEAVING with ret: 0<BR>&lt;1&gt;=20
lvm_tab_create -- LEAVING with ret: 0<BR>vgscan -- reading all physical =
volumes=20
(this may take a while...)<BR>&lt;1&gt; vg_check_exist_all_vg --=20
CALLED<BR>&lt;22&gt; pv_read_all_pv -- CALLED<BR>&lt;22&gt; =
pv_read_all_pv --=20
calling lvm_dir_cache<BR>&lt;333&gt; lvm_dir_cache -- =
CALLED<BR>Segmentation=20
fault.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I've tried rebooting the system after =
modifying=20
/etc/rc.sysinit to avoid vgchange.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I'm working on Red Hat 7.2 with LVM=20
1.0.7.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>What should I do?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in Advance,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Javier.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------=_NextPart_000_0047_01C37214.6CF87340--
