Date: Thu, 26 Oct 2006 22:10:06 +0100
From: Paul LeoNerd Evans <leonerd@leonerd.org.uk>
Subject: Re: [linux-lvm] Mirror resync direction
Message-ID: <20061026221006.3a169598@nim.leo>
In-Reply-To: <20061026202702.GF1319@agk.surrey.redhat.com>
References: <20061026211738.008da405@nim.leo>
	<20061026202702.GF1319@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_sh2hEgdDd0ZMTS668ZE=G19";
	protocol="application/pgp-signature"; micalg=PGP-SHA1
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
Cc: agk@redhat.com

--Sig_sh2hEgdDd0ZMTS668ZE=G19
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Thu, 26 Oct 2006 21:27:02 +0100
Alasdair G Kergon <agk@redhat.com> wrote:

> On Thu, Oct 26, 2006 at 09:17:38PM +0100, Paul LeoNerd Evans wrote:
> > testing (2.02.06-3). I use it to set up a VG containing two
>=20
> > Is this a bug in the LVM2 tools, or the dm-mirror target, or what? Is it
> > perhaps a limitation of --corelog; in which case, how can I protect
> > against that?
>=20
> Firstly, this is work in progress, so you should be using newer
> tools.  Secondly, with newer tools you should follow a different
> procedure: use vgreduce --removemissing (carefully) to remove the
> lost device, add the replacement disk to the VG in the normal
> way, then use lvconvert to turn the LV back into a mirror.

Thanks for the quick reply :)

I've looked at my copy of vgreduce, and that has the option you named. I
tried that and it did as I suspected, namely converted the mirror back to
a plain linear LV, that I can mount as normal and use. Then running
pvcreate / vgextend / lvconvert --mirror 1, and now that works fine.

Thanks for the help.

> And I should add, dmeventd will do these steps automatically on failure
> if you configure it into the lvm2 and device-mapper packages and apply
> the right kernel patches (they're nearly ready for upstream submission).

Will that be a separate userland program? Presumably it'll appear in a
debian package of the same name at some point.

--=20
Paul "LeoNerd" Evans

leonerd@leonerd.org.uk
ICQ# 4135350       |  Registered Linux# 179460
http://www.leonerd.org.uk/

--Sig_sh2hEgdDd0ZMTS668ZE=G19
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (GNU/Linux)

iD8DBQFFQSQ1qRXzCRLr5iQRAmHZAJ9/8ajpEB0cMC6jla7MNVtFpn9zqwCeO+Bc
auLphg8E7F54AtZDhJA/XBU=
=HBul
-----END PGP SIGNATURE-----

--Sig_sh2hEgdDd0ZMTS668ZE=G19--
