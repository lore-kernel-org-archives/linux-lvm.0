Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j7SAP7V14135
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 06:25:07 -0400
Received: from natfrord.rzone.de (natfrord.rzone.de [81.169.145.161])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j7SAOoYo021302
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 06:24:59 -0400
Received: from micha-mobile (p5086C784.dip.t-dialin.net [80.134.199.132])
	by post.webmailer.de (8.13.1/8.13.1) with ESMTP id j7SAOmhT028234
	for <linux-lvm@redhat.com>; Sun, 28 Aug 2005 12:24:49 +0200 (MEST)
From: mailinglist@krausam.de
Subject: Re: [linux-lvm] vgscan & CDROM
Date: Sun, 28 Aug 2005 13:24:48 +0200
References: <20050828101721.GB26065@gutek>
In-Reply-To: <20050828101721.GB26065@gutek>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart48931560.iQHnP5GdsI";
	protocol="application/pgp-signature"; micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Message-Id: <200508281324.56314.mailinglist@krausam.de>
Reply-To: micha@krausam.de,
	LVM general discussion and development <linux-lvm@redhat.com>
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

--nextPart48931560.iQHnP5GdsI
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Try:
filter =3D [ "r|/dev/cdrom|" ]



Am Sonntag, 28. August 2005 12:17 schrieb Chris Osicki:
> Hi
>
> I seam not to be able to convince vgscan to let my cdroms alone.
> In the file /etc/lvm/lvm.conf I have this filter:
>
> [ "r|/dev/cdrom.*" ]
>
> when I run vgscan -v -v I see the following:
>
>
>       /dev/cdrom1: size is 31244 sectors
>   /dev/cdrom1: read failed after 0 of 2048 at 0: Input/output error
>       /dev/cdrom1: size is 31244 sectors
>       /dev/cdrom1: No label detected
>
>
> I tried other variants of this filter without luck.
> On the laptop I'm writing this message on it took several minutes for
> vgscan to finish. On another PC it doesn't take that long but is
> annoying. How do I convince vgscan not to scan those devices?
> I tried also such a filter as test:
>
> [ "r|/dev/pty.*" ]
>
> it didn't work either.
>
> I'm using
>
>   LVM version:     2.01.09 (2005-04-04)
>   Library version: 1.01.00-ioctl (2005-01-17)
>   Driver version:  4.4.0
>
> I would be very thankful for any help.
>
> Regards,
> Chris
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

=2D-=20
Micha Krause

Jabber:	SMS-King@jabber.org
Email:	mailinglist@krausam.de

--nextPart48931560.iQHnP5GdsI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)

iD8DBQBDEZ8HfAR45tA28LgRAs9vAJ0XLv4b69smxty2Pe8G8EGhMHqU3ACeO8oO
38e+3sf7eXsQjTNO10fc2Z0=
=/tTV
-----END PGP SIGNATURE-----

--nextPart48931560.iQHnP5GdsI--
