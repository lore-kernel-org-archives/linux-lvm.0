Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i27F1M812585
	for <linux-lvm@redhat.com>; Sun, 7 Mar 2004 10:01:22 -0500
Received: from mwinf0503.wanadoo.fr (smtp5.wanadoo.fr [193.252.22.26])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i27F1KST000679
	for <linux-lvm@redhat.com>; Sun, 7 Mar 2004 10:01:20 -0500
Received: from tangerine.coulon.evette (ADijon-107-1-5-243.w81-51.abo.wanadoo.fr [81.51.105.243])
	by mwinf0503.wanadoo.fr (SMTP Server) with ESMTP id AB4FD6800093
	for <linux-lvm@redhat.com>; Sun,  7 Mar 2004 16:01:14 +0100 (CET)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AzzmD-0003D9-Go
	for linux-lvm@redhat.com; Sun, 07 Mar 2004 16:01:13 +0100
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 14985-04 for <linux-lvm@redhat.com>;
	Sun, 7 Mar 2004 16:01:13 +0100 (CET)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.30)
	id 1AzzmC-0003D2-HT
	for linux-lvm@redhat.com; Sun, 07 Mar 2004 16:01:12 +0100
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Message-ID: <20040307150107.GI2207@tangerine.coulon.evette>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=PGP-SHA1;
	protocol="application/pgp-signature"; boundary="WBsA/oQW3eTA3LlM"
Content-Disposition: inline
Subject: [linux-lvm] lvm_blk_ioctl: unknown cmd 0x801c6d02
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
Date: Sun Mar  7 09:59:01 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--WBsA/oQW3eTA3LlM
Content-Type: text/plain; Format=Flowed; DelSp=Yes; charset=ISO-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

I've seen the following message in my syslog.

Mar  7 15:38:11 tangerine kernel: lvm -- lvm_blk_ioctl: unknown cmd =20
0x801c6d02
Mar  7 15:38:12 tangerine last message repeated 4 times


There is no visible misfunction or bad behaviour of the system anyway.

I'm running Debian sid with a kernel version 2.4.25
Any idea of the meaning of this message?

--
Regards
			- Jean-Luc

--WBsA/oQW3eTA3LlM
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBASzkzUdGGXzzGnNARAgrqAJ9lU12I0DOocPH2si2MfQ+jMzYt+ACgg15t
krUJemoa3HtNtznMiZYg3pg=
=qTB7
-----END PGP SIGNATURE-----

--WBsA/oQW3eTA3LlM--
