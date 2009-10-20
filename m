Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9K3KOpj011123
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 23:20:24 -0400
Received: from mail-yx0-f183.google.com (mail-yx0-f183.google.com
	[209.85.210.183])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9K3KEV5004636
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 23:20:14 -0400
Received: by yxe13 with SMTP id 13so4345970yxe.23
	for <linux-lvm@redhat.com>; Mon, 19 Oct 2009 20:20:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com> 
	<c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com> 
	<a5a956f70910191114r3025ec45r5ddb2e02620fb0c0@mail.gmail.com> 
	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com> 
	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com> 
	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com> 
	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com>
From: Drew <drew.kay@gmail.com>
Date: Mon, 19 Oct 2009 20:19:54 -0700
Message-ID: <c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com>
Subject: Re: [linux-lvm] Total free space using added VGs and LVs
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: Lou Arnold <larnolda1@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

> I've tried this (add a drive to VolGroup00/LogVol00) and it certainly wor=
ks,
> but it is much more difficult to undo than 1) creating a new volume group
> and new volume, or 2) adding the drive to VolGroup00 and creating a new
> volume. I read the documentation, but the file system fails whenever I
> reboot. After all, LogVol00 is mounted at root, you can't unmount root
> to=C2=A0shrink the volume. If you assume that the drive is empty and so y=
ou don't
> have any data to migrate, how does one do it?

Welcome to the joys of planning your partitions and their filesystems. :-)

When you're working with the root partition or any other partition
needed by the system you can't make changes while the LV is in use.
But then again, you are in the same boat with regular partitions, the
tools just change.

When you say migrate, are you meaning migrating to a larger drive? Or
do you mean migrate portions of the filesystem to a new logical volume
with free space?



--=20
Drew

"Nothing in life is to be feared. It is only to be understood."
--Marie Curie
