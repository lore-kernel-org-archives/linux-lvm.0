From: Andreas Dilger <adilger@clusterfs.com>
Subject: Re: [linux-lvm] e2fsadm and snapshots?
Message-ID: <20021031232551.GG23959@clusterfs.com>
References: <1036105045.10397.68.camel@theory.jpl.nasa.gov>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1036105045.10397.68.camel@theory.jpl.nasa.gov>
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
Date: Thu Oct 31 17:29:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jim King <jrk@mipl.jpl.nasa.gov>
Cc: linux-lvm@sistina.com

On Oct 31, 2002  14:57 -0800, Jim King wrote:
> I'm trying to set up snapshots on my LVM volumes sort of like the way
> Network Appliance does it... with hourly rotating snapshots. The obvious
> problem is that the snapshots do not dynamically size. This is a real
> issue, because snapshots no longer protect us from someone (for example)
> deleting a huge directory accidently.
> 
> To solve that I'm trying to figure a way to have them dynamically size
> -- with a script that checks how full they are and grows them
> automatically if they start to fill up.
> 
> Problem:
> --------
> If I do e2fsadm on a normal LVM volume it works, but if I do e2fsadm on
> a snapshot I get something like:
> 
>   /sbin/e2fsck: Permission denied while trying to open
>      /dev/data1/.mer_dev.hourly.3
>   You must have r/w access to the filesystem or be root
> 
> Now I'm logged in as root, and the filesystem is unmounted. Ideas? I'm
> suspecting it's because the snapshot is ro, but is there a way to work
> around this?

The LVM snapshot is the whole filesystem (with only the parts that
actually change being written to the snapshot LV) - no need to change
the filesystem size at all.  All you need to change is the LV size.

Cheers, Andreas
--
Andreas Dilger
http://www-mddsp.enel.ucalgary.ca/People/adilger/
http://sourceforge.net/projects/ext2resize/
