Subject: Re: [linux-lvm] How well tested is the snapshot feature?
Message-ID: <20020607174732.GA1076@fib011235813.fsnet.co.uk>
References: <2D0AFEFEE711D611923E009027D39F2B02F18A@nasexs1.meridian-data.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2D0AFEFEE711D611923E009027D39F2B02F18A@nasexs1.meridian-data.com>
From: Joe Thornber <joe@fib011235813.fsnet.co.uk>
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
Date: Fri Jun  7 12:48:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: "'linux-xfs@oss.sgi.com'" <linux-xfs@oss.sgi.com>

On Fri, Jun 07, 2002 at 08:35:44AM -0700, Dale Stephenson wrote:
> device-mapper (LVM2) uses (with VFS enhancement) the very same
> fsync_dev_lockfs() and unlockfs() calls.  However, the COW activity is not
> handled through brw_kiovec(), instead being transferred to device-mapper's
> kcopyd.  I haven't worked with LVM2 yet, so it's certainly possible that
> kcopyd allieviates the pressure on kupdated.  But in theory I would expect
> it to be susceptible to the same file system deadlocks experienced by LVM1.

I'm not sure what this kupdated interaction that you mention could be.
Both brw_kiovec and kcopyd stay well away from both the filesystem
and the buffer cache.

> 2) I'm still seeing an occasional xfs_freeze deadlock.
> xfs_unmountfs_writesb() (from xfs_freeze) and kupdated get stuck on separate
> pagebuf locks.  It occurs with multiple snapshots and streaming writes to
> the snapshot source over both samba and nfs.

Which kernel are you using ?  I've found that 2.4.18 can be easily
persuaded to deadlock by having two processes making GFP_NOIO requests
for memory whilst the system is short of free memory. 2.4.19-pre9
works fine.

- Joe
