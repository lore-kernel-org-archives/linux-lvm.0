Return-Path: <zoo1@corecomm.net>
Date: Tue, 27 Feb 2001 17:28:20 -0500
From: zoo1@corecomm.net
Subject: Re: [linux-lvm] Possible to raise Max LV?
Message-ID: <20010227172820.A1211@bar.nowhere>
References: <20010227213517.G29642@vestdata.no> <200102272055.f1RKt5S27720@webber.adilger.net>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
In-Reply-To: <200102272055.f1RKt5S27720@webber.adilger.net>; from adilger@turbolinux.com on Tue, Feb 27, 2001 at 01:55:05PM -0700
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

--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 27, 2001 at 01:55:05PM -0700, Andreas Dilger wrote:

>So says the guy from a company called "Big Storage" ;-).  However, I've
>seen several people who make multiple partitions on a single disk, and
>then turn these into PVs (don't ask me why),

easy way to convert an existing single-disk installation to LVM. make
the free space (hope you've got some) into a PV, create LVs, move over
your filesystem mountpoint by mountpoint and make the old partitions
into PVs as you go so you don't run out of disk. i was seriously
considering going that way myself.

then again, i was also considering creating two VGs, one for "user" data
and one for "system" stuff. now, i'm trying to figure out what i thought
the point of this was, maybe something about possible future migrations
to multispindle systems.

--=20
   PGP/GnuPG key (ID 1024D/BFE0D6D0) available from keyservers everywhere

       "Everything I am today, I owe to people whom it is now too late
                                   to punish."

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE6nCoENfZCE7/g1tARAty9AKDERNmAT5RMUzyFSW0DErRgjp/whQCfQNQA
vEGKrVGYaQSYeoARaXyZ6C4=
=2hmw
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
