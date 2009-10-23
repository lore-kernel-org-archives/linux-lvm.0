Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9NF3hFP019871
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:03:43 -0400
Received: from mail-vw0-f202.google.com (mail-vw0-f202.google.com
	[209.85.212.202])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9NF3WWL006661
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 11:03:32 -0400
Received: by vws40 with SMTP id 40so311751vws.23
	for <linux-lvm@redhat.com>; Fri, 23 Oct 2009 08:03:31 -0700 (PDT)
MIME-Version: 1.0
Date: Fri, 23 Oct 2009 10:03:31 -0500
Message-ID: <f6d6a910910230803g54c095bbwe1c4df66573f8678@mail.gmail.com>
From: Rod Rook <rod.rook@gmail.com>
Content-Type: multipart/alternative; boundary=001636c5bea7e2b3ee04769b83c4
Subject: [linux-lvm] How do I use free PE?
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

--001636c5bea7e2b3ee04769b83c4
Content-Type: text/plain; charset=ISO-8859-1

I've installed Fedora 10 on a 250GB SATA hard drive.
I want to use the unused portion (free PE= 4378, about 140GB), but I don't
know how I go about doing it.
I don't want to add it to VolGroup00, but I want it made accessible as a
general storage space.


> [root@localhost Documents]# pvdisplay /dev/sdb2
>
  --- Physical volume ---
  PV Name               /dev/sdb2
  VG Name               VolGroup00
  PV Size               232.69 GB / not usable 4.58 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              7446
  Free PE               4376
  Allocated PE          3070

>   PV UUID               DBf14Y-SLFe-cwZy-m1O7-3Jw9-Xhdf-3u42iX
>
>

--001636c5bea7e2b3ee04769b83c4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I&#39;ve installed Fedora 10 on a 250GB SATA hard drive. <br>I want to use =
the unused portion (free PE=3D 4378, about 140GB), but I don&#39;t know how=
 I go about doing it.<br>I don&#39;t want to add it to VolGroup00, but I wa=
nt it made accessible as a general storage space. <br>
<br><blockquote style=3D"border-left: 1px solid rgb(204, 204, 204); margin:=
 0pt 0pt 0pt 0.8ex; padding-left: 1ex;" class=3D"gmail_quote"><br>[root@loc=
alhost Documents]# pvdisplay /dev/sdb2<br></blockquote>=A0 --- Physical vol=
ume ---<br>
=A0 PV Name=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 /dev/sdb2<br>=A0 VG N=
ame=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 VolGroup00<br>=A0 PV Size=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 232.69 GB / not usable 4.58 MB<br>=
=A0 Allocatable=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 yes <br>=A0 PE Size (KByte)=
=A0=A0=A0=A0=A0=A0 32768<br>=A0 Total PE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 7446<br>
=A0 Free PE=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 4376<br>=A0 Allocated=
 PE=A0=A0=A0=A0=A0=A0=A0=A0=A0 3070<br><blockquote style=3D"border-left: 1p=
x solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-left: 1ex;" =
class=3D"gmail_quote">=A0 PV UUID=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 DBf14Y-SLFe-cwZy-m1O7-3Jw9-Xhdf-3u42iX<br>
<br></blockquote>

--001636c5bea7e2b3ee04769b83c4--
