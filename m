Return-Path: <lewis@sistina.com>
Date: Fri, 27 Jul 2001 10:21:32 -0500
From: AJ Lewis <lewis@sistina.com>
Subject: Re: [linux-lvm] [BUG] segmentation fault on snapshot with beta8
Message-ID: <20010727102132.A4314@sistina.com>
References: <20010726122738.E052917573@oscar.casa.dyndns.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="UlVJffcvxoiEqYs2"
Content-Disposition: inline
In-Reply-To: <20010726122738.E052917573@oscar.casa.dyndns.org>; from tomlins@cam.org on Thu, Jul 26, 2001 at 08:27:38AM -0400
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

--UlVJffcvxoiEqYs2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 26, 2001 at 08:27:38AM -0400, Ed Tomlinson wrote:
> tob is a wrapper script for afio that can installed from a debian
> package.  The snapshotted fs is reiserfs.  I have the vfs locking
> patch installed along with:
>=20
> --------
> diff -Nru a/fs/reiserfs/super.c b/fs/reiserfs/super.c
> --- a/fs/reiserfs/super.c       Sun Apr 29 20:44:38 2001
> +++ b/fs/reiserfs/super.c       Sun Apr 29 20:44:38 2001
> @@ -80,7 +80,7 @@
>      reiserfs_prepare_for_journal(s, SB_BUFFER_WITH_SB(s), 1);
>      journal_mark_dirty(&th, s, SB_BUFFER_WITH_SB (s));
>      reiserfs_block_writes(&th) ;
> -    journal_end(&th, s, 1) ;
> +    journal_end_sync(&th, s, 1) ;
>    }
>    s->s_dirt =3D dirty;
>    unlock_kernel() ;
> --------

Hmm...trying to reproduce this on 2.4.6...and after applying the lvm 0.9.1
beta8 patch, the linux-2.4.4-VFS-lock patch and the above patch (in that
order), I still get this when trying to create and mount a snapshot:

reiserfs: checking transaction log (device 3a:00) ...
Using r5 hash to sort names
ReiserFS version 3.6.25
reiserfs: checking transaction log (device 3a:01) ...
clm-2076: device is readonly, unable to replay log
Replay Failure, unable to mount
reiserfs_read_super: unable to initialize journal space

Is there some other patch or magic I need to do to get ReiserFS snapshots
working?  I thought the VFS-lock patch was supposed to fix that...

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
Error: Keyboard not attached. Press F1 to continue.
-----End Obligatory Humorous Quote------------------------------------------

--UlVJffcvxoiEqYs2
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7YYb8pE6/iGtdjLERAueGAKCDDULwuXZBYPNTkPPgXp9L5jnnfgCeLVMY
UfOG2cvyjzK+5LJ+rvvGU2E=
=df0l
-----END PGP SIGNATURE-----

--UlVJffcvxoiEqYs2--
