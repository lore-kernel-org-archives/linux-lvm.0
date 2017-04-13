Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F0FB760BE5
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 16:15:37 +0000 (UTC)
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2757632DD84
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 16:15:35 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id b187so70609506oif.0
	for <linux-lvm@redhat.com>; Thu, 13 Apr 2017 09:15:35 -0700 (PDT)
MIME-Version: 1.0
From: Charles Koprowski <cko@audaxis.com>
Date: Thu, 13 Apr 2017 18:14:54 +0200
Message-ID: <CABGge9ziQcu5a++kTJ-mOFEZet=W6YtuPMb4fxJGMmHRqu3Fbg@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a113df40a7beb5a054d0ea28c
Subject: [linux-lvm] ubuntu xenial + lvmlockd
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

--001a113df40a7beb5a054d0ea28c
Content-Type: text/plain; charset=UTF-8

Hi all,

I'm trying to set up a shared VG between 2 ubuntu servers (xenial) using
lvmlockd for locking.

Unfortunately, even if the default config (lvm.conf) mentions the
possibillity to use lvmlockd (use_lvmlockd = 1), I cannot find any trace of
the daemon lvmlockd or lvmlockctl tool in ubuntu.

Does anyone already done this before ?

Do I have to build lvm from source in order to use lvmlockd ?

Thanks

Regards,

Charles

--001a113df40a7beb5a054d0ea28c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi all,<div><br></div><div>I&#39;m trying to set up a shar=
ed VG between 2 ubuntu servers (xenial) using lvmlockd for locking.</div><d=
iv><br></div><div>Unfortunately, even if the default config (lvm.conf) ment=
ions the possibillity to use lvmlockd (use_lvmlockd =3D 1), I cannot find a=
ny trace of the daemon=C2=A0lvmlockd or=C2=A0lvmlockctl tool in ubuntu.</di=
v><div><br></div><div>Does anyone already done this before ?</div><div><br>=
</div><div>Do I have to build lvm from source in order to use lvmlockd ?</d=
iv><div><br></div><div>Thanks</div><div><br></div><div>Regards,</div><div><=
br></div><div>Charles<div class=3D"gmail_signature"></div>
</div></div>

--001a113df40a7beb5a054d0ea28c--
