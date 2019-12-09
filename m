Received: from mimecast-mx02.redhat.com
	(mimecast03.extmail.prod.ext.rdu2.redhat.com [10.11.55.19])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E7D6C2166B29
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 14:18:48 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5FCE78CCD09
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 14:18:48 +0000 (UTC)
From: =?utf-8?Q?=C5=81ukasz_Czerpak?= <lukasz.czerpak@gmail.com>
Message-Id: <B48327FD-46A3-4E49-8A71-44B21FA912AB@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Mon, 9 Dec 2019 15:18:36 +0100
In-Reply-To: <8489c3df-e12a-f343-212b-20b2f898b642@redhat.com>
References: <D2CA32A7-3D9D-4490-9B42-89DC00E163FE@gmail.com>
	<8B290F6D-9D0B-4186-9F17-AAAB0BFA8DDA@gmail.com>
	<9ce05dc0-25f9-cf62-3d7d-3911a7df90ea@redhat.com>
	<EE5C3FCA-1A0B-4518-927D-5108F109F5AA@gmail.com>
	<8489c3df-e12a-f343-212b-20b2f898b642@redhat.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_315E4236-F80B-42F3-9D4F-F43AB9B24B23"
Subject: Re: [linux-lvm] Thin pool vg1-thinpool1-tpool (253:3)
 transaction_id is 549, while expected 505.
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

--Apple-Mail=_315E4236-F80B-42F3-9D4F-F43AB9B24B23
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

hi,

Sure, I will update the kernel as per your recommendation. Thank you for he=
lp and prompt replies!
In regards to =E2=80=9Csharing thin-pool=E2=80=9D - there are no VMs, only =
LXD that is using VG and thin-pool. After digging more I found relevant art=
icle:

https://discuss.linuxcontainers.org/t/is-it-safe-to-create-an-lvm-backed-st=
orage-pool-that-can-be-shared-with-other-logical-volumes/5658/5 <https://di=
scuss.linuxcontainers.org/t/is-it-safe-to-create-an-lvm-backed-storage-pool=
-that-can-be-shared-with-other-logical-volumes/5658/5>

This might be the reason. I will investigate it more and share results here=
.

--
pozdrawiam,
=C5=81ukasz Czerpak




> On 9 Dec 2019, at 14:59, Zdenek Kabelac <zkabelac@redhat.com> wrote:
>=20
> Dne 09. 12. 19 v 14:50 =C5=81ukasz Czerpak napsal(a):
>> hi,
>> It=E2=80=99s Ubuntu 18.04.3:
>> $ lvm version
>>   LVM version:     2.02.176(2) (2017-11-03)
>>   Library version: 1.02.145 (2017-11-03)
>>   Driver version:  4.37.0
>> $ uname -a
>> Linux gandalf 4.15.0-72-generic #81-Ubuntu SMP Tue Nov 26 12:20:02 UTC 2=
019 x86_64 x86_64 x86_64 GNU/Linux
>> It=E2=80=99s weird as same error occurred few minutes ago. I wanted to t=
ake snapshot of thin volume and it first returned the following error:
>> $ lvcreate -s --name vmail-data-snapshot vg1/vmail-data
>> Using default stripesize 64.00 KiB.
>> Can't create snapshot vmail-data-snapshot as origin vmail-data is not su=
spended.
>> Failed to suspend thin snapshot origin vg1/vmail-data.
>> Then I tried with different volume:
>> $ lvcreate -s --name owncloud-data-snapshot vg1/owncloud-data
>> Using default stripesize 64.00 KiB.
>> Thin pool vg1-thinpool1-tpool (253:2) transaction_id is 574, while expec=
ted 572.
>> Failed to suspend vg1/thinpool1 with queued messages.
>> Same error when then tried to export LXD=E2=80=99s container:
>=20
> Hi
>=20
> While I'd highly recommend to move to kernel 4.20 (at least) - from name =
of your volumes - it does look like you are using thinp in some 'cloud' env=
ironment.
>=20
> For thin-pool it's critically important to always have thin-pool active o=
nly on a single machine.  You must never run thin-pool activate on multiple=
 machines (even if one machine is not using it - but just has it active).
>=20
> So we have seen already many times user have actived thin-pool on their h=
ost machines and then passed devices into virtual machines and used there t=
he same thin-pool (so thin-pool has been activate multiple times at the sam=
e time).
>=20
> So please carefully check if this is not your case - as this would nicely=
 explain why your 'transaction_id' got so much different.
>=20
> Regards
>=20
> Zdenek


