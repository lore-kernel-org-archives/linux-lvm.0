Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA9LkvV13025
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 16:46:57 -0500
Received: from sj-iport-2.cisco.com (sj-iport-2-in.cisco.com [171.71.176.71])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jA9LktGB029033
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 16:46:55 -0500
Received: from xbh-sjc-221.amer.cisco.com (xbh-sjc-221.cisco.com
	[128.107.191.63])
	by sj-core-1.cisco.com (8.12.10/8.12.6) with ESMTP id jA9LkS4Q013431
	for <linux-lvm@redhat.com>; Wed, 9 Nov 2005 13:46:48 -0800 (PST)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C5E577.144FEA80"
Date: Wed, 9 Nov 2005 13:46:44 -0800
Message-ID: <C6A1C20DB743364EB446E923B2229FEFE00C2F@xmb-sjc-229.amer.cisco.com>
From: "Tom Wang \(chuntwan\)" <chuntwan@cisco.com>
Subject: [linux-lvm] PV  Initialization 
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

------_=_NextPart_001_01C5E577.144FEA80
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,

I like to create the physical volume on my Fibre channel drive. I use
fdisk /dev/sda to create one primary partition which is the whole size
of disk and run "pvcreate /dev/sda" then I got the following error
message  "/dev/sda: close failed: bad file descriptor". Anybody knows
what this means and how to solve this problem?

If I create two partitions /dev/sda1 and /dev/sda2 then I was able to
run "pvcreate /dev/sda1" & "pvcreate /dev/sda2" ok.

Thanks!

Tom Wang

=20

=20

=20


------_=_NextPart_001_01C5E577.144FEA80
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2800.1522" name=3DGENERATOR></HEAD>
<BODY>
<DIV>
<P align=3Dleft><SPAN class=3D783101919-09112005><FONT face=3DArial =
size=3D2><SPAN=20
class=3D734223721-09112005>Hi,</SPAN></FONT></SPAN></P>
<P align=3Dleft><FONT face=3DArial><SPAN =
class=3D783101919-09112005><FONT><SPAN=20
class=3D734223721-09112005><FONT size=3D2>I like to create the physical =
volume on my=20
Fibre channel drive. </FONT><FONT face=3DArial size=3D2><SPAN=20
class=3D783101919-09112005><SPAN class=3D734223721-09112005>I use fdisk =
/dev/sda to=20
create one primary partition which is the whole size of disk=20
and&nbsp;</SPAN></SPAN></FONT><FONT size=3D2>run "pvcreate /dev/sda" =
then I got=20
the following error message&nbsp; "</FONT></SPAN></FONT></SPAN><SPAN=20
class=3D783101919-09112005><FONT><FONT size=3D2>/dev/sda: close failed: =
bad file=20
descriptor<SPAN class=3D734223721-09112005>". Anybody knows what this =
means and=20
how to solve this problem?</SPAN></FONT></FONT></SPAN></FONT></P>
<P align=3Dleft><FONT face=3DArial><SPAN =
class=3D783101919-09112005><FONT><FONT=20
size=3D2><SPAN =
class=3D734223721-09112005></SPAN></FONT></FONT></SPAN></FONT><FONT=20
face=3DArial><SPAN class=3D783101919-09112005><FONT><FONT size=3D2><SPAN =

class=3D734223721-09112005>If I create two partitions /dev/sda1 and =
/dev/sda2 then=20
I was able to run "pvcreate /dev/sda1"&nbsp;&amp; "pvcreate /dev/sda2"=20
ok.</SPAN></FONT></FONT></SPAN></FONT></P>
<P align=3Dleft><FONT face=3DArial><SPAN =
class=3D783101919-09112005><FONT><FONT=20
size=3D2><SPAN=20
class=3D734223721-09112005>Thanks!</SPAN></FONT></FONT></SPAN></FONT></P>=

<P align=3Dleft><FONT face=3DArial><SPAN =
class=3D783101919-09112005><FONT><FONT=20
size=3D2><SPAN class=3D734223721-09112005>Tom=20
Wang</SPAN></FONT></FONT></SPAN></FONT></P>
<P align=3Dleft><FONT face=3DArial><SPAN =
class=3D783101919-09112005><FONT><FONT=20
size=3D2><SPAN=20
class=3D734223721-09112005></SPAN></FONT></FONT></SPAN></FONT>&nbsp;</P>
<P align=3Dleft><FONT face=3DArial><FONT size=3D2><SPAN=20
class=3D783101919-09112005><FONT><SPAN=20
class=3D734223721-09112005></SPAN></FONT></SPAN></FONT></FONT>&nbsp;</P>
<P align=3Dleft><FONT face=3DArial><FONT size=3D2><SPAN=20
class=3D783101919-09112005><FONT><SPAN=20
class=3D734223721-09112005></SPAN></FONT></SPAN></FONT></FONT>&nbsp;</P><=
/DIV></BODY></HTML>

------_=_NextPart_001_01C5E577.144FEA80--
