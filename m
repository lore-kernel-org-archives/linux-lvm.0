Return-Path: <lewis@sistina.com>
Date: Fri, 27 Jul 2001 12:55:42 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] snapshots & reiserfs
Message-ID: <20010727125542.B14486@sistina.com>
References: <Pine.LNX.4.33.0107271727460.16916-100000@greebo.foobarhouse.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="hHWLQfXTYDoKhP50"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0107271727460.16916-100000@greebo.foobarhouse.com>; from jamesp@foobarhouse.com on Fri, Jul 27, 2001 at 05:31:38PM +0100
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

--hHWLQfXTYDoKhP50
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 27, 2001 at 05:31:38PM +0100, James Pattinson wrote:
> Im sure this is a FAQ but I can't find it.
>=20
> I want to be able to use snapshots on my beta8 / reiserfs (stock 2.5.7)
> system. I can create a snapshot OK, but when I try to mount it I get an
> error saying we can't replay the logs since we are mounted read only.

<-snip->
=20
> Any ideas? snapshots seem really cool, and i want to play :)

You need to make sure you apply the linux-2.4.x-VFS-lock.patch, and also
apply this:

--------
diff -Nru a/fs/reiserfs/super.c b/fs/reiserfs/super.c
--- a/fs/reiserfs/super.c       Sun Apr 29 20:44:38 2001
+++ b/fs/reiserfs/super.c       Sun Apr 29 20:44:38 2001
@@ -80,7 +80,7 @@
     reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
     journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
     reiserfs_block_writes(&th) ;
-    journal_end(&th, s, 1) ;
+    journal_end_sync(&th, s, 1) ;
   }
   s->s_dirt =3D dirty;
   unlock_kernel() ;
--------

Apply the patches in this order:
 - LVM Beta8 patch
 - VFS-lock patch
 - the patch included in this email

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
VI VI VI The editor of the beast.
-----End Obligatory Humorous Quote------------------------------------------

--hHWLQfXTYDoKhP50
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7YasepE6/iGtdjLERAuyJAJ9PLrQnoDAi/Xhl1kJA/q8IHAfQ+ACfdIPf
REYygshrvbHifhpZAA3HDTE=
=DuXI
-----END PGP SIGNATURE-----

--hHWLQfXTYDoKhP50--
