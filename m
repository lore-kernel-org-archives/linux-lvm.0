Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CAED35C54A
	for <linux-lvm@redhat.com>; Sat,  4 Nov 2017 07:38:47 +0000 (UTC)
Received: from mail-oi0-f41.google.com (mail-oi0-f41.google.com
	[209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id DD41080082
	for <linux-lvm@redhat.com>; Sat,  4 Nov 2017 07:38:45 +0000 (UTC)
Received: by mail-oi0-f41.google.com with SMTP id g125so3699916oib.12
	for <linux-lvm@redhat.com>; Sat, 04 Nov 2017 00:38:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALuPYL3WmDs5kT3=cRhji2=nf_OKOCygTnr-rGufA7xA777sZg@mail.gmail.com>
References: <CALuPYL3WmDs5kT3=cRhji2=nf_OKOCygTnr-rGufA7xA777sZg@mail.gmail.com>
From: Indivar Nair <indivar.nair@techterra.in>
Date: Sat, 4 Nov 2017 13:08:14 +0530
Message-ID: <CALuPYL2uTBmUXix3YksL-UDWJiRoyc0a8TYHOx-4mAA4ZJR7PA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a113d2f8ca345e2055d234f0f"
Subject: Re: [linux-lvm] Maximum number of drives in a Logical Volume Stripe
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

--001a113d2f8ca345e2055d234f0f
Content-Type: text/plain; charset="UTF-8"

Hi ...,

Got the solution/answer to the issue not allowing a stripe count of more
than 8 drives.
Its a bug in RHEL/CentOS 7.3 which is not there in earlier version, and has
been fixed in RHEL/CentOS 7.4
https://bugzilla.redhat.com/show_bug.cgi?id=1389546

Regards,


Indivar Nair

On Thu, Nov 2, 2017 at 7:31 PM, Indivar Nair <indivar.nair@techterra.in>
wrote:

> Hi ...,
>
> What is the maximum number of drives that we can have in a stripped
> logical volume?
>
> On a CentOS 7.3 machine, it is not allowing me to have a stripe count of
> more that 8 Drives. I have 12 Drives in the Volume Group and would like to
> use all of them in the Logical Volume.
>
> Is it a limitation of RHEL/CentOS?
> Is there a work around?
>
> Regards,
>
>
> Indivar Nair
>

--001a113d2f8ca345e2055d234f0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi ...,<div><br></div><div>Got the solution/answer to the =
issue not allowing a stripe count of more than 8 drives.</div><div>Its a bu=
g in RHEL/CentOS 7.3 which is not there in earlier version, and has been fi=
xed in RHEL/CentOS 7.4</div><div><a href=3D"https://bugzilla.redhat.com/sho=
w_bug.cgi?id=3D1389546">https://bugzilla.redhat.com/show_bug.cgi?id=3D13895=
46</a><br></div><div><br></div><div>Regards,<br></div><div><br></div><div><=
br></div><div>Indivar Nair</div></div><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote">On Thu, Nov 2, 2017 at 7:31 PM, Indivar Nair <span dir=
=3D"ltr">&lt;<a href=3D"mailto:indivar.nair@techterra.in" target=3D"_blank"=
>indivar.nair@techterra.in</a>&gt;</span> wrote:<br><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"><div dir=3D"ltr">Hi ...,<div><br></div><div>What is the maximum num=
ber of drives that we can have in a stripped logical volume?</div><div><br>=
</div><div>On a CentOS 7.3 machine, it is not allowing me to have a stripe =
count of more that 8 Drives. I have 12 Drives in the Volume Group and would=
 like to use all of them in the Logical Volume.</div><div><br></div><div>Is=
 it a limitation of RHEL/CentOS?</div><div>Is there a work around?</div><di=
v><br></div><div>Regards,</div><div><br></div><div><br></div><div>Indivar N=
air</div></div>
</blockquote></div><br></div>

--001a113d2f8ca345e2055d234f0f--
