From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] e2fsadm and snapshots?
Message-ID: <20021104162915.A13741@munet-d.enel.ucalgary.ca>
References: <1036105045.10397.68.camel@theory.jpl.nasa.gov> <20021031232551.GG23959@clusterfs.com> <1036112887.10402.88.camel@theory.jpl.nasa.gov> <20021101044736.GB554@clusterfs.com> <1036445485.26665.79.camel@theory.jpl.nasa.gov>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1036445485.26665.79.camel@theory.jpl.nasa.gov>; from jrk@mipl.jpl.nasa.gov on Mon, Nov 04, 2002 at 01:31:24PM -0800
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
Date: Mon Nov  4 17:30:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Nov 04, 2002  13:31 -0800, Jim King wrote:
>   EXT2-fs: lvm(58,5): couldn't mount because of unsupported optional
>   features (4).
> 
> I'm running RedHat 7.3 with 2.4.18-10smp and the RedHat lvm-1.0.3-4 RPM
> package. Tried mounting both with no options, with -t ext2, and with -t
> ext3. Same results in all cases. Doing the mount in verbose mode doesn't
> give any extra info.

Two word "vfs-locking patch".  It is in LVM CVS, and _still_ has not made
it into the (a?) kernel.

> ...I'd like to figure this out, but in truth there's a more serious
> problem with snapshots that means I can't use it. When the file-system
> is under load, having a snapshot increases the system load by many
> multiples. Example:
> 
>   - 250 GB filesystem, copying data to it at a rate of aobut 56 Mbs
>   - Load is constantly less than .2, usually down around .05
>   - Create one snapshot on the volume: load is now over 1 continuously.
>   - Create a 2nd snapshot: system load now jumps over 4.5 continuously.
>   - Same experiment with the filesystem used sparsely sees no
>     significant system load increase... so it has to do with 
>     usage.
> 
> I'd have expected performance loss by creating the snapshots, but I
> expect it to be a linear loss (ie: 2 snapshots is twice the load of 1
> snapshot).

Load is only an indicator of processes that are runnable, and not necessarily
an indication of how busy a system is.  If your disk is fairly busy, and
you have lots of processes writing to it, then even a small increase in
disk traffic could result in a huge jump in load as processes block waiting
for their disk I/O to finish.

I would suggest putting your snapshot LV onto a separate disk and see how
that does.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
