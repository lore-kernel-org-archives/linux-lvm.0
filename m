Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 696DE10AD6A3
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 13:52:47 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 507C9900338
	for <linux-lvm@redhat.com>; Mon,  9 Dec 2019 13:52:47 +0000 (UTC)
From: =?utf-8?Q?=C5=81ukasz_Czerpak?= <lukasz.czerpak@gmail.com>
Message-Id: <851BBC6E-89DF-443F-B3D0-F1097F698105@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Mon, 9 Dec 2019 14:52:42 +0100
In-Reply-To: <EE5C3FCA-1A0B-4518-927D-5108F109F5AA@gmail.com>
References: <D2CA32A7-3D9D-4490-9B42-89DC00E163FE@gmail.com>
	<8B290F6D-9D0B-4186-9F17-AAAB0BFA8DDA@gmail.com>
	<9ce05dc0-25f9-cf62-3d7d-3911a7df90ea@redhat.com>
	<EE5C3FCA-1A0B-4518-927D-5108F109F5AA@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D90AE331-D83D-4F72-87BC-3BB1FC4636A8"
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

--Apple-Mail=_D90AE331-D83D-4F72-87BC-3BB1FC4636A8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Forgot to paste ticket about lxd and out of date information: https://githu=
b.com/lxc/lxd/issues/4445 <https://github.com/lxc/lxd/issues/4445>

--
pozdrawiam,
=C5=81ukasz Czerpak




> On 9 Dec 2019, at 14:50, =C5=81ukasz Czerpak <lukasz.czerpak@gmail.com> w=
rote:
>=20
> hi,
>=20
> It=E2=80=99s Ubuntu 18.04.3:
>=20
> $ lvm version
>  LVM version:     2.02.176(2) (2017-11-03)
>  Library version: 1.02.145 (2017-11-03)
>  Driver version:  4.37.0
>=20
> $ uname -a
> Linux gandalf 4.15.0-72-generic #81-Ubuntu SMP Tue Nov 26 12:20:02 UTC 20=
19 x86_64 x86_64 x86_64 GNU/Linux
>=20
> It=E2=80=99s weird as same error occurred few minutes ago. I wanted to ta=
ke snapshot of thin volume and it first returned the following error:
>=20
> $ lvcreate -s --name vmail-data-snapshot vg1/vmail-data                  =
                                                                           =
                                         =20
> Using default stripesize 64.00 KiB.                                      =
                                                                           =
                                       =20
> Can't create snapshot vmail-data-snapshot as origin vmail-data is not sus=
pended.                                                                    =
                                       =20
> Failed to suspend thin snapshot origin vg1/vmail-data.
>=20
> Then I tried with different volume:
>=20
> $ lvcreate -s --name owncloud-data-snapshot vg1/owncloud-data            =
                                                                           =
                                         =20
> Using default stripesize 64.00 KiB.
> Thin pool vg1-thinpool1-tpool (253:2) transaction_id is 574, while expect=
ed 572.
> Failed to suspend vg1/thinpool1 with queued messages.
>=20
> Same error when then tried to export LXD=E2=80=99s container:
>=20
> $ lvcreate -s --name owncloud-data-snapshot vg1/owncloud-data
>  Using default stripesize 64.00 KiB.
>  Thin pool vg1-thinpool1-tpool (253:2) transaction_id is 574, while expec=
ted 572.
>  Failed to suspend vg1/thinpool1 with queued messages.
>=20
> I did vgcfgbackup and transaction_id for thinpool1 was 573. I really don=
=E2=80=99t know what=E2=80=99s going on.
> Wondering if this might be caused by LXD running as snap which is known t=
o not interact with system's lvmetad and thus giving out of date informatio=
n. LXD is configured to use thinpool1 as storage.
>=20
> Maybe after I did vgcfgbackup, updated mismatching transaction_id and res=
tored with vgcfgrestore, I got access to data and fake impression all was f=
ixed.
>=20
> =E2=80=94
> Best Regards,
> =C5=81ukasz Czerpak
>=20
>=20
>=20
>=20
>> On 9 Dec 2019, at 14:36, Zdenek Kabelac <zkabelac@redhat.com> wrote:
>>=20
>> Dne 08. 12. 19 v 21:47 =C5=81ukasz Czerpak napsal(a):
>>> After googling a lot I figure out what to do and it worked - at least I=
 can access the most critical data.
>>> I=E2=80=99ve followed instructions from this blog post: https://blog.mo=
notok.org/lvm-transaction-id-mismatch-and-metadata-resize-error/
>>> However, I have no idea what was the root cause of this. I hope I can f=
ully recover the volumes w/o re-creating the whole VG.
>>> In case I did something terribly wrong that looked like the solution no=
w, but may cause issues in future - I would appreciate any hints.
>>>>=20
>>>> $ lvchange -ay vg1
>>>> WARNING: Not using lvmetad because a repair command was run.
>>>> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while exp=
ected 505.
>>=20
>> Hi
>>=20
>> What's been you lvm2 & kernel version ?
>>=20
>> This difference is too big for 'recent' versions - there should never be=
 more
>> then one - unless you are using old kernel & old lvm2.
>>=20
>> Regards
>>=20
>> Zdenek
>>=20
>=20


--Apple-Mail=_D90AE331-D83D-4F72-87BC-3BB1FC4636A8
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D"">Forgot to paste ticket abo=
ut lxd and out of date information:&nbsp;<a href=3D"https://github.com/lxc/=
lxd/issues/4445" class=3D"">https://github.com/lxc/lxd/issues/4445</a><div =
class=3D""><br class=3D""><div class=3D"">
--<br class=3D"">pozdrawiam,<br class=3D"">=C5=81ukasz Czerpak<br class=3D"=
"><br class=3D""><br class=3D""><br class=3D"">
</div>
<div><br class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On=
 9 Dec 2019, at 14:50, =C5=81ukasz Czerpak &lt;<a href=3D"mailto:lukasz.cze=
