Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s0PLQjXu028123
	for <linux-lvm@redhat.com>; Sat, 25 Jan 2014 16:26:45 -0500
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s0PLQie1003492
	for <linux-lvm@redhat.com>; Sat, 25 Jan 2014 16:26:44 -0500
Received: by mail-oa0-f49.google.com with SMTP id i7so5162128oag.8
	for <linux-lvm@redhat.com>; Sat, 25 Jan 2014 13:26:43 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 25 Jan 2014 23:26:43 +0200
Message-ID: <CAFZxf=L8_MOCBx+E6GUg_gCJ=284M2wONeASHEDXWY0io4oXjQ@mail.gmail.com>
From: Vasil Valchev <vasil.val@gmail.com>
Content-Type: multipart/alternative; boundary=089e01538baa8cc00b04f0d2217d
Subject: [linux-lvm] Thin provisioned LV + raid5?
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

--089e01538baa8cc00b04f0d2217d
Content-Type: text/plain; charset=ISO-8859-1

Hello,

I want to create a thin pool that will be used for storing virtual machines
(inside separate thin volumes).
The thing is I can't find if that thin pool can be at the same time --type
raid5 (or similar) at the same time?

Would something like this be possible:

lvcreate -T virtvg/virtpool -L 500G --type raid5

Or maybe the whole approach is wrong?
What I want to do in the end is a thin pool/volumes that are replicated in
some way - ideally raid5, if not - mirrored.

Is this implemented and supported in LVM, or is hardware raid recommended
to handle the redundancy in thin provisioned storage?


Regards,
Vasil

--089e01538baa8cc00b04f0d2217d
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I want to create a thin pool tha=
t will be used for storing virtual machines (inside separate thin volumes).=
</div><div>The thing is I can&#39;t find if that thin pool can be at the sa=
me time --type raid5 (or similar) at the same time?</div>
<div><br></div><div>Would something like this be possible:</div><div><br></=
div><div>lvcreate -T virtvg/virtpool -L 500G --type raid5</div><div><br></d=
iv><div>Or maybe the whole approach is wrong?</div><div>What I want to do i=
n the end is a thin pool/volumes that are replicated in some way - ideally =
raid5, if not - mirrored.</div>
<div><br></div><div>Is this implemented and supported in LVM, or is hardwar=
e raid recommended to handle the redundancy in thin provisioned storage?</d=
iv><div><br></div><div><br></div><div>Regards,</div><div>Vasil</div></div>

--089e01538baa8cc00b04f0d2217d--
