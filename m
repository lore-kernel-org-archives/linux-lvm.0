From: Adam McDaniel <adamm@array.org>
Message-ID: <20020819192319.GB25631@grimlock>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Content-Disposition: inline
Subject: [linux-lvm] accidently formatted a physical volume...
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
Date: Mon Aug 19 14:23:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi.. I've had a simple implementation of LVM running on two 10gig
harddrives.. Everything was working fine until one day a co-worker
decided he wanted to run `mkfs.ext2 /dev/hdb`

Needless to say, the VG was screwed and I couldn't get any data out.
My question is that I'm wondering if there is any way I can salvage
the other PV and alteast get SOME data out.

Or, is there any way that I can fix/restore the formatted drive?

For some background info, I had one VG, two PVs, and one LV with ext2
running on it. I *believe* I had it configured to concatinate the
data, but im not 100% if it was setup in stripe mode. I'm running LVM
1.0.0-3 (debian/testing)

Sorry if this question has been asked before, I tried searching
through the mailing-list/howto for an answer but found nothing
useful.

Thanks in advance :)

--=20
Adam McDaniel
Array Networks
Calgary, AB, Canada

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE9YUWnIHy9fg7fMMMRAn8qAJ0Wj5167TEFpambCxbjhNlhGN3m9QCdGG0L
3UfuT6IXpqfT2uuvvIj26nE=
=wXzI
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
