Date: Mon, 27 Aug 2001 09:40:55 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Installed the lvm on the Red Hat 7.1 then what to do
Message-ID: <20010827094055.A12574@sistina.com>
References: <994015538.6465.5.camel@detrius>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="vkogqOf2sHV7VnPd"
Content-Disposition: inline
In-Reply-To: <994015538.6465.5.camel@detrius>; from erik@bagfors.nu on Sun, Jul 01, 2001 at 09:25:38PM +0200
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
To: =?iso-8859-1?Q?Erik_B=E5gfors?= <erik@bagfors.nu>
Cc: linux-lvm@sistina.com

--vkogqOf2sHV7VnPd
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

n Sun, Jul 01, 2001 at 09:25:38PM +0200, Erik B=E5gfors wrote:
>     hda1   hdc1      (PV:s on partitions or whole disks)
>        \   /
>         \ /
>        diskvg        (VG)
>        /  |  \
>       /   |   \
>   usrlv rootlv varlv (resizeable LV:s, think of them as resizeable virtua=
l partitions)
>     |      |     |
>  ext2  reiserfs  xfs (filesystems)

I hope you don't mind, but I've stuck this diagram in the LVM howto.  Is
that ok, or should i pull it out?

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
Programming graphics in X is like finding sqrt(pi) using Roman numerals.
-----End Obligatory Humorous Quote------------------------------------------

--vkogqOf2sHV7VnPd
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7ilv3pE6/iGtdjLERAnkjAJ91PCrnZlv3SUM5aSwBUOuykuW85wCeKSvO
RjwcmuOaEk7jaza3F1GIWcc=
=7unp
-----END PGP SIGNATURE-----

--vkogqOf2sHV7VnPd--
