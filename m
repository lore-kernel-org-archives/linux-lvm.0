Content-Type: text/plain; charset="us-ascii"
From: Adrian Head <ahead@bigpond.net.au>
References: <2D0AFEFEE711D611923E009027D39F2B02F08F@cdserv.meridian-data.com>
In-Reply-To: <2D0AFEFEE711D611923E009027D39F2B02F08F@cdserv.meridian-data.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-Id: <E16ZLc9-0002WX-00@hermes.sistina.com>
Subject: [linux-lvm] Re: Oops unmounting snapshot of xfs filesystem
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
Date: Fri Feb  8 18:44:02 2002
List-Id: <linux-lvm.redhat.com>
To: "Stephenson, Dale" <dstephenson@snapserver.com>, "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>, "'linux-lvm@sistina.com'" <linux-lvm@sistina.com>

> Kernel 2.4.16 with 12/14/01 xfs CVS.
There has been heaps of work with respect to XFS and LVM since December last 
year; therefore, I recommend that you try the current 2.4.17-xfs CVS.  If you 
don't like CVS kernels then use the split patches for 2.4.17-xfs (these 
however, won't have all the latest bug fixes).

I am running 2.4.17-xfs (CVS) with LVM-1.0.2 with the xfs_fs_freeze patch and 
I'm not seening your exact problem.  However, there is a bug at the moment 
that doesn't flush all inodes to disk on a freeze so the snapshot is not 
consistant.  The SGI guys are working on this at the moment.

PS.  I think the xfs_fs_freeze patch is actually in the CVS now.


> LVM CVS of 1/21/02 (functionally identical to 1.0.2, I believe).
> LVM's linux-2.4.11-VFS-lock.patch.
> xfs_fs_freeze() patch posted by Eric Sandeen.

-- 
Adrian Head

(Public Key available on request.)
