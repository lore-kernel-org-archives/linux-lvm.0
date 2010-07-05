Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o658qiJU010789
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 04:52:44 -0400
Received: from mail-pw0-f46.google.com (mail-pw0-f46.google.com
	[209.85.160.46])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o658qXhK004227
	for <linux-lvm@redhat.com>; Mon, 5 Jul 2010 04:52:34 -0400
Received: by pwi5 with SMTP id 5so1625517pwi.33
	for <linux-lvm@redhat.com>; Mon, 05 Jul 2010 01:52:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
References: <AANLkTinHO7upxegO7jMqa4OtWQ8i-4EOB7rb25G_tmuc@mail.gmail.com>
	<AANLkTikCxnSq4nyGf8V_uC5AqejaFwr7DgJuCcA4wY62@mail.gmail.com>
Date: Mon, 5 Jul 2010 01:52:33 -0700
Message-ID: <AANLkTilASQnpv7d0oB5NELpMQ7yzfWYIFjeooVtX8WPv@mail.gmail.com>
From: Ken Bass <daytooner@gmail.com>
Content-Type: multipart/alternative; boundary=000e0cd2e6b8bcee00048aa00e27
Subject: Re: [linux-lvm] Rebuilding ext4 filesystem on an LV
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

--000e0cd2e6b8bcee00048aa00e27
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 4, 2010 at 10:54 PM, Bryan Whitehead <driver@megahappy.net>wrot=
e:

> Dig deep into your memory (or just try different combos) of running
> mkfs.ext4 -n /dev/yourVG/yourLV
>
> -n is like a dry run so you can look for the alternate superblock
> locations.
>
> Using the above info, run fsck.ext4 -b <alt location> /dev/yourVG/yourLV
>
>
Tried all of that, with many different offsets. No luck.


> Even if it can find an alternate superblock, I'm not confident the
> fsck would be able to help much=85
>

Do you mean in general, or just for recovery of the trashed drive? I didn't
have much hope for the trashed drive, but I was hoping to recover what was
on the other drives.


> That said, I think you might be out of luck. Go ahead and give it a
> shot, I'm curious how much data you'll get.
>

Me too :-).

But what bothers me is this message I get when I run e2fsck (which runs
fsck.ext4):
"e2fsck: Invalid argument while trying to open
/dev/mapper/VolGroupX-LogVolX"

Why am I getting that?

thx for the response.

ken

--000e0cd2e6b8bcee00048aa00e27
Content-Type: text/html; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

<br><br><div class=3D"gmail_quote">On Sun, Jul 4, 2010 at 10:54 PM, Bryan W=
hitehead <span dir=3D"ltr">&lt;<a href=3D"mailto:driver@megahappy.net">driv=
er@megahappy.net</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 2=
04); padding-left: 1ex;">
Dig deep into your memory (or just try different combos) of running<br>
mkfs.ext4 -n /dev/yourVG/yourLV<br>
<br>
-n is like a dry run so you can look for the alternate superblock locations=
.<br>
<br>
Using the above info, run fsck.ext4 -b &lt;alt location&gt; /dev/yourVG/you=
rLV<br>
<br></blockquote><div>=A0</div><div>Tried all of that, with many different =
offsets. No luck.<br>=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin: 0pt 0pt 0pt 0.8ex; border-left: 1px solid rgb(204, 204, 204); p=
adding-left: 1ex;">

Even if it can find an alternate superblock, I&#39;m not confident the<br>
fsck would be able to help much=85<br></blockquote><div><br>Do you mean in =
general, or just for recovery of the trashed drive? I didn&#39;t have much =
hope for the trashed drive, but I was hoping to recover what was on the oth=
er drives.<br>
<br></div><blockquote class=3D"gmail_quote" style=3D"margin: 0pt 0pt 0pt 0.=
8ex; border-left: 1px solid rgb(204, 204, 204); padding-left: 1ex;">
<br>
That said, I think you might be out of luck. Go ahead and give it a<br>
shot, I&#39;m curious how much data you&#39;ll get.<br></blockquote><div><b=
r>Me too :-).<br><br>But what bothers me is this message I get when I run e=
2fsck (which runs fsck.ext4):<br>&quot;e2fsck: Invalid argument while tryin=
g to open=20
/dev/mapper/VolGroupX-LogVolX&quot; <br><br>Why am I getting that?</div><br=
></div>thx for the response.<br><br>ken<br><br>

--000e0cd2e6b8bcee00048aa00e27--
