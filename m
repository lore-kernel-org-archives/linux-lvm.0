Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAK0Dpr25105
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 19:13:51 -0500
Received: from dcs.nac.uci.edu (root@dcs.nac.uci.edu [128.200.34.32])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iAK0DmkM023040
	for <linux-lvm@redhat.com>; Fri, 19 Nov 2004 19:13:49 -0500
Subject: Re: [linux-lvm] HA Fileserver configuration recommendation sought.
From: Dan Stromberg <strombrg@dcs.nac.uci.edu>
In-Reply-To: <20041119192447.GB10969@nile.gs.washington.edu>
References: <1100857645.13422.99.camel@grma-lap>
	<1100888487.4379.9.camel@tesuji.nac.uci.edu>
	<20041119192447.GB10969@nile.gs.washington.edu>
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature";
	boundary="=-nEaYCpMd7/TZqaqGDm6t"
Date: Fri, 19 Nov 2004 16:13:45 -0800
Message-Id: <1100909625.4379.51.camel@tesuji.nac.uci.edu>
Mime-Version: 1.0
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


--=-nEaYCpMd7/TZqaqGDm6t
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Fri, 2004-11-19 at 11:24 -0800, David S. wrote:
> You can use PVFS2 (http://www.pvfs.org/pvfs2/) to aggregate disks from
> multiple servers into on big file system.  Though PVFS2 is specifically
> designed for parallel applications, and may not be suited for your
> purposes.  You can sort-of do it with AFS (http://www.openafs.org),
> with mutiple file servers servicing the same name space.  AFS is again
> rather different from an "ordinary" file system, however.  I know you
> can do it with IBM's GPFS (http://www-1.ibm.com/servers/eserver/clusters/=
software/gpfs.html);
> we use GPFS here on two servers attached to an IBM SAN to create a
> 6.5T file system.  But if you decide to take a run at GPFS, don't
> blame me.

Does PVFS2 have posix semantics these days?

My understanding is that IBM will only support GPFS on IBM hardware...



--=-nEaYCpMd7/TZqaqGDm6t
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)

iD8DBQBBnow5o0feVm00f/8RArroAJ9VrBB6ZimfJ33vLvwfItkPEcImSgCgjxKm
4NPToTlexOxAcmaV1GZB+IE=
=r/nd
-----END PGP SIGNATURE-----

--=-nEaYCpMd7/TZqaqGDm6t--
