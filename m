From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] [Bug#184653: lvm10: initrd-lvm image can't activate all vomume groups: ERROR 6]
Message-ID: <20030319155307.A4956@sistina.com>
References: <20030315103553.GB1635@tykepenguin.com>
Mime-Version: 1.0
In-Reply-To: <20030315103553.GB1635@tykepenguin.com>; from caulfield@sistina.com on Sat, Mar 15, 2003 at 10:35:53AM +0000
Content-Transfer-Encoding: quoted-printable
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
Date: Wed Mar 19 08:55:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-lvm@sistina.com

The size of the initrd is likely too small to take the /etc/lvmtab.d/ fil=
es.

Regards,
Heinz    -- The LVM Guy --


On Sat, Mar 15, 2003 at 10:35:53AM +0000, Patrick Caulfield wrote:
>=20
> --=20
>=20
> patrick
>=20

> X-Mail-Format-Warning: Bad RFC2822 header formatting in >From patrick  =
Thu Mar 13 23:45:17 2003
> Return-path: <debbugs@master.debian.org>
> Envelope-to: patrick@localhost
> Delivery-date: Thu, 13 Mar 2003 23:45:17 +0000
> Received: from localhost.pjc.net ([127.0.0.1] helo=3Dlocalhost)
> 	by arthur.pjc.net with esmtp (Exim 3.36 #1 (Debian))
> 	id 18tcNx-0001gN-00
> 	for <patrick@localhost>; Thu, 13 Mar 2003 23:45:17 +0000
> Received: from mail.cix.co.uk
> 	by localhost with POP3 (fetchmail-5.9.11)
> 	for patrick@localhost (single-drop); Thu, 13 Mar 2003 23:45:17 +0000 (=
GMT)
> Received: from master.debian.org (master.debian.org [65.125.64.135])
> 	by sulphur.cix.co.uk (8.11.3/CIX/8.11.3) with ESMTP id h2DNcJG15803
> 	for <patrick@tykepenguin.cix.co.uk>; Thu, 13 Mar 2003 23:38:19 GMT
> X-Envelope-From: debbugs@master.debian.org
> Received: from debbugs by master.debian.org with local (Exim 3.12 1 (De=
bian))
> 	id 18tbxc-0006o0-00; Thu, 13 Mar 2003 17:18:04 -0600
> X-Loop: owner@bugs.debian.org
> Subject: Bug#184653: lvm10: initrd-lvm image can't activate all vomume =
groups: ERROR 6
> Reply-To: Jan Schumacher <uzs5p3@uni-bonn.de>, 184653@bugs.debian.org
> Resent-From: Jan Schumacher <uzs5p3@uni-bonn.de>
> Original-Sender: Jan Schumacher <jan@magnolia.sub4all.de>
> Resent-To: debian-bugs-dist@lists.debian.org
> Resent-CC: Patrick Caulfield <patrick@debian.org>,
>    lvm10@packages.qa.debian.org
> Resent-Date: Thu, 13 Mar 2003 23:18:03 GMT
> Resent-Message-ID: <handler.184653.B.104759678822881@bugs.debian.org>
> X-Debian-PR-Message: report 184653
> X-Debian-PR-Package: lvm10
> X-Debian-PR-Keywords:=20
> Received: via spool by submit@bugs.debian.org id=3DB.104759678822881
>           (code B ref -1); Thu, 13 Mar 2003 23:18:03 GMT
> From: Jan Schumacher <uzs5p3@uni-bonn.de>
> To: Debian Bug Tracking System <submit@bugs.debian.org>
> X-Mailer: reportbug 1.50
> Date: Fri, 14 Mar 2003 00:04:05 +0100
> Message-Id: <E18tbk5-0001Ec-00@magnolia.home>
> Sender: Jan Schumacher <jan@magnolia.sub4all.de>
> Delivered-To: submit@bugs.debian.org
> Resent-Sender: Debian BTS <debbugs@master.debian.org>
> X-Envelope-To: patrick@tykepenguin.cix.co.uk
> X-Spam-Status: No, hits=3D-1.5 required=3D5.0
> 	tests=3DDEBIAN_BTS_BUG,FORGED_RCVD_FOUND,FROM_HAS_MIXED_NUMS,
> 	      PGP_SIGNATURE,RESENT_TO,SPAM_PHRASE_00_01,X_LOOP
> 	version=3D2.43
> X-Spam-Level:=20
>=20
> Package: lvm10
> Version: 1:1.0.7-1
> Severity: normal
>=20
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
> When booting with a (slightly hand-modified, see #184646) initrd image =
created with
> lvmcreate_initrd, lvm can't activate all volume groups. It displays the=
 following, which
> may contain typos, as I wrote it down from the screen:
>=20
> vgscan -- found inactive volume group "raid0vg"
> vgscan -- found inactive volume group "raid1vg"
> vgscan -- ERROR 6 writing volume group backup file /etc/lvmtab.d/raid1v=
g.tmp in vg_cfgbackup.c [line 271]
> vgscan -- ERROR: unable to do a backup of volume group "raid1vg"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group "ra=
id1vg" from "/etc/lvmtab"
> vgscan -- ERROR 6 writing volume group backup file /etc/lvmtab.d/raid1.=
tmp in vg_cfgbackup.c [line 271]
> vgscan -- ERROR: unable to do a backup of volume group "raid1"
> vgscan -- ERROR "lvm_tab_vg_remove(): unlink" removing volume group "ra=
id1" from "/etc/lvmtab"
>=20
>=20
> This leads to kernel panic, as my root fs is on raid1vg. The old lvm10 =
from woody activated
> "raid1" successfully, but not "raid1vg" with an untempered with image.
>=20
>=20
> - -- System Information
> Debian Release: 3.0
> Architecture: i386
> Kernel: Linux magnolia 2.4.20-noevms #1 Don M=E4r 13 14:01:12 CET 2003 =
i686
> Locale: LANG=3Dde_DE@euro, LC_CTYPE=3Dde_DE@euro
>=20
> Versions of packages lvm10 depends on:
> ii  debconf                       1.2.20     Debian configuration manag=
ement sy
> ii  file                          3.37-3.1   Determines file type using=
 "magic"
> ii  libc6                         2.3.1-3    GNU C Library: Shared libr=
aries an
> ii  lvm-common                    1.5.5      The Logical Volume Manager=
 for Lin
>=20
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.2.1 (GNU/Linux)
>=20
> iD8DBQE+cQ5u4cR0MEP0sUQRAsGnAJ9fOZAwVhs64RzOeuMprwnMy5dZMgCeMj5k
> U5GQVq6unH0rZwNLu4VobPI=3D
> =3Dz8B5
> -----END PGP SIGNATURE-----

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D=
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=
=3D-=3D-
