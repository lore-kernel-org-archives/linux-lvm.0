Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 60A822166B28
	for <linux-lvm@redhat.com>; Sat, 18 Jul 2020 14:28:42 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
	[205.139.110.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4199D924906
	for <linux-lvm@redhat.com>; Sat, 18 Jul 2020 14:28:42 +0000 (UTC)
Received: from [192.168.2.191] ([62.163.200.225])
	(authenticated user h.kraal@exonet.nl)
	by kerio.exonet.nl (Kerio Connect 9.2.11) with ESMTPSA
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	for linux-lvm@redhat.com; Sat, 18 Jul 2020 16:28:36 +0200
From: Henk Kraal <h.kraal@exonet.nl>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Sat, 18 Jul 2020 16:28:35 +0200
References: <0B6E7FBE-CE2B-4A2F-8560-A47218C0B511@exonet.nl>
	<20200717162032.GA12965@redhat.com>
In-Reply-To: <20200717162032.GA12965@redhat.com>
Message-Id: <CA0721F7-CC6D-44A3-BC75-E8331F96B495@exonet.nl>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_5633D129-DE75-4F92-AC89-E7810B82B9DB"
Subject: Re: [linux-lvm] Failed to update old PV extension headers in VG
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

--Apple-Mail=_5633D129-DE75-4F92-AC89-E7810B82B9DB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> On 17 Jul 2020, at 18:20, David Teigland <teigland@redhat.com> wrote:
>=20
> On Fri, Jul 17, 2020 at 09:04:32AM +0200, Henk Kraal wrote:
>> Hi all,
>>=20
>=20
>> I=E2=80=99ve run into an issue when trying to activate an LV which resid=
es on a
>> read-only loop device. When I run lvchange -a y <LV Path> I get the
>> following error:
>>=20
>>  Error writing device /dev/loop0p5 at 4096 length 512.
>>  bcache_invalidate: block (4, 0) still dirty
>>  Failed to write mda header to /dev/loop0p5 fd -1
>>  Failed to update old PV extension headers in VG recursor02-01-vg.
>>  Volume group "recursor02-01-vg" not found
>>  Cannot process volume group recursor02-01-vg
>>=20
>> I=E2=80=99ve observed this issue when using LVM version 2.03.02
>=20
>> Is there a way I can prevent the update of the extension headers when
>> activating the LV?
>=20
> I don't think there's a way to tell that version to skip the header
> update.  A more recent verson of lvm should work, and let you use the PV
> without updating the header.  It will not attempt updates from commands
> which are not otherwise updating lvm metadata.
> Dave

Hi Dave,

Thank you for confirming that skipping the header update probably isn=E2=80=
=99t possible as I expected. I just wanted to make sure I wasn=E2=80=99t go=
ing down a rabbit hole needlessly.

The older LVM headers which I=E2=80=99m dealing with are part of the OS of =
hundreds of virtual servers which I don=E2=80=99t control. My task is to ma=
ke the data on the read-only PV accesable for retrieval. A parameter to ski=
p the update would=E2=80=99t have been the best option but I guess I need f=
igure out if I can place a (temporary) writeable layer on top of the device=
 to work around this.

Off course I=E2=80=99m open to idea=E2=80=99s if they come to the table ;)

With kind regards,

Henk


--Apple-Mail=_5633D129-DE75-4F92-AC89-E7810B82B9DB
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D""><br class=3D""><div><br cl=
ass=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On 17 Jul 202=
0, at 18:20, David Teigland &lt;<a href=3D"mailto:teigland@redhat.com" clas=
s=3D"">teigland@redhat.com</a>&gt; wrote:</div><br class=3D"Apple-interchan=
ge-newline"><div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-=
family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration: none; float: none; displ=
ay: inline !important;" class=3D"">On Fri, Jul 17, 2020 at 09:04:32AM +0200=
, Henk Kraal wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-fami=
ly: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norm=
al; font-weight: normal; letter-spacing: normal; text-align: start; text-in=
dent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -w=
ebkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><blockquot=
e type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; orphans: auto; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-s=
ize-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none;" c=
lass=3D"">Hi all,<br class=3D""><br class=3D""></blockquote><br style=3D"ca=
ret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-styl=
e: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; white-sp=
ace: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decora=
tion: none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: Hel=
vetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; orphans: auto; text-align: start;=
 text-indent: 0px; text-transform: none; white-space: normal; widows: auto;=
 word-spacing: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-wid=
