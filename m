Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iBE3EBr18689
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 22:14:11 -0500
Received: from bluebottle-fe4.bluebottle.com (bluebottle-fe4.bluebottle.com
	[67.107.78.248])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iBE3DtgJ003172
	for <linux-lvm@redhat.com>; Mon, 13 Dec 2004 22:14:00 -0500
Date: Tue, 14 Dec 2004 03:21:14 +0000
From: Robin Green <greenrd@greenrd.org>
Subject: Re: [linux-lvm] Re: Fedora Core 3 system with lvm2 won't boot
Message-ID: <20041214032114.GB6748@localhost.localdomain>
References: <1102967092.3784.192.camel@tesuji.nac.uci.edu>
	<1102982038.3784.224.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Content-Disposition: inline
In-Reply-To: <1102982038.3784.224.camel@tesuji.nac.uci.edu>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 13, 2004 at 03:53:58PM -0800, Dan Stromberg wrote:
> 2) Anyone know how I can boot from a rescue CD, and get to a point where
> I can attempt to fsck the filesystem, or at least see where in bringing
> up LVM2 the system is getting confused?

I'm not an LVM2 expert, but I'll try and help.

> On Mon, 2004-12-13 at 11:44 -0800, Dan Stromberg wrote:
> > Anyway, now when it tries to boot, I see:
> >=20
> > Red Hat nash version 4.1.18 starting
> >   Reading all physical volumes.  This may take a while...
> >   Found volume group "VolGroup00" using metadata type lvm2
> >   2 logical volume(s) in volume group "VolGroup00" now active
> >=20
> >=20
> > ...and that's it.  I've left it there for over and hour, and it never
> > gets past that.
> >=20
> > I booted off of an FC3 rescue cd, and found that I could mount the /boot
> > partition, but I cannot mount the / partition.  I ran various lvm
> > commands that identified two lvm volumes on the system.
> > fsck'ing /dev/hda2 (which is /) is getting me no where though - it just
> > says "invalid argument".

Yes, it would do, it looks like /dev/hda2 holds a volume (sorry if my termi=
nology
is incorrect, it's bloody confusing), but definitely not a filesystem direc=
tly.
So you don't want to fsck /dev/hda2!

> > I tried firing up device mapper and udev in order to get
> > a /dev/VolGroup00 directory, but it just wouldn't do it - at least, not
> > with the things I tried.  I could mkdir the directory, but then "lvm
> > vgmknodes" would remove it.

You don't actually have to use udev if you can't get it to work. udev is ju=
st
a userspace program which automates the grunt work of setting up a ramdisk-=
based
/dev filesystem.

All you really need to do to gain access to the root filesystem is:

1) Note down what the root=3D device is that appears on the kernel
command line (this can be found by going to boot from hard drive and then e=
xamining
the kernel command line in grub, or by looking in /boot/grub/grub.conf )

2) Be booted from rescue disk

3) Sanity check: ensure that the nodes /dev/hda, /dev/hda2 etc. exist

4) Start up LVM2 (assuming it is not already started by the rescue disk!) by
typing:

  lvm vgchange --ignorelockingfailure -P -a y

Looking at my initrd script, it doesn't seem necessary to run any other com=
mands
to get LVM2 volumes activated - that's it.

5) Find out which major/minor number the root device is. This is the slight=
ly tricky
bit. You may have to use trial-and-error. In my case, I guessed right first=
 time:
(no comments about my odd hardware setup please ;)

[root@localhost t]# ls /sys/block
dm-0  dm-2  hdd    loop1  loop3  loop5  loop7  ram0  ram10  ram12  ram14  r=
am2  ram4  ram6  ram8
dm-1  hdc   loop0  loop2  loop4  loop6  md0    ram1  ram11  ram13  ram15  r=
am3  ram5  ram7  ram9
[root@localhost t]# cat /sys/block/dm-0/dev
253:0
[root@localhost t]# devmap_name 253 0
Volume01-LogVol02

In the first command, I listed the block devices known to the kernel. dm-* =
are the LVM
devices (on my 2.6.9 kernel, anyway). In the second command, I found out th=
e major:minor
numbers of /dev/dm-0. In the third command, I used devmap_name to check tha=
t the device
mapper name of node with major 253 and minor 0, is the same as the name of =
the root device
from my kernel command line (cf. step 1). Apart from a slight punctuation d=
ifference,
it is the same, therefore I have found the root device.

I'm not sure if FC3 includes the devmap_name command. According to fr2.rpmf=
ind.net, it doesn't.
But you don't really need it, you can just try all the LVM devices in turn =
until you find
your root device. Or, I can email you a statically-linked binary of it if y=
ou want.

6) Create the /dev node for the root filesystem if it doesn't already exist=
, e.g.:

  mknod /dev/dm-0 b 253 0

using the major-minor numbers found in step 5.

Please note that for the purpose of _rescue_, the node doesn't actually hav=
e to be under
/dev (so /dev doesn't have to be writeable) and its name does not matter. I=
t just needs
to exist somewhere on a filesystem, and you have to refer to it in the next=
 command.

7) Do what you want to the root filesystem, e.g.:

  fsck /dev/dm-0
  mount /dev/dm-0 /where/ever

As you probably know, the fsck might actually work, because a fsck can some=
times
correct filesystem errors that the kernel filesystem modules cannot.

8) If the fsck doesn't work, look in the output of fsck and in dmesg for si=
gns of
physical drive errors. If you find them, (a) think about calling a data rec=
overy
specialist, (b) do NOT use the drive!

I _think_ that is the right order to do things in, but I'm not 100% sure.

If this works, I expect a reward, ta.

--=20
Robin

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBvlwqtPCt67UksSYRAm1tAKC7WhjQKz9XVOmS3UfC3dx+USw+rgCfUvxE
q7Pf2xdDmxk74bsIwNPLvFo=
=c2py
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
