Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA6MGlr18190
	for <linux-lvm@redhat.com>; Sat, 6 Nov 2004 17:16:47 -0500
Received: from snark.apl.washington.edu (postfix@snark.apl.washington.edu
	[128.208.78.3])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA6MGjCw024038
	for <linux-lvm@redhat.com>; Sat, 6 Nov 2004 17:16:46 -0500
Received: from Gustav (vpn.apl.washington.edu [10.208.78.220])
	by snark.apl.washington.edu (Postfix) with ESMTP id 0AFFA97930
	for <linux-lvm@redhat.com>; Sat,  6 Nov 2004 14:16:45 -0800 (PST)
From: "Axel Schweiger" <axel@apl.washington.edu>
Date: Sat, 6 Nov 2004 14:16:46 -0800
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001F_01C4C40B.3F887B90"
Message-Id: <20041106221645.0AFFA97930@snark.apl.washington.edu>
Subject: [linux-lvm] Backup/Recovery Strategies
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_001F_01C4C40B.3F887B90
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit

Can anyon  suggest backup/recovery strategies for filesystems under LVM.
(Version 1 and 2)
 
1) If I loose the data in the /etc/lvm directory (or lvm.d) do I loose the
filesystems controlled by lvm?
2) How do I recover from a loss or corrpution of the LVM data.
3) What happens if the LVM filesystems have changed since the last backup of
the metadata?
 
Sorry if this shows a profound lack of understanding of LVM but I''m new to
this and haven't been able to find any recipes for doing 
backups?

Thanks much
Axel

------=_NextPart_000_001F_01C4C40B.3F887B90
Content-Type: text/html;
	charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dus-ascii">
<META content=3D"MSHTML 6.00.2900.2523" name=3DGENERATOR></HEAD>
<BODY>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D406240922-06112004>Can anyon=
=20
&nbsp;suggest backup/recovery strategies for filesystems under LVM. (Versio=
n 1=20
and 2)</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D406240922-06112004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D406240922-06112004>1) If I l=
oose the=20
data in the /etc/lvm directory (or lvm.d) do I loose the filesystems contro=
lled=20
by lvm?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D406240922-06112004>2) How do=
 I recover=20
from a loss or corrpution of the LVM data.</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D406240922-06112004>3) What h=
appens if=20
the LVM filesystems have changed since the last backup of the=20
metadata?</SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D406240922-06112004></SPAN></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><SPAN class=3D406240922-06112004>Sorry if =
this shows=20
a profound lack of understanding of LVM but I''m new to this and haven't be=
en=20
able to find any recipes for doing </SPAN></FONT></DIV>
<DIV><FONT face=3DArial size=3D2><SPAN=20
class=3D406240922-06112004>backups?</SPAN></FONT></DIV><FONT><SPAN=20
class=3D406240922-06112004>
<DIV><BR><FONT face=3DArial><FONT size=3D2>Thanks<SPAN class=3D406240922-06=
112004>=20
much</SPAN></FONT></FONT></DIV>
<DIV><SPAN class=3D406240922-06112004><FONT face=3DArial=20
size=3D2>Axel</FONT></SPAN></SPAN></FONT></DIV></BODY></HTML>

------=_NextPart_000_001F_01C4C40B.3F887B90--
