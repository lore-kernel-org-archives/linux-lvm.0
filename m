Return-Path: <lewis@sistina.com>
Date: Thu, 26 Jul 2001 10:39:45 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] LVM Bug, or Human Incompetence?
Message-ID: <20010726103945.A17862@sistina.com>
References: <20010726072115.A19419@paranoid.dyn.dhs.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="qMm9M+Fa2AknHoGS"
Content-Disposition: inline
In-Reply-To: <20010726072115.A19419@paranoid.dyn.dhs.org>; from paranoid-lvm@tweet.paranoid.dhs.org on Thu, Jul 26, 2001 at 07:21:15AM -0700
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

--qMm9M+Fa2AknHoGS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2001 at 07:21:15AM -0700, Mark Glines wrote:
> Note that the system is still useable at this point... the kernel LVM is =
fine,
> but none of the userland tools can find their asses (this includes receiv=
ing
> periodic lvmsadc crontab mouth-frothings about the kernel and /etc/lvmtab=
 DB
> mismatch).  After a reboot, however, vgscan still can't find its ass and
> everything fails, taking most of the machine's overall competence with it=
=20
> (obvious due to lack of /usr).  After a reboot, a sequence like the follo=
wing
> is necessary to bring it back:
>=20
> cd /etc/lvmconf
> mv tweet.conf.1.old tweet.conf
> vgcfgrestore -v -n tweet /dev/hdb
> vgscan
> /etc/init.d/lvm restart
> mount /usr
> mount /home
> mount /music
> *start various services manually, reboot, or switch init runlvls*

odd...
=20
> I'm running stock linux 2.4.6 LVM built as a module, with the debian sid =
"lvm10"
> package userland utilities (debian package version 0.9-1.2).

I think you might want to try using the LVM 0.9.1 Beta2 tools.  That is the
toolset that most closely matches the kernel LVM module.  That being said, =
it is
strongly recommended that you upgrade to the 0.9.1 Beta8 LVM, and patch your
kernel.  If you have an existing LVM setup, you will need to do some metada=
ta
migration (this is outlined in the README.1st on the FTP site where you can=
 get
LVM 0.9.1 Beta8 (ftp://ftp.sistina.com/pub/LVM/0.9.1_beta)

> hda2 used to be a DOS "extended" partition, containing 3 logical drives. =
 All 3
> of these have been migrated successfully to LV's (the VG using hdb as sol=
e PV).
> That leaves me (after a bit of cfdisking) with one free partition taking =
up 80%
> of hda.  I'd love to use this partition as a PV and chuck it into the VG,=
 but
> it doesn't seem to work, as I've documented above.
>=20
> Am I doing something wrong?  How outdated is the LVM code in stock 2.4.6?=
  If this
> isn't my fault, is this likely to be a kernel bug or userland bug?  Would=
 a redo
> of the transscript, using -d instead of (or in addition to) -v, be useful?

The kernel LVM code is about 5-6 months out of date.  I am pretty sure that=
 your
toolset is not very well matched for the kernel code.  As I said earlier, i=
t is
strongly recommended that you download LVM 0.9.1 Beta8, and follow the proc=
edure
in README.1st to upgrade to that version of LVM.

Hopefully the changes will be incorporated in the vanilla kernel soon...
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
Choose a job you love, and you will never have to work a day in your life.
-----End Obligatory Humorous Quote------------------------------------------

--qMm9M+Fa2AknHoGS
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7YDnBpE6/iGtdjLERAox7AJ93KAcD8pEvfeTKuJuTxJHgveP0cgCfbcSM
P0gTajJH9dtI/Ph9pDGt94A=
=Ousp
-----END PGP SIGNATURE-----

--qMm9M+Fa2AknHoGS--
