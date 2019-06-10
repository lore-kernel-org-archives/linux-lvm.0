Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 917E960A9F
	for <linux-lvm@redhat.com>; Mon, 10 Jun 2019 20:53:33 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
	[209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 149DC30917AC
	for <linux-lvm@redhat.com>; Mon, 10 Jun 2019 20:53:21 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id h21so11955354qtn.13
	for <linux-lvm@redhat.com>; Mon, 10 Jun 2019 13:53:21 -0700 (PDT)
MIME-Version: 1.0
From: Lucas Vinicius Hartmann <lucas.hartmann@gmail.com>
Date: Mon, 10 Jun 2019 17:53:09 -0300
Message-ID: <CAMbFyDTDQrTUHKAC=+Yi4S3cAyfagwB3Wt5o8tt811Zr07On2A@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000c769c5058afe5e10"
Subject: [linux-lvm] LVM cache gets marked as dirty on reboot
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

--000000000000c769c5058afe5e10
Content-Type: text/plain; charset="UTF-8"

I tried running my desktop from a 120GB+1TB writeback cache setup, but
every time the system is rebooted the entire cache is marked dirty, and
takes several hours to flush (it does complete).

Two different setups were tested (below), the issue only affected the root
mount point, not home.

Any ideas on how to debug/fix this?

First setup (encryption on top of LVM):
    One GPT partition on each drive, used as PVs.
    A single cached LV.
    / is an EXT4 partition, encrypted with LUKS.
    /boot and /boot/efi are simple partitions on the slow drive.

Second setup (LVM on top of encryption):
    A couple LUKS volumes, one on each drive, serving as PVs.
    One VG backed by the fast and slow LUKS volumes.
    / on a cached LV.
    /home on a separate cached LV.
    /boot and /boot/efi are simple partitions on the slow drive.

System:
    Fedora 30, KDE spin.
    Kernel 5.1.7-300.fc30.x86_64

--
Lucas Vinicius Hartmann

--000000000000c769c5058afe5e10
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I tried running my desktop from a 120GB+1TB writeback=
 cache setup, but every time the system is rebooted the entire cache is mar=
ked dirty, and takes several hours to flush (it does complete).<br></div><d=
iv><br></div><div>Two different setups were tested (below), the issue only =
affected the root mount point, not home.</div><div><br></div><div>Any ideas=
 on how to debug/fix this? <br></div><div><div></div><div><br></div></div><=
div>First setup (encryption on top of LVM):</div><div>=C2=A0=C2=A0=C2=A0 On=
e GPT partition on each drive, used as PVs.</div><div>=C2=A0=C2=A0=C2=A0 A =
single cached LV.</div>=C2=A0=C2=A0=C2=A0 / is an EXT4 partition, encrypted=
 with LUKS.<br><div><div><div>=C2=A0=C2=A0=C2=A0 /boot and /boot/efi are si=
mple partitions on the slow drive.</div><div><br></div><div>Second setup (L=
VM on top of encryption):</div><div>=C2=A0=C2=A0=C2=A0 A couple LUKS volume=
s, one on each drive, serving as PVs.</div><div>=C2=A0=C2=A0=C2=A0 One VG b=
acked by the fast and slow LUKS volumes.<br></div><div>=C2=A0=C2=A0=C2=A0 /=
 on a cached LV.</div><div>=C2=A0=C2=A0=C2=A0 /home on a separate cached LV=
.<br></div><div><div>=C2=A0=C2=A0=C2=A0 /boot and /boot/efi are simple part=
itions on the slow drive.</div></div><div><br></div><div>System:<br></div><=
/div><div>=C2=A0=C2=A0=C2=A0 Fedora 30, KDE spin.<br></div><div>=C2=A0=C2=
=A0=C2=A0 Kernel 5.1.7-300.fc30.x86_64</div><div><br><div><div><div><div di=
r=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div=
 dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><div>--<br>Lucas V=
inicius Hartmann<br></div></div></div></div></div></div></div></div></div><=
/div></div></div></div>

--000000000000c769c5058afe5e10--
