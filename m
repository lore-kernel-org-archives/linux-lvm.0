From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Message-Id: <20020705102810.1143@192.168.4.1>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Subject: [linux-lvm] Tr: Possible LVM bug in 2.4.19-rc1
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
Date: Fri Jul  5 05:28:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="iso-8859-1"
To: linux-LVM@sistina.com

---------------- D=E9but du message transmis ----------------
Sujet: Possible LVM bug in 2.4.19-rc1
Envoy=E9: jeudi 4 juillet 2002 13:59
De: Benjamin Herrenschmidt <benh@kernel.crashing.org>
=C0: linux-kernel@vger.kernel.org

Hi !

Olaf and I have been tracking down a bug where the kernel died
into lvm=5Fblk=5Fopen() during boot on pmac, and later on other PPCs
when trying to access an unconfigured LVM block device (or an
LVM minor not associated yet). This typically happened in the
pmac root discovery code which walks all gendisks, but I beleive
there are other possible exploits.
 
Here's what I've tracked down so far:

  static int lvm=5Fblk=5Fopen(struct inode *inode, struct file *file)
  {
  =09int minor =3D MINOR(inode->i=5Frdev);
  =09lv=5Ft *lv=5Fptr;
  =09vg=5Ft *vg=5Fptr =3D vg[VG=5FBLK(minor)];

  =09P=5FDEV("blk=5Fopen MINOR: %d  VG#: %d  LV#: %d  mode: %s%s\n",
=09        minor, VG=5FBLK(minor), LV=5FBLK(minor),
  =09      MODE=5FTO=5FSTR(file->f=5Fmode));

  #ifdef LVM=5FTOTAL=5FRESET
=09  if (lvm=5Freset=5Fspindown > 0)
=09  =09return -EPERM;
  #endif

  =09if (vg=5Fptr !=3D NULL &&
  =09    (vg=5Fptr->vg=5Fstatus & VG=5FACTIVE) &&

  .../...

At this point, no association have been made. That is VG=5FBLK(minor)
will return vg=5Flv=5Fmap[minor].vg=5Fnumber which has been initialized
to ABS=5FMAX=5FVG in lvm=5Finit=5Fvars().

That means that vg=5Fptr is set to vg[ABS=5FMAX=5FVG], which is right =
outside
the array bounds, as vg is declared to be

  /* volume group descriptor area pointers */
  vg=5Ft *vg[ABS=5FMAX=5FVG];

So, as soon as we dereference vg=5Fptr, we get whatever garbage is located
right after the array, and not the NULL value we would expect for a non
initialized association.

If my understanding is correct, then a simple fix would be to

  /* volume group descriptor area pointers */
-  vg=5Ft *vg[ABS=5FMAX=5FVG];
+  vg=5Ft *vg[ABS=5FMAX=5FVG+1];

though it's a bit hackish... maybe we should just test
VG=5FBLK < ABS=5FMAX=5FVG

Also, the loop initializing vg array to NULL can probably be removed
from lvm=5Finit=5Fvars as vg is part of the BSS and thus cleared by default.

Did I miss something =3F

Ben.

----------------- Fin du message transmis -----------------
