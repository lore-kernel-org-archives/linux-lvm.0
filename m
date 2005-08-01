Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j71DOKV03567
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 09:24:20 -0400
Received: from msr2.hinet.net (msr2.hinet.net [168.95.4.102])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j71DOHrs032758
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 09:24:18 -0400
Received: from Notebook (61-219-65-1.HINET-IP.hinet.net [61.219.65.1])
	by msr2.hinet.net (8.9.3/8.9.3) with ESMTP id VAA15670
	for <linux-lvm@redhat.com>; Mon, 1 Aug 2005 21:24:08 +0800 (CST)
Message-ID: <012601c5969c$8f7cc2f0$fa01a8c0@Notebook>
From: =?big5?B?sWmnyqZ7?= <ctc1230@ms67.hinet.net>
Subject: Re: [linux-lvm] How to recover data corrupted by vgcreate
Date: Mon, 1 Aug 2005 21:25:44 +0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0119_01C596DF.93A69B10"
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

------=_NextPart_000_0119_01C596DF.93A69B10
Content-Type: text/plain;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

Hi,

There is no backup information available in /etc/lvm/archive to restore =
VG to original configuration.
Unfortunately the root directory is also in LVM partition.
So, "vgcfgrestore" did not solve the problem.
I also tried to create new LV by "lvcreate" to match with the existing =
LV.
The problem is I have no idea about the size of old LV.
I just gave a random size in "lvcreate" command.
But, I could not mount the file system because of bad superblock.
I don't know what I missed. Maybe the size is critical to do the =
matching.
Is there any reverse procedure I can do to recover VG by the existing LV =
information?
It may just like to recover partition table by scanning cylinder data in =
hard disk.
Any idea? Thanks a lot.

Davis


  > >On Wed, Jul 27, 2005 at 11:33:05AM -0500, Jonathan E Brassow wrote:
  > >>I'm not familiar exactly with how the metadata gets laid on disk, =
but
  > >>I would think you could just 'vgcreate vg_name /dev/hdd2' (you did =

  > >>this
  > >>already) then 'lvcreate -n <lvname> -l <max size> vg_name'...  =
This of
  > >>course assumes that the previous lv resided wholly on /dev/hdd2.  =
Then
  > >>try mounting the new lv and see what happens.
  > >
  > >Before you do that, try vgcfgrestore.
  > >
  >=20
  > AJ, when he did the initial 'vgcreate' was part of the process to=20
  > create a backup copy of the metadata?  If so, vgcfgrestore could =
work. =20
  > But otherwise, I'm not sure were the old metadata would be stored,=20
  > since this disk is from a different machine...  Seems odd to me that =

  > vgcreate would blow over the old vg if it knew about it.  If it did =
not=20
  > know (or detect the old vg), how would it know to backup the =
metadata?

  Not sure, but if the reason the disk was moved was because a cpu went =
out, i'm
  assuming the old root fs is also on that disk - hoping so anyway ;)  =
If so,
  the old root fs can be mounted and /etc/lvm/archive can be checked for =
a valid
  copy of the metadata.  (Assuming root wasn't on lvm...)

  As to why vgcreate didn't recognize the old VG...that's very odd - not =
sure
  what went wrong there...


------=_NextPart_000_0119_01C596DF.93A69B10
Content-Type: text/html;
	charset="big5"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dbig5">
<META content=3D"MSHTML 6.00.2800.1498" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT size=3D2>Hi,</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>There is no backup information available in=20
/etc/lvm/archive<FONT size=3D3> </FONT>to restore VG to original=20
configuration.</FONT></DIV>
<DIV><FONT size=3D2>Unfortunately the root directory is also in LVM=20
partition.</FONT></DIV>
<DIV><FONT size=3D2>So, "vgcfgrestore" did not solve the =
problem.</FONT></DIV>
<DIV><FONT size=3D2>I also tried to create new LV by "lvcreate" to match =
with=20
the&nbsp;existing LV.</FONT></DIV>
<DIV><FONT size=3D2>The problem is I have no idea about the size of old=20
LV.</FONT></DIV>
<DIV><FONT size=3D2>I just gave a random size in "lvcreate" =
command.</FONT></DIV>
<DIV><FONT size=3D2>But, I could not mount the file system because of =
bad=20
superblock.</FONT></DIV>
<DIV><FONT size=3D2>I don't know what I missed. Maybe the size is =
critical to do=20
the matching.</FONT></DIV>
<DIV><FONT size=3D2>Is there any reverse procedure I can do to recover =
VG by the=20
existing LV information?</FONT></DIV>
<DIV><FONT size=3D2>It may just like to recover partition table by =
scanning=20
cylinder data in hard disk.</FONT></DIV>
<DIV><FONT size=3D2>Any idea? Thanks a lot.</FONT></DIV>
<DIV><FONT size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT size=3D2>Davis</FONT></DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV><FONT size=3D2></FONT><FONT size=3D2></FONT><FONT =
size=3D2></FONT><BR></DIV>
  <DIV>&gt; &gt;On Wed, Jul 27, 2005 at 11:33:05AM -0500, Jonathan E =
Brassow=20
  wrote:<BR>&gt; &gt;&gt;I'm not familiar exactly with how the metadata =
gets=20
  laid on disk, but<BR>&gt; &gt;&gt;I would think you could just =
'vgcreate=20
  vg_name /dev/hdd2' (you did <BR>&gt; &gt;&gt;this<BR>&gt; =
&gt;&gt;already)=20
  then 'lvcreate -n &lt;lvname&gt; -l &lt;max size&gt; vg_name'...&nbsp; =
This=20
  of<BR>&gt; &gt;&gt;course assumes that the previous lv resided wholly =
on=20
  /dev/hdd2.&nbsp; Then<BR>&gt; &gt;&gt;try mounting the new lv and see =
what=20
  happens.<BR>&gt; &gt;<BR>&gt; &gt;Before you do that, try=20
  vgcfgrestore.<BR>&gt; &gt;<BR>&gt; <BR>&gt; AJ, when he did the =
initial=20
  'vgcreate' was part of the process to <BR>&gt; create a backup copy of =
the=20
  metadata?&nbsp; If so, vgcfgrestore could work.&nbsp; <BR>&gt; But =
otherwise,=20
  I'm not sure were the old metadata would be stored, <BR>&gt; since =
this disk=20
  is from a different machine...&nbsp; Seems odd to me that <BR>&gt; =
vgcreate=20
  would blow over the old vg if it knew about it.&nbsp; If it did not =
<BR>&gt;=20
  know (or detect the old vg), how would it know to backup the=20
  metadata?<BR><BR>Not sure, but if the reason the disk was moved was =
because a=20
  cpu went out, i'm<BR>assuming the old root fs is also on that disk - =
hoping so=20
  anyway ;)&nbsp; If so,<BR>the old root fs can be mounted and =
/etc/lvm/archive=20
  can be checked for a valid<BR>copy of the metadata.&nbsp; (Assuming =
root=20
  wasn't on lvm...)<BR><BR>As to why vgcreate didn't recognize the old=20
  VG...that's very odd - not sure<BR>what went wrong=20
there...<BR><BR></DIV></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0119_01C596DF.93A69B10--
