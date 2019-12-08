Received: from mimecast-mx02.redhat.com
	(mimecast05.extmail.prod.ext.rdu2.redhat.com [10.11.55.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id CCF0B884E2
	for <linux-lvm@redhat.com>; Sun,  8 Dec 2019 20:47:26 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6290A9018F8
	for <linux-lvm@redhat.com>; Sun,  8 Dec 2019 20:47:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id p17so12700328wmi.3
	for <linux-lvm@redhat.com>; Sun, 08 Dec 2019 12:47:23 -0800 (PST)
Received: from [192.168.200.100] (80.49.186.102.ipv4.supernova.orange.pl.
	[80.49.186.102]) by smtp.gmail.com with ESMTPSA id
	z12sm11274867wmd.16.2019.12.08.12.47.21 for <linux-lvm@redhat.com>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 08 Dec 2019 12:47:22 -0800 (PST)
From: =?utf-8?Q?=C5=81ukasz_Czerpak?= <lukasz.czerpak@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Date: Sun, 8 Dec 2019 21:47:20 +0100
References: <D2CA32A7-3D9D-4490-9B42-89DC00E163FE@gmail.com>
In-Reply-To: <D2CA32A7-3D9D-4490-9B42-89DC00E163FE@gmail.com>
Message-Id: <8B290F6D-9D0B-4186-9F17-AAAB0BFA8DDA@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_4A4B5E56-BF4E-44E4-BDC5-0C029752A8B6"
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
To: linux-lvm@redhat.com

--Apple-Mail=_4A4B5E56-BF4E-44E4-BDC5-0C029752A8B6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

After googling a lot I figure out what to do and it worked - at least I can=
 access the most critical data.
I=E2=80=99ve followed instructions from this blog post: https://blog.monoto=
k.org/lvm-transaction-id-mismatch-and-metadata-resize-error/ <https://blog.=
monotok.org/lvm-transaction-id-mismatch-and-metadata-resize-error/>

However, I have no idea what was the root cause of this. I hope I can fully=
 recover the volumes w/o re-creating the whole VG.
In case I did something terribly wrong that looked like the solution now, b=
ut may cause issues in future - I would appreciate any hints.


=E2=80=94
Best Regards,
=C5=81ukasz Czerpak




> On 8 Dec 2019, at 20:35, =C5=81ukasz Czerpak <lukasz.czerpak@gmail.com> w=
rote:
>=20
> Hi,
>=20
> I cannot get my LVM working.=20
>=20
> The structure is as follows:
>=20
> vg1 -> thinpool1 -> 11x lvs
>=20
> I extended size of one of child LVs, after that ran xfs_growfs which got =
stuck. After 1hr I did cold reboot and thinpool reported the following:
>=20
> $ lvchange -ay vg1
> WARNING: Not using lvmetad because a repair command was run.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expect=
ed 505.
>=20
>=20
> I tried lvconvert =E2=80=94repair vg1/thinpool1 but it always throws tran=
saction id mismatch error:
>=20
> $ lvconvert --repair vg1/thinpool1
> WARNING: Disabling lvmetad cache for repair command.
> WARNING: Not using lvmetad because of repair.
> Transaction id 505 from pool "vg1/thinpool1" does not match repaired tran=
saction id 549 from /dev/mapper/vg1-lvol2_pmspare.
> WARNING: LV vg1/thinpool1_meta3 holds a backup of the unrepaired metadata=
. Use lvremove when no longer required.
> WARNING: New metadata LV vg1/thinpool1_tmeta might use different PVs.  Mo=
ve it with pvmove if required.
>=20
> I have no idea on how to proceed and more importantly *how to access/reco=
ver data in LVs*. I desperately looking for any help :(
>=20
> =E2=80=94
> Best regards,
> =C5=81ukasz Czerpak
>=20
>=20
>=20


--Apple-Mail=_4A4B5E56-BF4E-44E4-BDC5-0C029752A8B6
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html; charset=UTF-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; charset=
=3Dutf-8"></head><body style=3D"word-wrap: break-word; -webkit-nbsp-mode: s=
pace; line-break: after-white-space;" class=3D"">After googling a lot I fig=
ure out what to do and it worked - at least I can access the most critical =
data.<div class=3D"">I=E2=80=99ve followed instructions from this blog post=
:&nbsp;<a href=3D"https://blog.monotok.org/lvm-transaction-id-mismatch-and-=
metadata-resize-error/" class=3D"">https://blog.monotok.org/lvm-transaction=
-id-mismatch-and-metadata-resize-error/</a></div><div class=3D""><br class=
=3D""></div><div class=3D"">However, I have no idea what was the root cause=
 of this. I hope I can fully recover the volumes w/o re-creating the whole =
VG.</div><div class=3D"">In case I did something terribly wrong that looked=
 like the solution now, but may cause issues in future - I would appreciate=
 any hints.</div><div class=3D""><br class=3D""></div><div class=3D""><br c=
lass=3D""><div class=3D"">
=E2=80=94<br class=3D"">Best Regards,<br class=3D"">=C5=81ukasz Czerpak<br =
class=3D""><br class=3D""><br class=3D""><br class=3D"">
</div>
<div><br class=3D""><blockquote type=3D"cite" class=3D""><div class=3D"">On=
 8 Dec 2019, at 20:35, =C5=81ukasz Czerpak &lt;<a href=3D"mailto:lukasz.cze=
rpak@gmail.com" class=3D"">lukasz.czerpak@gmail.com</a>&gt; wrote:</div><br=
 class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Hi,<br=
 class=3D""><br class=3D"">I cannot get my LVM working. <br class=3D""><br =
class=3D"">The structure is as follows:<br class=3D""><br class=3D"">vg1 -&=
gt; thinpool1 -&gt; 11x lvs<br class=3D""><br class=3D"">I extended size of=
 one of child LVs, after that ran xfs_growfs which got stuck. After 1hr I d=
id cold reboot and thinpool reported the following:<br class=3D""><br class=
=3D"">$ lvchange -ay vg1<br class=3D""> WARNING: Not using lvmetad because =
a repair command was run.<br class=3D""> Thin pool vg1-thinpool1-tpool (253=
:3) transaction_id is 549, while expected 505.<br class=3D""> Thin pool vg1=
-thinpool1-tpool (253:3) transaction_id is 549, while expected 505.<br clas=
s=3D""> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while =
expected 505.<br class=3D""> Thin pool vg1-thinpool1-tpool (253:3) transact=
ion_id is 549, while expected 505.<br class=3D""> Thin pool vg1-thinpool1-t=
pool (253:3) transaction_id is 549, while expected 505.<br class=3D""> Thin=
 pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while expected 505=
.<br class=3D""> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 54=
9, while expected 505.<br class=3D""> Thin pool vg1-thinpool1-tpool (253:3)=
 transaction_id is 549, while expected 505.<br class=3D""> Thin pool vg1-th=
inpool1-tpool (253:3) transaction_id is 549, while expected 505.<br class=
=3D""> Thin pool vg1-thinpool1-tpool (253:3) transaction_id is 549, while e=
xpected 505.<br class=3D""> Thin pool vg1-thinpool1-tpool (253:3) transacti=
on_id is 549, while expected 505.<br class=3D""> Thin pool vg1-thinpool1-tp=
ool (253:3) transaction_id is 549, while expected 505.<br class=3D""><br cl=
ass=3D""><br class=3D"">I tried lvconvert =E2=80=94repair vg1/thinpool1 but=
 it always throws transaction id mismatch error:<br class=3D""><br class=3D=
"">$ lvconvert --repair vg1/thinpool1<br class=3D""> WARNING: Disabling lvm=
etad cache for repair command.<br class=3D""> WARNING: Not using lvmetad be=
cause of repair.<br class=3D""> Transaction id 505 from pool "vg1/thinpool1=
" does not match repaired transaction id 549 from /dev/mapper/vg1-lvol2_pms=
pare.<br class=3D""> WARNING: LV vg1/thinpool1_meta3 holds a backup of the =
unrepaired metadata. Use lvremove when no longer required.<br class=3D""> W=
ARNING: New metadata LV vg1/thinpool1_tmeta might use different PVs. &nbsp;=
Move it with pvmove if required.<br class=3D""><br class=3D"">I have no ide=
a on how to proceed and more importantly *how to access/recover data in LVs=
*. I desperately looking for any help :(<br class=3D""><br class=3D"">=E2=
=80=94<br class=3D"">Best regards,<br class=3D"">=C5=81ukasz Czerpak<br cla=
ss=3D""><br class=3D""><br class=3D""><br class=3D""></div></div></blockquo=
te></div><br class=3D""></div></body></html>
--Apple-Mail=_4A4B5E56-BF4E-44E4-BDC5-0C029752A8B6--
