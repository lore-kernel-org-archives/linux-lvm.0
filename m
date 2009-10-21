Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.11])
	by int-mx05.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n9LFTQpX024485
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 11:29:26 -0400
Received: from mail-gx0-f226.google.com (mail-gx0-f226.google.com
	[209.85.217.226])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n9LFT71f005087
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 11:29:07 -0400
Received: by gxk26 with SMTP id 26so4633870gxk.11
	for <linux-lvm@redhat.com>; Wed, 21 Oct 2009 08:29:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
References: <a5a956f70910190752m19843bc8x264a79c93c0cde41@mail.gmail.com> 
	<c268e4660910191103x606dd07nf89aee516f8756c9@mail.gmail.com> 
	<a5a956f70910191114r3025ec45r5ddb2e02620fb0c0@mail.gmail.com> 
	<c268e4660910191141s5c5f3e1lf422c67f7f8bf423@mail.gmail.com> 
	<a5a956f70910191200t340c02c2t28f14d3aef46cfdc@mail.gmail.com> 
	<c268e4660910191251x485888edm470b67a1999d5241@mail.gmail.com> 
	<a5a956f70910191726j7b7b0e7bx2738e5c6517cb537@mail.gmail.com> 
	<c268e4660910192019p16125b04ka90a9c5cd63ba128@mail.gmail.com> 
	<a5a956f70910201044j12e70c1cg78f454e580595815@mail.gmail.com>
From: Drew <drew.kay@gmail.com>
Date: Wed, 21 Oct 2009 08:28:47 -0700
Message-ID: <c268e4660910210828n5f0f523cnb8d9da476b7f1b64@mail.gmail.com>
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

> The documentation wasn't specific. I believe the intent was simply to
> migrate the data to another logical volume to temporarily allow the source
> volume to be reduced and/or removed. But let's assume that has happened or
> that doesn't need to happen. So now we need to unmount LogVol00, reduce it
> to its original nunber of extents and then remount it (either before or
> after remount we remove the physical drive.) I assume you can't try this =
or
> you'll screw up your computer, but I have a system that I screw=C2=A0up a=
nd
> easily restore from a OS image. So no need to be too cautious.

I've done this on several occasions.

If you want to play with various scenarios in LVM, I'd recommend
reading the LVM How-To @ http://tldp.org/HOWTO/LVM-HOWTO/ . Sections
11 & 13 cover the most common tasks you'll encounter in LVM. Play
around, don't be afraid to break things, and if you have questions
feel free to give the list a shout.


--=20
Drew

"Nothing in life is to be feared. It is only to be understood."
--Marie Curie
