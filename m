Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5KDHBu00794
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 09:17:11 -0400
Received: from deliver.uni-koblenz.de (deliver.uni-koblenz.de [141.26.64.15])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j5KDH4qd032198
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 09:17:09 -0400
Received: from localhost (localhost [127.0.0.1])
	by deliver.uni-koblenz.de (Postfix) with ESMTP id 5D6946CE5DD
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 15:17:04 +0200 (CEST)
Received: from deliver.uni-koblenz.de ([127.0.0.1])
	by localhost (deliver [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 20038-04 for <linux-lvm@redhat.com>;
	Mon, 20 Jun 2005 15:17:03 +0200 (CEST)
Received: from mailhost.uni-koblenz.de (mailhost.uni-koblenz.de [141.26.64.1])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by deliver.uni-koblenz.de (Postfix) with ESMTP id BFA766CE421
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 15:17:03 +0200 (CEST)
Received: from bliss.uni-koblenz.de (bliss.uni-koblenz.de [141.26.64.65])
	(authenticated bits=0)
	by mailhost.uni-koblenz.de (8.12.10/8.12.10/SuSE Linux 0.7) with ESMTP
	id j5KDH1Zo009170
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NOT)
	for <linux-lvm@redhat.com>; Mon, 20 Jun 2005 15:17:02 +0200
From: Rainer Krienke <krienke@uni-koblenz.de>
Subject: Re: [linux-lvm] Is LVM safe?
Date: Mon, 20 Jun 2005 15:17:00 +0200
References: <1119268975.25392.34.camel@volt>
In-Reply-To: <1119268975.25392.34.camel@volt>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3135966.bpaFzdWkZW";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200506201517.01268.krienke@uni-koblenz.de>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>

--nextPart3135966.bpaFzdWkZW
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Montag 20 Juni 2005 14:02, John Rowe wrote:
> With a 'standard' disk partition (ext3, etc.) I can be confident that if
> I have the partition I have the data: I can always just move the disk to
> another system and mount it. Is the same true for LVM?
>
> I am concerned that the LVM system also seems to need some information
> kept on the host files system in /etc/lvm* and that if I lose that I'm
> in serious trouble.

The main difference between a partition and lvm is in my eyes that in lvm y=
ou=20
usually do not have a single disk where your data is on. Instead you will=20
have a bunch of disks and possibly your data are spread across all of these=
=20
disks (depending on the setup of your volumegroups).=20
=20
So if you want to move your disk to another system you will have to move al=
l=20
disks that have been part of the lvm structure. Since lvm scans all disks t=
o=20
build up the volumegroups and logical volumes it should also work after you=
=20
moved your disks to another system.=20

If you modified you /etc/lvm/lvm.conf file you probably will have to take a=
=20
look at this file on the old and new system to get things right since you c=
an=20
for example determine which of the systems disks are scanned for physical=20
volumes and volumegroups. Since there might be a different set of disks in=
=20
the old and new system (aside from the disks you moved) the configuration=20
could need an update in this case.

Have a nice day
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

--nextPart3135966.bpaFzdWkZW
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.0 (GNU/Linux)

iD8DBQBCtsHNaldtjc/KDEoRAsj5AJ0SxyD7AbJuX2Prfy+lTw2AGvwRTQCffP+X
2oczFUKXcgA8aZBiq/7NYQI=
=TakV
-----END PGP SIGNATURE-----

--nextPart3135966.bpaFzdWkZW--
