From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] I broke my PVs!
Message-ID: <20021021115226.B9466@sistina.com>
References: <20021020104912.GD26167@percy.comedia.it> <1035144994.29693.2.camel@localhost.localdomain>
Mime-Version: 1.0
In-Reply-To: <1035144994.29693.2.camel@localhost.localdomain>; from austin@coremetrics.com on Sun, Oct 20, 2002 at 03:16:34PM -0500
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
Date: Mon Oct 21 04:55:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Oct 20, 2002 at 03:16:34PM -0500, Austin Gonyou wrote:
> On Sun, 2002-10-20 at 05:49, Luca Berra wrote:
> > On Sat, Oct 19, 2002 at 11:14:02PM -0500, Austin Gonyou wrote:
> > >I have 3 disks, one 9GB and two 18GB scsi disks. I just re-installed my
> > >system with RH 8.0, and it didn't like that the two 18's weren't
> > >initialized, I guess I screwed up, cause I didn't think I was
> > >initializing them(since I told the installer not to), and instead ran
> > >fdisk and then saved without making partitions. 
> 
> 
> > what do you mean with initialized?
> > mke2fs? in this case you will find lovely ext2 superblock copies in the
> > middle of your data, but then you could salvage most of your data.
> 
> I ran fdisk, then just saved. So I guess you could say I just lost the
> partition table.
>  
> > lost partition table? just recreate it, it is not destructive?
> 
> I didn't have any partitions just whole disks. 

Austin,
so your 2 18Gb drives have been in one VG as whole disk PVs
and you wrote a partition table onto those. which toasted the PV
structures on both forcing vgscan to fail finding the VG.

Before you write anything else onto the disks, you should save the rest
of your LVM metadata for later help.
Let's assume your PVs are /dev/sdb and /dev/sdc and your VG name
is "vg00", then you want to run:

# dd if=/dev/sdb of=sdb.vgda bs=1k count=4k
# dd if=/dev/sdc of=sdc.vgda bs=1k count=4k
# tar jcf vg00.vgda.tar.bz2 sd[bc].vgda
# rm sd[bc].vgda

We need vg00.vgda.tar.bz2 if it comes to option 3 below :)


The 3 options are:

- follow Luca's advice to recreate everything with the _very_ same parameters
  (pvcreate, vgcreate, lvcreate -Zn). LVM doesn't destroy the data then;
  this presumes that you just ran those commands giving you a simple layout
  in the first place.
  YOU NEED TO RUN "lvcreate -Zn ..." IN ORDER TO AVOID ZEROING THE FIRST
  BLOCK OF THE LV DATA!!!

- vgcfgrestore your metadata if you still have a backup:
  
  # dd if=/dev/zero of=/dev/sdb count=1 bs=512
  # dd if=/dev/zero of=/dev/sdc count=1 bs=512
  # pvcreate -ff /dev/sd[bc]
  # vgcfgrestore -n vg00 -f /etc/lvmconf/vg00.conf /dev/sdb
  # vgcfgrestore -n vg00 -f /etc/lvmconf/vg00.conf /dev/sdc
  # vgscan
  # vgchange -ay

- send vg00.tar.bz2 to me for a hack to get your PV structures back;
  you can restore the hacked metadata to the devices using dd


If your layout is _that_ simple and you have the exact parameters at
hand (PE size, stripe size), you want to prefer option one above.
Again: run "lvcreate -Zn ..." because otherwise your FS will be in trouble.

Regards,
Heinz    -- The LVM Guy --


> 
> > lost lvm metadata?
> > i s'pose you don't have a metadata backup handy,
> > how were your lv's laid out in your vg?
> 
> one LV, one VG, and two PVs in the VG, striped. -i2 -I64
>  
> > i never tried this on linux, but on hp-ux pvcreate, vgcreate and
> > lvcreate weren't
> > destructive, it only touched disk metadata. so you could try pvcreate,
> > vgcreate and lvcreate.
> > DO A BACKUP OF YOUR RAW DISK DATA FIRST
> 
> what about vgcfgrestore from another set of smaller disks that are laid
> out the same way? could that work?
> 
> Wish I could, but I can't. Don't have enough disk space. :(
> 
> > L.
> > -- 
> > Luca Berra -- bluca@comedia.it
> >         Communication Media & Services S.r.l.
> >  /"\
> >  \ /     ASCII RIBBON CAMPAIGN
> >   X        AGAINST HTML MAIL
> >  / \
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

*** Software bugs are stupid.
    Nevertheless it needs not so stupid people to solve them ***

=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

Heinz Mauelshagen                                 Sistina Software Inc.
Senior Consultant/Developer                       Am Sonnenhang 11
                                                  56242 Marienrachdorf
                                                  Germany
Mauelshagen@Sistina.com                           +49 2626 141200
                                                       FAX 924446
=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
