Message-ID: <3DC238D1.54E65AEC@silicide.dk>
From: Jon Bendtsen <jon+lvm@silicide.dk>
MIME-Version: 1.0
Subject: Re: [linux-lvm] e2fsadm and snapshots?
References: <1036105045.10397.68.camel@theory.jpl.nasa.gov> 
		<20021031232551.GG23959@clusterfs.com> <1036112887.10402.88.camel@theory.jpl.nasa.gov>
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
Date: Fri Nov  1 02:19:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Jim King wrote:
> 
> On Thu, 2002-10-31 at 15:25, Andreas Dilger wrote:
> > The LVM snapshot is the whole filesystem (with only the parts that
> > actually change being written to the snapshot LV) - no need to change
> > the filesystem size at all.  All you need to change is the LV size.
> 
> OK -- so using lvextend I can extend it. But once it's extended, I can
> no longer mount it. I get:

You dont need to unmount it to extend it.
May i suggest mounting the filesystems as ext2, if you are running ext3?


I run 5 scripts for the snapshots as well.
One is run every minute, and checks if there is less than 512M left on
the snapshot, then it extends it. (this is actualy 3 scripts, one using
find to execute another script, this one is called by cron, the 2. does
a lvdisplay on the snapshot, and pipes the data into a perl script, that
does checking and resizing + email sysadm (me))
The 4 other scripts are run every hour, every 8 hour, every day, and
every
sunday. They take a new snapshot, unmounts the old, mounts the new, and
removes the old.

Ontop of all this, i take backup using the day snapshot, and i'll soon
(setting it up today) get another server, that i will use rsync to
take a backup of the hourly snapshot to another server, which is
identical.



JonB
