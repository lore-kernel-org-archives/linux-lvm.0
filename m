Subject: Re: [linux-lvm] I broke my PVs!
From: Austin Gonyou <austin@coremetrics.com>
In-Reply-To: <20021021115226.B9466@sistina.com>
References: <20021021115226.B9466@sistina.com>
Content-Transfer-Encoding: 7bit
Message-Id: <1035195304.2789.12.camel@localhost.localdomain>
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
Date: Mon Oct 21 05:15:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

You're On Mon, 2002-10-21 at 04:52, Heinz J . Mauelshagen wrote:
> On Sun, Oct 20, 2002 at 03:16:34PM -0500, Austin Gonyou wrote:
> > On Sun, 2002-10-20 at 05:49, Luca Berra wrote:
> > > On Sat, Oct 19, 2002 at 11:14:02PM -0500, Austin Gonyou wrote:
> > > >I have 3 disks, one 9GB and two 18GB scsi disks. I just
> re-installed my
> > > >system with RH 8.0, and it didn't like that the two 18's weren't
> > > >initialized, I guess I screwed up, cause I didn't think I was
> > > >initializing them(since I told the installer not to), and instead
> ran
> > > >fdisk and then saved without making partitions. 
> > 
> > 
> > > what do you mean with initialized?
> > > mke2fs? in this case you will find lovely ext2 superblock copies in
> the
> > > middle of your data, but then you could salvage most of your data.
> > 
> > I ran fdisk, then just saved. So I guess you could say I just lost the
> > partition table.
> >  
> > > lost partition table? just recreate it, it is not destructive?
> > 
> > I didn't have any partitions just whole disks. 
> 
> Austin,
> so your 2 18Gb drives have been in one VG as whole disk PVs
> and you wrote a partition table onto those. which toasted the PV
> structures on both forcing vgscan to fail finding the VG.
> 
> Before you write anything else onto the disks, you should save the rest
> of your LVM metadata for later help.
> Let's assume your PVs are /dev/sdb and /dev/sdc and your VG name
> is "vg00", then you want to run:
>
Gahh...:( I was talking to pjc, and I think I've got it working, but
wont' know until after I create a new kernel and get xfs utilities.

> # dd if=/dev/sdb of=sdb.vgda bs=1k count=4k
> # dd if=/dev/sdc of=sdc.vgda bs=1k count=4k
> # tar jcf vg00.vgda.tar.bz2 sd[bc].vgda
> # rm sd[bc].vgda
> 
> We need vg00.vgda.tar.bz2 if it comes to option 3 below :)
> 

We ended up making some loopback devices, using losetup on them,
pvcreating the loops with --size, vgcreating with them, then lvcreating
using that vg. 

vgchange -an on that vg, then losetup -d on the used loops, then
vgcfgrestore from that config for each pv, tweaking as needed based on
size. 


> The 3 options are:
> 
> - follow Luca's advice to recreate everything with the _very_ same
> parameters
>   (pvcreate, vgcreate, lvcreate -Zn). LVM doesn't destroy the data then;
>   this presumes that you just ran those commands giving you a simple
> layout
>   in the first place.
>   YOU NEED TO RUN "lvcreate -Zn ..." IN ORDER TO AVOID ZEROING THE FIRST
>   BLOCK OF THE LV DATA!!!
> 
> - vgcfgrestore your metadata if you still have a backup:

Yeah..I blew it away, before getting the backup, which happened on a
stupid hunch in the first place.

> - send vg00.tar.bz2 to me for a hack to get your PV structures back;
>   you can restore the hacked metadata to the devices using dd

:( pvcreate already run on the disks. :(

 
> 
> If your layout is _that_ simple and you have the exact parameters at
> hand (PE size, stripe size), you want to prefer option one above.
> Again: run "lvcreate -Zn ..." because otherwise your FS will be in
> trouble.

Understood. It is that simple. I will see what will happen when I get an
xfs enabled kernel and updated utilities. 

I will let you know what happens, but thanks for all the help. :)

--
Austin Gonyou
Coremetrics, Inc.
