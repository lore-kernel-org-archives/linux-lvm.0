Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i8CC2mr02145
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2004 08:02:48 -0400
Received: from mwinf0509.wanadoo.fr (smtp5.wanadoo.fr [193.252.22.26])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i8CC2lUG029592
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2004 08:02:47 -0400
Received: from me-wanadoo.net (localhost [127.0.0.1])
	by mwinf0509.wanadoo.fr (SMTP Server) with SMTP id 7FEC418000E0
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2004 14:02:41 +0200 (CEST)
Received: from tangerine.coulon.evette
	(ADijon-107-1-10-144.w81-249.abo.wanadoo.fr [81.249.82.144])
	by mwinf0509.wanadoo.fr (SMTP Server) with ESMTP id 7CF621800097
	for <linux-lvm@redhat.com>; Sun, 12 Sep 2004 14:02:40 +0200 (CEST)
Received: from localhost ([127.0.0.1])
	by tangerine.coulon.evette with esmtp (Exim 4.34) id 1C6T3x-0001to-IS
	for linux-lvm@redhat.com; Sun, 12 Sep 2004 14:02:33 +0200
Received: from tangerine.coulon.evette ([127.0.0.1])
	by localhost (tangerine [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06479-01 for <linux-lvm@redhat.com>;
	Sun, 12 Sep 2004 14:02:32 +0200 (CEST)
Received: from localhost ([127.0.0.1] helo=tangerine)
	by tangerine.coulon.evette with esmtp (Exim 4.34) id 1C6T3u-0001ta-0k
	for linux-lvm@redhat.com; Sun, 12 Sep 2004 14:02:31 +0200
Date: Sun, 12 Sep 2004 12:02:22 +0000
From: "Jean-Luc Coulon (f5ibh)" <jean-luc.coulon@wanadoo.fr>
Subject: Re: [linux-lvm] pvmove: ABORTING: Volume group metadata update failed.
References: <Pine.LNX.4.58.0409120340470.3989@philos.nvg.ntnu.no>
	<20040912114514.GI1094@agk.surrey.redhat.com>
In-Reply-To: <20040912114514.GI1094@agk.surrey.redhat.com> (from
	agk@redhat.com on Sun Sep 12 13:45:15 2004)
Message-Id: <1094990549l.5671l.0l@tangerine>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	boundary="=-JELfRc2/aaly17HE3uuZ"; micalg=PGP-SHA1
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com

--=-JELfRc2/aaly17HE3uuZ
Content-Type: text/plain; charset=ISO-8859-1; DelSp=Yes; Format=Flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le 12.09.2004 13:45:15, Alasdair G Kergon a =E9crit=A0:
>LVM2 pvmove only supports the new on-disk metadata format, not the
>old format used by LVM1, so you need to 'vgconvert' first: I'll add a
>specific error message to explain this!

Does running  "vgconvert -M2 vg00"  safe if vg00 is an active VG ?

Jean-Luc
>
>Alasdair
>--


--=-JELfRc2/aaly17HE3uuZ
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.5 (GNU/Linux)

iD8DBQBBRDrVUdGGXzzGnNARAtXWAJ0T8E5WhuWA2EAzHEQKcIqXjXKfcgCeK5AR
qrguziEVQew+lnkwK6p2qZU=
=IGTw
-----END PGP SIGNATURE-----

--=-JELfRc2/aaly17HE3uuZ--
