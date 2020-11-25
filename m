Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E3F43A9FBD
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 15:32:02 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D3FE780018D
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 15:32:02 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id s10so2547316ioe.1
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 07:31:59 -0800 (PST)
MIME-Version: 1.0
References: <CAMaziXsY6vpQdD+QQzW_1Km+Ltf41tz0G1WG5xAUiMARFWHoyw@mail.gmail.com>
	<20201123130412.GB2229389@localhost.localdomain>
	<CAMaziXsh55b9VNgq40nVJwoFtD774_5i=JEiNZZOrdKpJsWQ_A@mail.gmail.com>
	<20201125123853.GB2419337@localhost.localdomain>
In-Reply-To: <20201125123853.GB2419337@localhost.localdomain>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Wed, 25 Nov 2020 21:01:47 +0530
Message-ID: <CAMaziXvr12btCFAXLspFFUWwvHSpX3ZO237ys3X5kF9L59zzUg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c5aa0205b4f02086"
Subject: Re: [linux-lvm] What is the use of thin snapshots if the external
 origin cannot be set to writable ?
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

--000000000000c5aa0205b4f02086
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2020 at 8:50 PM Bryn M. Reeves <bmr@redhat.com> wrote:

> You can, it's just typically easier for most users to re-install than to
> execute the necessary steps to convert the system after the fact.
>
> If you have sufficient space then you can just create a thin pool, copy
> your existing file systems into it and then fix up the fstab, grub boot
> entries, initramfs and any other configuration that may still reference
> the old device names. Once you're finished you can remove the original
> volumes and reclaim the space for use by the thin pool.
>

Yes, I have migrated to thin pools successfully. Thanks.


-- 
Regards,
Sreyan Chakravarty

--000000000000c5aa0205b4f02086
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 25, 2020 at 8:50 PM Bryn =
M. Reeves &lt;<a href=3D"mailto:bmr@redhat.com">bmr@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">You can, it&#=
39;s just typically easier for most users to re-install than to<br>
execute the necessary steps to convert the system after the fact.<br>
<br>
If you have sufficient space then you can just create a thin pool, copy<br>
your existing file systems into it and then fix up the fstab, grub boot<br>
entries, initramfs and any other configuration that may still reference<br>
the old device names. Once you&#39;re finished you can remove the original<=
br>
volumes and reclaim the space for use by the thin pool.<br></blockquote><di=
v><br></div><div>Yes, I have migrated to thin pools successfully. Thanks.=
=C2=A0</div></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" =
class=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Sreyan Chakravarty<=
/div></div></div></div>

--000000000000c5aa0205b4f02086--
