Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6S7OS0x018831
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 03:24:28 -0400
Received: from dot.freshdot.net
	(IDENT:d482397ae432769d2d5a88cd5348b14b@dot.freshdot.net
	[80.69.73.239])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6S7ODPF015619
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 03:24:19 -0400
Received: from ssmeenk by dot.freshdot.net with local (Exim 4.62)
	(envelope-from <ssm+lvm@freshdot.net>) id 1G6Mhh-0005OK-1h
	for linux-lvm@redhat.com; Fri, 28 Jul 2006 09:24:13 +0200
Date: Fri, 28 Jul 2006 09:24:13 +0200
From: Sander Smeenk <ssm+lvm@freshdot.net>
Subject: Re: [linux-lvm] Performance impact of LVM
Message-ID: <20060728072413.GJ17454@freshdot.net>
References: <20060727120250.GB17454@freshdot.net>
	<200607271115.02076.peregrine@openbrainstem.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline
In-Reply-To: <200607271115.02076.peregrine@openbrainstem.net>
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
To: linux-lvm@redhat.com


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Quoting Lamont R. Peterson (peregrine@openbrainstem.net):

> > Then i made a scsi_vg01, with all the scsi disks and a ide_vg01 with all
> > the ide disks, and started lvcreating "partitions" inside those vg's.
> Any particular reason to not include all the disks in a single VG?

Well, SCSI is usually faster than IDE. So the SCSI disks are used for
storing databases, websitecontent, etc. IDE disks are only used
for booting and storing local backup copies, etc...

Although with the latest (pata) IDE disks the performance difference
already got really small ;)

> Also, this setup will actually leave you more vulnerable to single disk=
=20
> failures.  I would *highly* recommend using RAID to aggregate your disks=
=20
> together, then use LVM on top of that to make things manageable.

Mmmh, yeah, that's true. Although it doesn't really matter if one of
these servers would fail due to diskproblems. There's enough of them to
take the traffic ;)

I should fix that sometime soon though ;)

> The only "extra" LVM I/O done is when you are (re)configuring LVM.  Thing=
s=20
> like creating, resizing & deleting an LV require a little bit of disk I/O=
, of=20
> course.  Other than the small amount of overhead when using snapshot volu=
mes,=20
> there isn't any other impact on I/O performance.

OK, really clear explanation. Luckily it matches my idea about LVM, and
hopefuly with the two responses i've gotten i can convince my superiors
that LVM will not cause any performance impact.

> However, I wonder if the LVM address look-up code is better than, equal t=
o or=20
> any worse than that for a plain block device (e.g. partition, loopback=20
> mounted file, etc.).  If there is a statistically relevent delta there, I=
=20
> think it would only impact I/O latency and even then, it couldn't be much.

Would using bonnie++ on a 'plain block device' be a good enough way to
possibly measure that? ;-)   I think the latency is so small that it
won't show ;)

> When booting your system, it does have to take a moment and "vgscan" for =
VGs. =20
> This is pretty fast, but it adds a second or two to your bootup time.

Haha. That's NO problem compared to the time it takes the BIOS to detect
disks, load the SATA bios scan for disks, the Adaptec bios, scan for
disks, the two networkcards, blah ;)

> That's all I can think of off the top of my head.  HTH.

TY! Really appreciated.

Kind regards,
Sander.
--=20
| It was a business doing pleasure with you!
| 1024D/08CEC94D - 34B3 3314 B146 E13C 70C8  9BDB D463 7E41 08CE C94D

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.3 (GNU/Linux)

iD8DBQFEybuc1GN+QQjOyU0RAlycAKCHnZsqNdf9QjFxWDeAfKn1bi3g8gCeMZ04
H7lQouEhqH2iF40PAwKzVZE=
=s9c+
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
