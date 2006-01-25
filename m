Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0PEC3116110
	for <linux-lvm@redhat.com>; Wed, 25 Jan 2006 09:12:03 -0500
Received: from oxhp.com (mx2.oxhp.com [199.97.64.17])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k0PEBld2008656
	for <linux-lvm@redhat.com>; Wed, 25 Jan 2006 09:11:52 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C621B9.387F04C7"
Subject: RE: [linux-lvm] file descriptor 3 left open
Date: Wed, 25 Jan 2006 09:11:22 -0500
Message-ID: <CF88E297901EB040B49935FE71B99A2D01F4A13D@CTTRBEXVS01.oxhp.com>
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

------_=_NextPart_001_01C621B9.387F04C7
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Uncompressing Linux booting the kernel
Redhat Nash 4.1.18 starting
File descriptor 3 left open
Reading physical volumes This may take awhile
/dev/hda open failed: No media found
--------------------------------- this is the CDROM
No Volume groups found
File descriptor 3 left open
Reading physical volumes This may take awhile
/dev/hda open failed: No media found
No Volume groups found
File descriptor 3 left open
Reading physical volumes This may take awhile
/dev/hda open failed: No media found
No Volume groups found
mount error 6 mounting ext3 :  22
umount /initrd/dev  failed :2=20
kernel panic not syncing attempted to kill init.

Thank you, you lead me to the reason why it was failing.  I had to run
mkinitrd --with=3Dcciss to load the scsi adapter.
=20
The file descriptor left open messages are just indications of files
being left in open state?
=20
Thanks again!
=20
Nayan
=20
=20
=20
=20
________________________________

From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com]
On Behalf Of Jonathan E Brassow
Sent: Tuesday, January 24, 2006 6:22 PM
To: LVM general discussion and development
Subject: Re: [linux-lvm] file descriptor 3 left open


What do you mean by "not working", the rpm command seems to think the
files are installed... Take a look in /boot/grub/menu.lst and see if the
kernel is in there and it is the default to boot (default =3D 0 for the
first kernel listed)=20

brassow=20

On Jan 24, 2006, at 5:07 PM, Kapadia, Nayan U. wrote:=20


	Thanks, but that looks okay to me.=20
	Not working:=20
	rpm -ql kernel-smp-2.6.9-22.0.2.EL |grep boot=20
	/boot/System.map-2.6.9-22.0.2.ELsmp=20
	/boot/config-2.6.9-22.0.2.ELsmp=20
	/boot/vmlinuz-2.6.9-22.0.2.ELsmp=20
	/lib/modules/2.6.9-22.0.2.ELsmp/kernel/drivers/mtd/redboot.ko=20
	Working:=20
	rpm -ql kernel-smp-2.6.9-22.0.1.EL |grep boot=20
=09

	/boot/System.map-2.6.9-22.0.1.ELsmp=20
	/boot/config-2.6.9-22.0.1.ELsmp=20
	/boot/vmlinuz-2.6.9-22.0.1.ELsmp=20
	/lib/modules/2.6.9-22.0.1.ELsmp/kernel/drivers/mtd/redboot.ko=20


	Any ideas?=20

	From: linux-lvm-bounces@redhat.com
[mailto:linux-lvm-bounces@redhat.com] On Behalf Of Jonathan E Brassow=20
	Sent: Tuesday, January 24, 2006 5:49 PM=20
	To: LVM general discussion and development=20
	Subject: Re: [linux-lvm] file descriptor 3 left open=20

	IIRC, these are merely informative messages saying that, "Hey,
the person who called me forgot to close some of their file descriptors,
like they were suppose to. But don't worry, I'll close them for you."=20

	That would have been too long though, so I think they chose a
more cryptic message.=20

	As far as your kernel installation problem, I'm not sure what's
wrong there...=20

	You could 'rpm -q kernel' (or rpm -qa | grep kernel) to see if
it is installed. If it is, you could 'rpm -ql kernel-<the version> |
grep boot' to see if the image was correctly installed...=20

	brassow=20

	On Jan 24, 2006, at 3:55 PM, Kapadia, Nayan U. wrote:=20


		I keep seeing "file descriptor 3 left open" at boot
after the initrd is loaded.  The systems boots to the 2.6.9-22.0.1
kernel and works fine.  I have ran fsck against all filesystems however
the error messages still appears.  I noticed that when I run
system-config-lvm these errors are more predominant. =20
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
		I recently installed the new kernel 2.6.9-22.0.2 but the
