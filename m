Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 27E2317AD3
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2017 12:31:17 +0000 (UTC)
Received: from mail-vk0-f52.google.com (mail-vk0-f52.google.com
	[209.85.213.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8F23C325DBE
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2017 12:31:11 +0000 (UTC)
Received: by mail-vk0-f52.google.com with SMTP id y70so45858893vky.3
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2017 05:31:11 -0700 (PDT)
MIME-Version: 1.0
From: Billy Crook <billycrook@gmail.com>
Date: Mon, 10 Jul 2017 07:30:30 -0500
Message-ID: <CANZ96zVD8JaHBc0_LdcSudnDqNOtjevdOPGVW=4ppAmL0QuFrA@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a114551aa000b580553f5c21e"
Subject: [linux-lvm] Alert emails for degraded LVs
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

--001a114551aa000b580553f5c21e
Content-Type: text/plain; charset="UTF-8"

What monitoring/reporting agents do people use to be alerted when a
mirrored or raid5 or raid6 LV has become degraded?

Before LVM supported RAID type LVs, I would always use mdadm, and its
monitor sends an email to root when an array degrades.  What does LVM have
like that?

--001a114551aa000b580553f5c21e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">What monitoring/reporting agents do people use to be alert=
ed when a mirrored or raid5 or raid6 LV has become degraded?<div><br></div>=
<div>Before LVM supported RAID type LVs, I would always use mdadm, and its =
monitor sends an email to root when an array degrades.=C2=A0 What does LVM =
have like that?</div></div>

--001a114551aa000b580553f5c21e--
