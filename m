Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i279Ej829078
	for <linux-lvm@redhat.com>; Sun, 7 Mar 2004 04:14:45 -0500
Received: from mwinf0804.wanadoo.fr (smtp8.wanadoo.fr [193.252.22.23])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i279EhST009868
	for <linux-lvm@redhat.com>; Sun, 7 Mar 2004 04:14:44 -0500
Received: from tangerine.coulon.evette (ADijon-107-1-13-108.w81-250.abo.wanadoo.fr [81.250.94.108])
	by mwinf0804.wanadoo.fr (SMTP Server) with ESMTP id DB03C18000EB
	for <linux-lvm@redhat.com>; Sun,  7 Mar 2004 10:14:37 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AzuMk-0003hk-PR
	for linux-lvm@redhat.com; Sun, 07 Mar 2004 10:14:34 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 01141-04 for <linux-lvm@redhat.com>;
	Sun, 7 Mar 2004 10:14:32 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AzuMi-0003hc-5T
	for linux-lvm@redhat.com; Sun, 07 Mar 2004 10:14:32 +0100
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Message-ID: <20040307091431.GA2246@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="DocE+STaALJfprDB"
Content-Disposition: inline
Subject: [linux-lvm] 2.4.25, migration to lvm2 and paranoia
Sender: linux-lvm-admin@redhat.com
Errors-To: linux-lvm-admin@redhat.com
Reply-To: linux-lvm@redhat.com
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Post: <mailto:linux-lvm@redhat.com>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm/>
Date: Sun Mar  7 04:13:02 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--DocE+STaALJfprDB
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I plan to migrate to lvm2 (2.6.x in mind).
I've my root filesystem on lvm.
It has been told on this list that lvm2 is backward compatible with =20
lvm1 adn that, in case of a problem we can switch back to lvm1.

Well : all the tools are on the root filesystem and if something went =20
wrong, how to switch back to lvm1 ? Does having an initrd with the old =20
tools enough? Or do I4ve to build some kind of rescue disk?

--
Regards
			- Jean-Luc
--DocE+STaALJfprDB
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBASuf3UdGGXzzGnNARAqdFAJ0WOaq3DTrbueAYYYqME6vaTsRfBACcCsDr
4rAJrASsZ0r6dOxq1arRRnk=
=Is0C
-----END PGP SIGNATURE-----

--DocE+STaALJfprDB--
