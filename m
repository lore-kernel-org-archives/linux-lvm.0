From: "Chad C. Walstrom" <chewie@wookimus.net>
Message-Id: <20020205182642.GD9198@wookimus.net>
References: <Pine.LNX.4.10.10202051326310.19683-100000@pzat.meep.org>
    <3C6012B0.5000409@promofinarsa.es>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
    protocol="application/pgp-signature";
    boundary="GPJrCs/72TxItFYR"
Content-Disposition: inline
In-Reply-To: <3C6012B0.5000409@promofinarsa.es>
Subject: [linux-lvm] (OT) Backups (was Re: LVM reimplementationre ady for beta testing...)
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
Date: Tue Feb  5 12:28:01 2002
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--GPJrCs/72TxItFYR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Off-topic: multivolume tar archive + CDROM =3D=3D pain!

For those home backup solutions, don't ever listen to anyone who tells
you that doing multivolume tar archives on CDROM is a good idea.  It
isn't!  I know this from experience! ;-)  It's very painful.  CDROM's
are much better used as random access devices as opposed to linear.  tar
!=3D random access :. tar !=3D good backup solution w/CDROM media.  Maybe
tar'ing up smaller chunks of files that !=3D multivolume would be ok ;-).

Instead, make a good plan of attack for backing up files based on their
volatility and importance.  With CDROM's as a media, think regularily
scheduled full backups of selected data groups.

There are a few things I like to back up frequently:

        * $HOME (excluding things like netscape cache or download directory)
        * /var/cvs/$repositories
        * dpkg --get-selections > /var/backup/dpkg-selections.list
        * /var/backup/*
        * /etc/*
        * /var/lib/$pkgmgrfiles
        * /var/log/$newlogfiles

Things I back up infrequently:

        * *.{gif,png,jpg,mov,mp3,mpeg,ogg} # etc
        * /home/ftp/pub/*
        * /var/log/$oldlogfiles

Actually, I try to burn the ogg and mp3 files to disc immediately.
Sometimes I get smart and include the source code or binary code for the
a media player.

Anyway, back to your regularily scheduled off-topic thread. ;-)

--=20
Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
http://www.wookimus.net/                            | s.k.a. gunnarr
Get my public key, ICQ#, etc. $(mailx -s 'get info' chewie@wookimus.net)

--GPJrCs/72TxItFYR
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8YCPiDMcLGCBsWv0RAsVhAKC4Fh+wsruKDLuZzhHDxOJqVm5A1gCgpVFj
Etg+9hF1jP4IvBPIYHMsRpw=
=UMkg
-----END PGP SIGNATURE-----

--GPJrCs/72TxItFYR--