th: 0px; text-decoration: none;" class=3D"">I=E2=80=99ve run into an issue =
when trying to activate an LV which resides on a<br class=3D"">read-only lo=
op device. When I run lvchange -a y &lt;LV Path&gt; I get the<br class=3D""=
>following error:<br class=3D""><br class=3D"">&nbsp;Error writing device /=
dev/loop0p5 at 4096 length 512.<br class=3D"">&nbsp;bcache_invalidate: bloc=
k (4, 0) still dirty<br class=3D"">&nbsp;Failed to write mda header to /dev=
/loop0p5 fd -1<br class=3D"">&nbsp;Failed to update old PV extension header=
s in VG recursor02-01-vg.<br class=3D"">&nbsp;Volume group "recursor02-01-v=
g" not found<br class=3D"">&nbsp;Cannot process volume group recursor02-01-=
vg<br class=3D""><br class=3D"">I=E2=80=99ve observed this issue when using=
 LVM version 2.03.02<br class=3D""></blockquote><br style=3D"caret-color: r=
gb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; f=
ont-variant-caps: normal; font-weight: normal; letter-spacing: normal; text=
-align: start; text-indent: 0px; text-transform: none; white-space: normal;=
 word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;"=
 class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; font=
-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: no=
rmal; letter-spacing: normal; orphans: auto; text-align: start; text-indent=
: 0px; text-transform: none; white-space: normal; widows: auto; word-spacin=
g: 0px; -webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; tex=
t-decoration: none;" class=3D"">Is there a way I can prevent the update of =
the extension headers when<br class=3D"">activating the LV?<br class=3D""><=
/blockquote><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica;=
 font-size: 12px; font-style: normal; font-variant-caps: normal; font-weigh=
t: normal; letter-spacing: normal; text-align: start; text-indent: 0px; tex=
t-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-str=
oke-width: 0px; text-decoration: none;" class=3D""><span style=3D"caret-col=
or: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norm=
al; font-variant-caps: normal; font-weight: normal; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: n=
one; float: none; display: inline !important;" class=3D"">I don't think the=
re's a way to tell that version to skip the header</span><br style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoratio=
n: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none; float: none; display: inl=
ine !important;" class=3D"">update. &nbsp;A more recent verson of lvm shoul=
d work, and let you use the PV</span><br style=3D"caret-color: rgb(0, 0, 0)=
; font-family: Helvetica; font-size: 12px; font-style: normal; font-variant=
-caps: normal; font-weight: normal; letter-spacing: normal; text-align: sta=
rt; text-indent: 0px; text-transform: none; white-space: normal; word-spaci=
ng: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""=
><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 12px; font-style: normal; font-variant-caps: normal; font-weight: normal=
; letter-spacing: normal; text-align: start; text-indent: 0px; text-transfo=
rm: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width=
: 0px; text-decoration: none; float: none; display: inline !important;" cla=
ss=3D"">without updating the header. &nbsp;It will not attempt updates from=
 commands</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 12px; font-style: normal; font-variant-caps: normal; font-w=
eight: normal; letter-spacing: normal; text-align: start; text-indent: 0px;=
 text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text=
-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoratio=
n: none; float: none; display: inline !important;" class=3D"">which are not=
 otherwise updating lvm metadata.</span><br style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=
=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none; float: none; display: inline !important;=
" class=3D"">Dave</span><br style=3D"caret-color: rgb(0, 0, 0); font-family=
: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal=
; font-weight: normal; letter-spacing: normal; text-align: start; text-inde=
nt: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -web=
kit-text-stroke-width: 0px; text-decoration: none;" class=3D""></div></bloc=
kquote><br class=3D""></div><div>Hi Dave,</div><div><br class=3D""></div><d=
iv>Thank you for confirming that skipping the header update probably isn=E2=
=80=99t possible as I expected. I just wanted to make sure I wasn=E2=80=99t=
 going down a rabbit hole needlessly.</div><div><br class=3D""></div><div>T=
he older LVM headers which I=E2=80=99m dealing with are part of the OS of h=
undreds of virtual servers which I don=E2=80=99t control. My task is to mak=
e the data on the read-only PV accesable for retrieval. A parameter to skip=
 the update would=E2=80=99t have been the best option but I guess I need fi=
gure out if I can place a (temporary) writeable layer on top of the device =
to work around this.</div><div><br class=3D""></div><div>Off course I=E2=80=
=99m open to idea=E2=80=99s if they come to the table ;)</div><div><br clas=
s=3D""></div><div>With kind regards,</div><div><br class=3D""></div><div>He=
nk</div><br class=3D""></body></html>
--Apple-Mail=_5633D129-DE75-4F92-AC89-E7810B82B9DB--
