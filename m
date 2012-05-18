Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q4I1GVRi003830
	for <linux-lvm@redhat.com>; Thu, 17 May 2012 21:16:31 -0400
Received: from mail.bitfolk.com (bitfolk.com [85.119.80.223])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q4I1GUi2030583
	for <linux-lvm@redhat.com>; Thu, 17 May 2012 21:16:30 -0400
Received: from andy by mail.bitfolk.com with local (Exim 4.72)
	(envelope-from <andy@strugglers.net>) id 1SVBnv-0001il-Oe
	for linux-lvm@redhat.com; Fri, 18 May 2012 01:16:28 +0000
Date: Fri, 18 May 2012 01:16:27 +0000
From: Andy Smith <andy@strugglers.net>
Message-ID: <20120518011627.GD3867@bitfolk.com>
References: <CAGQjrKb6_HuVc2Ro8vnkMwEmHg-H4gJHJVf_Q5GVaZfSM1p7yA@mail.gmail.com>
	<20120517181350.2922a70b@bettercgi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-ripemd160;
	protocol="application/pgp-signature"; boundary="/Rh48Y0bnrojh5Wm"
Content-Disposition: inline
In-Reply-To: <20120517181350.2922a70b@bettercgi.com>
Subject: Re: [linux-lvm] lvreduce nightmare
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
To: linux-lvm@redhat.com


--/Rh48Y0bnrojh5Wm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, May 17, 2012 at 06:13:50PM -0500, Ray Morris wrote:
> > resize2fs /dev/vg0/data 100G
> > lvreduce -L -100G -n /dev/vg0/data*
>=20
> A 100 GB filesystem needs a block device of around 110 GB.  So this
> cut off the end of your filesystem. (The device needs to hold the
> journal as well as the FS, for example.)

I normally do as you suggest and resize2fs smaller, lvreduce and
then resize2fs again. This is due to paranoia though - I'm sure that
I normally see it match up with the lvreduce size exactly.

Surely OP's actual problem is that he has an FS with 2+ TB of data
on it that he resize2fs'd down *to* 100G when he actually wanted to
resize2fs it down *by* 100G? He said:

> >  I tried to reduce the VG and this is what it looked like before I
> > tried to reduce it
> >=20
> > Filesystem                       Size  Used Avail   Use% Mounted on
> > /dev/mapper/vg0-data         2.2T  1.7T  433G  80%  /data

Anyway I suspect your advice is still accurate though since you're
advising what to do when someone reduces an LV to very slightly
smaller than it needs to be to hold a ~100G FS and what he's
actually done is resize2fs and lvreduce a 2+TB FS into only 100G.
Hopefully all the data is still there and it's just the pointers
that are broken..  nasty.

> resize2fs to smaller size than you wish to end up with.=20
> see resize2fs -M=20

Ooh, I hadn't spotted that option. That certainly would reduce my
paranoia in future about making mistakes similar to this.

Cheers,
Andy

--=20
http://bitfolk.com/ -- No-nonsense VPS hosting

--/Rh48Y0bnrojh5Wm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEAREDAAYFAk+1ousACgkQIJm2TL8VSQunfwCg+8/sn3J3u00OUqE72uRuvLP5
GhQAoPsNTet1qkyafqbBDLN7GeYsnzOt
=sgQ4
-----END PGP SIGNATURE-----

--/Rh48Y0bnrojh5Wm--
