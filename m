Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0I3dbO31703
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2005 22:39:37 -0500
Received: from mail17.ca.com (mail17.ca.com [155.35.248.106])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0I3dZiX011673
	for <linux-lvm@redhat.com>; Mon, 17 Jan 2005 22:39:36 -0500
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C4FD0F.50E68FEA"
Date: Tue, 18 Jan 2005 14:39:29 +1100
Message-ID: <7C5D17C4190B2A4BBD47C71727973DA7016159B5@ausyms22.ca.com>
From: "Bao, Liping" <Liping.Bao@ca.com>
Subject: [linux-lvm] (root is lvm) Kernel panic: No init found. Try passing
	init= option to kernel
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------_=_NextPart_001_01C4FD0F.50E68FEA
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi, all
I am dealing with a Disaster Recovery Software. After recoveried system
layout with lvm tools and recoveried data I bootup the machine,but
"kernel panic" happened.=20
Really appreaciate your help.
=20
My system is Suse Linux Enterprise Server 9(kernel 2.6.5-7.97-default).
The / partition is installed in a lvm vg.
The /boot partion is a regular partition.
=20
My trace:
Before reboot, I can activate all my logic volume with command "vgchange
-ay", and all of them can be mounted successfully.=20
Then I installed lilo.
And during bootup, I add "initrd=3Dtrace" to trace the initrd procedure, =
I
don't find anything abnormal(dm-mod loaded,volume activated, chroot to
real root succesfully...) except the kernel panic.
In my opnion, the "kernel panic" always happened during upgrading
kernel.  Which problem it should be?
How can I trace the problem?
=20
Thanks in advance.
=20
=20
=20
=20

------_=_NextPart_001_01C4FD0F.50E68FEA
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2523" name=3DGENERATOR></HEAD>
<BODY>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>Hi, =
all</FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>I am dealing with a =
Disaster=20
Recovery Software. After recoveried system layout with lvm tools and =
recoveried=20
data&nbsp;I bootup the machine,but&nbsp;"kernel panic" happened.=20
</FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>Really appreaciate =
your=20
help.</FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>My system is Suse =
Linux=20
Enterprise Server 9(kernel 2.6.5-7.97-default).</FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>The / partition is =
installed in=20
a lvm vg.</FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>The /boot partion =
is a regular=20
partition.</FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>My =
trace:</FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>Before reboot, I =
can activate=20
all my logic volume with command "vgchange -ay", and all of them can be =
mounted=20
successfully. </FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>Then I installed=20
lilo.</FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>And during bootup, =
I add=20
"initrd=3Dtrace" to trace the initrd procedure, I don't find anything=20
abnormal(dm-mod loaded,volume activated, chroot&nbsp;to real root=20
succesfully...)&nbsp;except the kernel panic.</FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>In my opnion, the =
"kernel=20
panic" always happened during upgrading kernel.&nbsp; =
</FONT></SPAN>Which=20
problem it should be?</FONT></SPAN></DIV></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>How can I trace the =

problem?</FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D906080403-18012005><FONT size=3D2>Thanks in=20
advance.</FONT></SPAN></DIV>
<DIV><SPAN class=3D906080403-18012005></SPAN><SPAN=20
class=3D906080403-18012005></SPAN><SPAN class=3D906080403-18012005><FONT =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D906080403-18012005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D906080403-18012005><FONT =
size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><FONT face=3D&#23435;&#20307; =
size=3D2></FONT>&nbsp;</DIV></BODY></HTML>

------_=_NextPart_001_01C4FD0F.50E68FEA--
