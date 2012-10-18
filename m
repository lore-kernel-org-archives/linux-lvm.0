Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q9IDlAQQ003787
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 09:47:10 -0400
Received: from awh1.active.ee (alfa.active.ee [194.204.30.36])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9IDl8gG009368
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 09:47:09 -0400
From: Andres Toomsalu <andres@active.ee>
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_B1E46637-FF7D-4DC1-979C-BA68F8251606"
Date: Thu, 18 Oct 2012 16:47:07 +0300
In-Reply-To: <50800770.7080708@gmail.com>
References: <CB12DB70-5C4F-4936-9EDE-BFF4096D064F@active.ee>
	<507FDA2E.8080301@redhat.com> <508003F1.8090308@shiftmail.org>
	<50800770.7080708@gmail.com>
Message-Id: <7C5A8AE3-BA0A-44CE-A12C-BB81D19628AB@active.ee>
Subject: Re: [linux-lvm] how to recover after thin pool metadata did fill up?
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


--Apple-Mail=_B1E46637-FF7D-4DC1-979C-BA68F8251606
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

Is it intended to be backported to RHEL6 kernels as well?
--=20
----------------------------------------------
Andres Toomsalu

On 18.10.2012, at 16:43, Zdenek Kabelac wrote:

> Dne 18.10.2012 15:28, Spelic napsal(a):
>> On 10/18/12 12:30, Zdenek Kabelac wrote:
>>> Dne 17.10.2012 22:21, Andres Toomsalu napsal(a):
>>>> Hi,
>>>>=20
>>>> I'm aware that thin provisioning is not yet production ready (no =
metadata
>>>> resize) - but is there a way to recover from thin pool failure when =
pool
>>>> metadata was filled up?
>>>>=20
>>>>=20
>>>=20
>>>=20
>>> Unfortunately there is no 'easy' advice for now yet - you hit =
current
>>> Achilles heel of thinp support in lvm2 - we are thinking how to make
>>> recovery usable for user - but it's not easy task since many things =
are
>>> making it very complex - so it still needs some month of work.
>>>=20
>>=20
>> So, supposing one is aware of this problem beforehand, at pool =
creation
>> can this problem be worked around by using --poolmetadatasize  to =
make a
>> metadata volume much larger than the default?
>>=20
>> And if yes, do you have any advice on the metadata size we should =
use?
>>=20
>=20
> It really depends on the pool size and use-cases.
>=20
> The max size is ~16GB for metadata.
> The reasonable max size is probably within  4GB if you want to stay =
safe in the most possible conditions.
>=20
> With 3.7 kernel and the next release of lvm2 (2.02.99) it's expected =
full support for live size extension of metadata device.
>=20
> Zdenek
>=20
>=20


--Apple-Mail=_B1E46637-FF7D-4DC1-979C-BA68F8251606
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">Is it =
intended to be backported to RHEL6 kernels as well?<br><div>
<span class=3D"Apple-style-span" style=3D"border-collapse: separate; =
color: rgb(0, 0, 0); font-family: Helvetica; font-style: normal; =
font-variant: normal; font-weight: normal; letter-spacing: normal; =
line-height: normal; orphans: 2; text-align: -webkit-auto; text-indent: =
0px; text-transform: none; white-space: normal; widows: 2; word-spacing: =
0px; -webkit-border-horizontal-spacing: 0px; =
-webkit-border-vertical-spacing: 0px; =
-webkit-text-decorations-in-effect: none; -webkit-text-size-adjust: =
auto; -webkit-text-stroke-width: 0px; font-size: medium; "><div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
">--&nbsp;</div><div style=3D"margin-top: 0px; margin-right: 0px; =
margin-bottom: 0px; margin-left: 0px; font: normal normal normal =
12px/normal Helvetica; =
">----------------------------------------------</div><div =
style=3D"margin-top: 0px; margin-right: 0px; margin-bottom: 0px; =
margin-left: 0px; font: normal normal normal 12px/normal Helvetica; =
">Andres Toomsalu</div></div></span>
</div>
<br><div><div>On 18.10.2012, at 16:43, Zdenek Kabelac wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><div>Dne =
18.10.2012 15:28, Spelic napsal(a):<br><blockquote type=3D"cite">On =
10/18/12 12:30, Zdenek Kabelac wrote:<br></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">Dne 17.10.2012 22:21, Andres =
Toomsalu napsal(a):<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite">Hi,<br></blockquote></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">I'm =
aware that thin provisioning is not yet production ready (no =
metadata<br></blockquote></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">resize) =
- but is there a way to recover from thin pool failure when =
pool<br></blockquote></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote type=3D"cite">metadata=
 was filled up?<br></blockquote></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">Unfortunately there is no 'easy' =
advice for now yet - you hit =
current<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote=
 type=3D"cite">Achilles heel of thinp support in lvm2 - we are thinking =
how to make<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">recovery usable for user - but =
it's not easy task since many things =
are<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite">making it very complex - so it still needs some month of =
work.<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote type=3D"cite">So, supposing =
one is aware of this problem beforehand, at pool =
creation<br></blockquote><blockquote type=3D"cite">can this problem be =
worked around by using --poolmetadatasize &nbsp;to make =
a<br></blockquote><blockquote type=3D"cite">metadata volume much larger =
than the default?<br></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote type=3D"cite">And if yes, do =
you have any advice on the metadata size we should =
use?<br></blockquote><blockquote type=3D"cite"><br></blockquote><br>It =
really depends on the pool size and use-cases.<br><br>The max size is =
~16GB for metadata.<br>The reasonable max size is probably within =
&nbsp;4GB if you want to stay safe in the most possible =
conditions.<br><br>With 3.7 kernel and the next release of lvm2 =
(2.02.99) it's expected full support for live size extension of metadata =
device.<br><br>Zdenek<br><br><br></div></blockquote></div><br></body></htm=
l>=

--Apple-Mail=_B1E46637-FF7D-4DC1-979C-BA68F8251606--
