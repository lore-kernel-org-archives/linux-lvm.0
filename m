Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i2Q70cj16819
	for <linux-lvm@redhat.com>; Fri, 26 Mar 2004 02:00:38 -0500
From: Rainer Krienke <krienke@uni-koblenz.de>
Subject: Re: [linux-lvm] Somewhat offtopic: Strange umount problem ....
Date: Fri, 26 Mar 2004 08:00:17 +0100
References: <200403251534.47502.krienke@uni-koblenz.de>
	<1080238182.5985.3.camel@grandmother.littlebald.com>
In-Reply-To: <1080238182.5985.3.camel@grandmother.littlebald.com>
MIME-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
	micalg=pgp-sha1; boundary="Boundary-02=_FU9YA2uziPY0k00";
	charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Message-Id: <200403260800.21301.krienke@uni-koblenz.de>
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
Cc: David Johnston <david@littlebald.com>


--Boundary-02=_FU9YA2uziPY0k00
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

On Donnerstag, 25. M=E4rz 2004 19:09, David Johnston wrote:
> On Thu, 2004-03-25 at 09:34, Rainer Krienke wrote:
> > Hello,
> >
> > I have a problem with 3 server machines
> > I am running 3 NFS and SMB servers which run perfectly stable but
> > show a strange behaviour when rebooting the machines: The
> > filesystems which contain user directories cannot be umounted
> >
> > fuser -v shows only  this:
> > /export/user1        root     kernel mount  /export/user1
>
> Rainer,
> nfsd will do this.  Make sure all of your NFS servers are stopped before
> you try to umount your filesystems.
>
> Does that help?

Thanks for the hint, but unfortunately it was no hit: nfsd has already been=
=20
stopped, actually there is no process of which I would assume it could make=
 a=20
filesystem busy. Here is a list of all processes still running in single us=
er=20
mode when I *cannot* umount the xfs user filesystem on the lvm2 logical=20
volume:

http://www.uni-koblenz.de/~krienke/tmp/processes.txt

Does anyone see a suspect in there?

Thanks
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

--Boundary-02=_FU9YA2uziPY0k00
Content-Type: application/pgp-signature
Content-Description: signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.2 (GNU/Linux)

iD8DBQBAY9UFaldtjc/KDEoRAvt9AKDKr12TSuWsBfLHsBOBIfs5Ifd1DwCfc/BS
/dxj+c3oXxeBS6/4xPSRpnc=
=KCGC
-----END PGP SIGNATURE-----

--Boundary-02=_FU9YA2uziPY0k00--
