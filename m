Received: from mimecast-mx02.redhat.com
	(mimecast04.extmail.prod.ext.rdu2.redhat.com [10.11.55.20])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D13F2166B27
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 15:32:36 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00AC6103B80A
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 15:32:36 +0000 (UTC)
Received: by mail-io1-f47.google.com with SMTP id o8so2546619ioh.0
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 07:32:32 -0800 (PST)
MIME-Version: 1.0
References: <CAMaziXuSe+YncMw622UAeGp_3DKtoCuz-US1yh6+tkrmDyQ4=g@mail.gmail.com>
	<20201120111433.GI1787072@localhost.localdomain>
	<CAMaziXss8HAjSjV6g5kFjzkxnYCGZSowfZcT-nJVRm-tf0rJEQ@mail.gmail.com>
	<20201123131321.GC2229389@localhost.localdomain>
	<CAMaziXvoqVUOD=iAks4x9bhOxeZCNcGcT6mJwaJCUEk29AoTOw@mail.gmail.com>
	<20201125123611.GA2419337@localhost.localdomain>
In-Reply-To: <20201125123611.GA2419337@localhost.localdomain>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Wed, 25 Nov 2020 21:02:20 +0530
Message-ID: <CAMaziXtGT+Drh-VFi6RSaSq5jPkua9qbvxYyj=6y2Cb00fOvCw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c0d04b05b4f02230"
Subject: Re: [linux-lvm] Unusually long boot times with LVM Snapshots
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

--000000000000c0d04b05b4f02230
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 8:50 PM Bryn M. Reeves <bmr@redhat.com> wrote:

> Most likely you are just missing the dm-thin-pool module in the dracut
> initramfs image.
>
> You can re-build it with the following command:
>
>   # dracut -f /boot/initramfs-$(uname -r).img $(uname -r)
>
> If the running kernel matches the initramfs you want to rebuild then
> you can leave out the file and kernel version:
>
>   # dracut -f
>
> To build an initramfs with only the drivers that the running host
> uses add the -H switch (the dm-thin-pool module must be loaded at
> the time you run dracut for this to work):
>
>   # dracut -fH
>
> See the dracut man page for more details.
>

Yes, I did do the above thanks.
-- 
Regards,
Sreyan Chakravarty

--000000000000c0d04b05b4f02230
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 25, 2020 at 8:50 PM Bryn =
M. Reeves &lt;<a href=3D"mailto:bmr@redhat.com">bmr@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Most likely y=
ou are just missing the dm-thin-pool module in the dracut<br>
initramfs image.<br>
<br>
You can re-build it with the following command:<br>
<br>
=C2=A0 # dracut -f /boot/initramfs-$(uname -r).img $(uname -r)<br>
<br>
If the running kernel matches the initramfs you want to rebuild then<br>
you can leave out the file and kernel version:<br>
<br>
=C2=A0 # dracut -f<br>
<br>
To build an initramfs with only the drivers that the running host<br>
uses add the -H switch (the dm-thin-pool module must be loaded at<br>
the time you run dracut for this to work):<br>
<br>
=C2=A0 # dracut -fH<br>
<br>
See the dracut man page for more details.<br></blockquote><div><br></div><d=
iv>Yes, I did do the above thanks.=C2=A0</div></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Sreyan Chakravarty=
</div></div></div></div>

--000000000000c0d04b05b4f02230--
