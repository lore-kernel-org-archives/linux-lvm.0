Return-Path: <lewis@sistina.com>
Date: Sun, 6 May 2001 23:11:52 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Can't pvcreate second partition...
Message-ID: <20010506231152.A5547@sistina.com>
References: <20010506173613.78224.qmail@web10805.mail.yahoo.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="k+w/mQv8wyuph6w0"
Content-Disposition: inline
In-Reply-To: <20010506173613.78224.qmail@web10805.mail.yahoo.com>; from darren_young@yahoo.com on Sun, May 06, 2001 at 10:36:13AM -0700
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
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--k+w/mQv8wyuph6w0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 06, 2001 at 10:36:13AM -0700, Darren Young wrote:
> Funny, I had the same issue at the same time. I
> created /dev/hdb7 with fdisk and then a pvcreate just
> after. pvcreate stated that the dev didn't exist.
> Reboot fixed the problem. This could be a problem for
> machines already up in production with small windows
> for restarts. Why is this necessary and will it become
> a "non-issue" in future releases? If this will be
> necessary forever, then some simple planning would
> solve the problem, at least on new installations. Any
> way around this?

This appears to be an issue with fdisk and the 2.4.x series Linux kernels.
It has nothing to do with LVM as far as i can tell.  I've had problems where
I run fdisk to change the size of a partition, but linux doesn't detect the
change.  /proc/partitions is identical before and after i attempt to write
out the changes with fdisk.  I'm not sure what has caused this. Maybe
someone else on the list knows?

I'll try to verify this when i get into work tomorrow.

Regards,
--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-638-0500
1313 5th St SE, Suite 111              Fax:    612-638-0500
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Life's unfair - but root password helps!
-----End Obligatory Humorous Quote------------------------------------------

--k+w/mQv8wyuph6w0
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE69iCIpE6/iGtdjLERAs6rAJ9/GXyRbExDE63835G92fKpPowQ0wCfcKMh
fC6+yDg6Y1IlAxIG8XCRPSQ=
=Ryli
-----END PGP SIGNATURE-----

--k+w/mQv8wyuph6w0--
