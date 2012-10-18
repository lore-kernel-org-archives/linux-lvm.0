Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q9IDZWAU029532
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 09:35:32 -0400
Received: from awh1.active.ee (alfa.active.ee [194.204.30.36])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q9IDZSJC032263
	for <linux-lvm@redhat.com>; Thu, 18 Oct 2012 09:35:29 -0400
From: Andres Toomsalu <andres@active.ee>
Mime-Version: 1.0 (Apple Message framework v1278)
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_5CC86863-555F-496C-9F43-E65234F91BD6"
Date: Thu, 18 Oct 2012 16:35:26 +0300
In-Reply-To: <508003F1.8090308@shiftmail.org>
References: <CB12DB70-5C4F-4936-9EDE-BFF4096D064F@active.ee>
	<507FDA2E.8080301@redhat.com> <508003F1.8090308@shiftmail.org>
Message-Id: <BC370064-2BA7-4A43-9B07-9E3CF46002A6@active.ee>
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


--Apple-Mail=_5CC86863-555F-496C-9F43-E65234F91BD6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1

It has been commented that about 500MB should be enough by far - but as =
we could fill 128MB metadata easily with 1TB pool size just rewriting =
some 600GB during thin snapshot existance - I would go and reserve much =
more for metadata - so that it wont become an issue for sure. Probably =
2-5GB  for --poolmetadatasize should guarantee pool lifetime. At least =
by this time metadata area resizing should be supported I gather :)
--=20
----------------------------------------------
Andres Toomsalu

On 18.10.2012, at 16:28, Spelic wrote:

> On 10/18/12 12:30, Zdenek Kabelac wrote:
>> Dne 17.10.2012 22:21, Andres Toomsalu napsal(a):
>>> Hi,
>>>=20
>>> I'm aware that thin provisioning is not yet production ready (no =
metadata resize) - but is there a way to recover from thin pool failure =
when pool metadata was filled up?
>>>=20
>>>=20
>>=20
>>=20
>> Unfortunately there is no 'easy' advice for now yet - you hit current =
Achilles heel of thinp support in lvm2 - we are thinking how to make =
recovery usable for user - but it's not easy task since many things are =
making it very complex - so it still needs some month of work.
>>=20
>=20
> So, supposing one is aware of this problem beforehand, at pool =
creation
> can this problem be worked around by using --poolmetadatasize  to make =
a metadata volume much larger than the default?
>=20
> And if yes, do you have any advice on the metadata size we should use?
>=20
> Thank you
>=20
>=20


--Apple-Mail=_5CC86863-555F-496C-9F43-E65234F91BD6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=iso-8859-1

<html><head></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space; ">It =
has been commented that about 500MB should be enough by far - but as we =
could fill 128MB metadata easily with 1TB pool size just rewriting some =
600GB during thin snapshot existance - I would go and reserve much more =
for metadata - so that it wont become an issue for sure. Probably 2-5GB =
&nbsp;for&nbsp;--poolmetadatasize should guarantee pool lifetime. At =
least by this time metadata area resizing should be supported I gather =
:)<div>
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
<br><div><div>On 18.10.2012, at 16:28, Spelic wrote:</div><br =
class=3D"Apple-interchange-newline"><blockquote type=3D"cite"><div>On =
10/18/12 12:30, Zdenek Kabelac wrote:<br><blockquote type=3D"cite">Dne =
17.10.2012 22:21, Andres Toomsalu napsal(a):<br></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite">Hi,<br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote type=3D"cite">I'm aware that thin provisioning =
is not yet production ready (no metadata resize) - but is there a way to =
recover from thin pool failure when pool metadata was filled =
up?<br></blockquote></blockquote><blockquote type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><blockquote =
type=3D"cite"><br></blockquote></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote =
type=3D"cite"><br></blockquote><blockquote type=3D"cite">Unfortunately =
there is no 'easy' advice for now yet - you hit current Achilles heel of =
thinp support in lvm2 - we are thinking how to make recovery usable for =
user - but it's not easy task since many things are making it very =
complex - so it still needs some month of =
work.<br></blockquote><blockquote type=3D"cite"><br></blockquote><br>So, =
supposing one is aware of this problem beforehand, at pool =
creation<br>can this problem be worked around by using =
--poolmetadatasize &nbsp;to make a metadata volume much larger than the =
default?<br><br>And if yes, do you have any advice on the metadata size =
we should use?<br><br>Thank =
you<br><br><br></div></blockquote></div><br></body></html>=

--Apple-Mail=_5CC86863-555F-496C-9F43-E65234F91BD6--
