Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2CFIDlw006944
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 11:18:13 -0400
Received: from mail-qy0-f104.google.com (mail-qy0-f104.google.com
	[209.85.221.104])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2CFHsKO030665
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 11:17:55 -0400
Received: by qyk2 with SMTP id 2so746660qyk.23
	for <linux-lvm@redhat.com>; Thu, 12 Mar 2009 08:17:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1236870013.18005.96.camel@breeves.fab.redhat.com>
References: <f4f537b50903120752s73e40288wbdfaaae814acbdd9@mail.gmail.com>
	<1236870013.18005.96.camel@breeves.fab.redhat.com>
Date: Thu, 12 Mar 2009 10:17:54 -0500
Message-ID: <f4f537b50903120817v145966e7o55f24bf8f0b85513@mail.gmail.com>
Subject: Re: [linux-lvm] pvcreate and partition alignment
From: Eugene Vilensky <evilensky@gmail.com>
Content-Type: multipart/alternative; boundary=0015175cbac4079cf80464ed7d6e
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

--0015175cbac4079cf80464ed7d6e
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

>
> You need to make sure that the extents on the PV have the correct
> alignment.
>
>
Thank you both.  So the default is 64k which is a multiple of 4k which means
we are OK since we are not using partitions?

--0015175cbac4079cf80464ed7d6e
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"borde=
r-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-le=
ft: 1ex;">You need to make sure that the extents on the PV have the correct=
<br>

alignment.<br>
<br></blockquote><div><br>Thank you both.=A0 So the default is 64k which is=
 a multiple of 4k which means we are OK since we are not using partitions?<=
br></div></div>

--0015175cbac4079cf80464ed7d6e--
