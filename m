Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0ON8E110465
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 18:08:14 -0500
Received: from oxhp.com (mx2.oxhp.com [199.97.64.17])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id k0ON8BYv029145
	for <linux-lvm@redhat.com>; Tue, 24 Jan 2006 18:08:11 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C6213A.FB774429"
Subject: RE: [linux-lvm] file descriptor 3 left open
Date: Tue, 24 Jan 2006 18:07:43 -0500
Message-ID: <CF88E297901EB040B49935FE71B99A2D01F49F06@CTTRBEXVS01.oxhp.com>
From: "Kapadia, Nayan U." <nkapadia@oxhp.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

This is a multi-part message in MIME format.

------_=_NextPart_001_01C6213A.FB774429
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks, but that looks okay to me.
=20
Not working:
=20
rpm -ql kernel-smp-2.6.9-22.0.2.EL |grep boot
/boot/System.map-2.6.9-22.0.2.ELsmp
/boot/config-2.6.9-22.0.2.ELsmp
/boot/vmlinuz-2.6.9-22.0.2.ELsmp
/lib/modules/2.6.9-22.0.2.ELsmp/kernel/drivers/mtd/redboot.ko
=20
=20
Working:
=20
rpm -ql kernel-smp-2.6.9-22.0.1.EL |grep boot
=20
=20
/boot/System.map-2.6.9-22.0.1.ELsmp
/boot/config-2.6.9-22.0.1.ELsmp
/boot/vmlinuz-2.6.9-22.0.1.ELsmp
/lib/modules/2.6.9-22.0.1.ELsmp/kernel/drivers/mtd/redboot.ko


=20
Any ideas?
=20
=20

________________________________

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Jonathan E Brassow
Sent: Tuesday, January 24, 2006 5:49 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] file descriptor 3 left open


IIRC, these are merely informative messages saying that, "Hey, the
person who called me forgot to close some of their file descriptors,
like they were suppose to. But don't worry, I'll close them for you."=20

That would have been too long though, so I think they chose a more
cryptic message.=20

As far as your kernel installation problem, I'm not sure what's wrong
there...=20

You could 'rpm -q kernel' (or rpm -qa | grep kernel) to see if it is
installed. If it is, you could 'rpm -ql kernel-<the version> | grep
boot' to see if the image was correctly installed...=20

brassow=20

On Jan 24, 2006, at 3:55 PM, Kapadia, Nayan U. wrote:=20


	I keep seeing "file descriptor 3 left open" at boot after the
initrd is loaded.  The systems boots to the 2.6.9-22.0.1 kernel and
works fine.  I have ran fsck against all filesystems however the error
messages still appears.  I noticed that when I run system-config-lvm
these errors are more predominant. =20
	File descriptor 13 left open=20
	File descriptor 3 left open=20
	File descriptor 4 left open=20
	File descriptor 8 left open=20
	File descriptor 9 left open=20
	File descriptor 10 left open=20
	File descriptor 11 left open=20
	File descriptor 12 left open=20
	File descriptor 13 left open=20
	File descriptor 3 left open=20
	File descriptor 4 left open=20
	File descriptor 8 left open=20
	File descriptor 9 left open=20
	File descriptor 10 left open=20
	File descriptor 11 left open=20
	File descriptor 12 left open=20
	File descriptor 13 left open=20
	I recently installed the new kernel 2.6.9-22.0.2 but the system
does not find kernel at boot.  I think the file descriptor messages are
a symptom to some greater problem.  Please help.=20
	thank you!=20
	Nayan=20
=09
	_______________________________________________=20
	linux-lvm mailing list=20
	linux-lvm@redhat.com=20
	https://www.redhat.com/mailman/listinfo/linux-lvm=20
	read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


------_=_NextPart_001_01C6213A.FB774429
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2180" name=3DGENERATOR></HEAD>
<BODY>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D194410423-24012006>Thanks, but that looks okay to =
me.</SPAN></FONT></DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D194410423-24012006></SPAN></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D194410423-24012006>Not working:</SPAN></FONT></DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D194410423-24012006></SPAN></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2><SPAN=20
class=3D194410423-24012006>rpm -ql kernel-smp-2.6.9-22.0.2.EL |grep=20
boot</SPAN></FONT></DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
size=3D2>/boot/System.map-2.6.9-22.0.2.ELsmp<BR>/boot/config-2.6.9-22.0.2=
.ELsmp<BR>/boot/vmlinuz-2.6.9-22.0.2.ELsmp<BR>/lib/modules/2.6.9-22.0.2.E=
Lsmp/kernel/drivers/mtd/redboot.ko</FONT></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV><SPAN class=3D194410423-24012006><FONT face=3DArial color=3D#0000ff =

size=3D2>Working:</FONT></SPAN></DIV>
<DIV><SPAN class=3D194410423-24012006><FONT face=3DArial color=3D#0000ff =

