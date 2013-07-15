Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r6F5lINY012672
	for <linux-lvm@redhat.com>; Mon, 15 Jul 2013 01:47:18 -0400
Received: from mail-vb0-f49.google.com (mail-vb0-f49.google.com
	[209.85.212.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r6F5lH99003228
	for <linux-lvm@redhat.com>; Mon, 15 Jul 2013 01:47:17 -0400
Received: by mail-vb0-f49.google.com with SMTP id 12so2805369vbf.8
	for <linux-lvm@redhat.com>; Sun, 14 Jul 2013 22:47:17 -0700 (PDT)
MIME-Version: 1.0
From: Raymond Jennings <shentino@gmail.com>
Date: Sun, 14 Jul 2013 22:46:36 -0700
Message-ID: <CAGDaZ_r8xmDOMTr17CVUh3WJMwkgUYcrYWYfMfBPTiDQvt7LEQ@mail.gmail.com>
Content-Type: multipart/alternative; boundary=089e013cbd3ea4b4b204e18664f6
Subject: [linux-lvm] Mirroring to a thin volume
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

--089e013cbd3ea4b4b204e18664f6
Content-Type: text/plain; charset=UTF-8

Is there a way to hot-convert a live volume to thin provisioning?

I was thinking of doing this:

1.  Create a thin volume
2.  Have it mirror the linear volume
3.  Break the linear mirror
4.  Run an fs discard on the thin volume

--089e013cbd3ea4b4b204e18664f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Is there a way to hot-convert a live volume to thin provis=
ioning?<div><br></div><div>I was thinking of doing this:</div><div><br></di=
v><div>1. =C2=A0Create a thin volume</div><div>2. =C2=A0Have it mirror the =
linear volume</div>

<div>3. =C2=A0Break the linear mirror</div><div>4. =C2=A0Run an fs discard =
on the thin volume</div><div><br></div></div>

--089e013cbd3ea4b4b204e18664f6--
