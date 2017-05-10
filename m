Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.27])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E5E427FBB9
	for <linux-lvm@redhat.com>; Wed, 10 May 2017 11:13:41 +0000 (UTC)
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
	[209.85.217.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9ADA80F9B
	for <linux-lvm@redhat.com>; Wed, 10 May 2017 11:13:38 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id j17so30808564uag.3
	for <linux-lvm@redhat.com>; Wed, 10 May 2017 04:13:38 -0700 (PDT)
MIME-Version: 1.0
From: Bernd <ecki@zusammenkunft.net>
Date: Wed, 10 May 2017 13:13:37 +0200
Message-ID: <CABOR3+xoAwjiE2G_OWS=z7t=GVGSR_=QtpJ8gdP+2e95-kCB1w@mail.gmail.com>
Content-Type: multipart/alternative; boundary=001a11435dbe5d404d054f2990b3
Subject: [linux-lvm] lvm/openstack: stripe all volumes and distribute them
	round robin on PVs
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

--001a11435dbe5d404d054f2990b3
Content-Type: text/plain; charset=UTF-8

Hello,

when using local lvm2 logical volumes for OpenStack Nova ephemeral pool
then the created logical volumes are linear (not striped) and what is worse
than that, all volumes are allocated on the same first physical volume
(until it is filled up).

I made a ServerFault question about that:

https://serverfault.com/questions/849088/automatically-distribute-lvm-stripes-for-specific-lvm2-vg-on-linux/849255#849255

It was suggested that raid_stripe_all_devices should help (to turn on
striping by default), but it did not. So I went ahead and patched the
lvm.py of nova to turn the striping on. However I still wonder if there is
a lvm option (allocation policy for that).

Besides that, it looks like it is still creating the first stripe on the
first device. It would make more sense to have it (even in the linear case)
to round robin the LVs. Because first of all it might be the most busy part
of the volume and secondly it helps for keeping room for expanding volumes.

Is there anything planned in this direction?

Gruss
Bernd

--001a11435dbe5d404d054f2990b3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div><div>Hello,<br><br></div>whe=
n using local lvm2 logical volumes for OpenStack Nova ephemeral pool then t=
he created logical volumes are linear (not striped) and what is worse than =
that, all volumes are allocated on the same first physical volume (until it=
 is filled up).<br><br></div>I made a ServerFault question about that:<br><=
br><a href=3D"https://serverfault.com/questions/849088/automatically-distri=
bute-lvm-stripes-for-specific-lvm2-vg-on-linux/849255#849255">https://serve=
rfault.com/questions/849088/automatically-distribute-lvm-stripes-for-specif=
ic-lvm2-vg-on-linux/849255#849255</a><br><br></div>It was suggested that ra=
id_stripe_all_devices should help (to turn on striping by default), but it =
did not. So I went ahead and patched the lvm.py of nova to turn the stripin=
g on. However I still wonder if there is a lvm option (allocation policy fo=
r that).<br><br></div>Besides that, it looks like it is still creating the =
first stripe on the first device. It would make more sense to have it (even=
 in the linear case) to round robin the LVs. Because first of all it might =
be the most busy part of the volume and secondly it helps for keeping room =
for expanding volumes.<br><br></div>Is there anything planned in this direc=
tion?<br><br></div>Gruss<br></div>Bernd<br><br></div>

--001a11435dbe5d404d054f2990b3--
