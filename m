From: Alasdair G Kergon <agk@uk.sistina.com>
Message-ID: <20031121233558.E16901@uk.sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] LVM2/Device-Mapper update
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
Date: Fri Nov 21 17:37:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@lists.sistina.com, lvm-devel@lists.sistina.com, dm-devel@lists.sistina.com

I've updated the LVM 2.0 and Device-Mapper 1.0 tarballs at
ftp.sistina.com again to incorporate some minor bug fixes
and enhancements.
 
device-mapper:
  - dmsetup optionally accepts table data from standard input now
  - dmsetup mknodes will resync non-devfs /dev/mapper directory
  - userspace components can be compiled against current 2.6 kernel headers
  - default build excludes support for the obsolete dm version 1 interface
  - updated kernel patches for 2.4.20, 2.4.21 & 2.4.22
  - sync with ejt's 2.4.23-pre7-umd1 patchset
    [excludes patch 7 (reiserfs issue); adds missing header some archs need]

LVM2:
  - Fix for a bug sometimes seen when deleting a LV from a LVM1 VG with
    many LVs.
  - When reverting to using the LVM1 kernel driver after creating or
    editing LVs with the LVM2 tools, sometimes you had to use
    vgexport and LVM1's vgimport first.  No longer necessary.
  - Missing man pages written.
  - Tool error codes made more consistent.
  - vgmknodes written (needs the updated libdevmapper).
  - O_DIRECT can be turned off if it doesn't work in your kernel.
  - lvm dumpconfig to display the active configuration file.

If your root filesystem is on a LV, you should run 'vgmknodes' or
'vgscan --mknodes' to fix up the special files in /dev in your real root
filesystem after finishing with your initrd.  Also, you can use
'vgchange --ignorelockingfailure' on your initrd if the tool fails
because it can't write a lock file to a read-only filesystem.
[A patch for mounting read-only volumes from read-only PVs went into
CVS today - it's not in this particular release.]

ftp://ftp.sistina.com/pub/LVM2/tools/LVM2.0-stable.tgz
   (CVS tag v2.00.08)
 
ftp://ftp.sistina.com/pub/LVM2/device-mapper/device-mapper-stable.tgz
   (CVS tag v1.00.07)
 

Alasdair
-- 
agk@uk.sistina.com
