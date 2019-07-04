Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.26])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2A2681001DCD
	for <linux-lvm@redhat.com>; Thu,  4 Jul 2019 08:10:01 +0000 (UTC)
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
	[209.85.166.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A468185A07
	for <linux-lvm@redhat.com>; Thu,  4 Jul 2019 08:09:59 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id m24so1605757ioo.2
	for <linux-lvm@redhat.com>; Thu, 04 Jul 2019 01:09:59 -0700 (PDT)
MIME-Version: 1.0
From: Paul Richards <paul.richards@gmail.com>
Date: Thu, 4 Jul 2019 09:09:47 +0100
Message-ID: <CAMosweiEy7RY1URiBdxN-TxGrE+D1mBrqBev8y7PUbr1dkKekA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000022f94058cd68183"
Subject: [linux-lvm] lvmcache writeback mode and small writes
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

--000000000000022f94058cd68183
Content-Type: text/plain; charset="UTF-8"

Hello there,
I have a question about the behavior of lvmcache with respect to writes
that are smaller than the cache chunk size into chunks that are not
currently cached.

Given an lvmcache using writeback mode, 128KiB chunksize, and nothing
currently cached.

When an application does a 4KiB write followed by an fsync, what
reads/writes occur within lvmcache before the fsync is acknowledged?


Is it roughly:

1. The 128KiB cold chunk is read from the origin LV.
2. The 4KiB write is made into this chunk, and written to the cache LV.
3. Fsync acknowledged.

Or, does lvmcache avoid the read of the origin LV (step 1) by buffering the
smaller-than-chunksize write in the cache LV somewhere?  Perhaps in some
sort of dedicated journal for small writes.

--000000000000022f94058cd68183
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hello there,</div><div class=3D"gmail_default" style=3D=
"font-family:arial,helvetica,sans-serif">I have a question about the behavi=
or of lvmcache with respect to writes that are smaller than the cache chunk=
 size into chunks that are not currently cached.<br></div><div class=3D"gma=
il_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><div=
 class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif">G=
iven an lvmcache using writeback mode, 128KiB chunksize, and nothing curren=
tly cached.</div><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:arial,helvetica,sans-serif">When an application does a 4KiB write foll=
owed by an fsync, what reads/writes occur within lvmcache before the fsync =
is acknowledged?</div><div class=3D"gmail_default" style=3D"font-family:ari=
al,helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default=
" style=3D"font-family:arial,helvetica,sans-serif">Is it roughly:</div><div=
 class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><=
br></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,=
sans-serif">1. The 128KiB cold chunk is read from the origin LV.<br></div><=
div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif=
">2. The 4KiB write is made into this chunk, and written to the cache LV.<b=
r></div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,s=
ans-serif">3. Fsync acknowledged.</div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif">Or, does lvmcache =
avoid the read of the origin LV (step 1) by buffering the smaller-than-chun=
ksize write in the cache LV somewhere?=C2=A0 Perhaps in some sort of dedica=
ted journal for small writes.</div><div class=3D"gmail_default" style=3D"fo=
nt-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default=
" style=3D"font-family:arial,helvetica,sans-serif"><br></div></div>

--000000000000022f94058cd68183--
