Return-Path: <bg@blacknet.de>
Date: Thu, 28 Jun 2001 12:32:37 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] Newbie Questin  - How to use LVM after INSTALLING IT !!!
Message-ID: <20010628123237.B15645@dragon.blacknet.de>
References: <Pine.A32.4.21.0106280955550.55417-100000@prlfs.prl.ernet.in>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="/WwmFnJnmDyWGHa4"
Content-Disposition: inline
In-Reply-To: <Pine.A32.4.21.0106280955550.55417-100000@prlfs.prl.ernet.in>; from rshukla@prl.ernet.in on Thu, Jun 28, 2001 at 09:59:01AM +0530
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

--/WwmFnJnmDyWGHa4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


On Thu, Jun 28 '01 at 09:59, RAGHVENDRA SHUKLA wrote:
> how can i use it to make my / , /boot , /var=20
> dynamic ( in resize ) .
At first, I would not try to put /boot on LVM
Than you would need some additional space to create a PV, with this a VG
and than LVs for / and /var. Use ext2fs on this LV (or reiserfs) for
resizeability. Move /var and / to the LV, change fstab (the one on the /
LV), create a initrd (lvmmkinitrd), change lilo.conf, run lilo and try
to boot your new LVM system.
BTW: There are a lot of docs, faqs and howtos on the LVM homepage:
    http://www.sistina.com/lvm/

    Goetz.

--/WwmFnJnmDyWGHa4
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7OwfEf5srOMkjkQoRAgdUAKC4Q0p4mdj3H6e62xIVKpgsdP2pGwCg9R6R
IFounD9xWI5kTEyQTJ67cmQ=
=q1jj
-----END PGP SIGNATURE-----

--/WwmFnJnmDyWGHa4--