--Apple-Mail=_315E4236-F80B-42F3-9D4F-F43AB9B24B23
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D"">hi,<div class=3D""><br cla=
ss=3D""></div><div class=3D"">Sure, I will update the kernel as per your re=
commendation. Thank you for help and prompt replies!</div><div class=3D"">I=
n regards to =E2=80=9Csharing thin-pool=E2=80=9D - there are no VMs, only L=
XD that is using VG and thin-pool. After digging more I found relevant arti=
cle:</div><div class=3D""><br class=3D""></div><div class=3D""><a href=3D"h=
ttps://discuss.linuxcontainers.org/t/is-it-safe-to-create-an-lvm-backed-sto=
rage-pool-that-can-be-shared-with-other-logical-volumes/5658/5" class=3D"">=
https://discuss.linuxcontainers.org/t/is-it-safe-to-create-an-lvm-backed-st=
orage-pool-that-can-be-shared-with-other-logical-volumes/5658/5</a></div><d=
iv class=3D""><br class=3D""></div><div class=3D"">This might be the reason=
. I will investigate it more and share results here.</div><div class=3D""><=
br class=3D""><div class=3D"">
--<br class=3D"">pozdrawiam,<br class=3D"">=C5=81ukasz Czerpak<br class=3D"=
"><br class=3D""><br class=3D""><br class=3D"">
</div>
<div><br class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On=
 9 Dec 2019, at 14:59, Zdenek Kabelac &lt;<a href=3D"mailto:zkabelac@redhat=
.com" class=3D"">zkabelac@redhat.com</a>&gt; wrote:</div><br class=3D"Apple=
-interchange-newline"><div class=3D""><span style=3D"caret-color: rgb(0, 0,=
 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-vari=
ant-caps: normal; font-weight: normal; letter-spacing: normal; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; word-sp=
acing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: n=
one; display: inline !important;" class=3D"">Dne 09. 12. 19 v 14:50 =C5=81u=
kasz Czerpak napsal(a):</span><br style=3D"caret-color: rgb(0, 0, 0); font-=
family: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; tex=
t-indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px=
; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><block=
quote type=3D"cite" style=3D"font-family: Helvetica; font-size: 12px; font-=
style: normal; font-variant-caps: normal; font-weight: normal; letter-spaci=
ng: normal; orphans: auto; text-align: start; text-indent: 0px; text-transf=
orm: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-te=
xt-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: none=
;" class=3D"">hi,<br class=3D"">It=E2=80=99s Ubuntu 18.04.3:<br class=3D"">=
$ lvm version<br class=3D"">&nbsp;&nbsp;LVM version: &nbsp;&nbsp;&nbsp;&nbs=
p;2.02.176(2) (2017-11-03)<br class=3D"">&nbsp;&nbsp;Library version: 1.02.=
145 (2017-11-03)<br class=3D"">&nbsp;&nbsp;Driver version: &nbsp;4.37.0<br =
class=3D"">$ uname -a<br class=3D"">Linux gandalf 4.15.0-72-generic #81-Ubu=
ntu SMP Tue Nov 26 12:20:02 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux<br clas=
s=3D"">It=E2=80=99s weird as same error occurred few minutes ago. I wanted =
to take snapshot of thin volume and it first returned the following error:<=
br class=3D"">$ lvcreate -s --name vmail-data-snapshot vg1/vmail-data<br cl=
ass=3D"">Using default stripesize 64.00 KiB.<br class=3D"">Can't create sna=
pshot vmail-data-snapshot as origin vmail-data is not suspended.<br class=
=3D"">Failed to suspend thin snapshot origin vg1/vmail-data.<br class=3D"">=
Then I tried with different volume:<br class=3D"">$ lvcreate -s --name ownc=
loud-data-snapshot vg1/owncloud-data<br class=3D"">Using default stripesize=
 64.00 KiB.<br class=3D"">Thin pool vg1-thinpool1-tpool (253:2) transaction=
_id is 574, while expected 572.<br class=3D"">Failed to suspend vg1/thinpoo=
l1 with queued messages.<br class=3D"">Same error when then tried to export=
 LXD=E2=80=99s container:<br class=3D""></blockquote><br style=3D"caret-col=
or: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: norm=
al; font-variant-caps: normal; font-weight: normal; letter-spacing: normal;=
 text-align: start; text-indent: 0px; text-transform: none; white-space: no=
rmal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: n=
one;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Hel=
vetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fon=
t-weight: normal; letter-spacing: normal; text-align: start; text-indent: 0=
px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-t=
ext-stroke-width: 0px; text-decoration: none; float: none; display: inline =
!important;" class=3D"">Hi</span><br style=3D"caret-color: rgb(0, 0, 0); fo=
nt-family: Helvetica; font-size: 12px; font-style: normal; font-variant-cap=
s: normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; word-spacing: =
0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br=
 style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12p=
x; font-style: normal; font-variant-caps: normal; font-weight: normal; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0=
); font-family: Helvetica; font-size: 12px; font-style: normal; font-varian=
t-caps: normal; font-weight: normal; letter-spacing: normal; text-align: st=
art; text-indent: 0px; text-transform: none; white-space: normal; word-spac=
ing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none; float: non=
e; display: inline !important;" class=3D"">While I'd highly recommend to mo=
ve to kernel 4.20 (at least) - from name of your volumes - it does look lik=
e you are using thinp in some 'cloud' environment.</span><br style=3D"caret=
-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: nor=
mal; text-align: start; text-indent: 0px; text-transform: none; white-space=
: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoratio=
n: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: H=
elvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; f=
ont-weight: normal; letter-spacing: normal; text-align: start; text-indent:=
 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit=
