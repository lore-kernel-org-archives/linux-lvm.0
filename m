From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] [Q]XFS + LVM Snapshot?
Message-ID: <20011117152233.R1308@lynx.no>
References: <007201c16f91$a8d49650$fc00a8c0@xp>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <007201c16f91$a8d49650$fc00a8c0@xp>; from oh@linuxsecurity.co.kr on Sun, Nov 18, 2001 at 02:59:53AM +0900
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
Date: Sat Nov 17 16:21:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Sean Oh <oh@linuxsecurity.co.kr>
Cc: linux-lvm@sistina.com

On Nov 18, 2001  02:59 +0900, Sean Oh wrote:
> Kernel: 2.4.15-pre4 with XFS patch ( linux-2.4-xfs CVS tree from SGI site)
> LVM: current - LVM CVS
> 
> Patches applied: linux-2.4.11-VFS-lock.patch from LVM CVS
> 
> *I can not mount the original FS and snapshot FS at the same time. If
> I unmount the origianal XFS FS and then mount the snapshot FS, it works,
> tough.

Yes, you need an XFS patch which does something with the filesystem UUID
in the snapshot.  XFS has a feature which prevents the same filesystem
from being mounted more than once.

What they do to fix this is to create writable snapshots.  What I would
rather they do is in the "duplicate UUID detection" code, allow mounting
of devices which are on read-only media (e.g. a snapshot).

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