system does not find kernel at boot.  I think the file descriptor
messages are a symptom to some greater problem.  Please help.=20
		thank you!=20
		Nayan=20

		_______________________________________________=20
		linux-lvm mailing list=20
		linux-lvm@redhat.com=20
		https://www.redhat.com/mailman/listinfo/linux-lvm=20
		read the LVM HOW-TO at
http://tldp.org/HOWTO/LVM-HOWTO/________________________________________
_______=20

	linux-lvm mailing list=20
	linux-lvm@redhat.com=20
	https://www.redhat.com/mailman/listinfo/linux-lvm=20
	read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/


------_=_NextPart_001_01C621B9.387F04C7
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2180" name=3DGENERATOR></HEAD>
<BODY>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>Uncompressing Linux booting the =
kernel</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>Redhat Nash 4.1.18 starting</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>File descriptor 3 left open</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>Reading physical volumes This may take=20
awhile</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>/dev/hda open failed: No media=20
found&nbsp;&nbsp;&nbsp;&nbsp; --------------------------------- this is =
the=20
CDROM</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>No Volume groups found</FONT></SPAN></DIV><SPAN =

class=3D094405013-25012006><FONT face=3DArial color=3D#0000ff=20
size=3D2></FONT></SPAN><FONT face=3DArial color=3D#0000ff =
size=3D2></FONT><FONT=20
face=3DArial color=3D#0000ff size=3D2></FONT><FONT face=3DArial =
color=3D#0000ff=20
size=3D2></FONT><FONT face=3DArial color=3D#0000ff size=3D2></FONT>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>File descriptor 3 left open</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>Reading physical volumes This may take=20
awhile</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>/dev/hda open failed: No media =
found</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>No Volume groups found</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>File descriptor 3 left open</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>Reading physical volumes This may take=20
awhile</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>/dev/hda open failed: No media =
found</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>No Volume groups found</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN =
class=3D094405013-25012006></SPAN><FONT=20
face=3DArial><FONT color=3D#0000ff><FONT size=3D2>m<SPAN =
class=3D094405013-25012006>ount=20
error 6 mounting ext3 :&nbsp; 22</SPAN></FONT></FONT></FONT></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN =
class=3D094405013-25012006></SPAN><FONT=20
face=3DArial><FONT color=3D#0000ff><FONT size=3D2>u<SPAN=20
class=3D094405013-25012006>mount /initrd/dev&nbsp; failed :2=20
</SPAN></FONT></FONT></FONT></DIV>
<DIV dir=3Dltr align=3Dleft><FONT><FONT color=3D#0000ff><FONT =
size=3D2><SPAN=20
class=3D094405013-25012006></SPAN></FONT></FONT></FONT><SPAN=20
class=3D094405013-25012006></SPAN><FONT face=3DArial><FONT =
color=3D#0000ff><FONT=20
size=3D2>k<SPAN class=3D094405013-25012006>ernel panic not syncing =
attempted to kill=20
init.</SPAN></FONT></FONT></FONT></DIV><FONT face=3DArial><FONT=20
color=3D#0000ff><FONT size=3D2><SPAN=20
class=3D094405013-25012006></SPAN></FONT></FONT></FONT><FONT =
face=3DArial=20
color=3D#0000ff size=3D2></FONT><FONT face=3DArial color=3D#0000ff =
size=3D2></FONT><FONT=20
face=3DArial color=3D#0000ff size=3D2></FONT><FONT face=3DArial =
color=3D#0000ff=20
size=3D2></FONT><FONT face=3DArial color=3D#0000ff size=3D2></FONT><FONT =
face=3DArial=20
color=3D#0000ff size=3D2></FONT><FONT face=3DArial color=3D#0000ff =
size=3D2></FONT><FONT=20
face=3DArial color=3D#0000ff size=3D2></FONT><FONT face=3DArial =
color=3D#0000ff=20
size=3D2></FONT>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff =
size=3D2></FONT><FONT=20
face=3DArial color=3D#0000ff size=3D2></FONT><FONT face=3DArial =
color=3D#0000ff=20
size=3D2></FONT><FONT face=3DArial color=3D#0000ff =
size=3D2></FONT><BR><SPAN=20
class=3D094405013-25012006><FONT face=3DArial color=3D#0000ff =
size=3D2>Thank you, you=20
lead me to the reason why it was failing.&nbsp; I had to run mkinitrd=20
--with=3Dcciss to load the scsi adapter.</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>The file descriptor left open messages are just =
indications=20
of files being left in open state?</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>Thanks again!</FONT></SPAN></DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2></FONT></SPAN>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><SPAN class=3D094405013-25012006><FONT =
face=3DArial=20
color=3D#0000ff size=3D2>Nayan</FONT></SPAN></DIV>
<DIV><FONT face=3DArial color=3D#0000ff size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
size=3D2></FONT>&nbsp;</DIV>
<DIV dir=3Dltr align=3Dleft><FONT face=3DArial color=3D#0000ff=20
size=3D2></FONT>&nbsp;</DIV>
<DIV class=3DOutlookMessageHeader lang=3Den-us dir=3Dltr align=3Dleft>
<HR tabIndex=3D-1>
<FONT face=3DTahoma size=3D2><B>From:</B> linux-lvm-bounces@redhat.com=20
[mailto:linux-lvm-bounces@redhat.com] <B>On Behalf Of </B>Jonathan E=20
Brassow<BR><B>Sent:</B> Tuesday, January 24, 2006 6:22 PM<BR><B>To:</B> =
LVM=20
general discussion and development<BR><B>Subject:</B> Re: [linux-lvm] =
file=20
descriptor 3 left open<BR></FONT><BR></DIV>
<DIV></DIV><!-- Converted from text/enriched format -->
<DIV>What do you mean by "not working", the rpm command seems to think =
the files=20
are installed... Take a look in /boot/grub/menu.lst and see if the =
kernel is in=20
there and it is the default to boot (default =3D 0 for the first kernel =
listed)=20
</DIV><BR>
<DIV>brassow </DIV><BR>
<DIV>On Jan 24, 2006, at 5:07 PM, Kapadia, Nayan U. wrote: </DIV><BR>
<BLOCKQUOTE>
  <DIV><FONT face=3DArial><FONT color=3D#0000ff><SMALL>Thanks, but that =
