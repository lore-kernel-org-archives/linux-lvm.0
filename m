Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id p2UISsKU008764
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2011 14:28:54 -0400
Received: from ps536.phatservers.com (ps536.phatservers.com [216.17.105.202])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p2UISntY015369
	for <linux-lvm@redhat.com>; Wed, 30 Mar 2011 14:28:50 -0400
Date: Wed, 30 Mar 2011 13:28:37 -0500
From: Ray Morris <support@bettercgi.com>
Message-ID: <20110330132837.07e8d0ea@bettercgi.com>
In-Reply-To: <5fe2faea.20827.12f07068fe6.Coremail.ooolinux@163.com>
References: <20110329124814.7fd059c7@bettercgi.com>
	<784dab.9d29.12f01ad2e6f.Coremail.ooolinux@163.com>
	<5fe2faea.20827.12f07068fe6.Coremail.ooolinux@163.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] copy lv from  lv?
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
Content-Type: text/plain; charset="windows-1252"
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: ooolinux@163.com

> 1..how to pipe two copy  together

This is what I use after some experimenting.  I've found=20
it's often far faster than the more obvious use of dd:

nice -5 dd if=3D/dev/clones/from bs=3D64M iflag=3Ddirect |=20
        dd of=3D/dev/scratch/to bs=3D64M oflag=3Ddirect

I use 64 MB extents. For smaller extents, a matching dd=20
block size might be good.

> 2.i take lv as xen-guestOS's  disk. usually many  guestOS created
> from one lv(called template), maybe many data is readonly, so  if  so
> many lvs share readonly part ,and have its private data? COW save
> disk space, and take less time. i do not think snapshot is sutable
> for this case. thanks

Some people use snapshots for that purpose.  I'm not one of those
people, so I don't know details, other than that it can be done.

If you are creating that template guest, meaning that you can choose
the filesystem layout, etc., the most efficient but less flexible=20
option may be to decide explicitly what's read only. The liveCD=20
crowd has documented procedures gained from their experience in=20
making most of the system read only. As a side benefit, such systems
can't be rooted or screwed up in some ways, so there's a level of
trust knowing the core system is "correct".  Then you could mount=20
the same image for the readonyl portions of many guests, while=20
mounting "per guest" images for /home, /tmp, etc.
--=20
Ray Morris
support@bettercgi.com

Strongbox - The next generation in site security:
http://www.bettercgi.com/strongbox/

Throttlebox - Intelligent Bandwidth Control
http://www.bettercgi.com/throttlebox/

Strongbox / Throttlebox affiliate program:
http://www.bettercgi.com/affiliates/user/register.php




On Wed, 30 Mar 2011 21:49:21 +0800 (CST)
yue <ooolinux@163.com> wrote:

> 1..how to pipe two copy  together
> 2.i take lv as xen-guestOS's  disk. usually many  guestOS created
> from one lv(called template), maybe many data is readonly, so  if  so
> many lvs share readonly part ,and have its private data? COW save
> disk space, and take less time. i do not think snapshot is sutable
> for this case. thanks
>=20
>=20
>=20
>=20
> At 2011-03-30 01:48:14=EF=BC=8C"Ray Morris" <support@bettercgi.com> wrote:
>=20
> >> if lvm do not support lv copy? it is better copy on write.
> >> dd takes long time.
> >
> >For a complete copy the only thing faster than "dd" is two=20
> >copies of "dd" piped together. dd is basically limited by
> >the speed of the physical disks, assuming proper arguments=20
> >to dd.  For a copy on write, that's called a snapshot. LVM=20
> >COULD beused to copy, by making and splitting a mirror, but=20
> >that's going to be a lot slower than dd. (Though a mirror and
> >split can be used on a live filesystem, wth it unmounted only=20
> >for an instant during the split).
> >--=20
> >Ray Morris
> >support@bettercgi.com
> >
> >Strongbox - The next generation in site security:
> >http://www.bettercgi.com/strongbox/
> >
> >Throttlebox - Intelligent Bandwidth Control
> >http://www.bettercgi.com/throttlebox/
> >
> >Strongbox / Throttlebox affiliate program:
> >http://www.bettercgi.com/affiliates/user/register.php
> >
> >
> >
> >
> >On Tue, 29 Mar 2011 20:53:37 +0800 (CST)
> >yue <ooolinux@163.com> wrote:
> >
> >> if lvm do not support lv copy? it is better copy on write.
> >> dd takes long time.
> >> =20
> >> thanks
> >
> >_______________________________________________
> >linux-lvm mailing list
> >linux-lvm@redhat.com
> >https://www.redhat.com/mailman/listinfo/linux-lvm
> >read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
