Return-Path: <bg@blacknet.de>
Date: Sat, 28 Apr 2001 01:40:15 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] LVM on root, Kernel panic: "I have no root and I must scream"
Message-ID: <20010428014015.D10716@dragon.blacknet.de>
References: <DC5B1A21E9E7D211B0020090273AD628242BBD@summit15.corvallis.summit>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="E/DnYTRukya0zdZ1"
Content-Disposition: inline
In-Reply-To: <DC5B1A21E9E7D211B0020090273AD628242BBD@summit15.corvallis.summit>; from Evan.Day@SUMMITSITE.COM on Fri, Apr 27, 2001 at 03:06:51PM -0700
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

--E/DnYTRukya0zdZ1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Fri, Apr 27 '01 at 15:06, Day, Evan wrote:
> Using LILO (21.5 from the stable Debian dist) is sketchy.  Sometimes it'll
> boot, other times it just prints "LI" on the screen [ ... ]
Whilt I don't know if this I true, I once read that the letters of LILO
tells you what exactly is broken with your setup.
> I think I was a bit confused because it turns out that /dev/sdb is scsi=
=20
> id 6 (boot disk) and /dev/sda is scsi id 5, even though the SCSI BIOS=20
> reports id 6 as HD0 and id 5 as HD1.
You're asking for trouble here. Why don't you fix your disk's IDs to be=20
0 (the boot disk) and 1 (the other) ...
> I have a pair of IDE drives on the system, too, and LILO always
=2E.. or simply boot from the IDE disks?
> complains that /dev/sdb isn't the first disk...=20
There is an option for LILO to tell it what the BIOS assumes each disk
is. (ReadTheFineManual ;-))

Cu,
    Goetz.

--E/DnYTRukya0zdZ1
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE66gNef5srOMkjkQoRArYTAKDhwVo6vntUkTz454d6Trr9fZnuvACgkxNc
2v0zydb2/EGhYMia2NYP5bI=
=bX5y
-----END PGP SIGNATURE-----

--E/DnYTRukya0zdZ1--
