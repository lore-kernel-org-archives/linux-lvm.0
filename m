Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p6UGnEi2025540
	for <linux-lvm@redhat.com>; Sat, 30 Jul 2011 12:49:14 -0400
Received: from mail-iy0-f174.google.com (mail-iy0-f174.google.com
	[209.85.210.174])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p6UGnDYA017541
	for <linux-lvm@redhat.com>; Sat, 30 Jul 2011 12:49:13 -0400
Received: by iyb12 with SMTP id 12so7303577iyb.33
	for <linux-lvm@redhat.com>; Sat, 30 Jul 2011 09:49:12 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_069A6E50-D803-4D2A-8BDC-96464A2B8B65"
From: evilensky@gmail.com
In-Reply-To: <97485ADD3BBC4386A165837AEB179590@Chimpanzeke>
Date: Sat, 30 Jul 2011 11:49:10 -0500
Message-Id: <9F46830B-61B9-44D1-B7C4-6E4F848BD0B5@gmail.com>
References: <97485ADD3BBC4386A165837AEB179590@Chimpanzeke>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--Apple-Mail=_069A6E50-D803-4D2A-8BDC-96464A2B8B65
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Jul 29, 2011, at 10:30 PM, David Ziring wrote:

> Hi all,
> =20
> I=92m hoping I can get some help recovering my data.  A week or so =
back I accidentally overwrote the partition table on one of the two =
drives containing my data.  I luckily didn=92t touch the partition =
itself, so I believe all the data is still there, but in rebuilding the =
partition table I (think I) nuked the uuid of the drive.  Now I=92m not =
sure how to progress. =20


If all that is over-written is the partition table, testdisk =
(http://www.cgsecurity.org/wiki/TestDisk) is about the simplest =
partition recovery solution I've found.

-Ev


--Apple-Mail=_069A6E50-D803-4D2A-8BDC-96464A2B8B65
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=windows-1252

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; =
"><br><div><div>On Jul 29, 2011, at 10:30 PM, David Ziring =
wrote:</div><br class=3D"Apple-interchange-newline"><blockquote =
type=3D"cite">
<div dir=3D"ltr">
<div dir=3D"ltr">
<div style=3D"FONT-FAMILY: 'Calibri'; COLOR: #000000; FONT-SIZE: 12pt">
<div>Hi all, </div>
<div>&nbsp;</div>
<div>I=92m hoping I can get some help recovering my data.&nbsp; A week =
or so back=20
I accidentally overwrote the partition table on one of the two drives =
containing=20
my data.&nbsp; I luckily didn=92t touch the partition itself, so I =
believe all the=20
data is still there, but in rebuilding the partition table I (think I) =
nuked the=20
uuid of the drive.&nbsp; Now I=92m not sure how to progress.&nbsp; =
<br></div></div></div></div></blockquote><br></div><div><br></div><div>If =
all that is over-written is the partition table, testdisk (<a =
href=3D"http://www.cgsecurity.org/wiki/TestDisk">http://www.cgsecurity.org=
/wiki/TestDisk</a>) is about the simplest partition recovery solution =
I've found.</div><div><br></div><div>-Ev</div><br></body></html>=

--Apple-Mail=_069A6E50-D803-4D2A-8BDC-96464A2B8B65--
