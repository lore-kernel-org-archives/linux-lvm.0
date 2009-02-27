Subject: Re: [linux-lvm] vgchange doesn't enable found VGs
From: "Brian J. Murrell" <brian@interlinx.bc.ca>
In-Reply-To: <49A81CA2.7080907@redhat.com>
References: <1235748997.1193.15.camel@pc.interlinx.bc.ca>
	<49A814EA.3090902@redhat.com>
	<1235752705.1193.32.camel@pc.interlinx.bc.ca>
	<49A81CA2.7080907@redhat.com>
Content-Type: multipart/signed; micalg="pgp-sha1";
	protocol="application/pgp-signature";
	boundary="=-RksTpPFR9dLsRbksSqGl"
Date: Fri, 27 Feb 2009 12:30:30 -0500
Message-Id: <1235755830.1193.40.camel@pc.interlinx.bc.ca>
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
To: bmr@redhat.com, LVM general discussion and development <linux-lvm@redhat.com>


--=-RksTpPFR9dLsRbksSqGl
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2009-02-27 at 17:02 +0000, Bryn M. Reeves wrote:
>=20
> So it's not scanning /dev/sda at all (only ramdisks?).

So it seems, yes.

> Do you have any
> filter settings in lvm.conf

devices {
    dir =3D "/dev"
    scan =3D [ "/dev" ]
    preferred_names =3D [ ]
    filter =3D [ "a/.*/" ]
    cache_dir =3D "/etc/lvm/cache"
    cache_file_prefix =3D ""
    write_cache_state =3D 1
    sysfs_scan =3D 1     =20
    md_component_detection =3D 1
    ignore_suspended_devices =3D 0
}

>  and are you sure that the SD device nodes
> will have been created at this point in the boot process?

Well, the data from the previous message was done on a fully booted
machine, complete with /dev/sda being present for many, many minutes if
not hours.

> You don't mention the distribution you're using

RHEL5.2.

> but most 2.6 based
> setups will use udev to manage driver loading and device node creation
> during boot. It's possible for these to get out of sync in some cases.

Yes, but again, the data I am giving you is being taken from a
completely up and running system.

> Is there any way you can grab a listing of /dev at the moment the
> vgchange runs during boot?

Not relevant per above.

> Did it scan /dev/sda this time?

Yes.

> Just to be clear, are you only seeing this problem during boot or are
> you able to reproduce once the system has completed booting (i.e.
> vgchange -ay fails but vgchange -ay <vg name> succeeds)?

As per the above, I can reproduce on a completed booted system.

b.


--=-RksTpPFR9dLsRbksSqGl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEABECAAYFAkmoIzQACgkQl3EQlGLyuXA/jACgreaHhLOTpGZyrfE6/xTrWElT
6cMAoMxEJEz2blv/B8vX0oNF1NLRj2wB
=rmUb
-----END PGP SIGNATURE-----

--=-RksTpPFR9dLsRbksSqGl--
