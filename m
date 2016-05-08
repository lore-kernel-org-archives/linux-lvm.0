Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u48JoWJM014672
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO) for <linux-lvm@redhat.com>; Sun, 8 May 2016 15:50:32 -0400
Received: from mail-yw0-f171.google.com (mail-yw0-f171.google.com
	[209.85.161.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BA350C0C058B
	for <linux-lvm@redhat.com>; Sun,  8 May 2016 15:01:10 +0000 (UTC)
Received: by mail-yw0-f171.google.com with SMTP id t10so263976959ywa.0
	for <linux-lvm@redhat.com>; Sun, 08 May 2016 08:01:10 -0700 (PDT)
MIME-Version: 1.0
Date: Sun, 8 May 2016 18:01:10 +0300
Message-ID: <CAFTDQfBd3s4iohq7sb_1puC37mTTh2VUmWVAyF7Ud0auADZOoQ@mail.gmail.com>
From: =?UTF-8?B?0JjQu9GM0Y8g0JHQvtC60LA=?= <bokailya@gmail.com>
Content-Type: multipart/alternative; boundary=001a1142e55858edc1053255f6ee
Subject: [linux-lvm] Not informative error message,
 when trying to change unallocatable physical volume
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

--001a1142e55858edc1053255f6ee
Content-Type: text/plain; charset=UTF-8

#lvcreate -L600M -n test vg-arch
  Insufficient free space: 150 extents needed, but only 0 available

but fixed with
#pvchange --allocatable y /dev/mapper/lvm
maybe possibly change message to more usable?


My topic on arch forum
https://bbs.archlinux.org/viewtopic.php?id=212300

--001a1142e55858edc1053255f6ee
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>#lvcreate -L600M -n test vg-arch<br>=C2=A0 Insuf=
ficient free space: 150 extents needed, but only 0 available<br><br></div>b=
ut fixed with<code> <br>#pvchange --allocatable y /dev/mapper/lvm<br></code=
></div><code>maybe possibly change message to more usable?<br><br><br>My to=
pic on arch forum <br><a href=3D"https://bbs.archlinux.org/viewtopic.php?id=
=3D212300">https://bbs.archlinux.org/viewtopic.php?id=3D212300</a><br></cod=
e></div>

--001a1142e55858edc1053255f6ee--