-text-stroke-width: 0px; text-decoration: none;" class=3D""><span style=3D"=
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-st=
yle: normal; font-variant-caps: normal; font-weight: normal; letter-spacing=
: normal; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-deco=
ration: none; float: none; display: inline !important;" class=3D"">For thin=
-pool it's critically important to always have thin-pool active only on a s=
ingle machine. &nbsp;You must never run thin-pool activate on multiple mach=
ines (even if one machine is not using it - but just has it active).</span>=
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
12px; font-style: normal; font-variant-caps: normal; font-weight: normal; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 12px; font-style: normal; font-varia=
nt-caps: normal; font-weight: normal; letter-spacing: normal; text-align: s=
tart; text-indent: 0px; text-transform: none; white-space: normal; word-spa=
cing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" class=3D=
""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-s=
ize: 12px; font-style: normal; font-variant-caps: normal; font-weight: norm=
al; letter-spacing: normal; text-align: start; text-indent: 0px; text-trans=
form: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-wid=
th: 0px; text-decoration: none; float: none; display: inline !important;" c=
lass=3D"">So we have seen already many times user have actived thin-pool on=
 their host machines and then passed devices into virtual machines and used=
 there the same thin-pool (so thin-pool has been activate multiple times at=
 the same time).</span><br style=3D"caret-color: rgb(0, 0, 0); font-family:=
 Helvetica; font-size: 12px; font-style: normal; font-variant-caps: normal;=
 font-weight: normal; letter-spacing: normal; text-align: start; text-inden=
t: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -webk=
it-text-stroke-width: 0px; text-decoration: none;" class=3D""><br style=3D"=
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-st=
yle: normal; font-variant-caps: normal; font-weight: normal; letter-spacing=
: normal; text-align: start; text-indent: 0px; text-transform: none; white-=
space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-deco=
ration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-fa=
mily: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: no=
rmal; font-weight: normal; letter-spacing: normal; text-align: start; text-=
indent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; display=
: inline !important;" class=3D"">So please carefully check if this is not y=
our case - as this would nicely explain why your 'transaction_id' got so mu=
ch different.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: He=
lvetica; font-size: 12px; font-style: normal; font-variant-caps: normal; fo=
nt-weight: normal; letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; -webkit-=
text-stroke-width: 0px; text-decoration: none;" class=3D""><br style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style=
: normal; font-variant-caps: normal; font-weight: normal; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-famil=
y: Helvetica; font-size: 12px; font-style: normal; font-variant-caps: norma=
l; font-weight: normal; letter-spacing: normal; text-align: start; text-ind=
ent: 0px; text-transform: none; white-space: normal; word-spacing: 0px; -we=
bkit-text-stroke-width: 0px; text-decoration: none; float: none; display: i=
nline !important;" class=3D"">Regards</span><br style=3D"caret-color: rgb(0=
, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; font-=
variant-caps: normal; font-weight: normal; letter-spacing: normal; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cla=
ss=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; fon=
t-size: 12px; font-style: normal; font-variant-caps: normal; font-weight: n=
ormal; letter-spacing: normal; text-align: start; text-indent: 0px; text-tr=
ansform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-=
width: 0px; text-decoration: none;" class=3D""><span style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 12px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; tex=
t-align: start; text-indent: 0px; text-transform: none; white-space: normal=
; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;=
 float: none; display: inline !important;" class=3D"">Zdenek</span></div></=
blockquote></div><br class=3D""></div></body></html>
--Apple-Mail=_315E4236-F80B-42F3-9D4F-F43AB9B24B23--
