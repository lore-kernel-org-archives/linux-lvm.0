Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i214PJ808851
	for <linux-lvm@redhat.com>; Sun, 29 Feb 2004 23:25:19 -0500
Received: from MTVMIME03.enterprise.veritas.com (bay-bridge.veritas.com [143.127.3.10])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i214PIb26090
	for <linux-lvm@redhat.com>; Sun, 29 Feb 2004 23:25:18 -0500
Received: from vxindia.veritas.com (unverified) by MTVMIME03.enterprise.veritas.com
 (Content Technologies SMTPRS 4.3.12) with ESMTP id <T680f5c66f30a891155860@MTVMIME03.enterprise.veritas.com> for <linux-lvm@redhat.com>;
 Sun, 29 Feb 2004 20:25:12 -0800
Received: from sachin (rekha.vxindia.veritas.com [10.212.92.46] (may be forged))
	by vxindia.veritas.com (8.11.6+Sun/8.9.3) with SMTP id i214KBW10342
	for <linux-lvm@redhat.com>; Mon, 1 Mar 2004 09:50:12 +0530 (IST)
Message-ID: <005901c3ffb7$2ad55d30$2e5cd40a@sachin>
From: "sachin" <sdurge@vxindia.veritas.com>
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0056_01C3FF74.1BC54C30"
Subject: [linux-lvm] Snapshot validity
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Mon Mar  1 14:15:18 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_0056_01C3FF74.1BC54C30
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable






> Hi All
>=20
> I have a question.

LVM1 or LVM2 ?

- Joe

Hi All=20

I am using lvm1

-SachiN_

_=3D=3D__=3D=3D__=3D=3D__=3D=3D__=3D=3D__=3D=3D__=3D=3D_

Original messagel was=20


Hi All

I have a question.
What happen if i have change the configuration of the snapshot origin =
volume
i.e i may change the size of the volume .Is the snapshot is valid or its =
of
no use

What i think is data is of no use ,because internally the driver may
checking the
extent mapping of the origin of the  snapshot and then it scanning the
ioexception table
i.e COW table .If my assumption is not correct ,If any one knows the =
actual
working
Please tell  me .

Thanks
SachiN_




------=_NextPart_000_0056_01C3FF74.1BC54C30
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META content=3D"text/html; charset=3Diso-8859-1" =
http-equiv=3DContent-Type>
<META content=3D"MSHTML 5.00.3315.2870" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&gt; Hi All<BR>&gt; <BR>&gt; I have a=20
question.<BR><BR>LVM1 or LVM2 ?<BR><BR>- Joe</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Hi All <BR><BR>I am using =
lvm1</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>-SachiN_<BR></DIV></FONT>
<DIV><FONT face=3DArial =
size=3D2>_=3D=3D__=3D=3D__=3D=3D__=3D=3D__=3D=3D__=3D=3D__=3D=3D_</FONT><=
/DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Original messagel was </FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Hi All<BR><BR>I have a =
question.<BR>What happen if=20
i have change the configuration of the snapshot origin volume<BR>i.e i =
may=20
change the size of the volume .Is the snapshot is valid or its of<BR>no=20
use<BR><BR>What i think is data is of no use ,because internally the =
driver=20
may<BR>checking the<BR>extent mapping of the origin of the&nbsp; =
snapshot and=20
then it scanning the<BR>ioexception table<BR>i.e COW table .If my =
assumption is=20
not correct ,If any one knows the actual<BR>working<BR>Please tell&nbsp; =
me=20
.<BR><BR>Thanks<BR>SachiN_<BR><BR><BR></DIV></FONT></BODY></HTML>

------=_NextPart_000_0056_01C3FF74.1BC54C30--
