Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16Jc30-0004vY-00@hermes.sistina.com>
Subject: [linux-lvm] Re: Problem getting snapshots mounted for ext3 & resierfs on
 2.4.17-xfs+lvm-1.0.1
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
Date: Thu Dec 27 09:03:01 2001
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@sistina.com, linux-xfs@oss.sgi.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Well for the seasoned regulars on the list you may already know about this 
but as it turned out I didn't.  Therefore, I'm posting this just so that it 
may help another LVM newbie.

The problem of the kernel dying when the snapshot overflowed was fixed by 
going to kernel 2.4.17-xfs and using the self generating 
lvm-1.0.1-2.4.16.patch and the VFS-lock patch.

The other problem of ext3 and resierfs not being able to mount a snapshot was 
fixed by changing the following line in "linux/drives/md/lvm.c" from:

/* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
/* #define LVM_VFS_ENHANCEMENT */

to:

/* lvm_do_lv_create calls fsync_dev_lockfs()/unlockfs() */
#define LVM_VFS_ENHANCEMENT

More info can be found here:
http://marc.theaimsgroup.com/?l=linux-lvm&m=98276596902838&w=2

Hope this helps.

Date: Thu, 27 Dec 2001 12:58:00 +1000
From: Adrian Head <ahead@bigpond.net.au>
To: linux-lvm@sistina.com, linux-xfs@oss.sgi.com

- -----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

I'm starting to play around with LVM with the goal of having XFS, ext3,
reiserfs and LVM coexist nicely together.

Using the latest XFS CVS + the vfs-lock patch everything seemed fine except
if a snapshot ever got full it would oops the machine.  Because the LVM
version in the XFS CVS is 1.0.1-rc4(ish) I decided to generate the
appropriate 1.0.1 patch and recompile to see if this fixed the problem.

The order of patches was:
Standard 2.4.17-xfs CVS tree
+ VFS-lock patch
+ lvm-1.0.1 self generated patch
There were no rejects

The problem I have now is that I cannot mount the snapshot - I get the
standard "wrong fs type, bad option, bad superblock" etc..... error.  Has
anyone with the XFS CVS kernel ever come up against this before?  This mount
error occurs for ext3, reiserfs filesystems.  Snapshots on XFS volumes work
fine as long as they are done with xfs_freeze.

- -- 
Adrian Head

(Public Key available on request.)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQE8Kzio8ZJI8OvSkAcRAj75AJ9DvAn+kJUDqwf1qxXUSPsCTdt9PQCeOqV8
zWFBV6wjdItpWeL6Yw9hx00=
=Uhhb
-----END PGP SIGNATURE-----
