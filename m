Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j0JAuYO00697
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 05:56:34 -0500
Received: from spsoftindia.com (134-215-187-203.cable-client.iqara.net
	[203.187.215.134] (may be forged))
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j0JAuVUN011884
	for <linux-lvm@redhat.com>; Wed, 19 Jan 2005 05:56:33 -0500
Received: from 192.168.16.224 for linux-lvm@redhat.com;
	Wed, 19 Jan 2005 16:26:18 +0530
Message-ID: <007101c4fe15$2a6d9710$e010a8c0@spsoft.com>
From: "Mekhala" <shirke.mekhala@spsoftindia.com>
Date: Wed, 19 Jan 2005 16:23:52 +0530
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_006E_01C4FE43.43DBD1C0"
Subject: [linux-lvm] Problem in understanding Lvm code 
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

------=_NextPart_000_006E_01C4FE43.43DBD1C0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi,

For understanding the LVM and Snapshot module, I am going through the
source code for solving some of my queries like
 -How does it allocate space for creating snapshot?
 -Does it create snapshot on the same volume?
 -How does it copy the buffer to snapshot?
=20
 To move in further details I have compiled the LVM source code for =
debugging.
But after giving some of the printk statements in the code for =
understanding the flow the print statement of lvm.c get printed but the
print statement in lvm-snap.c is not getting printed.
=20
 Can any one give some pointer to solve this or any other better =
approach to
 solve my above queries?
=20
> Thanks in advance
Mekhala

------=_NextPart_000_006E_01C4FE43.43DBD1C0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2462.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2><FONT face=3D"Times New Roman" =
size=3D3>For=20
understanding the LVM and Snapshot module, I am going through =
the<BR>source code=20
for solving some of my queries like<BR>&nbsp;-How does it allocate space =
for=20
creating snapshot?<BR>&nbsp;-Does it create snapshot on the same=20
volume?<BR>&nbsp;-How does it copy the buffer to snapshot?<BR>&nbsp;<BR> =
To move=20
in further details I have compiled the LVM source code for=20
debugging.<BR>But&nbsp;after giving some of the printk statements in the =
code=20
for understanding the flow the print statement of lvm.c get printed but=20
the<BR>print statement in lvm-snap.c is not getting =
printed.<BR>&nbsp;<BR> Can=20
any one give some pointer to solve this or any other better approach=20
to<BR>&nbsp;solve my above queries?<BR>&nbsp;<BR>&gt; Thanks in=20
advance</FONT><BR>Mekhala</DIV></FONT></BODY></HTML>

------=_NextPart_000_006E_01C4FE43.43DBD1C0--
