MIME-Version: 1.0
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<83c4026c-5abe-e9e5-ac1d-6ed9e025e660@gmail.com>
	<b2923ab7-deed-588f-1bc1-c32c154824bc@redhat.com>
In-Reply-To: <b2923ab7-deed-588f-1bc1-c32c154824bc@redhat.com>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Wed, 23 Oct 2019 12:56:22 +0200
Message-ID: <CACrcyfL=U4HU7ovOdn8a8o_FkMfe-yLV-wcqYyaO9=Kh-rPZXA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000023dfdd059591c51e"
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--00000000000023dfdd059591c51e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thanks,

Ok, looking at thin than.
Is there a way to adopt similarities using thin instead?

Regards Tomas

Den ons 23 okt. 2019 kl 12:26 skrev Zdenek Kabelac <zkabelac@redhat.com>:

> Dne 22. 10. 19 v 18:13 Dalebj=C3=B6rk, Tomas napsal(a):
> > That is cool,
> >
> > But, are there any practical example how this could be working in
> reality.
> >
>
> There is not yet a practical example available from our lvm2 team yet.
>
> So we are only describing the 'model' & 'plan' we have ATM...
>
>
> >
> > I have created a way to perform block level incremental forever by
> reading the
> > -cow device, and thin_dump would be nice replacement for that.
>
>
> COW is dead technology from our perspective - it can't cope with recent
> performance of modern drives like NVMe...
>
> So our plan is to focus on thinp technology here.
>
>
> Zdenek
>
>

--00000000000023dfdd059591c51e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Thanks,</div><div><br></div><div>Ok, looking at thin =
than.</div><div>Is there a way to adopt similarities using thin instead?</d=
iv><div><br></div><div>Regards Tomas</div></div><br><div class=3D"gmail_quo=
te"><div class=3D"gmail_attr" dir=3D"ltr">Den ons 23 okt. 2019 kl 12:26 skr=
ev Zdenek Kabelac &lt;<a href=3D"mailto:zkabelac@redhat.com">zkabelac@redha=
t.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);border=
-left-width:1px;border-left-style:solid">Dne 22. 10. 19 v 18:13 Dalebj=C3=
=B6rk, Tomas napsal(a):<br>
&gt; That is cool,<br>
&gt; <br>
&gt; But, are there any practical example how this could be working in real=
ity.<br>
&gt; <br>
<br>
There is not yet a practical example available from our lvm2 team yet.<br>
<br>
So we are only describing the &#39;model&#39; &amp; &#39;plan&#39; we have =
ATM...<br>
<br>
<br>
&gt; <br>
&gt; I have created a way to perform block level incremental forever by rea=
ding the <br>
&gt; -cow device, and thin_dump would be nice replacement for that.<br>
<br>
<br>
COW is dead technology from our perspective - it can&#39;t cope with recent=
<br>
performance of modern drives like NVMe...<br>
<br>
So our plan is to focus on thinp technology here.<br>
<br>
<br>
Zdenek<br>
<br>
</blockquote></div>

--00000000000023dfdd059591c51e--
