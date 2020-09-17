Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D01D52166B27
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2020 17:13:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 79A82800161
	for <linux-lvm@redhat.com>; Thu, 17 Sep 2020 17:13:47 +0000 (UTC)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 17 Sep 2020 19:13:39 +0200
Message-Id: <4529ACB9-3A9B-41F2-9B39-B44DA9768B58@gmail.com>
References: <f4b822a0-33d2-bd9b-6696-09d09aa19052@redhat.com>
In-Reply-To: <f4b822a0-33d2-bd9b-6696-09d09aa19052@redhat.com>
Content-Type: multipart/alternative;
	boundary=Apple-Mail-741D5D53-FE27-47FD-A6D9-217AB6C87787
Subject: Re: [linux-lvm] size of lvm metadata
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
To: Heinz Mauelshagen <heinzm@redhat.com>
Cc: linux-lvm@redhat.com

--Apple-Mail-741D5D53-FE27-47FD-A6D9-217AB6C87787
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

ok

Ithanks


> pe_count(24) * extent_size(8192) =3D 196608 bytes usable space of the
> > total dev_size(204800) metadata size? =3D dev_size(204800) - 196608 =3D
> > 8192


Sent from my iPhone

> On 17 Sep 2020, at 17:22, Heinz Mauelshagen <heinzm@redhat.com> wrote:
>=20
> =EF=BB=BF Tomas,
>=20
> the first PE starts at offset 2048 sectors of size 512 bytes by default, =
i.e. the LVM MDA (metadata area)
> is ~1MiB big (because the MDA starts at offset 1 page into the device).  =
If you plan for large numbers of LVs or expect very scattered allocations w=
hich both grow the metadata, you may want to create a
> bigger MDA using vgcreate's option --metadatasize (also see /etc/lvm/lvm.=
conf description on
> metadata/pvmetadatasize).
>=20
> On 9/16/20 5:50 PM, Tomas Dalebj=C3=B6rk wrote:
> > hi
> >=20
> > I am trying to understand how big the lvm metadata is
> >=20
> > in the vgcfgbackup file, I can see extent_size =3D 8192 dev_size =3D
> > 204800 pe_start =3D 2048 pe_count 24
> >=20
> > pe_count(24) * extent_size(8192) =3D 196608 bytes usable space of the
> > total dev_size(204800) metadata size? =3D dev_size(204800) - 196608 =3D
> > 8192
> >=20
> > but... pe_start is 2048? so what is pe_start here? cant be
> > sectors(512)? bytes? well than ther be not aligned
> >=20
> > so where starts the actual data? and where ends the lvm metadata?
> At offset 2048 sectors (1MiB into the device) / MDA ends at sector 2047.
>=20
> Mind that lvm2 metadata is text formatted (see /etc/lvm/backup/$VGName fo=
r one)
> and thus varies in size (the MDA is used as a ring buffer for 2 copies of=
 the MDA to
> support atomic updates).  As pointed out above when refering to 'vgcreate=
 --metadatasize',
> in more elaborate setups you may run out of MDA space.
>=20
> Heinz
>=20
> >=20
> > regards Tomas Sent from my iPhone
> >=20
> >=20
> > _______________________________________________ linux-lvm mailing
> > list linux-lvm@redhat.com=20
> > https://www.redhat.com/mailman/listinfo/linux-lvm read the LVM HOW-TO
> > at http://tldp.org/HOWTO/LVM-HOWTO/
>=20

--Apple-Mail-741D5D53-FE27-47FD-A6D9-217AB6C87787
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=3Dutf-8"></head><body dir=3D"auto">ok<div><br></div><div>Ithanks</div><div=
><br></div><div><br></div><div><blockquote type=3D"cite"><div dir=3D"ltr"><=
span style=3D"white-space: pre-wrap; display: block; width: 98vw;">pe_count=
(24) * extent_size(8192) =3D 196608 bytes usable space of the
&gt; total dev_size(204800) metadata size? =3D dev_size(204800) - 196608 =
=3D
&gt; 8192</span></div></blockquote></div><div><br><div dir=3D"ltr">Sent fro=
m my iPhone</div><div dir=3D"ltr"><br><blockquote type=3D"cite">On 17 Sep 2=
020, at 17:22, Heinz Mauelshagen &lt;heinzm@redhat.com&gt; wrote:<br><br></=
blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF
 =20
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
 =20
 =20
    Tomas,<br>
    <br>
    the first PE starts at offset 2048 sectors of size 512 bytes by
    default, i.e. the LVM MDA (metadata area)<br>
    is ~1MiB big (because the MDA starts at offset 1 page into the
    device).&nbsp; If you plan for large numbers of LVs or expect very
    scattered allocations which both grow the metadata, you may want to
    create a<br>
    bigger MDA using vgcreate's option --metadatasize (also see
    /etc/lvm/lvm.conf description on<br>
    metadata/pvmetadatasize).<br>
    <br>
    On 9/16/20 5:50 PM, Tomas Dalebj=C3=B6rk wrote:<br>
    <span style=3D"white-space: pre-wrap; display: block; width: 98vw;">&gt=
; hi
&gt;=20
&gt; I am trying to understand how big the lvm metadata is
&gt;=20
&gt; in the vgcfgbackup file, I can see extent_size =3D 8192 dev_size =3D
&gt; 204800 pe_start =3D 2048 pe_count 24
&gt;=20
&gt; pe_count(24) * extent_size(8192) =3D 196608 bytes usable space of the
&gt; total dev_size(204800) metadata size? =3D dev_size(204800) - 196608 =
=3D
&gt; 8192
&gt;=20
&gt; but... pe_start is 2048? so what is pe_start here? cant be
&gt; sectors(512)? bytes? well than ther be not aligned
&gt;=20
&gt; so where starts the actual data? and where ends the lvm metadata?
</span>
    <p>At offset 2048 sectors (1MiB into the device) / MDA ends at
      sector 2047.<br>
      <br>
      Mind that lvm2 metadata is text formatted (see
      /etc/lvm/backup/$VGName for one)<br>
      and thus varies in size (the MDA is used as a ring buffer for 2
      copies of the MDA to<br>
      support atomic updates).&nbsp; As pointed out above when refering to
      'vgcreate --metadatasize',<br>
      in more elaborate setups you may run out of MDA space.<br>
    </p>
    <p>Heinz<br>
    </p>
    <span style=3D"white-space: pre-wrap; display: block; width: 98vw;">&gt=
;=20
&gt; regards Tomas Sent from my iPhone
&gt;=20
&gt;=20
&gt; _______________________________________________ linux-lvm mailing
&gt; list <a class=3D"moz-txt-link-abbreviated" href=3D"mailto:linux-lvm@re=
dhat.com">linux-lvm@redhat.com</a>=20
&gt; <a class=3D"moz-txt-link-freetext" href=3D"https://www.redhat.com/mail=
man/listinfo/linux-lvm">https://www.redhat.com/mailman/listinfo/linux-lvm</=
a> read the LVM HOW-TO
&gt; at <a class=3D"moz-txt-link-freetext" href=3D"http://tldp.org/HOWTO/LV=
M-HOWTO/">http://tldp.org/HOWTO/LVM-HOWTO/</a>
</span><br>
 =20

</div></blockquote></div></body></html>
--Apple-Mail-741D5D53-FE27-47FD-A6D9-217AB6C87787--
