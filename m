Return-Path: <bg@blacknet.de>
Date: Tue, 21 Aug 2001 15:09:43 +0200
From: Goetz Bock <bock@blacknet.de>
Subject: Re: [linux-lvm] LVM+RAID+ReiserFS
Message-ID: <20010821150943.A25747@dragon.blacknet.de>
References: <3B82575A.A23285FF@LookThatUp.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="7AUc2qLy4jB3hD7Z"
Content-Disposition: inline
In-Reply-To: <3B82575A.A23285FF@LookThatUp.com>; from Igor.Dumaire@LookThatUp.com on Tue, Aug 21, 2001 at 02:43:06PM +0200
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

--7AUc2qLy4jB3hD7Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Can I use LVM and RAID5 Soft and ReiserFS on Linux 2.4.9 ?
It should work. I'm using 2.2.19 with LVM and ReiserFS on my server with
out any problems. I'm using 2.4.8 with LVM on my workstation and RAID5
should be a transparent block layer. So it should work ...

But to be sure, get a couple of empty disk and do some testing of your
own :-)
--=20
Goetz Bock                                              IT Consultant
Dipl.-Inf. Univ.

--7AUc2qLy4jB3hD7Z
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.4 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7gl2Wf5srOMkjkQoRAnroAJ9tPaUnJ9irKiKEKpyqa86a038omwCdGQDP
l1rW/UkOhcPzpW5FooUdZwE=
=NbAE
-----END PGP SIGNATURE-----

--7AUc2qLy4jB3hD7Z--
