From: "Chad C. Walstrom" <chewie@wookimus.net>
Subject: Re: [linux-lvm] Directory becomes sticky socket?
Message-Id: <20020205183643.GE9198@wookimus.net>
References: <20020204154410.GA14373@wookimus.net>
    <20020205110759.C30823@sistina.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="mSxgbZZZvrAyzONB"
Content-Disposition: inline
In-Reply-To: <20020205110759.C30823@sistina.com>
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
Date: Tue Feb  5 12:38:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--mSxgbZZZvrAyzONB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 05, 2002 at 11:07:59AM +0100, Heinz J . Mauelshagen wrote:
> Chad, check for processes having the socket open, stop them and retry.
> An optional "chmod o-t /usr/share/doc/libldap2" may be necessary.

I should have done that first, I suppose.  I did end up shutting down to
single user mode, unmounting the logical volume, and using debugfs to
clear the inode (which still reported the file as being a socket).  This
actually happend to one other file, and a third was a corrupted symbolic
link of some kind.  Regardless, with these three files cleared,
fsck.ext3 happily cleared dtime's and reset inode sizes until I had a
working system again.  Thanks to all who sent me suggestions.

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Get my public key, ICQ#, etc. $(mailx -s 'get info' chewie@wookimus.net)

--mSxgbZZZvrAyzONB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8YCY7DMcLGCBsWv0RAvgRAJ9vl9mwtBfR+3NYIAwuTmgUn4O1hACZAc2p
6NT1tu5t9Hqo0HP5nuTW2eI=
=f/Su
-----END PGP SIGNATURE-----

--mSxgbZZZvrAyzONB--
