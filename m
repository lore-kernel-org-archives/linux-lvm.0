Return-Path: <lewis@sistina.com>
Date: Fri, 19 Jan 2001 10:17:57 -0600
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] Patch for Kernel 2.2.16
Message-ID: <20010119101757.K23203@sistina.com>
References: <615A249B783CD41192F400D0B747AC8601A001EB@hesse.bbn.hp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="bX/mw5riLlTkt+Gv"
Content-Disposition: inline
In-Reply-To: <615A249B783CD41192F400D0B747AC8601A001EB@hesse.bbn.hp.com>; from holger_zecha@hp.com on Fri, Jan 19, 2001 at 04:19:54PM +0100
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

--bX/mw5riLlTkt+Gv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 19, 2001 at 04:19:54PM +0100, ZECHA,HOLGER (HP-Germany,ex1) wro=
te:
> is there a lvm patch for kernel 2.2.16 available ?

By following the instructions in the PATCHES/README file for 0.9.1 Beta2, I
was able to generate a patch that appears to work for 2.2.16.  I copied the
fragments-2.2.18 file to fragments-2.2.16 and ran 'make' in the PATCHES
directory.  This created a file called lvm-0.9.1_beta2-2.2.16.patch.

I grabbed the 2.2.16 rawio patch from the 0.8.1 release of LVM.  (You can
get this from the LVM ftp site at
ftp://ftp.sistina.com/LVM/0.8.1/PATCHES/linux-2.2.16-rawio.patch)  I applied
this rawio patch and the generated lvm patch to the clean 2.2.16 kernel,
configured, and built the kernel.  After installing the kernel and rebooting
the machine, I was able to see the volume group i had created with a 2.2.18
kernel and LVM 0.9.1 Beta2.  I mounted a logical volume from the volume
group, and was able to use it. =20

That is the extent of the testing I have done, so if you are worried about
your data, don't do this!  Or at least backup your data before trying it.
Good luck.

--=20
AJ Lewis
Sistina Software Inc.                  Voice:  612-379-3951
1313 5th St SE, Suite 111              Fax:    612-379-3952
Minneapolis, MN 55414                  E-Mail: lewis@sistina.com
http://www.sistina.com

Current GPG fingerprint =3D 3B5F 6011 5216 76A5 2F6B  52A0 941E 1261 0029 2=
648
Get my key at: http://www.sistina.com/~lewis/gpgkey
 (Unfortunately, the PKS-type keyservers do not work with multiple sub-keys)

-----Begin Obligatory Humorous Quote----------------------------------------
Students nowadays, complaining they only get 5MBs of disk space!
In my day we were lucky if we had one file, and that was /dev/null.
-----End Obligatory Humorous Quote------------------------------------------

--bX/mw5riLlTkt+Gv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6aGi1pE6/iGtdjLERAoNtAJ9Ca/Zv4FOHb6wY5aL3IkI/kbvJPgCgiXv4
pKfbTdQIiE5WETAX1chL68Q=
=0raH
-----END PGP SIGNATURE-----

--bX/mw5riLlTkt+Gv--
