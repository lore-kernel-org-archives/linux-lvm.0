Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 77050662D5
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2019 13:40:20 +0000 (UTC)
Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com
	[209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D5FD74E93F
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2019 13:40:18 +0000 (UTC)
Received: by mail-oi1-f170.google.com with SMTP id j21so1776830oii.8
	for <linux-lvm@redhat.com>; Wed, 23 Jan 2019 05:40:18 -0800 (PST)
MIME-Version: 1.0
From: Eric Ren <renzhengeek@gmail.com>
Date: Wed, 23 Jan 2019 21:40:05 +0800
Message-ID: <CAKM4Aexk-=PBRMCUvXwzHxXzWCbYL22dSo+uHFXaasVCVuKddA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f564180580203b09"
Subject: [linux-lvm] Question about thin-pool/thin LV with stripes
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

--000000000000f564180580203b09
Content-Type: text/plain; charset="UTF-8"

Hello,

I created thin LVs with 2 stripes on two PVs as follows:

```
lvcreate --yes --zero=n --type=thin-pool --name=mythinpool
--extents=90%FREE --chunksize=512K --poolmetadatasize=1G --stripes=2
--stripesize=4K vg0
...
# lvs -o+stripes -a
  LV                 VG  Attr       LSize    Pool       Origin Data%
Meta%  Move Log Cpy%Sync Convert #Str
  RootVolume         vg0 Vwi-a-t---   10.00g mythinpool        1.36
                               0
  [lvol0_pmspare]    vg0 ewi-------    2.00g
                              1
  mythinpool         vg0 twi-aot--- <175.77g                   0.08   0.79
                              1
  [mythinpool_tdata] vg0 Twi-ao---- <175.77g
                              2
  [mythinpool_tmeta] vg0 ewi-ao----    2.00g
                              1

# dmsetup table
vg0-mythinpool: 0 368607232 linear 252:2 0
vg0-RootVolume: 0 20971520 thin 252:2 1
vg0-mythinpool-tpool: 0 368607232 thin-pool 252:0 252:1 1024 71993 1
skip_block_zeroing
vg0-mythinpool_tdata: 0 368607232 striped 2 8 254:16 4458496 254:32 264192
vg0-mythinpool_tmeta: 0 4194304 linear 254:16 188762112
```

As you can see, only "mythinpool_tdata" LV has 2 stripes. Is that OK?
If I want to benefit performance from stripes, will it works for me? Or,
should I create dataLV, metadata LV, thinpool and thin LV using
step-by-step way
and specify "--stripes 2" in every steps?

Besides, is there anything I should take care of to extend the VG/thin-pool
with *striped thin-LV*
when out of space?

Any suggestion would be very appreciated, thanks in advance!

Regards,
Eric Ren

--000000000000f564180580203b09
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello,<=
div><br></div><div>I created thin LVs with 2 stripes on two PVs as follows:=
</div><div><br></div><div>```</div><div>lvcreate --yes --zero=3Dn --type=3D=
thin-pool --name=3Dmythinpool --extents=3D90%FREE --chunksize=3D512K --pool=
metadatasize=3D1G --stripes=3D2 --stripesize=3D4K vg0<br></div><div>...</di=
v><div><div># lvs -o+stripes -a</div><div>=C2=A0 LV=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0VG=C2=A0 Attr=C2=A0 =C2=A0 =C2=A0 =C2=
=A0LSize=C2=A0 =C2=A0 Pool=C2=A0 =C2=A0 =C2=A0 =C2=A0Origin Data%=C2=A0 Met=
a%=C2=A0 Move Log Cpy%Sync Convert #Str</div><div>=C2=A0 RootVolume=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0vg0 Vwi-a-t---=C2=A0 =C2=A010.00g mythinpool=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 1.36=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A00</div><div>=C2=A0 [lvol0_pmspare]=C2=A0 =C2=A0 vg0 ewi=
-------=C2=A0 =C2=A0 2.00g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 1</div><div>=C2=A0 mythinpool=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0vg0 twi-aot--- &lt;175.77g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.08=C2=A0 =C2=A00.79=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 1</div><div>=C2=A0 [mythinpool_tdata] vg0 Twi-ao---- &lt;=
175.77g=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 2</div><div>=C2=A0 [mythinpool_tmeta] vg0 ewi-ao----=C2=A0 =C2=A0 2.00g=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1</di=
v></div><div><br></div><div><div># dmsetup table</div><div>vg0-mythinpool: =
0 368607232 linear 252:2 0</div><div>vg0-RootVolume: 0 20971520 thin 252:2 =
1</div><div>vg0-mythinpool-tpool: 0 368607232 thin-pool 252:0 252:1 1024 71=
993 1 skip_block_zeroing</div><div>vg0-mythinpool_tdata: 0 368607232 stripe=
d 2 8 254:16 4458496 254:32 264192</div><div>vg0-mythinpool_tmeta: 0 419430=
4 linear 254:16 188762112</div></div><div>```</div><div><br></div><div>As y=
ou can see, only &quot;mythinpool_tdata&quot; LV has 2 stripes. Is that OK?=
</div><div>If I want to benefit performance from stripes, will it works for=
 me? Or,</div><div>should I create dataLV, metadata LV, thinpool and thin L=
V using step-by-step way</div><div>and specify &quot;--stripes 2&quot; in e=
very steps?</div><div><br></div><div>Besides, is there anything I should ta=
ke care of to extend the VG/thin-pool with *striped thin-LV*</div><div>when=
 out of space?</div><div><br></div><div>Any suggestion would be very apprec=
iated, thanks in advance!</div><div><br></div><div>Regards,=C2=A0<br></div>=
<div><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr">Eric Ren<b=
r></div></div></div></div></div></div></div>

--000000000000f564180580203b09--
