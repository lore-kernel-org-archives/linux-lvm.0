From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm on loopback mount problems
Message-ID: <20031021123829.E848@sistina.com>
References: <2D4B6CD74137D4119A1100104BC6BCBF0BC585CD@dubntex006.qwest.net> <20030924103325.B2618@sistina.com> <1066581326.3895.77.camel@bob.gp.ln>
Mime-Version: 1.0
In-Reply-To: <1066581326.3895.77.camel@bob.gp.ln>; from gpmidi@k4lrg.org on Sun, Oct 19, 2003 at 12:35:26PM -0400
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
Date: Tue Oct 21 05:37:01 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sun, Oct 19, 2003 at 12:35:26PM -0400, Paulson McIntyre wrote:
> I tryed the same procedure on my rh9 box; dident work for me either. I
> then used dd to create a random file the same size as the lv i had
> created, copyed the data onto the lv, copyed the data off the lv, and
> did a 'cmp'...they differ at byte1, line1. 

Ouch, silent data corruption!
Please try a mainline kernel and see if this disapears.

Regards,
Heinz    -- The LVM Guy --

> 
> On Wed, 2003-09-24 at 04:33, Heinz J . Mauelshagen wrote:
> > Never seen this here.
> > Did a quick test and it works with 1.0.7 on 2.4.21 vanilla here.
> > It could be a problem with that RedHat kernel.
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> > 
> > On Tue, Sep 23, 2003 at 05:14:31PM -0400, Montgomery, Kendal L wrote:
> > > I've seen a few things about using lvm on a loopback filesystem, but nothing
> > > concrete, so I tried it myself.  Most everything works okay until I get to
> > > acutally mounting the filesystem.  Here are the steps I did:
> > > 
> > > [root@klmontg tmp]# dd if=/dev/zero of=fake_disk.img bs=1M count=500
> > > 500+0 records in
> > > 500+0 records out
> > > [root@klmontg tmp]# losetup /dev/loop0 fake_disk.img
> > > [root@klmontg tmp]# pvcreate /dev/loop0
> > > pvcreate -- physical volume "/dev/loop0" successfully created
> > > 
> > > [root@klmontg tmp]# vgcreate /dev/vgtest /dev/loop0
> > > vgcreate -- INFO: using default physical extent size 4 MB
> > > vgcreate -- INFO: maximum logical volume size is 255.99 Gigabyte
> > > vgcreate -- doing automatic backup of volume group "vgtest"
> > > vgcreate -- volume group "vgtest" successfully created and activated
> > >  
> > > [root@klmontg tmp]# lvcreate --name lv_one --size 200M /dev/vgtest
> > > lvcreate -- doing automatic backup of "vgtest"
> > > lvcreate -- logical volume "/dev/vgtest/lv_one" successfully created
> > >  
> > > [root@klmontg tmp]# mke2fs /dev/vgtest/lv_one
> > > mke2fs 1.32 (09-Nov-2002)
> > > Filesystem label=
> > > OS type: Linux
> > > Block size=1024 (log=0)
> > > Fragment size=1024 (log=0)
> > > 51200 inodes, 204800 blocks
> > > 10240 blocks (5.00%) reserved for the super user
> > > First data block=1
> > > 25 block groups
> > > 8192 blocks per group, 8192 fragments per group
> > > 2048 inodes per group
> > > Superblock backups stored on blocks:
> > >         8193, 24577, 40961, 57345, 73729
> > >  
> > > Writing inode tables: done
> > > Writing superblocks and filesystem accounting information: done
> > >  
> > > This filesystem will be automatically checked every 26 mounts or
> > > 180 days, whichever comes first.  Use tune2fs -c or -i to override.
> > > [root@klmontg tmp]# e2fsck /dev/vgtest/lv_one
> > > e2fsck 1.32 (09-Nov-2002)
> > > Couldn't find ext2 superblock, trying backup blocks...
> > > e2fsck: Bad magic number in super-block while trying to open
> > > /dev/vgtest/lv_one
> > >  
> > > The superblock could not be read or does not describe a correct ext2
> > > filesystem.  If the device is valid and it really contains an ext2
> > > filesystem (and not swap or ufs or something else), then the superblock
> > > is corrupt, and you might try running e2fsck with an alternate superblock:
> > >     e2fsck -b 8193 <device>
> > >  
> > > [root@klmontg tmp]# e2fsck -b 8193 /dev/vgtest/lv_one
> > > e2fsck 1.32 (09-Nov-2002)
> > > e2fsck: Bad magic number in super-block while trying to open
> > > /dev/vgtest/lv_one
> > >  
> > > The superblock could not be read or does not describe a correct ext2
> > > filesystem.  If the device is valid and it really contains an ext2
> > > filesystem (and not swap or ufs or something else), then the superblock
> > > is corrupt, and you might try running e2fsck with an alternate superblock:
> > >     e2fsck -b 8193 <device>
> > >  
> > > [root@klmontg tmp]# mount /dev/vgtest/lv_one /mnt
> > > mount: you must specify the filesystem type
> > > [root@klmontg tmp]# mount -t ext2 /dev/vgtest/lv_one /mnt
> > > mount: wrong fs type, bad option, bad superblock on /dev/vgtest/lv_one,
> > >        or too many mounted file systems
> > > 
> > > As you can see, one the filesystem was made, nothing else works. I can't
> > > fsck the filesystem on the new logical volume, or mount it.  This is
> > > obviously a problem since, well, it's useless unless I can mount it.
> > > 
> > > I'm using RedHat 9 with the  2.4.20-20.9 kernel.  I've also tried this on
> > > RedHat 8 on another box.  I got the latest version of util-linux which is
> > > 2.11z and compiled that (in case it was a possible bug in mount 2.11y which
> > > comes with redhat).  I'm using lvm 1.0.3-12 that comes with redhat 9.  I
> > > have not tried getting the latest lvm tools.  That's my next step...
> > > 
> > > Anyone else had this problem, or tried doing this?  The reason I wanted to
> > > do this in the first place is so I can test snapshots.  I want to be able to
> > > have a filesystem which is static, that I will then take a snapshot of, then
> > > change things on it, and then use the snapshot to bring it back to it's
> > > original form.  I know there is some work on union filesystems or
> > > translucent filesystems, and such things, but none of it seems mature
> > > enough, so this solution seemed like it might work until I hit this snag.
> > > 
> > > Is anyone else doing this (lvm on loopback)?  Does anyone have it working
> > > correctly?  Am I doing something wrong?  Do I need a different version of
> > > something?
> > > 
> > > Thanks in advance for any help.
> > > 
> > > Kendal.
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> > 
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > 
> > Heinz Mauelshagen                                 Sistina Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > 
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> > 
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
