Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p6UM6rcp007463
	for <linux-lvm@redhat.com>; Sat, 30 Jul 2011 18:06:53 -0400
Received: from mail-pz0-f42.google.com (mail-pz0-f42.google.com
	[209.85.210.42])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6UM6pEs022290
	for <linux-lvm@redhat.com>; Sat, 30 Jul 2011 18:06:51 -0400
Received: by pzk37 with SMTP id 37so8935438pzk.29
	for <linux-lvm@redhat.com>; Sat, 30 Jul 2011 15:06:51 -0700 (PDT)
Message-ID: <4DEB0D46292F45E8A1FE55F7BB47ED64@Chimpanzeke>
From: "David Ziring" <zeke@thebayou.net>
Date: Sat, 30 Jul 2011 15:06:03 -0700
MIME-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000B_01CC4ECA.333FEED0"
Subject: Re: [linux-lvm] Please help me recover my LVM configuration
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
To: linux-lvm@redhat.com

This is a multi-part message in MIME format.

------=_NextPart_000_000B_01CC4ECA.333FEED0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Following up on this message, I don=E2=80=99t want anyone to think =
I=E2=80=99m asking for help without doing my own research. =20

I found  a set of instructions at =
http://www.barryodonovan.com/index.php/2007/12/08/lvm-recovery and =
it=E2=80=99s similar to my problem (although my physical volume is on a =
partition instead of the entire disk) and I want to make sure that the =
plan to repair my system won=E2=80=99t wipe existing data.

So, assuming the data is still on /dev/sdc1, if I recreate the PV, will =
I lose data?  i.e., will pvcreate =E2=80=93vvvv =E2=80=93u <my uuid> =
/dev/sdc1 destroy the data on the partition?
Similiarly, will vgcreate =E2=80=93v <my volumename> /dev/sdc1 kill my =
data?

Am I heading in entirely the wrong direction?

Thanks,
DZ

From: David Ziring=20
Sent: Friday, July 29, 2011 8:30 PM
To: linux-lvm@redhat.com=20
Subject: Please help me recover my LVM configuration

Hi all,=20

I=E2=80=99m hoping I can get some help recovering my data.  A week or so =
back I accidentally overwrote the partition table on one of the two =
drives containing my data.  I luckily didn=E2=80=99t touch the partition =
itself, so I believe all the data is still there, but in rebuilding the =
partition table I (think I) nuked the uuid of the drive.  Now =
I=E2=80=99m not sure how to progress. =20
Please help this relative neophyte =E2=80=93 there is a lot of nostalgia =
sitting on those drives.  Tell me what information you need and I will =
get it.

DZ
------=_NextPart_000_000B_01CC4ECA.333FEED0
Content-Type: text/html;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<HTML><HEAD></HEAD>
<BODY dir=3Dltr>
<DIV dir=3Dltr>
<DIV style=3D"FONT-FAMILY: 'Calibri'; COLOR: #000000; FONT-SIZE: 12pt">
<DIV>Following up on this message, I don=E2=80=99t want anyone to think =
I=E2=80=99m asking for=20
help without doing my own research.&nbsp; </DIV>
<DIV>&nbsp;</DIV>
<DIV>I found&nbsp; a set of instructions at <A=20
href=3D"http://www.barryodonovan.com/index.php/2007/12/08/lvm-recovery"><=
FONT=20
face=3D"Times New =
Roman">http://www.barryodonovan.com/index.php/2007/12/08/lvm-recovery</FO=
NT></A><FONT=20
face=3D"Times New Roman"> </FONT><FONT face=3DCalibri>and it=E2=80=99s =
similar to my problem=20
(although my physical volume is on a partition instead of the entire =
disk) and I=20
want to make sure that the plan to repair my system won=E2=80=99t wipe =
existing=20
data.</FONT></DIV>
<DIV>&nbsp;</DIV>
<DIV>So, assuming the data is still on /dev/sdc1, if I recreate the PV, =
will I=20
lose data?&nbsp; i.e., will pvcreate =E2=80=93vvvv =E2=80=93u &lt;my =
uuid&gt; /dev/sdc1 destroy=20
the data on the partition?</DIV>
<DIV>Similiarly, will vgcreate =E2=80=93v &lt;my volumename&gt; =
/dev/sdc1 kill my=20
data?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Am I heading in entirely the wrong direction?</DIV>
<DIV>&nbsp;</DIV>
<DIV>Thanks,</DIV>
<DIV>DZ</DIV>
<DIV=20
style=3D"FONT-STYLE: normal; DISPLAY: inline; FONT-FAMILY: 'Calibri'; =
COLOR: #000000; FONT-SIZE: small; FONT-WEIGHT: normal; TEXT-DECORATION: =
none">
<DIV style=3D"FONT: 10pt tahoma">
<DIV><FONT size=3D3 face=3DCalibri></FONT>&nbsp;</DIV>
<DIV style=3D"BACKGROUND: #f5f5f5">
<DIV style=3D"font-color: black"><B>From:</B> <A =
title=3Dzeke@thebayou.net=20
href=3D"mailto:zeke@thebayou.net">David Ziring</A> </DIV>
<DIV><B>Sent:</B> Friday, July 29, 2011 8:30 PM</DIV>
<DIV><B>To:</B> <A title=3Dlinux-lvm@redhat.com=20
href=3D"mailto:linux-lvm@redhat.com">linux-lvm@redhat.com</A> </DIV>
<DIV><B>Subject:</B> Please help me recover my LVM=20
configuration</DIV></DIV></DIV>
<DIV>&nbsp;</DIV></DIV>
<DIV=20
style=3D"FONT-STYLE: normal; DISPLAY: inline; FONT-FAMILY: 'Calibri'; =
COLOR: #000000; FONT-SIZE: small; FONT-WEIGHT: normal; TEXT-DECORATION: =
none">
<DIV dir=3Dltr>
<DIV style=3D"FONT-FAMILY: 'Calibri'; COLOR: #000000; FONT-SIZE: 12pt">
<DIV>Hi all, </DIV>
<DIV>&nbsp;</DIV>
<DIV>I=E2=80=99m hoping I can get some help recovering my data.&nbsp; A =
week or so back=20
I accidentally overwrote the partition table on one of the two drives =
containing=20
my data.&nbsp; I luckily didn=E2=80=99t touch the partition itself, so I =
believe all the=20
data is still there, but in rebuilding the partition table I (think I) =
nuked the=20
uuid of the drive.&nbsp; Now I=E2=80=99m not sure how to progress.&nbsp; =
<BR>Please help=20
this relative neophyte =E2=80=93 there is a lot of nostalgia sitting on =
those=20
drives.&nbsp; Tell me what information you need and I will get it.</DIV>
<DIV>&nbsp;</DIV>
<DIV>DZ</DIV></DIV></DIV></DIV></DIV></DIV></BODY></HTML>

------=_NextPart_000_000B_01CC4ECA.333FEED0--
