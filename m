From: Wiktor Wodecki <wodecki@gmx.de>
Subject: Re: [linux-lvm] bug in lvm 1.0.[23]
Message-Id: <20020304194901.GB769@kakerlak>
References: <20020301185709.GC1654@kakerlak>
    <20020301115523.S22608@lynx.adilger.int>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="IiVenqGWf+H9Y6IX"
Content-Disposition: inline
In-Reply-To: <20020301115523.S22608@lynx.adilger.int>
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
Date: Mon Mar  4 12:54:01 2002
List-Id: <linux-lvm.redhat.com>
To: Andreas Dilger <adilger@clusterfs.com>
Cc: linux-lvm@sistina.com

--IiVenqGWf+H9Y6IX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

begin  Andreas Dilger  quotation:

> On Mar 01, 2002  19:57 +0100, Wiktor Wodecki wrote:
> Probably just old devices in /dev.  Just delete /dev/storage and /dev/vg0
> and re-run vgscan.  It should set it up properly now.

the point was that the system doesn't get it if I plug-in two vg's with
the same name. That's the bug :-)

--=20
Regards,

Wiktor Wodecki      |    http://johoho.eggheads.org
wodecki@gmx.de      |    IRC: Johoho@IrcNET

--IiVenqGWf+H9Y6IX
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8g8+t6SNaNRgsl4MRAiXfAJoCx0rMcJsvrRV1GDFlMlkRrtEiPwCfcjg1
DMwodbExJfxJVsl0aJE2Epw=
=Z4j7
-----END PGP SIGNATURE-----

--IiVenqGWf+H9Y6IX--
