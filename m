Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 769B42026D48
	for <linux-lvm@redhat.com>; Sat, 21 Nov 2020 08:22:10 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[207.211.31.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32294185A7BC
	for <linux-lvm@redhat.com>; Sat, 21 Nov 2020 08:22:10 +0000 (UTC)
Received: by mail-io1-f48.google.com with SMTP id r1so12403391iob.13
	for <linux-lvm@redhat.com>; Sat, 21 Nov 2020 00:22:05 -0800 (PST)
MIME-Version: 1.0
References: <CAMaziXuSe+YncMw622UAeGp_3DKtoCuz-US1yh6+tkrmDyQ4=g@mail.gmail.com>
	<20201120111433.GI1787072@localhost.localdomain>
In-Reply-To: <20201120111433.GI1787072@localhost.localdomain>
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Sat, 21 Nov 2020 13:51:42 +0530
Message-ID: <CAMaziXuxo6oHSN63T1Jms8kcv3HKVXe_2BtR18g9w=GyNhSFbA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f8fafc05b499a7ab"
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

--000000000000f8fafc05b499a7ab
Content-Type: text/plain; charset="UTF-8"

On Fri, Nov 20, 2020 at 4:45 PM Bryn M. Reeves <bmr@redhat.com> wrote:

> What type of snapshot are you using? LVM2 allows either "classic" CoW
> snaps,
> or the newer thin provisioned snapshots using the dm-thinp target.
>
> Classic snapshots are known to have very poor IO performance when multiple
> snapshots of the same volume exist simultaneously (especially for write-
> heavy workloads).
>
> Thin provisioned snapshots are not normally activated at boot time unless
> they are explicitly requested (via dracut's rd.lvm.lv options) since they
> have the skip activation flag set by default.
>

I tried thin snapshots, but what use are they if I can't use my system all
together.

Once my root logical volume was marked read only I could not revert it back
to writable, after the snapshot was created.

-- 
Regards,
Sreyan Chakravarty

--000000000000f8fafc05b499a7ab
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Nov 20, 2020 at 4:45 PM Bryn =
M. Reeves &lt;<a href=3D"mailto:bmr@redhat.com">bmr@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">What type of =
snapshot are you using? LVM2 allows either &quot;classic&quot; CoW snaps,<b=
r>
or the newer thin provisioned snapshots using the dm-thinp target.<br>
<br>
Classic snapshots are known to have very poor IO performance when multiple<=
br>
snapshots of the same volume exist simultaneously (especially for write-<br=
>
heavy workloads).<br>
<br>
Thin provisioned snapshots are not normally activated at boot time unless<b=
r>
they are explicitly requested (via dracut&#39;s <a href=3D"http://rd.lvm.lv=
" rel=3D"noreferrer" target=3D"_blank">rd.lvm.lv</a> options) since they<br=
>
have the skip activation flag set by default.<br></blockquote><div><br></di=
v><div>I tried thin snapshots, but what use are they if I can&#39;t use my =
system all together.</div><div><br></div><div>Once my root logical volume w=
as marked read only I could not revert it back to writable, after the snaps=
hot was created.=C2=A0</div></div><div><br></div>-- <br><div dir=3D"ltr" cl=
ass=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Sreyan Chakravarty</d=
iv></div></div></div>

--000000000000f8fafc05b499a7ab--
