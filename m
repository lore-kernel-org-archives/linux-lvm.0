Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 661D72166B27
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 15:33:15 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4E37B800889
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 15:33:15 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id p5so1020242iln.8
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 07:33:12 -0800 (PST)
MIME-Version: 1.0
References: <CAMaziXssM=DVD1qLEhqmVpZmepn-GpA2KgGm8BcDuthbtM+gQQ@mail.gmail.com>
	<20201125124004.GC2419337@localhost.localdomain>
In-Reply-To: <20201125124004.GC2419337@localhost.localdomain>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Wed, 25 Nov 2020 21:03:00 +0530
Message-ID: <CAMaziXtxYQ7HWYfrCPw1EV42mfx3gxcyOriFmAT6FQ6Jx=PM2g@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000001b3a8f05b4f02594"
Subject: Re: [linux-lvm] System bricked after moving to thin snapshots
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

--0000000000001b3a8f05b4f02594
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 8:50 PM Bryn M. Reeves <bmr@redhat.com> wrote:

>
> See my reply to your other message - you need to rebuild your initramfs
> image to include the dm-thin-pool module.
>

Yes I did that.

Thanks.

-- 
Regards,
Sreyan Chakravarty

--0000000000001b3a8f05b4f02594
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 25, 2020 at 8:50 PM Bryn =
M. Reeves &lt;<a href=3D"mailto:bmr@redhat.com">bmr@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
See my reply to your other message - you need to rebuild your initramfs<br>
image to include the dm-thin-pool module.<br></blockquote><div><br></div><d=
iv>Yes I did that.</div><div><br></div><div>Thanks.=C2=A0</div></div><div><=
br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"=
>Regards,<div>Sreyan Chakravarty</div></div></div></div>

--0000000000001b3a8f05b4f02594--
