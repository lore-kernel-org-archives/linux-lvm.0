Message-Id: <064b01c1f69a$71b9c100$070414ac@Home.PIN.LU>
From: "Christian Limpach" <chris@Pin.LU>
References: <Pine.LNX.4.33.0205081213340.3518-100000@diablo.unixag-zw.fh-kl.de>
Subject: Re: [linux-lvm] offtopic but ...
MIME-Version: 1.0
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
Date: Wed May  8 09:11:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Hi!

> What i would like  is a solution which is between LVM and a RAIDx. LVM
> has in my eyes the disadvantage that you create a filesystem over
different
> drives/partitions. If you lose one you nearly lose everything.
> With a RAID you lose a harddrive/partition (diskspace) to build it (more
> costs for harddrives and maybe a controller).

here's what you/one could do:
- you create a RAID5 occupying about 10% of your total disk space
- you create a a PV on this RAID5 and disable allocation on it (-x n)
- you create PVs in the remaining space on all the disks
- you put all the PVs in a VG
- you create your partitions
- you have faith in pvmove ;-)

Finally you'll need a script which runs regularly and uses the statistics
from lvdisplay to find out which PEs are most read from and written to and
moves those PEs to the PV which is on the RAID5.  This is very likely to
keep at least all the metadata of your filesystems on the RAID5 part of your
disks since metadata should have the most accesses.  Additionally one could
add some magic to the filesystems which allows finding out where the
metadata is and lock those PEs onto the RAID5-PV.

I'm too chicken to have faith in pvmove ;-)

     christian
