From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Removing an old disk, and some vgexport/import love..
Message-ID: <20020919154459.A1017@sistina.com>
References: <002001c25fa7$482b2740$ccc67140@ownage> <20020919115935.A32578@sistina.com> <000d01c2615f$7f7d7130$ddc67140@nolove>
Mime-Version: 1.0
In-Reply-To: <000d01c2615f$7f7d7130$ddc67140@nolove>; from lightning@aci.net on Sat, Sep 21, 2002 at 04:10:30AM -0700
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
Date: Thu Sep 19 08:48:23 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Matt,

ok. I see what you did.
As a result of all your steps and presuming that the vgreduce didn't fail.
the vgimport should just work.

To help you any further, I need to look at your metadata.
Please dd them of the devices (dd if=/dev/hdX1 of=hdX1.vgda, bs=1k count=4k),
tar them, bzip2 them and send them in direct email to mge@sistina.com.

X above stands for e, f and g respectively.

Regards,
Heinz    -- The LVM Guy --


On Sat, Sep 21, 2002 at 04:10:30AM -0700, Matt wrote:
> Heinz,
> 
> Sorry I didn't explain my situation with a little more clarity, Here are the
> steps I went through,
> it will sound like a cluster f*ck, but bare with me.
> 
> 1.) I read through the LVM-howto a couple of times but I keep smashing my
> face into the wall for
> thinking I needed to export the volume... My brain failed me on that one.
> 
> 2.) With my old setup I had LVM going with three disks, here was the setup
> before my great
> attempt to remove the old disk.
> 
>                 Connected via a PCI Promise ATA100 card.
>                 /dev/hde1 - 80gb part of the 'garage' VG
>                 /dev/hdf1 - 15gb part of the 'garage' VG (disk to be
> removed)
>                 /dev/hdg1 - 80gb part of the 'garage' VG
> 
> It only gets better from here folks... ;(
> 
> 3.) I put in another Promise ATA100 card so I could hook up the new 80gb
> drive that will
> replace the 15gb, that currently resides in the 'garage' VG. (there were no
> more IDE conncetors,
> hince adding another Promise card.)  From this point the device names
> changed because the
> new card took over the 'hd[efgh]' letter assignment, and the old card that
> had the current working
> drives from the 'garage' VG had been moved to 'hd[ijkl]'.  LVM picked up the
> changes without a
> hitch, so I continued to get ready to move the extents from the 15gb drive
> (/dev/hdf1, now /dev/hdj1)
> to the new 80gb that is "/dev/hde1".  I followed the HOWTO verbatim with
> their example of the
> pvmove command and steps following, I was able to move the extents to the
> new drive (/dev/hde1)
> and also reduce it by running:
>                 vgreduce garage /dev/hdj1
> 
> 4.) From this point I went ahead and ran:
>                 unmount /home/blah
>                 vgchange -an garage
>                 vgexport garage (why lord did I do this?)
> 
> As you can see I went into brain damage mode and thought I had to export
> this volume, I would
> have felt better taken a beating to the crotch than run this command, live
> and learn I guess...
> 
> 5.) After all this wonderful stuff, I decided to power off the machine and
> take out the 15gb and
> permantely replace it by adding the 80gb to where the 15gb use to be (Master
> slave on the old
> Promise PCI ATA100 card).  I then took out the new Promise PCI ATA100 card
> that had been
> connected to the new 80gb.  So I am back down to one card.
> 
> 6.) I fired the machine back up, didn't see anything odd in the dmesg output
> so I decided to import
> the 'garage' VG.
>                 vgimport garage /dev/hde1 /dev/hdf1 /dev/hdg1
> 
> This of course gave me the error that I posted with my original post.  I've
> skimmed through the
> mailing list archives and a few searches on Google but I didn't really see
> anything that blantely
> screamed my current situation.  Thanks for all your help so far.. ;)
> 
> -- Matt
> 
> 
> 
> ----- Original Message -----
> From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> To: <linux-lvm@sistina.com>
> Sent: Thursday, September 19, 2002 2:59 AM
> Subject: Re: [linux-lvm] Removing an old disk, and some vgexport/import
> love..
> 
> 
> > On Wed, Sep 18, 2002 at 11:39:19PM -0700, Matt wrote:
> > > Helu,
> > >
> > >
> > >
> > > I am in dire need of some help.I recently removed an old disk from my PV
> > > and added a new one
> > >
> > >  in place of the old one.
> > >
> > > e.g.
> > >
> > >
> > >
> > > pvmove garage /dev/hdj1 /dev/hde1 (hde1 being the new drive)
> > >
> > >
> > >
> > > The physical extents moved over to the new drive and everything was
> > > looking good until
> > >
> > > I made a pretty big mistake, I figured I'd need to export the group
> > > 'garage' and import it.
> > >
> > > Wrong! Now when I go and try to import my group it freaks stating:
> > >
> > >
> > >
> > >             # vgimport garage /dev/hde1 /dev/hdg1 /dev/hdf1
> > >
> > > vgimport -- ERROR: wrong number of physical volumes to import volume
> > > group "garage"
> >
> > Matt,
> >
> > you didn't need to export the volume group unless you want to move it to
> > a different system. It looks like you exported the VG and removed
> /dev/hdj1,
> > right?
> >
> > If that assumption is true, you still need /dev/hdj1 in order to get your
> > VG back.
> >
> > Then do the following:
> >
> > # vgimport garage /dev/hd[efgj]1
> > # vgchange -ay garage
> > # vgreduce garage /dev/hdj1
> >
> > That should bring your VG back and reduce it by the empty /dev/hdj1
> > physical volume.
> >
> > You can physically remove /dev/hdj1 afterwards if you want to.
> >
> > Regards,
> > Heinz    -- The LVM Guy --
> >
> > >
> > >
> > >
> > > I can't do a vgcfgrestore either, because it is currently exported and I
> > > am not sure if that would
> > > fix anything anyways. Here is some more information:
> > >
> > >
> > >
> > >             # pvscan
> > >
> > > pvscan -- reading all physical volumes (this may take a while...)
> > >
> > > pvscan -- inactive PV "/dev/hdg1"  is in EXPORTED VG "garage" [74.55 GB
> > > / 0 free]
> > >
> > > pvscan -- inactive PV "/dev/hde1"  is in EXPORTED VG "garage" [76.33 GB
> > > / 0 free]
> > >
> > > pvscan -- inactive PV "/dev/hdf1"  is in EXPORTED VG "garage" [74.52 GB
> > > / 60.21 GB free]
> > >
> > > pvscan -- total: 3 [225.42 GB] / in use: 3 [225.42 GB] / in no VG: 0 [0]
> > >
> > >
> > >
> > >             vgscan -d output can be found at:
> > > http://www.planetgarage.net/vgscan.txt (long)
> > >
> > >
> > >
> > > root@deify:~ # vgdisplay -Dv
> > >
> > > vgdisplay -- WARNING: volume group "garagePV_EXP" is exported
> > >
> > > --- Volume group ---
> > >
> > > VG Name               garagePV_EXP
> > >
> > > VG Access             read/write
> > >
> > > VG Status             NOT available/exported/resizable
> > >
> > > VG #                  0
> > >
> > > MAX LV                256
> > >
> > > Cur LV                1
> > >
> > > Open LV               0
> > >
> > > MAX LV Size           255.99 GB
> > >
> > > Max PV                256
> > >
> > > Cur PV                3
> > >
> > > Act PV                3
> > >
> > > VG Size               225.41 GB
> > >
> > > PE Size               4 MB
> > >
> > > Total PE              57705
> > >
> > > Alloc PE / Size       42290 / 165.20 GB
> > >
> > > Free  PE / Size       15415 / 60.21 GB
> > >
> > > VG UUID               fs8lXY-bca9-tFHT-yv8g-HP7U-Ssh7-v13m9h
> > >
> > >
> > >
> > > --- Logical volume ---
> > >
> > > LV Name                /dev/garage/LLAMA
> > >
> > > VG Name                garage
> > >
> > > LV Write Access        read/write
> > >
> > > LV Status              NOT available
> > >
> > > LV #                   1
> > >
> > > # open                 0
> > >
> > > LV Size                165.20 GB
> > >
> > > Current LE             42290
> > >
> > > Allocated LE           42290
> > >
> > > Allocation             next free
> > >
> > > Read ahead sectors     120
> > >
> > > Block device           58:0
> > >
> > >
> > >
> > >
> > >
> > > --- Physical volumes ---
> > >
> > > PV Name (#)           /dev/hde1 (1)
> > >
> > > PV Status             available / allocatable
> > >
> > > Total PE / Free PE    19541 / 0
> > >
> > >
> > >
> > > PV Name (#)           /dev/hdg1 (3)
> > >
> > > PV Status             available / allocatable
> > >
> > > Total PE / Free PE    19086 / 0
> > >
> > >
> > >
> > > PV Name (#)           /dev/hdf1 (4)
> > >
> > > PV Status             available / allocatable
> > >
> > > Total PE / Free PE    19078 / 15415
> > >
> > >
> > >
> > >
> > >
> >
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> >
> >
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> =-
> >
> > Heinz Mauelshagen                                 Sistina Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> >
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> =-
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> >
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