looks okay=20
  to me.</SMALL></FONT></FONT> </DIV>
  <DIV> </DIV>
  <DIV><FONT face=3DArial><FONT color=3D#0000ff><SMALL>Not=20
  working:</SMALL></FONT></FONT> </DIV>
  <DIV> </DIV>
  <DIV><FONT face=3DArial><FONT color=3D#0000ff><SMALL>rpm -ql=20
  kernel-smp-2.6.9-22.0.2.EL |grep boot</SMALL></FONT></FONT> </DIV>
  <DIV><FONT face=3DArial><FONT=20
  =
color=3D#0000ff><SMALL>/boot/System.map-2.6.9-22.0.2.ELsmp</SMALL></FONT>=
</FONT>=20
  </DIV>
  <DIV><FONT face=3DArial><FONT=20
  =
color=3D#0000ff><SMALL>/boot/config-2.6.9-22.0.2.ELsmp</SMALL></FONT></FO=
NT>=20
  </DIV>
  <DIV><FONT face=3DArial><FONT=20
  =
color=3D#0000ff><SMALL>/boot/vmlinuz-2.6.9-22.0.2.ELsmp</SMALL></FONT></F=
ONT>=20
  </DIV>
  <DIV><FONT face=3DArial><FONT=20
  =
color=3D#0000ff><SMALL>/lib/modules/2.6.9-22.0.2.ELsmp/kernel/drivers/mtd=
/redboot.ko</SMALL></FONT></FONT>=20
  </DIV>
  <DIV> </DIV>
  <DIV> </DIV>
  <DIV><FONT face=3DArial><FONT=20
  color=3D#0000ff><SMALL>Working:</SMALL></FONT></FONT> </DIV>
  <DIV> </DIV>
  <DIV><FONT face=3DArial><FONT color=3D#0000ff><SMALL>rpm -ql=20
  kernel-smp-2.6.9-22.0.1.EL |grep boot</SMALL></FONT></FONT> </DIV>
  <DIV> </DIV>
  <DIV><FONT face=3DArial></FONT> </DIV><BR>
  <DIV><FONT face=3DArial><FONT=20
  =
color=3D#0000ff><SMALL>/boot/System.map-2.6.9-22.0.1.ELsmp</SMALL></FONT>=
</FONT>=20
  </DIV>
  <DIV><FONT face=3DArial><FONT=20
  =
color=3D#0000ff><SMALL>/boot/config-2.6.9-22.0.1.ELsmp</SMALL></FONT></FO=
NT>=20
  </DIV>
  <DIV><FONT face=3DArial><FONT=20
  =
color=3D#0000ff><SMALL>/boot/vmlinuz-2.6.9-22.0.1.ELsmp</SMALL></FONT></F=
ONT>=20
  </DIV>
  <DIV><FONT face=3DArial><FONT=20
  =