size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV><SPAN class=3D194410423-24012006><FONT face=3DArial color=3D#0000ff =
size=3D2>rpm=20
-ql kernel-smp-2.6.9-22.0.1.EL |grep boot</FONT></SPAN></DIV>
<DIV><FONT face=3DArial></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial><FONT color=3D#0000ff =
size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT color=3D#0000ff=20
size=3D2>/boot/System.map-2.6.9-22.0.1.ELsmp<BR>/boot/config-2.6.9-22.0.1=
.ELsmp<BR>/boot/vmlinuz-2.6.9-22.0.1.ELsmp<BR>/lib/modules/2.6.9-22.0.1.E=
Lsmp/kernel/drivers/mtd/redboot.ko<BR></FONT><BR></DIV><FONT=20
color=3D#0000ff size=3D2></FONT></FONT>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D194410423-24012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>Any ideas?</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D194410423-24012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><SPAN =
class=3D194410423-24012006></SPAN>&nbsp;</DIV><BR>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
<HR tabIndex=3D-1>
<FONT face=3DTahoma size=3D2><B>From:</B> linux-lvm-bounces@redhat.com=20
[mailto:linux-lvm-bounces@redhat.com] <B>On Behalf Of </B>Jonathan E=20
Brassow<BR><B>Sent:</B> Tuesday, January 24, 2006 5:49 PM<BR><B>To:</B> =
LVM=20
general discussion and development<BR><B>Subject:</B> Re: [linux-lvm] =
file=20
descriptor 3 left open<BR></FONT><BR></DIV>
<DIV></DIV><!-- Converted from text/enriched format -->
<DIV>IIRC, these are merely informative messages saying that, "Hey, the =
person=20
who called me forgot to close some of their file descriptors, like they =
were=20
suppose to. But don't worry, I'll close them for you." </DIV><BR>
<DIV>That would have been too long though, so I think they chose a more =
cryptic=20
message. </DIV><BR>
<DIV>As far as your kernel installation problem, I'm not sure what's =
wrong=20
there... </DIV><BR>
<DIV>You could 'rpm -q kernel' (or rpm -qa | grep kernel) to see if it =
is=20
installed. If it is, you could 'rpm -ql kernel-&lt;the version&gt; | =
grep boot'=20
to see if the image was correctly installed... </DIV><BR>
<DIV>brassow </DIV><BR>
<DIV>On Jan 24, 2006, at 3:55 PM, Kapadia, Nayan U. wrote: </DIV><BR>
<BLOCKQUOTE>
  <DIV><FONT face=3DArial><SMALL>I keep seeing "file descriptor 3 left =
open" at=20
  boot after the initrd is loaded.&nbsp; The systems boots to the =
2.6.9-22.0.1=20
  kernel and works fine.&nbsp; I have ran fsck against all filesystems =
however=20
  the error messages still appears.&nbsp; I noticed that when I run=20
  system-config-lvm these errors are more =
predominant.&nbsp;</SMALL></FONT>=20
  </DIV>
  <DIV> </DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 13 left =
open</SMALL></FONT>=20
</DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 3 left =
open</SMALL></FONT> </DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 4 left =
open</SMALL></FONT> </DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 8 left =
open</SMALL></FONT> </DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 9 left =
open</SMALL></FONT> </DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 10 left =
open</SMALL></FONT>=20
</DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 11 left =
open</SMALL></FONT>=20
</DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 12 left =
open</SMALL></FONT>=20
</DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 13 left =
open</SMALL></FONT>=20
</DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 3 left =
open</SMALL></FONT> </DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 4 left =
open</SMALL></FONT> </DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 8 left =
open</SMALL></FONT> </DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 9 left =
open</SMALL></FONT> </DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 10 left =
open</SMALL></FONT>=20
</DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 11 left =
open</SMALL></FONT>=20
</DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 12 left =
open</SMALL></FONT>=20
</DIV>
  <DIV><FONT face=3DArial><SMALL>File descriptor 13 left =
open</SMALL></FONT>=20
</DIV>
  <DIV> </DIV>
  <DIV><FONT face=3DArial><SMALL>I recently installed the new kernel =
2.6.9-22.0.2=20
  but the system does not find kernel at boot.&nbsp; I think the file =
descriptor=20
  messages are a symptom to some greater problem.&nbsp; Please=20
  help.</SMALL></FONT> </DIV>
  <DIV> </DIV>
  <DIV><FONT face=3DArial><SMALL>thank you!</SMALL></FONT> </DIV>
  <DIV> </DIV>
  <DIV><FONT face=3DArial><SMALL>Nayan</SMALL></FONT> </DIV>
  <DIV> </DIV>
  <DIV><FONT face=3DArial><SMALL></SMALL></FONT> </DIV>
  <DIV>_______________________________________________ </DIV>
  <DIV>linux-lvm mailing list </DIV>
  <DIV>linux-lvm@redhat.com </DIV>
  <DIV>https://www.redhat.com/mailman/listinfo/linux-lvm </DIV>
  <DIV>read the LVM HOW-TO at=20
http://tldp.org/HOWTO/LVM-HOWTO/</DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C6213A.FB774429--
