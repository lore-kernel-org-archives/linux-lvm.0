Subject: RE: [linux-lvm] mounting snapshot errors
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <1075274923.337.23.camel@ws.rdb.linux-help.org>
References: <9BBB7C9EFEF1874BAC4DC204E867EFAF02560F62@s99mail06>
	 <1075274923.337.23.camel@ws.rdb.linux-help.org>
Message-Id: <1075311258.29632.56.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Wed Jan 28 12:48:01 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: lvm <linux-lvm@sistina.com>

On Wed, 2004-01-28 at 02:28, R Dicaire wrote:
> On Tue, 2004-01-27 at 21:53, Little, Chris wrote:
> > is the filesystem you are snapshotting still mounted when you execute the
> > snapshot?  They need to be offline before the snapshot takes place.
> 
> Yes, they are still mounted when I take a snapshot, I must have missed that
> in the docs, that in itself poses a problem as I then cant umount the volumes
> without killing services. I'd understood the snapshotting process as being
> able to snapshot a live filesystem, and then mount the snapshot to perform
> backups from it instead of the live filesystem. Whats the purpose of the
> --size arg to lvcreate when taking a snapshot, I thought it was a buffer
> to hold data that'd normally be written to disk but cant when the
> snapshot exists? I'm confused.
> 
I snapshot live mounted volumes every day.  (LVM 1.x, kernel 2.4.21)

It works.

I use xfs.

For LVM snapshot to work with mounted filesystems you either have to
have the vfs-lock patch applied or invoke a filesystem freeze from user
space prior to creating the snapshot.

With xfs, I use the xfs_freeze command from userspace.

Then on the xfs mount, I have to use the "-o ro,nouuid" flag to mount
the snapshot because the master volume and the  snapshot have the same
uuid.

Greg
-- 
Greg Freemyer
