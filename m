Subject: Re: [linux-lvm] e2fsadm and snapshots?
From: Jim King <jrk@mipl.jpl.nasa.gov>
In-Reply-To: <20021101044736.GB554@clusterfs.com>
References: <1036105045.10397.68.camel@theory.jpl.nasa.gov>
	<20021031232551.GG23959@clusterfs.com>
	<1036112887.10402.88.camel@theory.jpl.nasa.gov> 
	<20021101044736.GB554@clusterfs.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1036445485.26665.79.camel@theory.jpl.nasa.gov>
Mime-Version: 1.0
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
Date: Mon Nov  4 15:32:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Thu, 2002-10-31 at 20:47, Andreas Dilger wrote:
> > OK -- so using lvextend I can extend it. But once it's extended, I can
> > no longer mount it. I get:
> > 
> >   mount: wrong fs type, bad option, bad superblock on
> >     /dev/data1/.mer_dev.hourly.3, or too many mounted file systems
> > 
> > Is there something I'm missing here? (ok -- obviously yes...)
> 
> You must have gotten some sort of error in the syslog after this
> (dmesg will show you).

  EXT2-fs: lvm(58,5): couldn't mount because of unsupported optional
  features (4).

I'm running RedHat 7.3 with 2.4.18-10smp and the RedHat lvm-1.0.3-4 RPM
package. Tried mounting both with no options, with -t ext2, and with -t
ext3. Same results in all cases. Doing the mount in verbose mode doesn't
give any extra info.




...I'd like to figure this out, but in truth there's a more serious
problem with snapshots that means I can't use it. When the file-system
is under load, having a snapshot increases the system load by many
multiples. Example:

  - 250 GB filesystem, copying data to it at a rate of aobut 56 Mbs
  - Load is constantly less than .2, usually down around .05
  - Create one snapshot on the volume: load is now over 1 continuously.
  - Create a 2nd snapshot: system load now jumps over 4.5 continuously.
  - Same experiment with the filesystem used sparsely sees no
    significant system load increase... so it has to do with 
    usage.

I'd have expected performance loss by creating the snapshots, but I
expect it to be a linear loss (ie: 2 snapshots is twice the load of 1
snapshot).

Is this sort of performance loss a known issue? I've got another way of
doing pseudo-snapshots without LVM, but it'd be really nice to use the
built-in snapshotting for a number of reasons. I can't find any mention
of this sort of thing anywhere, and don't see it addressed in any of the
changelogs.


This is on the above RedHat system, which is a dual-processor Athlon
1800 system with 1GB of memory that's doing nothing except holding
volumes and NFS serving them out. VGs are on two 3-ware ide-RAID RAID 5
setups of 960 GB apiece.


-- 
------------------------------------------------------
Jim King
Multimission Image Processing Lab  (MIPL) Engineering Group
Science Data Processing Systems Section,  Jet Propulsion Lab
James.King@jpl.nasa.gov  
------------------------------------------------------
