From: "Chad C. Walstrom" <chewie@wookimus.net>
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011130142015.F23836@wookimus.net>
References: <20011130020118.C17482@wookimus.net> <NBBBKLKHMJHIJLHOGAOJOEDKJCAA.steve.wray@the.net.nz>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ZInfyf7laFu/Kiw7"
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJOEDKJCAA.steve.wray@the.net.nz>
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
Date: Fri Nov 30 14:18:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--ZInfyf7laFu/Kiw7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2001 at 09:41:21PM +1300, Steve Wray wrote:
> > Reason #1:  Mount /usr as read-only.  There is only one reason why you
>=20
> ONLY if you also have /usr/share (for one, there may be others) on writea=
ble
> partitions!!!

Why would you want/need to have /usr/share writeable?  FHS 2.2 states:

        4.11  /usr/share : Architecture-independent data

        4.11.1  Purpose

        The /usr/share hierarchy is for all read-only architecture
        independent data files. [25]

        This hierarchy is intended to be shareable among all architecture
        platforms of a given OS; thus, for example, a site with i386,
        Alpha, and PPC platforms might maintain a single /usr/share
        directory that is centrally-mounted.  Note, however, that
        /usr/share is generally not intended to be shared by different
        OSes or by different releases of the same OS.

        Any program or package which contains or requires data that
        doesn't need to be modified should store that data in /usr/share
        (or /usr/local/share, if installed locally).  It is recommended
        that a subdirectory be used in /usr/share for this purpose.

        Game data stored in /usr/share/games must be purely static data.
        Any modifiable files, such as score files, game play logs, and so
        forth, should be placed in /var/games.

        ...

        Footnote:=20
        25.  Much of this data originally lived in /usr  (man,  doc)  or
        /usr/lib (dict, terminfo, zoneinfo).

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Get my public key, ICQ#, etc. $(mailx -s 'get info' chewie@wookimus.net)

--ZInfyf7laFu/Kiw7
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8B+n/DMcLGCBsWv0RAtRiAKC5dm1s2qF3twfBS0vxpTRix+MrigCfcKsc
5INgYBoXuZhqr7er+zssDb4=
=+1hT
-----END PGP SIGNATURE-----

--ZInfyf7laFu/Kiw7--
