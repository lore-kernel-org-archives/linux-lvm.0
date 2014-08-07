Received: from mx1.redhat.com (ext-mx14.extmail.prod.ext.phx2.redhat.com
	[10.5.110.19])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s773mnNV019604
	for <linux-lvm@redhat.com>; Wed, 6 Aug 2014 23:48:49 -0400
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s773mlKA027320
	(version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Wed, 6 Aug 2014 23:48:48 -0400
Received: by mail-yh0-f46.google.com with SMTP id a41so2518612yho.33
	for <linux-lvm@redhat.com>; Wed, 06 Aug 2014 20:48:47 -0700 (PDT)
MIME-Version: 1.0
Date: Wed, 6 Aug 2014 20:48:47 -0700
Message-ID: <CAAN_kG2zpfi6iStRDmpGRJD7Wg-EX-P4Ok7Y9Uo5n8jnanEyuQ@mail.gmail.com>
From: Timur Alperovich <timur@maginatics.com>
Content-Type: multipart/alternative; boundary=20cf303639814c1fc6050001f79f
Subject: [linux-lvm] LVM thin pool discard_max_bytes reports 0
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

--20cf303639814c1fc6050001f79f
Content-Type: text/plain; charset=UTF-8

Hi there,

I was trying to understand why fstrim would fail on an LVM thin provisioned
volume and figured out that the discard_max_bytes is reported as 0 in
/sys/block/dm-N/queue/discard_max_bytes (I checked the device that
corresponded to the LVM pool that the volume is created within). The
discard options are also disabled for the thin volume itself. I'm observing
this issue on an Ubuntu 12.04 system, running kernel 3.8.0-32, and LVM2
2.02.98 backported to Ubuntu 12.04 (
https://launchpad.net/~timur-alperovich/+archive/ubuntu/ppa/+packages).

I did a small experiment where I created another LVM pool within the same
volume group and the discard value was set to 65536 for that device. I'm
not sure if it matters, but the system is an running on ESXi 5.0 host.
While I don't necessarily expect discard to propagate to the host, I was
hoping to reclaim the block in the thin pool itself.

Could anyone shed some light on why discard may be disabled on an LVM thin
pool device? I tried looking for any bugs specific to TRIM or discard
subsequent to 2.02.98, but could not find anything definitive.

Also, is there a way to enable discard without having to recreate the thin
pool?

Thank you,
Timur

--20cf303639814c1fc6050001f79f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi there,<div><br></div><div>I was trying to understand wh=
y fstrim would fail on an LVM thin provisioned volume and figured out that =
the discard_max_bytes is reported as 0 in /sys/block/dm-N/queue/discard_max=
_bytes (I checked the device that corresponded to the LVM pool that the vol=
ume is created within). The discard options are also disabled for the thin =
volume itself. I&#39;m observing this issue on an Ubuntu 12.04 system, runn=
ing kernel 3.8.0-32, and LVM2 2.02.98 backported to Ubuntu 12.04 (<a href=
=3D"https://launchpad.net/~timur-alperovich/+archive/ubuntu/ppa/+packages">=
https://launchpad.net/~timur-alperovich/+archive/ubuntu/ppa/+packages</a>).=
</div>
<div><br></div><div>I did a small experiment where I created another LVM po=
ol within the same volume group and the discard value was set to 65536 for =
that device. I&#39;m not sure if it matters, but the system is an running o=
n ESXi 5.0 host. While I don&#39;t necessarily expect discard to propagate =
to the host, I was hoping to reclaim the block in the thin pool itself.</di=
v>
<div><br></div><div>Could anyone shed some light on why discard may be disa=
bled on an LVM thin pool device? I tried looking for any bugs specific to T=
RIM or discard subsequent to 2.02.98, but could not find anything definitiv=
e.</div>
<div><br></div><div>Also, is there a way to enable discard without having t=
o recreate the thin pool?</div><div><br></div><div>Thank you,</div><div>Tim=
ur</div></div>

--20cf303639814c1fc6050001f79f--
