Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2QKoEj05271
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 15:50:14 -0500
From: Rainer Krienke <rainer@krienke.org>
Subject: Re: [linux-lvm] Somewhat offtopic: Strange umount problem ....
Date: Fri, 26 Mar 2004 21:50:06 +0100
References: <200403251534.47502.krienke@uni-koblenz.de>
	<200403260800.21301.krienke@uni-koblenz.de>
	<1080319473.16404.3.camel@grandmother.littlebald.com>
In-Reply-To: <1080319473.16404.3.camel@grandmother.littlebald.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_DeJZACsFo3Cun7C";
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200403262150.12149.rainer@krienke.org>
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
To: linux-lvm@sistina.com


--Boundary-02=_DeJZACsFo3Cun7C
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Am Freitag, 26. M=E4rz 2004 17:44 schrieb David Johnston:
=2E..
> > > Rainer,
> > > nfsd will do this.  Make sure all of your NFS servers are stopped
> > > before you try to umount your filesystems.
> > >
> > > Does that help?
> >
> > Thanks for the hint, but nfsd has already been stopped
> > Here is a list of all processes still running in single user
>
> Rainer,
> could it be your multipath daemon?  In single-user mode, I would expect
> multipathd and the migration_CPUx daemons to shut down.

No, this is allright since multipath and software Mirror are sitting "below=
"=20
the filesystem and have to be active at least as long as the filesystem is=
=20
active..=20

@Klaus
nfsd does not run any longer. If you want to take a look, the processes sti=
ll=20
running are here:

http://www.uni-koblenz.de/~krienke/tmp/processes.txt

Nothing suspicious to me....

Thanks
Rainer

--Boundary-02=_DeJZACsFo3Cun7C
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAZJeDaldtjc/KDEoRAjt2AJ9sztUBDXtsrOW718zPB7Mt8usryACgu1uQ
1pxuTbB5VCb3c9NVo8XFdZw=
=sqh1
-----END PGP SIGNATURE-----

--Boundary-02=_DeJZACsFo3Cun7C--
