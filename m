Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i43GQSv15161
	for <linux-lvm@redhat.com>; Mon, 3 May 2004 12:26:28 -0400
Received: from monkey.sneakemail.com (clean.sneakemail.com [38.136.15.35])
	by mx3.redhat.com (8.12.10/8.12.10) with SMTP id i43GQS99018962
	for <linux-lvm@redhat.com>; Mon, 3 May 2004 12:26:28 -0400
Message-ID: <15307-37652@sneakemail.com>
Date: Mon, 03 May 2004 18:26:20 +0200
From: "Peter Valdemar Morch" <swp5jhu02@sneakemail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] 2.6 upgrade - LVM version ? & root partition access
	problems...
References: <408C2883.5080606@sneakemail.com>	<20040426135853.GA17309@null.msp.redhat.com>	<4095715C.3000900@sneakemail.com>
	<20040503135024.GA11496@null.msp.redhat.com>
In-Reply-To: <20040503135024.GA11496@null.msp.redhat.com>
Content-Transfer-Encoding: quoted-printable
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: linux-lvm@redhat.com

AJ Lewis alewis-at-redhat.com |Lists| wrote:
> Bah - I guess I should have pointed you at the fedora mkinitrd - it might
> have saved you the hassle.  :(

> http://distro.ibiblio.org/pub/linux/distributions/fedora/linux/core/devel=
opment/i386/Fedora/RPMS/mkinitrd-3.5.21-1.i386.rpm
> is the current version AFAIK.  I think this will work better with RH9
> systems than the other one (which was originally built around debian)

Possibly. I can't get it to work with either 2.6.5 or my 2.4 image, though:

valde@peter:~> rpm -q mkinitrd
mkinitrd-3.5.21-1
valde@peter:~> sudo mkinitrd ost.img 2.6.5
No module raid1 found for kernel 2.6.5, aborting.
valde@peter:~> sudo mkinitrd ost.img 2.4.20-20.9custom
pvscan -- LVM driver/module not loaded?

(While I'm running in a 2.6 kernel. module raid1 is not not found for=20
2.6.5 because I've built it into the kernel now. I can't be bothered to=20
test it as a module at this point)

>>I've created a new version (incl. svn diff) of the script here:
>>http://wwww.XXXXXXXXX/postings/lvm2/

Wups, what happened with the extra 'w' (4 in all)? It does work, though...

> K - so if the fedora mkinitrd doesn't work for people using RH9, they can
> try that one. :)  Thanks!

To make as few changes as possible, RH9 users will have to edit it and=20
uncomment these lines

INITRDSIZE=3D4096
INITRDINODES=3D5000

and run it with the -d option, such as in
# lvm2create_initrd.sh -d 2.6.5

Also, I forgot to mention something weird. If I attempt to boot my old=20
2.4 kernel, fsck complains. Booting with kernel option " fastboot" gets=20
me past the fsck point, all the way to the final login screen. However,=20
in the 2.4 kernel, I no longer have keyboard or mouse support. But I can=20
ssh into it from outside. Rebooting again into 2.6 also stops at fsck,=20
so the " fastboot" is required *again*. When running in 2.6, I then run=20
"lvm vgmknodes" and then it can boot in 2.6 fsck and all - no problemo.=20
But it seems I've passed the point of no-return-to-2.4.

Later,

Peter

--=20
Peter Valdemar M=EF=BF=BDrch
http://www.XXXXXXXXX