color=3D#0000ff><SMALL>/lib/modules/2.6.9-22.0.1.ELsmp/kernel/drivers/mtd=
/redboot.ko</SMALL></FONT></FONT>=20
  </DIV><BR><BR>
  <DIV> </DIV>
  <DIV><FONT face=3DArial><FONT color=3D#0000ff><SMALL>Any=20
  ideas?</SMALL></FONT></FONT> </DIV>
  <DIV> </DIV>
  <DIV> </DIV><BR>
  <DIV><B><SMALL>From:</SMALL></B><SMALL> linux-lvm-bounces@redhat.com=20
  [mailto:linux-lvm-bounces@redhat.com] <B>On Behalf Of </B>Jonathan E=20
  Brassow</SMALL> </DIV>
  <DIV><B><SMALL>Sent:</SMALL></B><SMALL> Tuesday, January 24, 2006 5:49 =

  PM</SMALL> </DIV>
  <DIV><B><SMALL>To:</SMALL></B><SMALL> LVM general discussion and=20
  development</SMALL> </DIV>
  <DIV><B><SMALL>Subject:</SMALL></B><SMALL> Re: [linux-lvm] file =
descriptor 3=20
  left open</SMALL> </DIV><BR>
  <DIV>IIRC, these are merely informative messages saying that, "Hey, =
the person=20
  who called me forgot to close some of their file descriptors, like =
they were=20
  suppose to. But don't worry, I'll close them for you." </DIV><BR>
  <DIV>That would have been too long though, so I think they chose a =
more=20
  cryptic message. </DIV><BR>
  <DIV>As far as your kernel installation problem, I'm not sure what's =
wrong=20
  there... </DIV><BR>
  <DIV>You could 'rpm -q kernel' (or rpm -qa | grep kernel) to see if it =
is=20
  installed. If it is, you could 'rpm -ql kernel-&lt;the version&gt; | =
grep=20
  boot' to see if the image was correctly installed... </DIV><BR>
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
    <DIV><FONT face=3DArial><SMALL>File descriptor 13 left =
open</SMALL></FONT>=20
    </DIV>
    <DIV><FONT face=3DArial><SMALL>File descriptor 3 left =
open</SMALL></FONT>=20
    </DIV>
    <DIV><FONT face=3DArial><SMALL>File descriptor 4 left =
open</SMALL></FONT>=20
    </DIV>
    <DIV><FONT face=3DArial><SMALL>File descriptor 8 left =
open</SMALL></FONT>=20
    </DIV>
    <DIV><FONT face=3DArial><SMALL>File descriptor 9 left =
open</SMALL></FONT>=20
    </DIV>
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
open</SMALL></FONT>=20
    </DIV>
    <DIV><FONT face=3DArial><SMALL>File descriptor 4 left =
open</SMALL></FONT>=20
    </DIV>
    <DIV><FONT face=3DArial><SMALL>File descriptor 8 left =
open</SMALL></FONT>=20
    </DIV>
    <DIV><FONT face=3DArial><SMALL>File descriptor 9 left =
open</SMALL></FONT>=20
    </DIV>
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
    <DIV><FONT face=3DArial><SMALL>I recently installed the new kernel=20
    2.6.9-22.0.2 but the system does not find kernel at boot.&nbsp; I =
think the=20
    file descriptor messages are a symptom to some greater =
problem.&nbsp; Please=20
    help.</SMALL></FONT> </DIV>
    <DIV><FONT face=3DArial><SMALL>thank you!</SMALL></FONT> </DIV>
    <DIV><FONT face=3DArial><SMALL>Nayan</SMALL></FONT> </DIV><BR>
    <DIV>_______________________________________________ </DIV>
    <DIV>linux-lvm mailing list </DIV>
    <DIV>linux-lvm@redhat.com </DIV>
    <DIV>https://www.redhat.com/mailman/listinfo/linux-lvm </DIV>
    <DIV>read the LVM HOW-TO at=20
    =
http://tldp.org/HOWTO/LVM-HOWTO/_________________________________________=
______=20
    </DIV></BLOCKQUOTE>
  <DIV>linux-lvm mailing list </DIV>
  <DIV>linux-lvm@redhat.com </DIV>
  <DIV>https://www.redhat.com/mailman/listinfo/linux-lvm </DIV>
  <DIV>read the LVM HOW-TO at=20
http://tldp.org/HOWTO/LVM-HOWTO/</DIV></BLOCKQUOTE></BODY></HTML>

------_=_NextPart_001_01C621B9.387F04C7--
