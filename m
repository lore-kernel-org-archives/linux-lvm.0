Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i48Lhdv12730
	for <linux-lvm@redhat.com>; Sat, 8 May 2004 17:43:39 -0400
Received: from toybox.mhill.net (c-67-166-18-167.client.comcast.net
	[67.166.18.167])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i48LhcAX032447
	for <linux-lvm@redhat.com>; Sat, 8 May 2004 17:43:38 -0400
Date: Sat, 8 May 2004 15:43:32 -0600
From: Michael Hill <michael@mhill.net>
Subject: Re: [linux-lvm] Problem with LVs
Message-ID: <20040508214332.GA2621@toybox.mhill.net>
References: <20040508013716.GH1226@toybox.mhill.net>
	<20040508075908.GA26935@percy.comedia.it>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <20040508075908.GA26935@percy.comedia.it>
Reply-To: Michael Hill <michael@mhill.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
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


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, May 08, 2004 at 09:59:09AM +0200, Luca Berra wrote:
>On Fri, May 07, 2004 at 07:37:16PM -0600, Michael Hill wrote:
>>The minor device number for data and winex is the same.  I'm hoping that
>vgscan -f

Okay, thanks.  Of course, it wasn't that simple; I spent about an hour
and a half bouncing between single-user and recovery CD, to no avail.
No matter what I did, the data LV stubbornly retained the same minor
device no. as the winex LV.

It wasn't until I booted from recovery CD, mounted the root part'n, and
looked in /dev/*_vg that I had an idea.  data_vg had just a "data" entry
(not counting "group"), instead of the three that it has when LVM is up
and running.  I thought maybe that entry, since it clearly remained on
disk between boots, was interfering when vgscan is run at boot.  So I
deleted it.  At the next reboot, data_vg didn't come up.  So *then* I
ran vgscan -f , and finally I had different minor device nos. for the
LVs in data_vg!  Another reboot, and I was back in business.

Thanks for telling me the command to run, Luca.

--=20
			--Michael

---------------------------------------------------------------------------=
----
Michael Hill   <><  Isaiah 9:6 |
michael AT mhill DOT net       | # find / -name '*[Bb][Aa][Ss][Ee]*' \
Aerospace/Software Engineer    | > -user your -print | xargs chown us:cats
http://www.qadas.com/~msh/     |
---In a marketplace (like the one of ideas), not everything has equal value=
!---
Did you ever notice that everybody in favor of abortion has already been bo=
rn?!

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQFAnVSElSecBhO4gLERAnR/AJ9/dwiWu6PIpLQ0J+6/XF3L0iI0nQCfbDJc
RfhEfY+BlcXlQG/uajMlElU=
=O4YQ
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
