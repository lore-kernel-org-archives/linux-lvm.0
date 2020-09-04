Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 05E9110F038
	for <linux-lvm@redhat.com>; Fri,  4 Sep 2020 12:09:57 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEC57185A78B
	for <linux-lvm@redhat.com>; Fri,  4 Sep 2020 12:09:57 +0000 (UTC)
From: =?utf-8?Q?Tomas_Dalebj=C3=B6rk?= <tomas.dalebjork@gmail.com>
Mime-Version: 1.0 (1.0)
Date: Fri, 4 Sep 2020 14:09:47 +0200
Message-Id: <0B002628-0740-4DA4-A9BD-320A743A7A30@gmail.com>
References: <CACrcyfJBtsVFwf8wFjDAc1sOKPiOVBJjKbDC3c+3G-z6v5SCpA@mail.gmail.com>
In-Reply-To: <CACrcyfJBtsVFwf8wFjDAc1sOKPiOVBJjKbDC3c+3G-z6v5SCpA@mail.gmail.com>
Content-Type: multipart/alternative;
	boundary=Apple-Mail-4BA69AAC-0ACB-41BC-8310-70990E9FF80E
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
To: Mikulas Patocka <mpatocka@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>

--Apple-Mail-4BA69AAC-0ACB-41BC-8310-70990E9FF80E
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

hi

I tried to perform as suggested
# lvconvert =E2=80=94splitsnapshot vg/lv-snap
works fine
# lvconvert -s vg/lv vg/lv-snap
works fine too

but...
if I try to converting cow data directly from the meta device, than it does=
n=E2=80=99t work
eg
# lvconvert -s vg/lv /dev/mycowdev
the tool doesn=E2=80=99t like the path
I tried to place a link in /dev/vg/mycowdev -> /dev/mycowdev
and retried the operations=20
# lvconveet -s vg/lv /dev/vg/mycowdev
but this doesn=E2=80=99t work either

conclusion=20
even though the cow device is an exact copy of the cow device that I have s=
aved on /dev/mycowdev before the split, it wouldn=E2=80=99t work to use to =
convert back as a lvm snapshot=20

not sure if I understand the tool correctly, or if there are other things n=
eeded to perform, such as creating virtual information about the lvm VGDA d=
ata on the first of this virtual volume named /dev/mycowdev=20

let me know what more steps are needed

beat regards Tomas

Sent from my iPhone

> On 7 Nov 2019, at 18:29, Tomas Dalebj=C3=B6rk <tomas.dalebjork@gmail.com>=
 wrote:
>=20
> =EF=BB=BF
> Great, thanks!=20
>=20
> Den tors 7 nov. 2019 kl 17:54 skrev Mikulas Patocka <mpatocka@redhat.com>=
:
>>=20
>>=20
>> On Tue, 5 Nov 2019, Tomas Dalebj=C3=B6rk wrote:
>>=20
>> > Thanks,
>> >=20
>> > That really helped me to understand how the snapshot works.
>> > Last question:
>> > - lets say that block 100 which is 1MB in size is in the cow device, a=
nd a write happen that wants to something or all data on that region of blo=
ck 100.
>> > Than I assume; based on what have been previously said here, that the =
block in the cow device will be overwritten with the new changes.
>>=20
>> Yes, the block in the cow device will be overwritten.
>>=20
>> Mikulas
>>=20
>> > Regards Tomas

--Apple-Mail-4BA69AAC-0ACB-41BC-8310-70990E9FF80E
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=
=3Dutf-8"></head><body dir=3D"auto">hi<div><br></div><div>I tried to perfor=
m as suggested</div><div># lvconvert =E2=80=94splitsnapshot vg/lv-snap</div=
><div>works fine</div><div># lvconvert -s vg/lv vg/lv-snap</div><div>works =
fine too</div><div><br></div><div>but...</div><div>if I try to converting c=
ow data directly from the meta device, than it doesn=E2=80=99t work</div><d=
iv>eg</div><div># lvconvert -s vg/lv /dev/mycowdev</div><div>the tool doesn=
=E2=80=99t like the path</div><div>I tried to place a link in /dev/vg/mycow=
dev -&gt; /dev/mycowdev</div><div>and retried the operations&nbsp;</div><di=
v># lvconveet -s vg/lv /dev/vg/mycowdev</div><div>but this doesn=E2=80=99t =
work either</div><div><br></div><div>conclusion&nbsp;</div><div>even though=
 the cow device is an exact copy of the cow device that I have saved on /de=
v/mycowdev before the split, it wouldn=E2=80=99t work to use to convert bac=
k as a lvm snapshot&nbsp;</div><div><br></div><div>not sure if I understand=
 the tool correctly, or if there are other things needed to perform, such a=
s creating virtual information about the lvm VGDA data on the first of this=
 virtual volume named /dev/mycowdev&nbsp;</div><div><br></div><div>let me k=
now what more steps are needed</div><div><br></div><div>beat regards Tomas<=
/div><div><br><div dir=3D"ltr">Sent from my iPhone</div><div dir=3D"ltr"><b=
r><blockquote type=3D"cite">On 7 Nov 2019, at 18:29, Tomas Dalebj=C3=B6rk &=
lt;tomas.dalebjork@gmail.com&gt; wrote:<br><br></blockquote></div><blockquo=
te type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Great, thanks! =
<br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Den tors 7 nov. 2019 kl 17:54 skrev Mikulas Patocka &lt;<a href=3D"mail=
to:mpatocka@redhat.com">mpatocka@redhat.com</a>&gt;:<br></div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><br>
<br>
On Tue, 5 Nov 2019, Tomas Dalebj=C3=B6rk wrote:<br>
<br>
&gt; Thanks,<br>
&gt; <br>
&gt; That really helped me to understand how the snapshot works.<br>
&gt; Last question:<br>
&gt; - lets say that block 100 which is 1MB in size is in the cow device, a=
nd a write happen that wants to something or all data on that region of blo=
ck 100.<br>
&gt; Than I assume; based on what have been previously said here, that the =
block in the cow device will be overwritten with the new changes.<br>
<br>
Yes, the block in the cow device will be overwritten.<br>
<br>
Mikulas<br>
<br>
&gt; Regards Tomas</blockquote></div>
</div></blockquote></div></body></html>
--Apple-Mail-4BA69AAC-0ACB-41BC-8310-70990E9FF80E--
