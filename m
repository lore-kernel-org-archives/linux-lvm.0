From: Andreas Dilger <adilger@turbolabs.com>
Date: Fri, 12 Oct 2001 18:11:38 -0600
Subject: Re: [linux-lvm] pv recovery after trashing partition table.
Message-ID: <20011012181138.D27981@turbolinux.com>
References: <20011012.181856.-303677.1.james.cromie@juno.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011012.181856.-303677.1.james.cromie@juno.com>
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
To: Jim N Cromie <james.cromie@juno.com>
Cc: linux-lvm@sistina.com

On Oct 12, 2001  18:18 -0600, Jim N Cromie wrote:
> Miraculously, Ive successfully recovered hda[1-3], by a combination of
> luck,
> a simple partition table (1=vfat, 2=swap, 3=ext2, 4=lvm, on cylinder
> boundaries), good notes (I had the cylinder numbers mostly written down),
> and perseverance with fdisk.  I wrote experimental partition-tables
> untill I was able to mount them.
> 
> SO, WHAT IF ANY ARE MY OPTIONS ?
> 
> 1) Would a carefully considered set of 'dd' commands possibly
> restore it?   I have nothing to lose in hda4 at this point.
> 
> 2) IS IT POSSIBLE THAT DESPITE MY SUCCESS MOUNTING hda 1-3, particularly
> hda3, since thats ext2, (ie a real filesystem, with a real fsck).  Ive
> somehow got the partitions wrong, and thus pvdata is looking in the wrong
> disk sector for its meta-data  ?

Correct.  It is possible that hda3 is larger than it should be, and is
stealing the beginning of hda4.  What you really want to have is "gpart"
which _should_ find the partition tables for you automatically.

Failing that, you could look at "dumpe2fs -h /dev/hda3" to find the
previous size of the filesystem there so you know how big to make it.

Cheers, Andreas
--
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