rpak@gmail.com" class=3D"">lukasz.czerpak@gmail.com</a>&gt; wrote:</div><br=
 class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">hi,<br=
 class=3D""><br class=3D"">It=E2=80=99s Ubuntu 18.04.3:<br class=3D""><br c=
lass=3D"">$ lvm version<br class=3D""> &nbsp;LVM version: &nbsp;&nbsp;&nbsp=
;&nbsp;2.02.176(2) (2017-11-03)<br class=3D""> &nbsp;Library version: 1.02.=
145 (2017-11-03)<br class=3D""> &nbsp;Driver version: &nbsp;4.37.0<br class=
=3D""><br class=3D"">$ uname -a<br class=3D"">Linux gandalf 4.15.0-72-gener=
ic #81-Ubuntu SMP Tue Nov 26 12:20:02 UTC 2019 x86_64 x86_64 x86_64 GNU/Lin=
ux<br class=3D""><br class=3D"">It=E2=80=99s weird as same error occurred f=
ew minutes ago. I wanted to take snapshot of thin volume and it first retur=
ned the following error:<br class=3D""><br class=3D"">$ lvcreate -s --name =
vmail-data-snapshot vg1/vmail-data &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;<br class=3D"">Using default stripesize 64.00 KiB. &nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;<br class=3D"">Can't create snapshot vmail-data-snapshot as origin vmail-=
data is not suspended. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br class=
=3D"">Failed to suspend thin snapshot origin vg1/vmail-data.<br class=3D"">=
<br class=3D"">Then I tried with different volume:<br class=3D""><br class=
=3D"">$ lvcreate -s --name owncloud-data-snapshot vg1/owncloud-data &nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;<br class=3D"">Using default stripesize 64.00 KiB.<br class=3D""=
>Thin pool vg1-thinpool1-tpool (253:2) transaction_id is 574, while expecte=
d 572.<br class=3D"">Failed to suspend vg1/thinpool1 with queued messages.<=
br class=3D""><br class=3D"">Same error when then tried to export LXD=E2=80=
=99s container:<br class=3D""><br class=3D"">$ lvcreate -s --name owncloud-=
data-snapshot vg1/owncloud-data<br class=3D""> &nbsp;Using default stripesi=
ze 64.00 KiB.<br class=3D""> &nbsp;Thin pool vg1-thinpool1-tpool (253:2) tr=
ansaction_id is 574, while expected 572.<br class=3D""> &nbsp;Failed to sus=
pend vg1/thinpool1 with queued messages.<br class=3D""><br class=3D"">I did=
 vgcfgbackup and transaction_id for thinpool1 was 573. I really don=E2=80=
=99t know what=E2=80=99s going on.<br class=3D"">Wondering if this might be=
 caused by LXD running as snap which is known to not interact with system's=
 lvmetad and thus giving out of date information. LXD is configured to use =
thinpool1 as storage.<br class=3D""><br class=3D"">Maybe after I did vgcfgb=
ackup, updated mismatching transaction_id and restored with vgcfgrestore, I=
 got access to data and fake impression all was fixed.<br class=3D""><br cl=
ass=3D"">=E2=80=94<br class=3D"">Best Regards,<br class=3D"">=C5=81ukasz Cz=
erpak<br class=3D""><br class=3D""><br class=3D""><br class=3D""><br class=
=3D""><blockquote type=3D"cite" class=3D"">On 9 Dec 2019, at 14:36, Zdenek =
Kabelac &lt;<a href=3D"mailto:zkabelac@redhat.com" class=3D"">zkabelac@redh=
at.com</a>&gt; wrote:<br class=3D""><br class=3D"">Dne 08. 12. 19 v 21:47 =
=C5=81ukasz Czerpak napsal(a):<br class=3D""><blockquote type=3D"cite" clas=
s=3D"">After googling a lot I figure out what to do and it worked - at leas=
t I can access the most critical data.<br class=3D"">I=E2=80=99ve followed =
instructions from this blog post: <a href=3D"https://blog.monotok.org/lvm-t=
ransaction-id-mismatch-and-metadata-resize-error/" class=3D"">https://blog.=
monotok.org/lvm-transaction-id-mismatch-and-metadata-resize-error/</a><br c=
lass=3D"">However, I have no idea what was the root cause of this. I hope I=
 can fully recover the volumes w/o re-creating the whole VG.<br class=3D"">=
In case I did something terribly wrong that looked like the solution now, b=
ut may cause issues in future - I would appreciate any hints.<br class=3D""=
><blockquote type=3D"cite" class=3D""><br class=3D"">$ lvchange -ay vg1<br =
class=3D"">WARNING: Not using lvmetad because a repair command was run.<br =
class=3D"">Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, whi=
le expected 505.<br class=3D""></blockquote></blockquote><br class=3D"">Hi<=
br class=3D""><br class=3D"">What's been you lvm2 &amp; kernel version ?<br=
 class=3D""><br class=3D"">This difference is too big for 'recent' versions=
 - there should never be more<br class=3D"">then one - unless you are using=
 old kernel &amp; old lvm2.<br class=3D""><br class=3D"">Regards<br class=
=3D""><br class=3D"">Zdenek<br class=3D""><br class=3D""></blockquote><br c=
lass=3D""></div></div></blockquote></div><br class=3D""></div></body></html=
>
--Apple-Mail=_D90AE331-D83D-4F72-87BC-3BB1FC4636A8--
