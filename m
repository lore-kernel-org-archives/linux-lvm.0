Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6OI07Hd013995
	for <linux-lvm@redhat.com>; Mon, 24 Jul 2006 14:00:07 -0400
Received: from dark-templar.advansoft.us ([166.70.63.214])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6OHxrBR001955
	for <linux-lvm@redhat.com>; Mon, 24 Jul 2006 14:00:00 -0400
Received: from corsair.lrp.advansoft.us (lrp.dsl.xmission.com [166.70.26.153])
	by dark-templar.advansoft.us (Postfix) with ESMTP id 5F65A682E8
	for <linux-lvm@redhat.com>; Mon, 24 Jul 2006 11:59:39 -0600 (MDT)
From: "Lamont R. Peterson" <peregrine@openbrainstem.net>
Subject: Re: [linux-lvm] Failed PV recovery
Date: Mon, 24 Jul 2006 11:59:28 -0600
References: <200607232019.52718.peregrine@openbrainstem.net>
	<44C4BAC0.7090508@conterra.de>
In-Reply-To: <44C4BAC0.7090508@conterra.de>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart1353173.iRCvB9OzhE";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200607241159.32754.peregrine@openbrainstem.net>
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
To: LVM <linux-lvm@redhat.com>

--nextPart1353173.iRCvB9OzhE
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Monday 24 July 2006 06:19am, Dieter St=FCken wrote:
> Lamont R. Peterson wrote:
> > 4.  Are there better ways I could have handled this (other than the
> > obvious like RAID to start with, etc.)?
>
> Hi Lamont,
>
> I strongly suggest to use: http://smartmontools.sourceforge.net/
> to monitor all disks. In most cases you get warnings about
> problems with your disks weeks before they fail completely.

Thanks :), I'll check it out.  Since my home file server is now growing,=20
that's just the kind of monitoring I want for the future.

> > A few months ago, I started seeing some unreadable sectors on the 45GB
> > drive.
>
> ... but you have to take it seriously :-)

Absolutely; and I did take the indications seriously.  Unfortunately, the=20
accounting department (a.k.a. my wife & my bank account) couldn't help me o=
ut=20
fast enough.

Of course, the good news is that she now knows first hand (well 1.5 hand, I=
=20
guess) what it's like to have a disk go bad with data on it.  That should=20
help me get parts faster in the future :) .
=2D-=20
Lamont R. Peterson <peregrine@OpenBrainstem.net>
=46ounder [ http://blog.OpenBrainstem.net/peregrine/ ]
GPG Key fingerprint: 0E35 93C5 4249 49F0 EC7B  4DDD BE46 4732 6460 CCB5
  ___                   ____            _           _
 / _ \ _ __   ___ _ __ | __ ) _ __ __ _(_)_ __  ___| |_ ___ _ __ ___
| | | | '_ \ / _ \ '_ \|  _ \| '__/ _` | | '_ \/ __| __/ _ \ '_ ` _ \
| |_| | |_) |  __/ | | | |_) | | | (_| | | | | \__ \ ||  __/ | | | | |
 \___/| .__/ \___|_| |_|____/|_|  \__,_|_|_| |_|___/\__\___|_| |_| |_|
      |_|               Intelligent Open Source Software Engineering
                              [ http://www.OpenBrainstem.net/ ]

--nextPart1353173.iRCvB9OzhE
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.4 (GNU/Linux)

iD8DBQBExQqEvkZHMmRgzLURAm76AKC4IZaqKpYEx7PEdIcXsmxM/oKcnACffuh2
YbpKZqtPo+Rn2qGodKw8sV8=
=mrmq
-----END PGP SIGNATURE-----

--nextPart1353173.iRCvB9OzhE--
