content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <BC28A9E979C56C44BCBC2DED313A4470017E823E@bond.ncl.ac.uk>
From: "C R Ritson" <C.R.Ritson@newcastle.ac.uk>
Subject: [linux-lvm] RE: stock kernel 2.4.20 + LVM 1.0.7 + ext3fs => snapshot problem?
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
Date: Thu May 15 07:27:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

The solution appears to be to apply the patches in the other order. To
create a kernel capable of making a snapshot of an active ext3 or
reiserfs volume, the drill appears to be to apply the VFS-lock patch for
the appropriate kernel version to the un-patched kernel tree, and only
THEN to apply the generated LVM patch.

This makes me wonder if it would be possible to add this to the
configure script, so that I could say

	configure --with-VFS-lock

I envisage makeing --with-ext3 and --with-reiserfs aliases for the
above. Just an idea.

> -----Original Message-----
> From: C R Ritson=20
> Sent: 09 May 2003 16:51
> To: 'linux-lvm@sistina.com'
> Subject: stock kernel 2.4.20 + LVM 1.0.7 + ext3fs =3D> snapshot =
problem?
>=20
> ... cannot make a snapshot of a mounted=20
> ext3 filesystem. When I attempt to mount the snapshot=20
> (readonly) I get:-
>=20
> 	mount: wrong fs type, bad option, bad superblock on=20
> /dev/vga/addon.backup,
>       or too many mounted file systems
>=20
> ... applying this patch=20
> separately after the generated LVM patch breaks the kernel,=20
> leaving me with unresolved reverences to fsync_dev_lockfs and=20
> unlockfs.

Chris Ritson (Computing Officer)

Rm 618, Claremont Bridge,       EMAIL: C.R.Ritson@newcastle.ac.uk
School of Computing Science,    PHONE: +44 191 222 8175
University of Newcastle,        FAX  : +44 191 222 8232
Newcastle on Tyne, UK NE1 7RU.  http://www.cs.ncl.ac.uk/~c.r.ritson/
