Message-Id: <3C224F8F.7080308@carolina.rr.com>
From: Jason Edgecombe <jedgecombe@carolina.rr.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Implementation questions
References: <25E4CA13D679FF48BC30769420220971467A39@nd1-clusa.local.bunnings.com.au>
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
Date: Thu Dec 20 14:50:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com

hi,

   I see two options for setting up raid1 (this is whole-disk mirroring, 
right?:

1. configure a system how you like as a raid array with the second disk 
faulty. then duplicate the first hdd using "dd" or something similar.
2. use an automated installer(i.e. Redhat's Kickstart) to install a bare 
bones (non-lvm)root partition on the raid device, then have an 
after-installation program setup lvm and the rest of the system.
BTW, Redhat's installer DOES understand RAID, just not LVM.
(If you're REALLY brave, you could hack LVM support into Redhat's 
installer, but I'm not brave enough for that.)

FYI,
Kickstart info:
http://www.redhat.com/docs/manuals/linux/RHL-7.2-Manual/custom-guide/s1-kickstart2-file.html


The @Base Package group contains a bare bones Redhat system, I think 
it's about 200-300MB.

Jason Edgecombe

Colin Coe wrote:

> Thanks for the responses.  I didn't properly explain the problem properly.
> The real problem is getting the LVM installed on to /dev/md0 where /dev/md0
> is /dev/hda1 and /dev/hdc1.  I'm still trying to get the first (test) box up
> and going properly.
> 
> The wishlist
> - make the 2 x 20GB drives into /dev/hd[ac]1 partitioned to use the whole
> disk
> - make /dev/md0 (RAID1) contain both disks
> - use pvcreate /dev/md0
> - use vgcreate rootvg /dev/md0
> - lvcreate ...
> - mkfs.xfs /dev/rootvg/...
> 
> I don't mind if the setup procedure for the first (test) machine is dodgy
> and convoluted, as pointed out I should be able to use Ghost or some other
> method to roll the other machines out after.
> 
> TIA
> 
> CC
> 
> 
>>-----Original Message-----
>>From:	mitch@mdmiller.com [SMTP:mitch@mdmiller.com]
>>Sent:	Tuesday, December 18, 2001 10:04 PM
>>To:	linux-lvm@sistina.com
>>Subject:	Re: [linux-lvm] Implementation questions
>>
>>Doesn't Ghost support Linux / LILO configurations?  That would allow you
>>to configure up one PC, and duplicate it to 129 others, and it's VERY
>>quick.  You do, however, still have to make any individualized changes to
>>each one after the duplication.
>>
>>-- Mitch
>>
>>
>>
>>On Tue, 18 Dec 2001, Lewis Bergman wrote:
>>
>>
>>>>As I have about 130 of these to do, I am toying with the idea of
>>>>
>>installing
>>
>>>>a cut-down Linux system with XFS, LAM, md and ramdisk support and
>>>>
>>making a
>>
>>>>bootable CD-ROM which I can then use to configure the system how I
>>>>
>>want it.
