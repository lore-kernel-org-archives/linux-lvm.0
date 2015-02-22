Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t1M35PhY015772
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2015 22:05:25 -0500
Received: from mail-ig0-f170.google.com (mail-ig0-f170.google.com
	[209.85.213.170])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t1M35NT5005995
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=FAIL)
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2015 22:05:24 -0500
Received: by mail-ig0-f170.google.com with SMTP id l13so14669443iga.1
	for <linux-lvm@redhat.com>; Sat, 21 Feb 2015 19:05:23 -0800 (PST)
MIME-Version: 1.0
Date: Sat, 21 Feb 2015 19:05:23 -0800
Message-ID: <CAF0z+n1UQXryRYMjCLzjtO07Q+ErJtW_+YFFKwmAyipkBhm_WQ@mail.gmail.com>
From: Greg Zartman <gregzartman@gmail.com>
Content-Type: multipart/alternative; boundary=001a1134b850857a91050fa48e6a
Subject: [linux-lvm] Combine multiple physical volumes onto a larger device
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

--001a1134b850857a91050fa48e6a
Content-Type: text/plain; charset=UTF-8

I'm sure this has been asked and answered before, but after a fair bit of
googleing I'm not coming up with an answer.

I have a fairly old volume group that is made of 9 x 620GB PVs.  I'd like
to move this volume group off these devices onto a couple larger drives.
What is the best way to do this?  I've read that you can vgextend the new
drives into the volume group and the use pvmove to move data off one PV to
another, but I don't know if you can pvmove smaller pvs onto a larger disk
and they will all be combined.

Maybe there is a better way to move the entire VG?    I want to maintain
the current VG and LV names from my old setup, this my desire to just move
the entire lot at once instead of rsyncing or something.

Thanks,

Greg

--001a1134b850857a91050fa48e6a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;m sure this has been asked and answered before, but =
after a fair bit of googleing I&#39;m not coming up with an answer.<div><br=
></div><div>I have a fairly old volume group that is made of 9 x 620GB PVs.=
=C2=A0 I&#39;d like to move this volume group off these devices onto a coup=
le larger drives.=C2=A0 What is the best way to do this?=C2=A0 I&#39;ve rea=
d that you can vgextend the new drives into the volume group and the use pv=
move to move data off one PV to another, but I don&#39;t know if you can pv=
move smaller pvs onto a larger disk and they will all be combined.</div><di=
v><br></div><div>Maybe there is a better way to move the entire VG? =C2=A0 =
=C2=A0I want to maintain the current VG and LV names from my old setup, thi=
s my desire to just move the entire lot at once instead of rsyncing or some=
thing.</div><div><br>Thanks,</div><div><br>Greg</div></div>

--001a1134b850857a91050fa48e6a--
