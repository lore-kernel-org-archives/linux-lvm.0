Received: from mx1.redhat.com (ext-mx11.extmail.prod.ext.phx2.redhat.com
	[10.5.110.16])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r545kKdF016698
	for <linux-lvm@redhat.com>; Tue, 4 Jun 2013 01:46:21 -0400
Received: from wizard.servers.creatim.net (mail.creatim.com [195.246.8.45])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r545kFeo015622
	for <linux-lvm@redhat.com>; Tue, 4 Jun 2013 01:46:16 -0400
Received: from undisclosed (undisclosed [127.0.0.254]) (Authenticated sender:
	undisclosed) by wizard.servers.creatim.net (Postfix) with
	ESMTPSA id 36C8310E04FC
	for <linux-lvm@redhat.com>; Tue,  4 Jun 2013 07:46:13 +0200 (CEST)
Received: by mail-ie0-f182.google.com with SMTP id 9so7493760iec.41
	for <linux-lvm@redhat.com>; Mon, 03 Jun 2013 22:46:11 -0700 (PDT)
MIME-Version: 1.0
Date: Tue, 4 Jun 2013 07:46:10 +0200
Message-ID: <CAEp_DRC=xOm-yWLGR27PnsuLPTTXcPMnKLSmk+iS1VLDG0hKtw@mail.gmail.com>
From: Bostjan Skufca <bostjan@a2o.si>
Content-Type: multipart/alternative; boundary=089e013c60ec358b7804de4d99f4
Subject: [linux-lvm] Mounted, but idle LVM volume causes constant disk writes
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

--089e013c60ec358b7804de4d99f4
Content-Type: text/plain; charset=ISO-8859-1

Hello,

If LVM2 volume is mounted (ext4 fs), why is there constant write activity
to the devices below (sw raid in this case) despite not using the mounted
volume at all?

I am seing this on multiple hosts. On this particular one I am seeing
around 20 writes per second on average, but they occur in batches of around
50-90 writeIOps on every 3-4 seconds. If I mount the same filesystem (ext4)
on sw raid1 without LVM in between, I see the expected 0 write IOps when
not using the filesystem.

Kernel versions where I noticed this: 3.0.13 (sysrescd) 3.4.1, 3.9.4
(custom compiled). I noticed it on all systems where lvm is in use.

Thank you for the hints,
b.


PS: I did search the web first, but I could not find the answer. Sorry if
this has been answered before, maybe I was searching for the wrong terms.

--089e013c60ec358b7804de4d99f4
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div style>If LVM2 volume is mounted =
(ext4 fs), why is there constant write activity to the devices below (sw ra=
id in this case) despite not using the mounted volume at all?<br></div><div=
 style>
<br></div><div style>I am seing this on multiple hosts. On this particular =
one I am seeing around 20 writes per second on average, but they occur in b=
atches of around 50-90 writeIOps on every 3-4 seconds. If I mount the same =
filesystem (ext4) on sw raid1 without LVM in between, I see the expected 0 =
write IOps when not using the filesystem.</div>
<div style><br></div><div style>Kernel versions where I noticed this: 3.0.1=
3 (sysrescd) 3.4.1, 3.9.4 (custom compiled). I noticed it on all systems wh=
ere lvm is in use.</div><div style><br></div><div style>Thank you for the h=
ints,</div>
<div style>b.</div><div style><br></div><div style><br></div><div style>PS:=
 I did search the web first, but I could not find the answer. Sorry if this=
 has been answered before, maybe I was searching for the wrong terms.</div>
<div><br></div></div>

--089e013c60ec358b7804de4d99f4--
