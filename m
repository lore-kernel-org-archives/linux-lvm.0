From: "William Blunn" <bill@tao-group.com>
Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
Message-Id: <000701c1b07d$2d69e600$216410ac@tao.co.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <wxx3d0d2czp.fsf@nommo.uio.no>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Fri Feb  8 02:47:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com
Cc: terjekv@math.uio.no

>   first, I'm sorry for asking here, but I'm close enough on topic (I
>   hope :) and I know there are bright heads who deal with linux at
>   this level out there.  I've also looked through google, and at the
>   kernel IDE-documentation.  and the little thing that lingers is
>   128GiB.
>=20
>   fdisk is only able to address 128GiB, that's rather obvious.
>   ...
>   if I pvcreate the device itself it helps a little, but not
>   much.

No-one seems to have mentioned the nub of the issue:

    /dev/hda would have been 128 GiB in size.

So trying different tools/techniques won't help you one bit!!!

The problem is the IDE limit. IDE has 28 bits to address the block. The
block is 2^9 bytes. So the maximum device size is

    2^(28+9) B =3D 128 GiB ~=3D 137 GB.

Maxtor have addressed this limit with their "Big Drive" scheme
(http://www.maxtor.com/products/bigdrive/ - read the white paper), which
extends the address size from 28 to 48 bits. This extends the maximum
device size to

    2^(48+9) B =3D 128 PiB ~=3D 144 PB ~=3D 144,115,188 GB

This of course means an updated version of the ATA interface
specification, which in turn means that you need different software
drivers.

In the Linux world this means you need kernel patches in order to access
the portion above 128 GiB.

I am very pleased to learn that Andrei has made a patch. Now I can
cheerfully go out and buy 160 GB drives knowing that I can get Linux to
see the whole drive - cool!

One wonders how long it will take the other operating systems to catch
up with Linux (again) :-)

Bill
--=20
William H. Blunn - bill@tao-group.com - Developer Support
Tao
62/63 Suttons Business Park, Earley, READING, RG6 1AZ, United Kingdom
Tel: +44 118 901 2999 - Fax: +44 118 901 2963 - http://tao-group.com/
