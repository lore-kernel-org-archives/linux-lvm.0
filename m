From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] What is VFS
Message-ID: <20011029163350.B22997@dragon.blacknet.de>
References: <20011029084748.E4182@tykepenguin.com> <000201c16088$c16c6610$0101a8c0@mdmiller.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <000201c16088$c16c6610$0101a8c0@mdmiller.com>; from mitch@mdmiller.com on Mon, Oct 29, 2001 at 08:48:20AM -0600
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
Date: Mon Oct 29 09:33:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Mon, Oct 29 '01 at 08:48, Mitch Miller wrote:
> I guess I'm not _for_sure_ what VFS is, and why it'd be detecting so many
The VFS is the virtual filesystem layer, that lies under all
FileSystems.
> (literally hundreds per hour) disk changes.  I do have a standard floppy,
I can only guess on this, maybe your (unused) JAZZ drives spinnes down
and creates a 0 (removed), than the driver spinns it up again (1) ...
> and a SCSI attached (Adaptec 2940) Iomega Jazz drive.  The drive has a
> single LVM partition on it, but it's not currently mounted (I've not fully
> implemented LVM on this box yet).

--=20
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.

--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE73Xbdf5srOMkjkQoRAlEqAKDtYUaLB09vomYHdT93tflH2a+3mgCgoNuh
z6wE6YJpRqyEOYuKILvKStY=
=ZbRZ
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--
