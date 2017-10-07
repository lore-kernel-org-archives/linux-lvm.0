Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.30])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 478BC619AB
	for <linux-lvm@redhat.com>; Sat,  7 Oct 2017 04:28:15 +0000 (UTC)
Received: from mail-oi0-f42.google.com (mail-oi0-f42.google.com
	[209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8991E3680C
	for <linux-lvm@redhat.com>; Sat,  7 Oct 2017 04:28:14 +0000 (UTC)
Received: by mail-oi0-f42.google.com with SMTP id v132so13113701oie.1
	for <linux-lvm@redhat.com>; Fri, 06 Oct 2017 21:28:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALuPYL2sLeTe8M7KgBGPbMkZWBQAGaOkkj0SS6ovHTg_0SCmuQ@mail.gmail.com>
References: <CALuPYL3fiHTGbxBFCeQw+HMEAwZBKs2HBMBuThnDFAHDCsDAsQ@mail.gmail.com>
	<CALuPYL3NMm7xrfemcbQ7Kt511rL=VrS7cKi0J0HBKjq8z7QDyg@mail.gmail.com>
	<CALuPYL2R1vLb5TY6CHEcC_m653oSyRHF2UBOU3if5fg2R8bCPg@mail.gmail.com>
	<CALuPYL0ohSNtaC4N97WWUHbW3J8DfnzhT1Pd=iTe_pFvhN2tjw@mail.gmail.com>
	<CALuPYL3EY2EjGER-Fhz0QW8Mu+LBE-L8oOAYo8=Eu9WwawCbgg@mail.gmail.com>
	<CALuPYL1KRtc5e-ZQOqCKE4fyNt9WAgKzBNDdn-6N52yEEQxvEA@mail.gmail.com>
	<CALuPYL26eMycV=h5ZLHTejWNSh-kwYdMKrNnfR7EfKNM83VBLQ@mail.gmail.com>
	<CALuPYL1uwtmaCS8PoVd6F4Y9u4qqhqtyST0yZi77H7fNdi2XUQ@mail.gmail.com>
	<CALuPYL1=MUfFawNOdSpSO-9az3m1vvWF3Y3jCrertFr5M3NewA@mail.gmail.com>
	<CALuPYL2=kUoNv=VhvKqzqEM9E0QOe5vjeopGAC4oZ8_=0TUhDg@mail.gmail.com>
	<CALuPYL2sLeTe8M7KgBGPbMkZWBQAGaOkkj0SS6ovHTg_0SCmuQ@mail.gmail.com>
From: Indivar Nair <indivar.nair@techterra.in>
Date: Sat, 7 Oct 2017 09:58:12 +0530
Message-ID: <CALuPYL1UVWO1013K7zna4xcBLQYx2zB1beJXVYpOyXWd=209Sw@mail.gmail.com>
Content-Type: multipart/alternative; boundary="001a113d2f8cba890f055aed623d"
Subject: [linux-lvm] Shared VG, Separate LVs
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

--001a113d2f8cba890f055aed623d
Content-Type: text/plain; charset="UTF-8"

Hi...,

With CLVM / HA-LVM on a 2 node cluster -

Is it possible to have a shared VG but separate LVs, with each LV
exclusively activated on different nodes in a 2 node cluster.
In case of a failure, the LV of the failed node will be activated on the
other node.

Regards,


Indivar Nair

--001a113d2f8cba890f055aed623d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hi...,<div dir=3D"auto"><br></div><div dir=3D"auto"><div =
dir=3D"auto">With CLVM / HA-LVM on a 2 node cluster -</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Is it possible to have a shared VG but separa=
te LVs, with each LV exclusively activated on different nodes in a 2 node c=
luster.</div><div dir=3D"auto">In case of a failure, the LV of the failed n=
ode will be activated on the other node.<br></div><div dir=3D"auto"><br></d=
iv><div dir=3D"auto">Regards,</div><div dir=3D"auto"><br></div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Indivar Nair</div></div></div>

--001a113d2f8cba890f055aed623d--
