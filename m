From: Rainer Krienke <krienke@uni-koblenz.de>
Subject: Re: [linux-lvm] LVM - Multipath / Failover
References: <HLRQMH$2DE0339CD21640CE00AD36D8D76DB9A4@terra.com.br>
In-Reply-To: <HLRQMH$2DE0339CD21640CE00AD36D8D76DB9A4@terra.com.br>
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_oVuc/wNEr7xNrw5";
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200309251454.01183.krienke@uni-koblenz.de>
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
Date: Thu Sep 25 08:03:05 2003
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, Eduardo Dias <edugdias@terra.com.br>

--Boundary-02=_oVuc/wNEr7xNrw5
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

On Donnerstag, 25. September 2003 13:59, Eduardo Dias wrote:
> Hi all,
>
> I am looking for any information about LVM with multipathing for failover
> and/or load balance, but I just found information using LVM and RAID. I
> would like  to know if is possible to configure a VG with 2 paths to acce=
ss
> the same disk device without using RAID? I have a RH 7.3 (2.4.18) and AS
> 2.1 (2.4.x).
> The sorage has been connected on a SAN enviroment.
>

We are also using Multipathing in a SAN environment with suse 8.2. The=20
solution we used was to create a multipath md raid-device. On top of this=20
multipath device we build further abstraction layers like a software raid 1=
=20
also using the standard raid tools. Works great for us.

Rainer
=2D-=20
=2D------------------------------------------------------------------------=
=2D-
Rainer Krienke, Universitaet Koblenz, Rechenzentrum, Raum A022
Universitaetsstrasse 1, 56070 Koblenz, Tel: +49 261287 -1312, Fax: -1001312
Mail: krienke@uni-koblenz.de, Web: http://www.uni-koblenz.de/~krienke
Get my public PGP key: http://www.uni-koblenz.de/~krienke/mypgp.html
=2D------------------------------------------------------------------------=
=2D-

--Boundary-02=_oVuc/wNEr7xNrw5
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2-rc1-SuSE (GNU/Linux)

iD8DBQA/cuVoaldtjc/KDEoRAkhGAJ9zEJoPPZPhFneEH9FK8D2XKUEpJQCdH+Au
P4G7cqInnBNGEeFmK7vng54=
=8rAR
-----END PGP SIGNATURE-----

--Boundary-02=_oVuc/wNEr7xNrw5--
