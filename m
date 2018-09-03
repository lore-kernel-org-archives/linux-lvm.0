Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E3B72010CF1
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2018 09:04:49 +0000 (UTC)
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com
	[209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9DAB883F3C
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2018 09:04:48 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id j8-v6so751196ybg.9
	for <linux-lvm@redhat.com>; Mon, 03 Sep 2018 02:04:48 -0700 (PDT)
MIME-Version: 1.0
From: Oleksandr Panchuk <panolex@gmail.com>
Date: Mon, 3 Sep 2018 12:04:36 +0300
Message-ID: <CAAjPMgNf6RWUHidgpDC_8Jo7q6GN7u2bgU3nk7nMtKq_URN6JQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary="0000000000004b10410574f3d5f8"
Subject: [linux-lvm] Prepend LV
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

--0000000000004b10410574f3d5f8
Content-Type: text/plain; charset="UTF-8"

Hello, All

I have not found any documentation about how to prepend LV with some free
space
.
Possible use case - we have LV with filesystem and data on it. But to
migrate this LV to KVM virtual machine we need to craft partition inside
this LV with already existing data.

I know it is possible to create new LV and copy data here, but it could be
time consuming for big LVs.

So, Is there any way to prepend LV with some free space ?

Thanks in advance,
Alex

--0000000000004b10410574f3d5f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello, All<div><br></div><div>I have not found any documen=
tation about how to prepend LV with some free space</div><div>.</div><div>P=
ossible use case - we have LV with filesystem and data on it. But to migrat=
e this LV to KVM virtual machine we need to craft partition inside this LV =
with already existing data.</div><div><br></div><div>I know it is possible =
to create new LV and copy data here, but it could be time consuming for big=
 LVs.</div><div><br></div><div>So, Is there any way to prepend LV with some=
 free space ?</div><div><br></div><div>Thanks in advance,</div><div>Alex</d=
iv></div>

--0000000000004b10410574f3d5f8--
