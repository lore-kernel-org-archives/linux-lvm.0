Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i18CsKa03602
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 07:54:20 -0500
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.126.177])
	by mx1.redhat.com (8.11.6/8.11.6) with SMTP id i18CsJb05853
	for <linux-lvm@redhat.com>; Sun, 8 Feb 2004 07:54:19 -0500
From: Rainer krienke <rainer@krienke.org>
Subject: Re: [linux-lvm]Re: corrupt /dev/lvm - bizzare properties
References: <1076220042.4025d08a18acb@pandani.services.adelaide.edu.au> <yw1xn07tu7w8.fsf@kth.se> <1076241638.402624e656f43@pandani.services.adelaide.edu.au>
In-Reply-To: <1076241638.402624e656f43@pandani.services.adelaide.edu.au>
MIME-Version: 1.0
Content-Type: multipart/signed;
  protocol="application/pgp-signature";
  micalg=pgp-sha1;
  boundary="Boundary-02=_3FjJAxPuDgCoc8z";
  charset="windows-1252"
Content-Transfer-Encoding: 7bit
Message-Id: <200402081354.15872.rainer@krienke.org>
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
Date: Sun Feb  8 17:50:14 2004
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com, Chris Doherty <chris.doherty@adelaide.edu.au>, =?windows-1252?q?M=E5ns=20Rullg=E5rd?= <mru@kth.se>
Cc: linux-lvm@sistina.com

--Boundary-02=_3FjJAxPuDgCoc8z
Content-Type: text/plain;
  charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
Content-Description: signed data
Content-Disposition: inline

Am Sonntag, 8. Februar 2004 13:00 schrieb Chris Doherty:
> Quoting M=E5ns Rullg=E5rd <mru@kth.se>:
> > Chris Doherty <chris.doherty@adelaide.edu.au> writes:
> > > I've been using LVM happily for several months without any
> > > complaints or problems.  This morning that all changed.  The boot
> > > process stopped cold when lvm-mod (w|c)ouldn't load.  My first
> > > impulse was to fsck, which I did as a matter of course.  Eventually,
> > > I stumbled across what appears to be the source of my problem:
> > >
> > > root@connect4:~# ls -la /dev/lvm
> > > ?---rws-w-  8306 840966198 976250230 875573298 Sep 24  2004 /dev/lvm
> >
> > Your filesystem seems to have taken some heavy blows.  You should fsck
> > it properly.  You might need the -f flag to fsck to force a complete
> > check if filesystem is marked clean.
>
> the filesystem can't be mounted (which is the really worrying part) so i
> can't fsck it.
>

A filesystem that is to be fscked can and may *never* be mounted when=20
performing an fsck. Usually all fsck tools won't do anything but stop if th=
e=20
filesystem (fsck was called for)  is currently mounted! If your root=20
filesystem is corrupt boot from a rescue CD or similar and then check the=20
filesystem.=20

Have a nice day
Rainer
=2D-=20
Rainer Krienke, rainer@krienke.org

--Boundary-02=_3FjJAxPuDgCoc8z
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAJjF3aldtjc/KDEoRApdGAKCTIvq6kEGO9QiDVuPiLubjeU6fkgCeOTMI
SyN65eBMBRKrv5nIFGuiuns=
=4uoq
-----END PGP SIGNATURE-----

--Boundary-02=_3FjJAxPuDgCoc8z--
