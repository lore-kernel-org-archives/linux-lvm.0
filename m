Received: from mimecast-mx02.redhat.com
	(mimecast02.extmail.prod.ext.rdu2.redhat.com [10.11.55.18])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0CCF12026D25
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2020 12:04:27 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [207.211.31.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9685480120A
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2020 12:04:27 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id o8so13204295ioh.0
	for <linux-lvm@redhat.com>; Tue, 24 Nov 2020 04:04:24 -0800 (PST)
MIME-Version: 1.0
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Tue, 24 Nov 2020 17:34:12 +0530
Message-ID: <CAMaziXssM=DVD1qLEhqmVpZmepn-GpA2KgGm8BcDuthbtM+gQQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000008c37ad05b4d91cef"
Subject: [linux-lvm] System bricked after moving to thin snapshots
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

--0000000000008c37ad05b4d91cef
Content-Type: text/plain; charset="UTF-8"

Hi,

I have cloned my original root LVM, and then migrated to the newer thin
LVMs using partclone.

Both backup and restore went off without causing any problems.

But when I am now trying to boot into my system, it asks for the encryption
LUKS passphrase but after that I am getting:

              dracut-initqueue[300]: Warning: dracut-initqueue timeout  -
starting timeout scripts

This are my current logical volumes:

#  lvs

 LV     VG       Attr       LSize   Pool   Origin Data%  Meta%  Move Log
Cpy%Sync Convert
  fedora vgfedora Vwi-a-tz-- 700.00g pool00        16.61

  pool00 vgfedora twi-aotz-- 929.75g               12.50  16.61


I keep getting the error:

Scanning devices dm-0  for LVM logical volumes vgfedora/fedora
inactive '/dev/vgfedora/pool00' [929.75 GiB] inherit
inactive '/dev/vgfedora/fedora' [700.00 GiB] inherit
 modprobe: FATAL: Module dm-thin-pool not found in directory
/lib/modules/5.8.18-200.fc32.x86_64
/usr/sbin/modprobe failed: 1
Can't process LV vgfedora/fedora: thin target support missing from kernel?

I have marked the logical volumes as active via :
          lvchange -kn vgfedora/pool00
          lvchange -kn vgfedora/fedora

How can I add the dm-thin-pool module ? I can't even boot.

Please let me know if any other info is required from my side.

Need some help as I am unable to use my laptop.

-- 
Regards,
Sreyan Chakravarty

--0000000000008c37ad05b4d91cef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi,</div><div><br></div><div>I have cloned my origina=
l root LVM, and then migrated to the newer thin LVMs using partclone.</div>=
<div><br></div><div>Both backup and restore went off without causing any pr=
oblems.<br></div><div><br></div><div>But when I am now trying to boot into =
my system, it asks for the encryption LUKS passphrase but after that I am g=
etting:</div><div><br></div><div>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dracut-initqueue[300]: Warning: dracut=
-initqueue timeout=C2=A0 -=C2=A0 starting timeout scripts</div><div><br></d=
iv><div>This are my current logical volumes:</div><div><br></div><div>#=C2=
=A0 lvs</div><div><br></div><div>=C2=A0LV =C2=A0 =C2=A0 VG =C2=A0 =C2=A0 =
=C2=A0 Attr =C2=A0 =C2=A0 =C2=A0 LSize =C2=A0 Pool =C2=A0 Origin Data% =C2=
=A0Meta% =C2=A0Move Log Cpy%Sync Convert<br>=C2=A0 fedora vgfedora Vwi-a-tz=
-- 700.00g pool00 =C2=A0 =C2=A0 =C2=A0 =C2=A016.61 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0<br>=C2=A0 pool00 vgfedora twi-aotz-- 929.75g =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 12.50 =C2=A016.61=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0</div><div><br></div><div>I keep getting the error:</div><div><br=
></div><div>Scanning devices dm-0 =C2=A0for LVM logical volumes vgfedora/fe=
dora<br>inactive &#39;/dev/vgfedora/pool00&#39; [929.75 GiB] inherit<br>ina=
ctive &#39;/dev/vgfedora/fedora&#39; [700.00 GiB] inherit<br>=C2=A0modprobe=
: FATAL: Module dm-thin-pool not found in directory /lib/modules/5.8.18-200=
.fc32.x86_64<br>/usr/sbin/modprobe failed: 1<br>Can&#39;t process LV vgfedo=
ra/fedora: thin target support missing from kernel?<br></div><div><br></div=
><div>I have marked the logical volumes as active via :</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lvchange -kn vgfedora/pool00</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 lvchange -kn vgfedora/fedora</div><div><br></di=
v><div>How can I add the dm-thin-pool module ? I can&#39;t even boot.</div>=
<div><br></div><div>Please let me know if any other info is required from m=
y side.</div><div><br></div><div>Need some help as I am unable to use my la=
ptop.</div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmail_signature"=
 data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Regards,<div>Sreyan Ch=
akravarty</div></div></div></div>

--0000000000008c37ad05b4d91cef--
