Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.14])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id nA25oFWg013088
	for <linux-lvm@redhat.com>; Mon, 2 Nov 2009 00:50:15 -0500
Received: from mail-vw0-f171.google.com (mail-vw0-f171.google.com
	[209.85.212.171])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id nA25o4ig011423
	for <linux-lvm@redhat.com>; Mon, 2 Nov 2009 00:50:05 -0500
Received: by vws1 with SMTP id 1so1075088vws.23
	for <linux-lvm@redhat.com>; Sun, 01 Nov 2009 21:50:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <f6d6a910910230859y205a4a99o515e29fd65040125@mail.gmail.com>
References: <f6d6a910910230803g54c095bbwe1c4df66573f8678@mail.gmail.com>
	<29ae894c0910230838o755803d9td6211d953ac343e5@mail.gmail.com>
	<f6d6a910910230859y205a4a99o515e29fd65040125@mail.gmail.com>
Date: Sun, 1 Nov 2009 23:50:04 -0600
Message-ID: <f6d6a910911012150k4ba3bfcfl76665516bfad9e2f@mail.gmail.com>
Subject: Re: [linux-lvm] How do I use free PE?
From: Rod Rook <rod.rook@gmail.com>
Content-Type: multipart/alternative; boundary=0016e68ea4fb01ad2904775cf381
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

--0016e68ea4fb01ad2904775cf381
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Oct 23, 2009 at 9:59 AM, Rod Rook <rod.rook@gmail.com> wrote:

> Thank you for your reply. I was thinking of using Gnome parted, but I
> wanted to check to see if it can be used with LVM2 partitions.
>
> I am happy to report that I've successfully reduced the physical volume of
VolGroup00 by 160GB, which I don't think I will ever use with the volume
group. I left about 10GB for use by a snapshot volume. Since nobody had told
me that using gparted application is safe for what I was trying to do, I did
some more reading on the subject in other forums and made a backup of the
volume group before I plunged into this risky undertaking.

I used a System Rescue CD (version 1.3.1) to do the job. It comes with
gparted and LVM manager.
So, I can dare to say that one can reduce the physical volume of a volume
group provided there is a significant unused part exists.

--0016e68ea4fb01ad2904775cf381
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<br><div class=3D"gmail_quote">On Fri, Oct 23, 2009 at 9:59 AM, Rod Rook <s=
pan dir=3D"ltr">&lt;<a href=3D"mailto:rod.rook@gmail.com">rod.rook@gmail.co=
m</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"borde=
r-left: 1px solid rgb(204, 204, 204); margin: 0pt 0pt 0pt 0.8ex; padding-le=
ft: 1ex;">
Thank you for your reply. I was thinking of using Gnome parted, but I
wanted to check to see if it can be used with LVM2 partitions. <br><div><di=
v></div><div class=3D"h5"><br></div></div></blockquote></div>I am happy to =
report that I&#39;ve successfully reduced the physical volume of VolGroup00=
 by 160GB, which I don&#39;t think I will ever use with the volume group. I=
 left about 10GB for use by a snapshot volume. Since nobody had told me tha=
t using gparted application is safe for what I was trying to do, I did some=
 more reading on the subject in other forums and made a backup of the volum=
e group before I plunged into this risky undertaking. <br>
<br>I used a System Rescue CD (version 1.3.1) to do the job. It comes with =
gparted and LVM manager. <br>So, I can dare to say that one can reduce the =
physical volume of a volume group provided there is a significant unused pa=
rt exists. <br>
<br><br>

--0016e68ea4fb01ad2904775cf381--
