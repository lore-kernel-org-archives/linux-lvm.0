From: Chad Walstrom <chewie@wookimus.net>
Subject: Re: [linux-lvm] has anyone used LVM in a HA cluster?
Message-ID: <20020509193503.GD2472@wookimus.net>
References: <FB4B89C780FB274F8122447ED6CCDD773B492A@ads-ems.archway.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="eheScQNz3K90DVRs"
Content-Disposition: inline
In-Reply-To: <FB4B89C780FB274F8122447ED6CCDD773B492A@ads-ems.archway.com>
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
Date: Thu May  9 14:38:02 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--eheScQNz3K90DVRs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2002 at 09:54:40AM -0700, Au, Richard wrote:
> I'm wondering if anyone has used LVM in a high-availibility cluster
> where two servers are connected to shared storage (the physical
> volumes).  If so, which cluster solution did you use?  Will there be
> problems if the logical volumes are visable to both servers, even if
> only one of them has them mounted?  Thanks!

Doing something like this w/o having servers participate in some sort of
locking or journaling scheme is somewhat scary.  You'd have to be pretty
careful on how you access a shared physical storage system in this
manner.

I believe Sistina's GFS project might be more to your liking. IIRC, it's
a clustered, journaling filesystem designed explicitly for your setup.
It's a bonus that it is also GPL.  Check it out at:
http://www.sistina.com/products_gfs.htm.  The latest GPL version of GFS
seems to be 4.1.1 (as present on ftp://ftp.sistina.com/pub/GFS).  I'm
not sure, but I'm assuming from the info available on the website that
GFS 5.0.1 is commercially available as well.  Is Sistina doing something
similar to TrollTech w/licensing GFS, then?  Or are they just behind the
ball as far as releasing the newer versions to the ftp site?  (I'm
assuming the former.)

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr

--eheScQNz3K90DVRs
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE82s9nDMcLGCBsWv0RAo2mAKDU1jdxxoA71wI+8M6NiSTPgXC8UACgqvyg
yz8XlpQFBG8DghnVCDxiEhQ=
=pPDz
-----END PGP SIGNATURE-----

--eheScQNz3K90DVRs--
