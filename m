content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: Re: [linux-lvm] LVM 1.0.7, kernel 2.4.21 and snapshots over ext3 filesystem
Message-ID: <BC28A9E979C56C44BCBC2DED313A4470017E83E8@bond.ncl.ac.uk>
From: "C R Ritson" <C.R.Ritson@newcastle.ac.uk>
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
Date: Thu Jul  3 11:14:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

> Date: Tue, 1 Jul 2003 23:16:54 +0200
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] LVM 1.0.7, kernel 2.4.21 and=20
>=20
> My bet is that you first patched the kernel for VFS-lock and
> *then* patched the kernel for LVM.  This undoes (parts of)
> the VFS-lock.  The reason is as follows:
>=20
> - AFAICS the LVM kernel patch generator has functions as they
>   should be in the kernel
> - this means the 'patch' is dynamically build by comparing
>   the current kernel with the functions LVM wants there.
> - so if the VFS-lock patch is in the kernel, LVM will
>   'correct' it, undoing it's efforts.

That is strange - my exprience with kernel 2.4.20 and LVM 1.0.7 was as
follows:

With no VFS-lock patch I get problems with snapshots as described.

Attempting to apply the VFS-lock patch AFTER the LVM generated patch
gives me an un-compilable tree with with unresolved reverences to
fsync_dev_lockfs and unlockfs.

On one test machine I am running a 2.4.20 kernel in which the VFS-lock
patch was applied BEFORE the LVM patch. Here, I am taking a snapshot at
about 23:30 every night, and backing that up to tape to ensure that
backup sees a stable volume, then leaving the snapshot around for the
next 24 hours to allow users to recover from sinple file deletions and
corruptions themselves.

Would Heinz care to comment on these two apparently conflicting results?

Chris Ritson (Computing Officer)

Rm 618, Claremont Bridge,       EMAIL: C.R.Ritson@newcastle.ac.uk
School of Computing Science,    PHONE: +44 191 222 8175
University of Newcastle,        FAX  : +44 191 222 8232
Newcastle on Tyne, UK NE1 7RU.  http://www.cs.ncl.ac.uk/~c.r.ritson/
