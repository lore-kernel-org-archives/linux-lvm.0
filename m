Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B8D0A60C57
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 10:06:43 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
	[209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E398581F01
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 10:06:41 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id u4so6282529ljj.9
	for <linux-lvm@redhat.com>; Wed, 23 Oct 2019 03:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<9e58accdc28692b3c8b2b09f37bce57c@assyoma.it>
	<alpine.LRH.2.21.1910221846190.5121@fairfax.gathman.org>
	<df172328d6043d90506718605a4a812e@assyoma.it>
In-Reply-To: <df172328d6043d90506718605a4a812e@assyoma.it>
From: =?UTF-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Date: Wed, 23 Oct 2019 12:06:28 +0200
Message-ID: <CACrcyfJhTjPO99ShtSvb7wPLWge-eMu4_Avpi5YdhRN6t8n0ng@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000b6d6c80595911272"
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
To: Gionatan Danti <g.danti@assyoma.it>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

--000000000000b6d6c80595911272
Content-Type: text/plain; charset="UTF-8"

Many thanks for all the feedback.

The idea works for those applications that supports snapshots.
Like Sybase / SAP Adaptive Server Enterprise, Sybase / SAP IQ Server, DB2,
MongoDB, MariaDB/MySQL, PostgreSQL etc..

Anyhow, back to the origin question:
Is there a way how to re-create the cow- format.
so that lvconvert --merge can be used.
Or by having lvconvert --merge to accept to read from a "cow file"

If that would be possible, than instant recovery would be possible from an
external source, like a backup server.

Regards Tomas

Den ons 23 okt. 2019 kl 08:58 skrev Gionatan Danti <g.danti@assyoma.it>:

> Il 23-10-2019 00:53 Stuart D. Gathman ha scritto:
> > If you can find all the leaf nodes belonging to the root (in my btree
> > database they are marked with the root id and can be found by
> > sequential
> > scan of the volume), then reconstructing the btree data is
> > straightforward - even in place.
> >
> > I remember realizing this was the only way to recover a major
> > customer's
> > data - and had the utility written, tested, and applied in a 36 hour
> > programming marathon (which I hope to never repeat).  If this hasn't
> > occured to thin pool programmers, I am happy to flesh out the
> > procedure.
> > Having such a utility available as a last resort would ratchet up the
> > reliability of thin pools.
>
> Very interesting. Can I ask you what product/database you recovered?
>
> Anyway, giving similar ability to thin Vols would be awesome.
>
> Thanks.
>
> --
> Danti Gionatan
> Supporto Tecnico
> Assyoma S.r.l. - www.assyoma.it
> email: g.danti@assyoma.it - info@assyoma.it
> GPG public key ID: FF5F32A8
>

--000000000000b6d6c80595911272
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Many thanks for all the feedback.</div><div><br></div=
><div>The idea works for those applications that supports snapshots.</div><=
div>Like Sybase / SAP Adaptive Server Enterprise, Sybase / SAP IQ Server, D=
B2, MongoDB, MariaDB/MySQL, PostgreSQL etc..</div><div><br></div><div>Anyho=
w, back to the origin question:</div><div>Is there a way how to re-create t=
he cow- format.</div><div>so that lvconvert --merge can be used.</div><div>=
Or by having lvconvert --merge to accept to read from a &quot;cow file&quot=
;</div><div><br></div><div>If that would be possible, than instant recovery=
 would be possible from an external source, like a backup server.</div><div=
><br></div><div>Regards Tomas</div><div></div></div><br><div class=3D"gmail=
_quote"><div class=3D"gmail_attr" dir=3D"ltr">Den ons 23 okt. 2019 kl 08:58=
 skrev Gionatan Danti &lt;<a href=3D"mailto:g.danti@assyoma.it">g.danti@ass=
yoma.it</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;padding-left:1ex;border-left-color:rgb(204,204,204);bord=
er-left-width:1px;border-left-style:solid">Il 23-10-2019 00:53 Stuart D. Ga=
thman ha scritto:<br>
&gt; If you can find all the leaf nodes belonging to the root (in my btree<=
br>
&gt; database they are marked with the root id and can be found by <br>
&gt; sequential<br>
&gt; scan of the volume), then reconstructing the btree data is<br>
&gt; straightforward - even in place.<br>
&gt; <br>
&gt; I remember realizing this was the only way to recover a major <br>
&gt; customer&#39;s<br>
&gt; data - and had the utility written, tested, and applied in a 36 hour<b=
r>
&gt; programming marathon (which I hope to never repeat).=C2=A0 If this has=
n&#39;t<br>
&gt; occured to thin pool programmers, I am happy to flesh out the <br>
&gt; procedure.<br>
&gt; Having such a utility available as a last resort would ratchet up the<=
br>
&gt; reliability of thin pools.<br>
<br>
Very interesting. Can I ask you what product/database you recovered?<br>
<br>
Anyway, giving similar ability to thin Vols would be awesome.<br>
<br>
Thanks.<br>
<br>
-- <br>
Danti Gionatan<br>
Supporto Tecnico<br>
Assyoma S.r.l. - <a href=3D"http://www.assyoma.it" target=3D"_blank" rel=3D=
"noreferrer">www.assyoma.it</a><br>
email: <a href=3D"mailto:g.danti@assyoma.it" target=3D"_blank">g.danti@assy=
oma.it</a> - <a href=3D"mailto:info@assyoma.it" target=3D"_blank">info@assy=
oma.it</a><br>
GPG public key ID: FF5F32A8<br>
</blockquote></div>

--000000000000b6d6c80595911272--
