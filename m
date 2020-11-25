Received: from mimecast-mx02.redhat.com
	(mimecast06.extmail.prod.ext.rdu2.redhat.com [10.11.55.22])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 097E4A9FB9
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 15:37:24 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EEC9D185A794
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 15:37:23 +0000 (UTC)
Received: by mail-io1-f46.google.com with SMTP id r1so2498531iob.13
	for <linux-lvm@redhat.com>; Wed, 25 Nov 2020 07:37:19 -0800 (PST)
MIME-Version: 1.0
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Wed, 25 Nov 2020 21:07:07 +0530
Message-ID: <CAMaziXsttreCZ28V3aw1srY17HFawW_g2DZjvDHSpa+5EeSQag@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000dc3d8105b4f033c6"
Subject: [linux-lvm] Is TRIM and DISCARD needed for normal HDD ?
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

--000000000000dc3d8105b4f033c6
Content-Type: text/plain; charset="UTF-8"

Hi,

I am using thin LVM pools, but I have a normal hard disk and not a SSD.

Is there any reason to enable TRIM and/or DISCARD for my HDD ?

I have heard it is only useful for a SSD. Will it offer any advantages in
my case ?

-- 
Regards,
Sreyan Chakravarty

--000000000000dc3d8105b4f033c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I am using thin LVM pools, but I ha=
ve a normal hard disk and not a SSD.</div><div><br></div><div>Is there any =
reason to enable TRIM and/or DISCARD for my HDD ?</div><div><br></div><div>=
I have heard it is only=C2=A0useful for a SSD. Will it offer any advantages=
 in my case ?<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Re=
gards,<div>Sreyan Chakravarty</div></div></div></div></div>

--000000000000dc3d8105b4f033c6--
