From: Josh Duncan <linux-lvm@msmd.net>
Subject: Re: [linux-lvm] lvm with gpt partitioning?
Message-ID: <20021015152222.GB18971@msmd.net>
References: <20021014200329.GA4885@msmd.net> <20021015090253.A10084@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20021015090253.A10084@sistina.com>
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
Date: Tue Oct 15 10:43:26 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Hi Heinz,

I don't think I can remove the partition, because the EFI firmware needs the
first partition of the disk to be vfat to boot from that disk.  That's not a
concern for this issue right now, but it will be when I want to have my / be an
LVM volume mirrored across sda/sdb.

--Josh


On Tue, Oct 15, 2002 at 09:02:53AM +0200, Heinz J . Mauelshagen wrote:
> 
> Josh,
> 
> if a device holds a partition, LVM assumes PC style.
> 
> Can you remove the partition (dd if=/dev/zero of=/dev/sdb bs=1k count=1)
> and use the whole device (pvcreate /dev/sdb) or go with PC style partitioning?
> 
> Regards,
> Heinz    -- The LVM Guy --
> 
> 
> On Mon, Oct 14, 2002 at 04:03:29PM -0400, Josh Duncan wrote:
> > Hi all,
> > 
> > I hope this isn't a redundant question, I've tried looking through the mailing
> > lists with no luck:
> > 
> > I'm having a problem setting up physical volumes on an ia64 machine running a
> > 2.4.18+lvm1.0.5 kernel.
> > 
> > the disk is labelled using an "EFI GPT" disk label/partitioning arrangement.  I
> > currently have two partitions defined, the first is 2gb and the second is 16gb.
> > I can do a pvcreate on the second, but not on the first.  I've attached output
> > from parted, fdisk, and pvcreate below...
> > 
> > any ideas?
> > --Josh
> > 
> > ------
> > fdisk:
> > ------
> > [root@one sbin]# fdisk -l /dev/sdb
> > 
> > Disk /dev/sdb: 255 heads, 63 sectors, 4427 cylinders
> > Units = cylinders of 16065 * 512 bytes
> > 
> >    Device Boot    Start       End    Blocks   Id  System
> > /dev/sdb1             1      4428  35566479+  ee  EFI GPT
> > 
> > -------
> > parted:
> > -------
> > [root@one sbin]# parted /dev/sdb print
> > Disk geometry for /dev/sdb: 0.000-34732.890 megabytes
> > Disk label type: GPT
> > Minor    Start       End     Filesystem  Name                  Flags
> > 1          0.017   2047.000                                    lba
> > 2       2047.000  18733.000                                    lba
> > 
> > ---------
> > pvcreate:
> > ---------
> > [root@one sbin]# pvcreate /dev/sdb1
> > pvcreate -- invalid partition type 0xee for "/dev/sdb1" (must be 0x8e)
> > 
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> *** Software bugs are stupid.
>     Nevertheless it needs not so stupid people to solve them ***
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Am Sonnenhang 11
>                                                   56242 Marienrachdorf
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 2626 141200
>                                                        FAX 924446
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
