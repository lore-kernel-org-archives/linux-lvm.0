Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o7HKGSth023204
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2010 16:16:28 -0400
Received: from umavas3.olemiss.edu (umavas3.olemiss.edu [130.74.120.103])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o7HKGJRI030455
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2010 16:16:19 -0400
Received: from umavas3.olemiss.edu (localhost [127.0.0.1])
	by localhost (Postfix) with SMTP id 6E69232275B
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2010 15:14:28 -0500 (CDT)
Received: from olemiss.edu (unknown [172.16.1.23])
	by umavas3.olemiss.edu (Postfix) with ESMTP id 36C7A322092
	for <linux-lvm@redhat.com>; Tue, 17 Aug 2010 15:14:28 -0500 (CDT)
From: Daksh Chauhan <daksh@olemiss.edu>
Date: Tue, 17 Aug 2010 15:16:17 -0500
Message-id: <4c6aee11.60d9.abeffb90.3576b179@olemiss.edu>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_SW_804715472_1282076177_mpa="
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] linux-lvm Digest, Vol 78, Issue 4
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com, Jack.Allen@mckesson.com

This is a multi-part message in MIME format.

------=_SW_804715472_1282076177_mpa=
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable



----



Message: 6
Date: Tue, 17 Aug 2010 15:26:09 -0400
From: "Allen, Jack" <Jack.Allen@mckesson.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Subject: [linux-lvm] pvmove hangs
Message-ID:
<230ED15F81AFD3409345FFA4E565F0E50CE525BF@NDHV3000.na.corp.mckesson.com>

Content-Type: text/plain; charset=3d"us-ascii"

Hello:

 .......................

         A little history and why I am asking the question in this=20
list.
The customer needed to move from an existing SAN to a new SAN and=20
wanted
as little as possible down time for the Application. So they zoned the
new SAN for access by the system and then added the new LUNs to the
existing Volume Group. Then ran the pvmove commands. It worked with no
problem on one of the PVs, but on the second one all the I/O hung at=20
the
Application and any commands that access the LVM information such as
vgdisplay.

Why not use LVM mirroring? Checkout lvconvert...


 .......................

_____

Jack Allen



------=_SW_804715472_1282076177_mpa=
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<style>
 .sw_message P{margin:0px;padding:0px;}
 .sw_message {FONT-SIZE: 12pt;FONT-FAMILY:Tahoma,Arial,Helvetica,sans-serif;background:white;}
</style>
</head>
<body class=3d"sw_message">
<BR><DIV id=3d"editor_signature"><P><FONT size=3d"2" face=3d"arial,san-serif=
">----</FONT></P><FONT size=3d"2" face=3d"arial,san-serif"><SPAN></SPAN></FO=
NT></DIV> <DIV> <P><BR><BR>Message: 6<BR>Date: Tue, 17 Aug 2010 15:26:09 -04=
00<BR>From: "Allen, Jack" &lt;Jack.Allen@mckesson.com&gt;<BR>To: LVM general=
 discussion and development &lt;linux-lvm@redhat.com&gt;<BR>Subject: [linux-=
lvm] pvmove hangs<BR>Message-ID:<BR>&lt;230ED15F81AFD3409345FFA4E565F0E50CE5=
25BF@NDHV3000.na.corp.mckesson.com&gt;<BR><BR>Content-Type: text/plain; char=
set=3d"us-ascii"<BR><BR>Hello:<BR><BR>&nbsp;.......................<SPAN></S=
PAN></P> <P><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; A little hi=
story and why I am asking the question in this list.<BR>The customer needed =
to move from an existing SAN to a new SAN and wanted<BR>as little as possibl=
e down time for the Application. So they zoned the<BR>new SAN for access by =
the system and then added the new LUNs to the<BR>existing Volume Group. Then=
 ran the pvmove commands. It worked with no<BR>problem on one of the PVs, bu=
t on the second one all the I/O hung at the<BR>Application and any commands =
that access the LVM information such as<BR>vgdisplay.<BR><SPAN></SPAN></P> <=
P><FONT color=3d"blue">Why not use LVM mirroring? Checkout lvconvert...&nbsp=
;</FONT></P> <P><FONT color=3d"blue"><SPAN></SPAN>&nbsp;</FONT><BR><BR>&nbsp=
;.......................<SPAN></SPAN></P> <P><SPAN></SPAN>&nbsp;</P> <P>____=
_<BR><BR>Jack Allen<BR></P><SPAN></SPAN></DIV> <DIV><SPAN></SPAN>&nbsp;</DIV=
> 
</body></html>

------=_SW_804715472_1282076177_mpa=--
