Received: from mimecast-mx02.redhat.com
	(mimecast01.extmail.prod.ext.rdu2.redhat.com [10.11.55.17])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A6DB91018CBE
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2020 14:16:45 +0000 (UTC)
Received: from us-smtp-1.mimecast.com (us-smtp-1.mimecast.com [205.139.110.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5A04085650E
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2020 14:16:45 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id p12so6376271ljc.9
	for <linux-lvm@redhat.com>; Thu, 19 Nov 2020 06:16:38 -0800 (PST)
MIME-Version: 1.0
From: Sreyan Chakravarty <sreyan32@gmail.com>
Date: Thu, 19 Nov 2020 19:46:21 +0530
Message-ID: <CAMaziXuSe+YncMw622UAeGp_3DKtoCuz-US1yh6+tkrmDyQ4=g@mail.gmail.com>
Content-Type: multipart/alternative; boundary="00000000000031932a05b47660ae"
Subject: [linux-lvm] Unusually long boot times with LVM Snapshots
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

--00000000000031932a05b47660ae
Content-Type: text/plain; charset="UTF-8"

Hi,

I use LVM with full disk encryption. I also use LVM snapshots, currently I
have a 70GB snapshot.

Now the only problem is that the boot times when LVM snapshots are present
are extremely long.

I boot my machine, enter my encryption passphrase and then wait for about 3
minutes. It is only after that long wait does my machine boot.

This only happens if snapshots are present, if no snapshots are present,
boot is almost instantaneous after I enter my passphrase.

Will adding --skip-mappings help ?

Is there any way this can be solved ?

-- 
Regards,
Sreyan Chakravarty

--00000000000031932a05b47660ae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>I use LVM with full disk encryption=
. I also use LVM snapshots, currently I have a 70GB snapshot.</div><div><br=
></div><div>Now the only problem is that the boot times when LVM snapshots =
are present are extremely long.</div><div><br></div><div>I boot my machine,=
 enter my encryption passphrase and then wait for about 3 minutes. It is on=
ly after that long wait does my machine boot.</div><div><br></div><div>This=
 only happens if snapshots are present, if no snapshots are present, boot i=
s almost instantaneous=C2=A0after I enter my passphrase.</div><div><br></di=
v><div>Will adding --skip-mappings help ?</div><div><br></div><div>Is there=
 any way this can be solved ?</div><div><br></div>-- <br><div dir=3D"ltr" c=
lass=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr=
">Regards,<div>Sreyan Chakravarty</div></div></div></div>

--00000000000031932a05b47660ae--
