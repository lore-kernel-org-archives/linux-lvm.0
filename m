Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k73FP3Fm026175
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 11:25:03 -0400
Received: from nz-out-0102.google.com (nz-out-0102.google.com [64.233.162.194])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k73FOTTM006782
	for <linux-lvm@redhat.com>; Thu, 3 Aug 2006 11:24:34 -0400
Received: by nz-out-0102.google.com with SMTP id n1so455907nzf
	for <linux-lvm@redhat.com>; Thu, 03 Aug 2006 08:24:28 -0700 (PDT)
Message-ID: <ebf0fc470608030824ve7d55d7m5fe62eed5a8ee7dd@mail.gmail.com>
Date: Fri, 4 Aug 2006 00:24:28 +0900
From: "Stanislaw Senotrusov" <senotrusov@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] How to clone LVM disk?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: linux-lvm@redhat.com

Going further.

I need to clone LVM disks on regular basics, so I am trying to build
some pipeline around it.

I cloned SRC disk to DST. Adjusted LVM partition on DST to fit disk.
Successfully booted from it.

One day I might need to connect SRC and DST disks at the same machine,
same time.

Trying to do that resulted in a system failure. I can change PV and VG
uuids on DST disk, but I cant find how to change LV uuid and VG name.
Maybe there are some other things to do on DST disk =E2=80=93 did't noticed
yet.

Is there any way to connect two cloned LVM disks at the same time?

--=20
Stas Senotrusov
