Received: from mx1.redhat.com (ext-mx05.extmail.prod.ext.phx2.redhat.com
	[10.5.110.29])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D6505D9C6
	for <linux-lvm@redhat.com>; Thu,  2 Nov 2017 14:02:11 +0000 (UTC)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7855BFECE
	for <linux-lvm@redhat.com>; Thu,  2 Nov 2017 14:02:09 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id q4so8868369oic.7
	for <linux-lvm@redhat.com>; Thu, 02 Nov 2017 07:02:09 -0700 (PDT)
MIME-Version: 1.0
From: Indivar Nair <indivar.nair@techterra.in>
Date: Thu, 2 Nov 2017 19:31:37 +0530
Message-ID: <CALuPYL3WmDs5kT3=cRhji2=nf_OKOCygTnr-rGufA7xA777sZg@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a113ac2a6146ae4055d006fe8"
Subject: [linux-lvm] Maximum number of drives in a Logical Volume Stripe
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

--001a113ac2a6146ae4055d006fe8
Content-Type: text/plain; charset="UTF-8"

Hi ...,

What is the maximum number of drives that we can have in a stripped logical
volume?

On a CentOS 7.3 machine, it is not allowing me to have a stripe count of
more that 8 Drives. I have 12 Drives in the Volume Group and would like to
use all of them in the Logical Volume.

Is it a limitation of RHEL/CentOS?
Is there a work around?

Regards,


Indivar Nair

--001a113ac2a6146ae4055d006fe8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi ...,<div><br></div><div>What is the maximum number of d=
rives that we can have in a stripped logical volume?</div><div><br></div><d=
iv>On a CentOS 7.3 machine, it is not allowing me to have a stripe count of=
 more that 8 Drives. I have 12 Drives in the Volume Group and would like to=
 use all of them in the Logical Volume.</div><div><br></div><div>Is it a li=
mitation of RHEL/CentOS?</div><div>Is there a work around?</div><div><br></=
div><div>Regards,</div><div><br></div><div><br></div><div>Indivar Nair</div=
></div>

--001a113ac2a6146ae4055d006fe8--
