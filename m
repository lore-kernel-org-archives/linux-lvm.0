Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Fri, 15 Dec 2000 10:00:28 +0000
From: Patrick Caulfield <patrick@tykepenguin.com>
Subject: Re: [linux-lvm] LVM and inactive snapshots.
Message-ID: <20001215100028.B526@tykepenguin.com>
References: <200012141314.OAA23601@e35.marxmeier.com> <Pine.OSF.4.21.0012141509060.4212-100000@lazy.accessus.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.OSF.4.21.0012141509060.4212-100000@lazy.accessus.net>; from jay@lazy.accessus.net on Thu, Dec 14, 2000 at 03:10:05PM -0600
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
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, Dec 14, 2000 at 03:10:05PM -0600, Jay Weber wrote:
> > No. The kernel should not unmount because this may cause
> > confusion and possibly corruption of user mode information
> > (eg. /etc/mtab).
> > 
> > If a snapshot is dead the kernel could simply return an error
> > (EIO?) for any access to the snapshot (which no longer exists).
> > So the bahaviour would be well defined.
> 
> Ah, yes, this does seem more reasonable and does address the issue of the
> bits that are left lying about.

THis patch should do that. It doesn't address the problem of remounting the
inactive snapshot though.

Patrick


--- drivers/md/lvm.c~   Thu Dec 14 14:31:21 2000
+++ drivers/md/lvm.c    Fri Dec 15 09:46:15 2000
@@ -1678,6 +1678,8 @@
                        down(&lv->lv_snapshot_sem);
                        if (lv->lv_block_exception != NULL)
                                lvm_snapshot_remap_block(&rdev_tmp, &rsector_tmp, pe_start, lv);
+                       else
+                           ret = 1;
                        up(&lv->lv_snapshot_sem);
                }
        }
