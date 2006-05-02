Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k420KN7S004899
	for <linux-lvm@redhat.com>; Mon, 1 May 2006 20:20:23 -0400
Received: from linux.interlinx.bc.ca (linux.interlinx.bc.ca [66.11.173.224])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k420KHl6024164
	for <linux-lvm@redhat.com>; Mon, 1 May 2006 20:20:17 -0400
Received: from pc.local (pc.ilinx [10.75.22.1])
	(using TLSv1 with cipher RC4-MD5 (128/128 bits))
	(No client certificate requested)
	by linux.interlinx.bc.ca (Postfix) with ESMTP id 9D370DB624
	for <linux-lvm@redhat.com>; Mon,  1 May 2006 20:20:15 -0400 (EDT)
Subject: Re: [linux-lvm] recover a pv from a disk with no partition table
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <20060501235549.GA29617@old.davidb.org>
References: <1146527256.31003.63.camel@pc.local>
	<20060501235549.GA29617@old.davidb.org>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-m68kJ0vKQ9DrbEAW+/V4"
Date: Mon, 01 May 2006 20:20:13 -0400
Message-Id: <1146529213.31003.67.camel@pc.local>
Mime-Version: 1.0
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


--=-m68kJ0vKQ9DrbEAW+/V4
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, 2006-05-01 at 16:55 -0700, David Brown wrote:
> On Mon, May 01, 2006 at 07:47:36PM -0400, Brian J. Murrell wrote:
> > I need to recover a PV from a disk with no partition table.  I have a
> > disk which gives EIO errors trying to read from the first few blocks of=
,
> > so, no partition table.
> >=20
> > Is there any way with LVM2, given that I have
> > the /etc/lvm/backup/<vgname> file that I can determine the offset into
> > the disk where the partition starts, so that I could do:
>=20
> The backup files don't list physical offsets.

Indeed.  That's why I used gpart, without success.

> But, you can see the id's for the partitions, and the lvm
> header is at offset 0x200 into the partition.

Yeah, I did notice that on another pv on the system:

# hexdump -C /dev/sda2 | less
00000000  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |..............=
..|
*
00000200  4c 41 42 45 4c 4f 4e 45  01 00 00 00 00 00 00 00  |LABELONE......=
..|
00000210  ad 24 02 c2 20 00 00 00  4c 56 4d 32 20 30 30 31  |=AD$.=C2 ...LV=
M2 001|
00000220  68 76 37 6b 4e 49 32 4e  72 5a 33 52 73 39 38 5a  |hv7kNI2NrZ3Rs9=
8Z|
00000230  42 65 73 33 53 76 4a 4c  75 68 61 4f 62 6a 53 36  |Bes3SvJLuhaObj=
S6|

Unfortunately, I am unable to find any "LABELONE" on the PV I am trying
to recover.  I'm getting a bad feeling that that means that the LVM
(device mapper) mappings are gone.  :-(

b.

--=20
My other computer is your Microsoft Windows server.

Brian J. Murrell

--=-m68kJ0vKQ9DrbEAW+/V4
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.2.2 (GNU/Linux)

iD8DBQBEVqW9l3EQlGLyuXARAqI9AJ9ntx9fXdwdv490QcYs2QWfYotTzgCeJ/r0
GunTCPceG486+iYQjHbL/OY=
=MJkw
-----END PGP SIGNATURE-----

--=-m68kJ0vKQ9DrbEAW+/V4--
