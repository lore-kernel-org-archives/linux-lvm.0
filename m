Return-Path: <zoo1@corecomm.net>
Date: Mon, 5 Feb 2001 21:39:17 -0500
From: zoo1@corecomm.net
Subject: Re: [linux-lvm] startup stuff an dnew question :-)
Message-ID: <20010205213917.C29990@bar.nowhere>
References: <Pine.LNX.4.21.0102021438490.380-100000@munster.noc.fr.clara.net> <3A7E61D7.D417A879@twc.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="qlTNgmc+xy1dBmNv"
In-Reply-To: <3A7E61D7.D417A879@twc.de>; from ulf@twc.de on Mon, Feb 05, 2001 at 09:18:31AM +0100
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

--qlTNgmc+xy1dBmNv
Content-Type: text/plain; charset=us-ascii

On Mon, Feb 05, 2001 at 09:18:31AM +0100, Ulf Bartelt wrote:

>This is how I did it on my router/mailserver:

[...]

>But the tricky part is: hda2 and hda1 are LVs too...
>I just faked partition map entries for them and I use them only by this
>"partition aliases", so I can boot a system living totally in LVs using
>conventional things like lilo...

erm... just what does this gain you, then? if you resize or move those
LVs, wouldn't you have to manually change the fake partition map
entries, sort of negating the entire point of using LVM...?

--
   PGP/GnuPG key (ID 1024D/BFE0D6D0) available from keyservers everywhere

       "Everything I am today, I owe to people whom it is now too late
                                   to punish."

--qlTNgmc+xy1dBmNv
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6f2PVNfZCE7/g1tARAp1HAJ0cctqFQtHuTYcgd02LVvjBkWiCqACfZoLO
e/hIOM6PorHN5gwrFkqy1Qw=
=zyJr
-----END PGP SIGNATURE-----

--qlTNgmc+xy1dBmNv--
