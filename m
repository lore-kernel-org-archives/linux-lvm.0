Subject: Re: [linux-lvm] wiping an old LVM
From: Geoff Dolman <geoff.dolman@cimr.cam.ac.uk>
In-Reply-To: <1070592126.26293.133.camel@rocky>
References: <1070592126.26293.133.camel@rocky>
Message-Id: <1070616618.17582.15.camel@lupin>
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
Date: Fri Dec  5 03:32:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

I have no idea if this is the way to do this officially but this worked
for me.

I had three partitions slash, usr and var on lvm vgs made on three
software raid devices.

I wanted to remove lvm 1 so I could try the 2.6 kernel - I guess I could
have upgraded lvm but that seemed like more effort.

What I did was:

backup each partition. Then for each partition, make a new partition on
a spare disk, mke2fs it, copy the data into it and change fstab to pick
up the new location.

Reboot. The old vg is still picked up by vgscan and I could not get rid
of them with lvremove/vgremove because it moaned that they were in use.
However, then for each one in turn I did mke2fs on the filing system and
then deleted /etc/lvmtab and rebooted. When the machine came up if then
lost that pv,vg,lv.

Although I didn't try this, one thing I thought of was that you could
delete /etc/lvmtab and edit the linuxrc script in /boot/initrd.img so
that it didn't run vgchange -ay and so on on boot. You would then be
able to get rid of stuff at your leisure without lvremove complaining
stuff was in use.


On Fri, 2003-12-05 at 02:42, Nathan Fredrickson wrote:
> Hi,
> I have browsed the archives and not found a conclusive answer to this: 
> How much of an PV partition do I need to wipe with dd so that pvscan
> does not find it?
> 
> I have found that even if I wipe a partition table with dd and then
> repartition with the same sized partitions, the old PV and VG are still
> found.  I tried zeroing the start of the LVM partition, but found this
> only worked consistently if I wiped nearly the entire partition.  Where
> exactly is the metadata that needs to be zeroed?
> 
> I'd like to to wipe it regardless of any information about previous LVM
> configuration.  This is for install scripts of cluster nodes which are
> re-imaged periodically.  I'm using LVM 1.0.3.
> 
> Thanks,
> Nathan
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
-- 
Geoff Dolman
JDRF/WT Diabetes and Inflammation Laboratory
Cambridge Institute for Medical Research
University of Cambridge
http://www-gene.cimr.cam.ac.uk/todd/
