Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i22FTM830197
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 10:29:22 -0500
Received: from mwinf0401.wanadoo.fr (smtp4.wanadoo.fr [193.252.22.27])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i22FTMb08647
	for <linux-lvm@redhat.com>; Tue, 2 Mar 2004 10:29:22 -0500
Received: from tangerine.coulon.evette (ADijon-107-1-10-64.w81-249.abo.wanadoo.fr [81.249.82.64])
	by mwinf0401.wanadoo.fr (SMTP Server) with ESMTP id F1669580009C
	for <linux-lvm@redhat.com>; Tue,  2 Mar 2004 16:29:15 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AyBpZ-0007Ku-48
	for linux-lvm@redhat.com; Tue, 02 Mar 2004 16:29:13 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26614-07 for <linux-lvm@redhat.com>;
	Tue, 2 Mar 2004 16:29:12 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AyBpX-0007Km-O7
	for linux-lvm@redhat.com; Tue, 02 Mar 2004 16:29:11 +0100
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Message-ID: <20040302152911.GI15556@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="p8PhoBjPxaQXD0vg"
Content-Disposition: inline
Subject: [linux-lvm] Adding xfs module to the initrd-lvm
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
Date: Tue Mar  2 10:27:03 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--p8PhoBjPxaQXD0vg
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I would like to add the xfs module to the lvm created by =20
lvmcreate_initrd.

Is there a mean to do that easily?
So I have to mount and existing one and add the module by hand?
So I have to use the standard initrd tools?

I use Debian sid.

--
Regards
			- Jean-Luc
--p8PhoBjPxaQXD0vg
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBARKhGUdGGXzzGnNARArlWAKCNXyJB7qXplgTBzBg4byj+wbPE/ACgmfGy
z1k1F5Y3Jvu1gXGB5UtyT20=
=HDmi
-----END PGP SIGNATURE-----

--p8PhoBjPxaQXD0vg--
