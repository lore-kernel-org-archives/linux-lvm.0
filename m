Message-ID: <007a01c313ae$5c75b100$4681a3cb@testgmdc.com>
From: "Bhoomi" <bjvora@gnvfc.net>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0077_01C313DC.761D4B30"
Subject: [linux-lvm] LVM kernel panic
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
Date: Sat May 10 08:37:47 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.

------=_NextPart_000_0077_01C313DC.761D4B30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

I have installed LVM on RH Linux 7.2, kernel 2.4.7-10. I have recompiled =
the kernel and it was working. First i changed the partition id of /home =
(/dev/hda3) from 83 to 8e, and then of  /root (/dev/hda2) partition from =
83 to 8e. Then i apply 'pvcreate' command for both the partition which =
was successfully done. Next was 'vgcreate', which gave an error:

-------------------------------------------------------------------------=
----------------
VGDA in kernel and lvmtab are NOT consitent please run vgscan
-------------------------------------------------------------------------=
----------------
At this stage not a single command was executing. Then again i changed =
/root (/dev/hda2) from 8e to 83 and rebooted the system.

Now it is giving following error.
-------------------------------------------------------------------------=
-----
kernel panic:VFS: Unable to mount root fs on 03:02
VFS: Can't find ext3 filesystem on dev ide0(3,2)
mount:error 22 mounting ext3
pivot root: pivot_root(/sysroot,/sysroot/initrd) failed: 2
Freeing unused kernel memory: 220k freed
kernel panic: No init found: Try passing init=3D option to kernel
-------------------------------------------------------------------------=
-----
I tried to login as 'linux single' and 'linux rescue' on boot: prompt =
but it stuckup with the error and not booting.

Pl. advise how to restore the system.

Thanks in advance..

Bhoomi



------=_NextPart_000_0077_01C313DC.761D4B30
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.2920.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I have installed LVM on RH Linux 7.2, =
kernel=20
2.4.7-10. I have recompiled the kernel and it was working. First i =
changed the=20
partition id of /home (/dev/hda3) from 83 to 8e, and then of&nbsp; /root =

(/dev/hda2) partition from 83 to 8e. Then i apply 'pvcreate' command for =
both=20
the partition which was successfully done. Next was 'vgcreate', which =
gave an=20
error:</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
-------------------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>VGDA in kernel and lvmtab are NOT =
consitent please=20
run vgscan</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
-------------------------</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>At this stage not a single command was =
executing.=20
Then again i changed /root (/dev/hda2) from 8e to 83 and rebooted the=20
system.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Now it is giving following =
error.</FONT></DIV>
<DIV><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
--------------</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>kernel panic:VFS: Unable to mount root =
fs on=20
03:02</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>VFS: Can't find ext3 filesystem on dev=20
ide0(3,2)</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>mount:error 22 mounting =
ext3</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>pivot root: =
pivot_root(/sysroot,/sysroot/initrd)=20
failed: 2</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>Freeing unused kernel memory: 220k=20
freed</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>kernel panic: No init found: Try =
passing init=3D=20
option to kernel</FONT></DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3DArial=20
size=3D2>----------------------------------------------------------------=
--------------</FONT></FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I tried to login as 'linux single' and =
'linux=20
rescue' on boot: prompt but it stuckup with the error and not=20
booting.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Pl. advise how to restore the =
system.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks in advance..</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Bhoomi</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV></DIV></BODY></HTML>

------=_NextPart_000_0077_01C313DC.761D4B30--
