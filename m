Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAK0M9r27121
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 19:22:09 -0500
Received: from polop.usc.edu (polop.usc.edu [128.125.10.9])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAK0M8ut025246
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 19:22:08 -0500
Received: from polop.usc.edu (localhost.localdomain [127.0.0.1])
	by polop.usc.edu (8.12.11/8.12.11) with ESMTP id iAK0M7RN001110
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 16:22:07 -0800
Received: (from garrick@localhost)
	by polop.usc.edu (8.12.11/8.12.11/Submit) id iAK0M7rn001108
	for linux-lvm@redhat.com; Fri, 19 Nov 2004 16:22:07 -0800
Date: Fri, 19 Nov 2004 16:22:07 -0800
From: Garrick Staples <garrick@usc.edu>
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
Message-ID: <20041120002207.GK3139@polop.usc.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100888487.4379.9.camel@tesuji.nac.uci.edu>
	<20041119192447.GB10969@nile.gs.washington.edu>
	<1100909625.4379.51.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BldhxuJQ12PvT3+j"
Content-Disposition: inline
In-Reply-To: <1100909625.4379.51.camel@tesuji.nac.uci.edu>
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
To: LVM general discussion and development <linux-lvm@redhat.com>


--BldhxuJQ12PvT3+j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2004 at 04:13:45PM -0800, Dan Stromberg alleged:
> On Fri, 2004-11-19 at 11:24 -0800, David S. wrote:
> > You can use PVFS2 (http://www.pvfs.org/pvfs2/) to aggregate disks from
> > multiple servers into on big file system.  Though PVFS2 is specifically
> > designed for parallel applications, and may not be suited for your
> > purposes.  You can sort-of do it with AFS (http://www.openafs.org),
> > with mutiple file servers servicing the same name space.  AFS is again
> > rather different from an "ordinary" file system, however.  I know you
> > can do it with IBM's GPFS (http://www-1.ibm.com/servers/eserver/cluster=
s/software/gpfs.html);
> > we use GPFS here on two servers attached to an IBM SAN to create a
> > 6.5T file system.  But if you decide to take a run at GPFS, don't
> > blame me.
>=20
> Does PVFS2 have posix semantics these days?
=20
No.  I was at the pvfs2 BOF and SC04 last week and this is one of their sel=
ling
points... much greater scalibity and performance by throwing out half of PO=
SIX.

> My understanding is that IBM will only support GPFS on IBM hardware...

Nor is it really FOSS.

Ultimately, it seems to me that GFS over clustered LVM is the way to go; th=
ough
all the bits don't seem to be quite in place just yet.

--=20
Garrick Staples, Linux/HPCC Administrator
University of Southern California

--BldhxuJQ12PvT3+j
Content-Type: application/pgp-signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.3 (GNU/Linux)

iD8DBQFBno4v0SBUxJbm9HMRAtUAAKCZJvePhQvVc/dbvMPkefhEzRnRRACfRFW8
v/yK3CSeqGIsKSa7ivow8Wg=
=P4fM
-----END PGP SIGNATURE-----

--BldhxuJQ12PvT3+j--
