Return-Path: <blutgens@sistina.com>
Date: Tue, 19 Jun 2001 16:39:40 -0500
From: Ben Lutgens <blutgens@sistina.com>
Subject: Re: [linux-lvm] RE: LVM and Lilo
Message-ID: <20010619163940.B523@minime.sistina.com>
References: <Pine.LNX.4.33.0106191857020.3018-100000@vie-ac.office.ecetra.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-md5;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.33.0106191857020.3018-100000@vie-ac.office.ecetra.com>; from alciocca@ecetra.com on Tue, Jun 19, 2001 at 07:00:45PM +0200
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

--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2001 at 07:00:45PM +0200, Adam Cioccarelli wrote:
>Hi,
>
>I have made the initrd image, boot is mounted, everything works fine
>basically, just that I can't run lilo when my root partition is a logical
>volume... If I boot into my old non-lvm root installation I can change the
>lilo.conf on the root logical volume and do a lilo -C /mnt/etc/lilo.conf
>and it will work.


vgscan gets run from the the initrd so all the information that it writes
to /etc/lvm* and /proc (not sure where it goes exactly) get's lost when
you change root to your logical volume. This way, when you run lilo it
barfs because it can't find the logical volume. You should need to just
run vgscan before you run lilo and hopefully all will be well.

>
>I read something about having to patch lilo but this was from a fair while
>ago. Does it still apply?
>
>Regards,
>Adam Cioccarelli
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@sistina.com
>http://lists.sistina.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

--=20
Ben Lutgens	=09
Sistina Software Inc.=09
Kernel panic: I have no root and I want to scream

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE7L8acLxkxGgLdGQgRAidoAKCtoM6O2zxcNCsC9ZRwsUsQ9eIOQACfbXCk
IdeuiVhjXn0ya6xTrcQHyHA=
=O81G
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
