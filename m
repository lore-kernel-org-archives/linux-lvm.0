content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-ID: <BC28A9E979C56C44BCBC2DED313A447001642369@bond.ncl.ac.uk>
From: "C R Ritson" <C.R.Ritson@newcastle.ac.uk>
Subject: [linux-lvm] stock kernel 2.4.20 + LVM 1.0.7 + ext3fs => snapshot problem?
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
Date: Fri May  9 10:50:06 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have been trying to use LVM on what started out as a standard red-hat
9 system. The supplied kernel had problems with out network card and
DHCP, so I am now attempting to use a stock 2.4.20 kernel patched with
lvm-1.0.7. Everything works fine except that I cannot make a snapshot of
a mounted ext3 filesystem. When I attempt to mount the snapshot
(readonly) I get:-

	mount: wrong fs type, bad option, bad superblock on
/dev/vga/addon.backup,
      or too many mounted file systems

I get the same problem with reiserfs, but not with ext2. Searching the
list archive suggests that I need the VFS-lock patch. I presume this is
already included in the patch-set I build as part of the LVM
installation (applying this patch separately after the generated LVM
patch breaks the kernel, leaving me with unresolved reverences to
fsync_dev_lockfs and unlockfs).

What should I try next?

Chris Ritson (Computing Officer)

Rm 618, Claremont Bridge,       EMAIL: C.R.Ritson@newcastle.ac.uk
School of Computing Science,    PHONE: +44 191 222 8175
University of Newcastle,        FAX  : +44 191 222 8232
Newcastle on Tyne, UK NE1 7RU.  http://www.cs.ncl.ac.uk/~c.r.ritson/
