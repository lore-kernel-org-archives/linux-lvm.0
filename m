Subject: Re: [linux-lvm] moving single LVM disk from one system to another
Message-ID: <20020819122400.GB2237@pc.ilinx>
References: <20020817070901.GA5022@linux.interlinx.bc.ca> <20020819102427.A24314@sistina.com> <20020819090226.GA13367@linux.interlinx.bc.ca> <20020819100456.GB13367@linux.interlinx.bc.ca>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XOIedfhf+7KOe/yw"
Content-Disposition: inline
In-Reply-To: <20020819100456.GB13367@linux.interlinx.bc.ca>
From: lvm@interlinx.bc.ca
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
Date: Mon Aug 19 07:24:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--XOIedfhf+7KOe/yw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

It's embarassing but I will come clean...

On Mon, Aug 19, 2002 at 06:04:57AM -0400, lvm@interlinx.bc.ca wrote:
>=20
> there are no device nodes under
> /dev/ide/host0/bus[01]/target0/.  Strange.

Not so strange once I looked more closely.  To try to soften the
embarassment, let me explain.  I am moving a disk from one motherboard
to another.  The board the disk was created on had two pairs (primary
and secondary times two) of IDE ports.  Regular, ol' IDE on ports
on hda-hdd and ATA100 on ports hde-hdh.

Since the disk in question is an ATA 100 disk, I put it on hde to take
advantage of the faster bus speed.  Not wanting to waste "good" ATA
100 ports on silly devices like CD-RW drives I put mine on hda.  And
of course since it's a writer, added "hda=3Dide-scsi" to the kernel
command line.  I think you know where this is going.

In moving the disk to the new motherboard, it only has a single pair
of IDE ports (primary and secondary), all ATA100, hda-hdd.  So,
naturally, I put the disk on hda, which was being masked by the
hda=3Dide-scsi kernel parameter.  Thus the empty /dev/ide/.../lun0/
directory.

Sorry to bother y'all with such a silly mistake.  :-)

b.

--=20
Brian J. Murrell

--XOIedfhf+7KOe/yw
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.7 (GNU/Linux)

iD8DBQE9YONgl3EQlGLyuXARAop3AJ0T4bSttjYFFAngO6BoAugEC142IwCg1j6W
NCJWhd5IPeWQTuFRbcZnHt4=
=RlJF
-----END PGP SIGNATURE-----

--XOIedfhf+7KOe/yw--
--XOIedfhf+7KOe/yw--
