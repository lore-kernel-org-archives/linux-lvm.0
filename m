From: Ivan Dimitrov <dobber@bastun.net>
Content-Type: multipart/signed; micalg=pgp-sha1; protocol="application/pgp-signature"; boundary="=-tENBETcqLSTxAYnG60c1"
Message-Id: <1067610833.26621.49.camel@dobber.bastun.net>
Mime-Version: 1.0
Subject: [linux-lvm] pvresize
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
Date: Mon Nov  3 07:44:01 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com

--=-tENBETcqLSTxAYnG60c1
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Hello list

I have searched on google for the problem I need to solve and what I
found is a tool that was in lvm 1.1 branch. Unfortunately I could not
find lvm 1.1 anywhere on the net. So I'll explain the situation I have
and kindly ask You if this is possible with the current tools.

I have a linux system with 2.4.21 kernel, raid5 on 3 hard disks and LVM
1.0.4. I have created the physical volume over /dev/md0 and now
everything works as a charm (thanks to the lvm creators:)). But now due
to disk shortage I want to add another hard disk to the raid volume and
extend the lvm physical volume to use the extra space. Unfortunately I
don't know how can I extend a lvm physical volume. What I found is a
tool that is only in lvm 1.1 branch - pvresize that is not included in
other branches of LVM. Can you point me where can I find and download
lvm 1.1 or are there other clean ways to extend the physical volume. And
I don't want to upgrade to LVM 2.
Thanks a lot.

ps2. Sorry for my bad English.


Ivan Dimitrov
System Administrator
Ancient Media Ltd.
--=20

Hi! I'm your friendly neighbourhood signature virus.
Copy me to your signature file and help me spread!

--=-tENBETcqLSTxAYnG60c1
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQA/onLQKBhoPewcguwRAmpYAJ9+lYmtzWzayWdXHkdBl6lCU9hT4wCfcVQC
OdvR5j+kyrn7Lga4qQoYoDQ=
=W7l3
-----END PGP SIGNATURE-----

--=-tENBETcqLSTxAYnG60c1--
