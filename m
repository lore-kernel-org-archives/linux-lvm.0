From: "Chad C. Walstrom" <chewie@wookimus.net>
Subject: Re: [linux-lvm] Mandrake 8.1 and LVM
Message-ID: <20011130192909.B1239@wookimus.net>
References: <20011130142015.F23836@wookimus.net> <20011130140221.B32143@auctionwatch.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
Content-Disposition: inline
In-Reply-To: <20011130140221.B32143@auctionwatch.com>
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
Date: Fri Nov 30 19:27:02 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 30, 2001 at 02:02:21PM -0800, Petro wrote:
> So you can install software that puts stuff in /usr/share/man and
> /usr/share/doc? =20

What's to stop you from installing software if you have mounted your
partition as read only?  It only forces you to do an extra step.

    bash# mount -o remount,rw /usr
    bash# # install your software
    bash# sync; mount -o remount,ro /usr

If the software is "putting stuff", a.k.a. creating variable data, it
belongs in a /var location.  i.e. /var/cache/man/...

Remember, the object of FHS is to provide people the ability to NFS
share their /usr partition.  If you have applications changing the data
on a number of machines to these directories, you're going to regret
your filesystem management decisions.  /var is for locally generated
data created by applications.

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Get my public key, ICQ#, etc. $(mailx -s 'get info' chewie@wookimus.net)

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8CDJlDMcLGCBsWv0RAoA5AKCCTQ9HIDsgIfrPNE6rosDa1yb1EACfbzQe
3c9byZFgtXOGQCvmsUi443M=
=SG6i
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
