Message-Id: <00bf01c1dc5a$43e78be0$6501a8c0@bomoon>
From: "bo" <bo@sosnetwork.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
    boundary="----=_NextPart_000_00BC_01C1DC17.35B7EFD0"
Subject: [linux-lvm] running lvm tool from user application script
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
Date: Thu Apr  4 22:27:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_00BC_01C1DC17.35B7EFD0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

LVM gurus,

I have been playing with the LVM tool for a while under ROOT =
privilledge.
Today, I tried to run "lvscan" & "pvscan" from one of my user script
to show LVM status to user. I realized I could not run them having the =
attached errors.

Q1: Is that true I can not run "vgscan", "lvscan",... under user =
applciation
which does not have "root" right?

Q2: I want to run these utilities from my CGI script for Web GUI.=20
     Any suggestions?

Thanks in advance,

BM

ATTACH)------------------------------------------------------------------=
-
Error2)
mooasun>$cat /etc/*tab
mooasun>$anacrontab    fstab    lvmtab    raidtab
mooasun>$crontab        inittab    mtab
mooasun>$lvscan
mooasun>$lvscan -- ERROR: "/etc/lvmtab" doesnot exist; please run vgscan
     =20
Error1)
mooasun>$vgscan
mooasun>$vgscan -- LVM driver/module not loaded!

------=_NextPart_000_00BC_01C1DC17.35B7EFD0
Content-Type: text/html;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dks_c_5601-1987">
<META content=3D"MSHTML 5.50.4522.1800" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>LVM gurus,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have been playing with the LVM tool =
for a while=20
under ROOT privilledge.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Today, I tried to run "lvscan" &amp; =
"pvscan" from=20
one of my user script</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>to show LVM status to user. I realized =
I could not=20
run them having the attached errors.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Q1: Is that true I can not run =
"vgscan",=20
"lvscan",... under user applciation</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>which does not have "root" =
right?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Q2: I want to run these utilities from =
my CGI=20
script for Web GUI. </FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp; Any=20
suggestions?</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>BM</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>ATTACH)---------------------------------------------------------=
----------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Error2)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>mooasun&gt;$cat /etc/*tab</FONT></DIV>
<DIV><FONT face=3DArial =
size=3D2>mooasun&gt;$anacrontab&nbsp;&nbsp;&nbsp;=20
fstab&nbsp;&nbsp;&nbsp; lvmtab&nbsp;&nbsp;&nbsp; raidtab</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>mooasun&gt;$crontab&nbsp;&nbsp;&nbsp;=20
&nbsp;&nbsp;&nbsp; inittab&nbsp;&nbsp;&nbsp; mtab</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>
<DIV><FONT face=3DArial size=3D2>mooasun&gt;$lvscan</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>mooasun&gt;$lvscan -- ERROR: =
"/etc/lvmtab" doesnot=20
exist; please run vgscan</FONT></DIV></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
</FONT></DIV>
<DIV>
<DIV><FONT face=3DArial size=3D2>Error1)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>mooasun&gt;$vgscan</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>mooasun&gt;$vgscan -- LVM driver/module =
not=20
loaded!</FONT></DIV></DIV></BODY></HTML>

------=_NextPart_000_00BC_01C1DC17.35B7EFD0--
