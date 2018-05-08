Received: from mx1.redhat.com (ext-mx04.extmail.prod.ext.phx2.redhat.com
	[10.5.110.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 12C305D6A3
	for <linux-lvm@redhat.com>; Tue,  8 May 2018 05:27:10 +0000 (UTC)
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1E8D38553E
	for <linux-lvm@redhat.com>; Tue,  8 May 2018 05:26:59 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id l1-v6so19103818wmb.2
	for <linux-lvm@redhat.com>; Mon, 07 May 2018 22:26:59 -0700 (PDT)
MIME-Version: 1.0
From: Patrick Dung <mpatdung@gmail.com>
Date: Tue, 8 May 2018 13:26:56 +0800
Message-ID: <CAEtPA0AYPR2uJLHh4Bf_eh7=0VvooETfs6GOc1ePgb6vUi=x5Q@mail.gmail.com>
Content-Type: multipart/alternative; boundary="000000000000f7a524056bab0897"
Subject: [linux-lvm] LVM not activated on boot in linux mdraid (Fedora 28)
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

--000000000000f7a524056bab0897
Content-Type: text/plain; charset="UTF-8"

Hello.

I have upgraded a host to Fedora 28. Using the new dracut to rebuilt
initramfs, new kernel and old kernel would fail to boot. If I use the old
kernel without touching the initramfs, it would boot.
I tried downgrading to old dracut and the problem persist.

The boot problem is that I can see my RAID but it failed to activate the
root (/) LVM on the mdraid.

It had error message like this in dracut shell:

+ lvm pvdisplay
  WARNING: PV mphetV-LMWe-se6x-86Bv-osHk-rVk2-K01UNk on /dev/sdb2 was
already found on /dev/sda2.
  WARNING: PV mphetV-LMWe-se6x-86Bv-osHk-rVk2-K01UNk on /dev/md126 was
already found on /dev/sda2.
  WARNING: PV mphetV-LMWe-se6x-86Bv-osHk-rVk2-K01UNk prefers device
/dev/sda2 because device was seen first.
  WARNING: PV mphetV-LMWe-se6x-86Bv-osHk-rVk2-K01UNk prefers device
/dev/md126 because device size is correct.

I had opened a bug in Fedora bugzilla, it had all the details:
https://bugzilla.redhat.com/show_bug.cgi?id=1575762

Thanks,
Patrick

--000000000000f7a524056bab0897
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hello.<br><br></div>I have u=
pgraded a host to Fedora 28. Using the new dracut to rebuilt initramfs, new=
 kernel and old kernel would fail to boot. If I use the old kernel without =
touching the initramfs, it would boot.<br></div>I tried downgrading to old =
dracut and the problem persist.<br><br></div><div>The boot problem is that =
I can see my RAID but it failed to activate the root (/) LVM on the mdraid.=
<br></div><div><br></div>It had error message like this in dracut shell:<br=
><br>+ lvm pvdisplay<br>=C2=A0 WARNING: PV mphetV-LMWe-se6x-86Bv-osHk-rVk2-=
K01UNk on /dev/sdb2 was already found on /dev/sda2.<br>=C2=A0 WARNING: PV m=
phetV-LMWe-se6x-86Bv-osHk-rVk2-K01UNk on /dev/md126 was already found on /d=
ev/sda2.<br>=C2=A0 WARNING: PV mphetV-LMWe-se6x-86Bv-osHk-rVk2-K01UNk prefe=
rs device /dev/sda2 because device was seen first.<br>=C2=A0 WARNING: PV mp=
hetV-LMWe-se6x-86Bv-osHk-rVk2-K01UNk prefers device /dev/md126 because devi=
ce size is correct.<br><br></div>I had opened a bug in Fedora bugzilla, it =
had all the details:<br><a href=3D"https://bugzilla.redhat.com/show_bug.cgi=
?id=3D1575762">https://bugzilla.redhat.com/show_bug.cgi?id=3D1575762</a><br=
><br></div>Thanks,<br></div>Patrick<br></div>

--000000000000f7a524056bab0897--
