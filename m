Date: Fri, 23 Sep 2005 13:42:04 -0400
From: David Mackintosh <David.Mackintosh@xdroop.com>
Message-ID: <20050923174204.GA30821@xdroop.com>
References: <1127486763.18453.11.camel@grma-lap>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="3V7upXqbjpZ4EhLz"
Content-Disposition: inline
In-Reply-To: <1127486763.18453.11.camel@grma-lap>
Subject: [linux-lvm] Re: Recovering data from LVM partitions....
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
To: Gary Mansell <Gary.Mansell@ricardo.com>
Cc: nahant-list@redhat.com, linux-lvm@redhat.com


--3V7upXqbjpZ4EhLz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 23, 2005 at 03:46:03PM +0100, Gary Mansell wrote:
=20
> Today I have had a filesystem failure on a machine and the / partition
> is very corrupted and will not boot. Is there anyway that I can access
> and recover the data from the logical volumes?

Memo for the archives: I had a disk in a LVM volume set die on me.  I
made some notes on pseudo-recovery at:

  http://xdroop.dhs.org/space/Linux/LVM+Volume+Failure

Note the "go back in time" step.

--=20
 /\oo/\
/ /()\ \ David Mackintosh | Public Key:=20
         dave@xdroop.com  | http://www.xdroop.com/dave/gpg.html
         $ gpg --recv-keys --keyserver subkeys.pgp.net 4C032504
         Mystery attachment?  http://xdroop.dhs.org/space/GPG

--3V7upXqbjpZ4EhLz
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.7 (GNU/Linux)

iD8DBQFDND5scwUBd0wDJQQRArDuAJ9r73ZtOCXynlWMOafHyJMPdCA7XACdFfwI
du3MoUv5wnSyMU6YPLGiwuE=
=8ari
-----END PGP SIGNATURE-----

--3V7upXqbjpZ4EhLz--
