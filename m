From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] e2fsadm and snapshots?
Message-ID: <20021101044736.GB554@clusterfs.com>
References: <1036105045.10397.68.camel@theory.jpl.nasa.gov> <20021031232551.GG23959@clusterfs.com> <1036112887.10402.88.camel@theory.jpl.nasa.gov>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1036112887.10402.88.camel@theory.jpl.nasa.gov>
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
Date: Thu Oct 31 22:51:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim King <jrk@mipl.jpl.nasa.gov>
Cc: linux-lvm@sistina.com

On Oct 31, 2002  17:08 -0800, Jim King wrote:
> On Thu, 2002-10-31 at 15:25, Andreas Dilger wrote:
> > The LVM snapshot is the whole filesystem (with only the parts that
> > actually change being written to the snapshot LV) - no need to change
> > the filesystem size at all.  All you need to change is the LV size.
> 
> OK -- so using lvextend I can extend it. But once it's extended, I can
> no longer mount it. I get:
> 
>   mount: wrong fs type, bad option, bad superblock on
>     /dev/data1/.mer_dev.hourly.3, or too many mounted file systems
> 
> Is there something I'm missing here? (ok -- obviously yes...)

You must have gotten some sort of error in the syslog after this
(dmesg will show you).

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
