Message-ID: <39D7C0AA.764B1447@attglobal.net>
Date: Sun, 01 Oct 2000 18:54:34 -0400
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] need help to recover my system
References: <39D6A94C.3C40B982@attglobal.net> <20001001100151.A3571@srv.t-online.de> <39D75B83.1555FED5@attglobal.net> <20001001181024.A5012@srv.t-online.de>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mauelshagen@Sistina.com
Cc: linux-lvm@msede.com

"Heinz J. Mauelshagen" wrote:
> 
> On Sun, Oct 01, 2000 at 11:42:59AM -0400, Les Hazelton wrote:
> > My kernel had LVM support compiled in, not as a module.  I had created an initrd but
> > may have not done that correctly.  I think the real problem was that the grub loader
> > was installed on the root "/" partition and not the "/boot" partition.  I had booted
> > the new configuration several times without problem until I deleted the original "/"
> > partition.  That's when I realized where the grub loader was installed.
> >
> > When I use linux fdisk I see the entry for hdc5 as Linux LVM (85) and if I do "cat
> > /proc/partitions"  there is an entry for /dev/hdc5.
> >
> > If, while running my test system with kernel 2.4.0, I run the pvcreate command for
> > /dev/hdc5 will that destroy the existing PV, VG, LVM content that is currently their?
> 
> Yes. You don't want to do that!

I didn't.  It just looked too dangerous 

> But it only allows you to do that using the "-ff" option of the
> pvcreate command. Without that it complains _because_ the physical volume
> still belongs to a volume group.
> 
> Could you supply the "pvscan -d" and the "vgscan -d" output from your test
> system to enable further investigation on why LVM doesn't find your volume
> group any longer?

I took two steps here. First, I thought some of the problems were
related to the 2.4.0 kernel so I backed it off and added an
lvm-2.2.16/17 patch I found referenced in the lvm mail archive. This
patch applied without error to the 2.2.17 kernel distributed on the
Mandrake 7.2b image. I configured it with "y" for lvm support and PROC
lvm data.

When I booted the new 2.2.17 kernel I ran "pvscan -D" & "vgscan -D".  I
can now do vgdisplay and lvmdisplay if I use the -D parameter.  I just
can't activate the volume group.  When I try, this is the result.

[root@farpt1 /root]# vgchange -va y
vgchange -- locking logical volume manager
vgchange -- finding all volume group(s)
vgchange -- checking volume group name "vg01"
vgchange -- checking existence of volume group "vg01"
vgchange -- reading volume group data for "vg01" from lvmtab
vgchange -- checking volume group consistency  of "vg01"
vgchange -- checking if all physical volumes of volume group "vg01" are
available
vgchange -- creating VGDA for "vg01" in kernel
vgchange -- can't open logical volume manager to activate volume group
"vg01"

vgchange -- unlocking logical volume manager
[root@farpt1 /root]# 

Not sure what I am missing here because the LVM support is linked with
the kernel so there is no module to load.

Les Hazelton

> Heinz
> 
> >
> > "Heinz J. Mauelshagen" wrote:
> >
> > > On Sat, Sep 30, 2000 at 11:02:36PM -0400, Les Hazelton wrote:
> > > > I had a Mandrake 7.1 system running the 2.2.17 kernel with LVM and
> > > > reiserfs patches applied.  I have a 15Gb partition on /dev/hdc5 which
> > > > was one large PV. It supports one VG which has the logical volumes for
> > > > /usr, /home, /var, etc... Everything except /boot and / which were on
> > > > the hda drive as plain ext2 file systems.
> > > >
> > > > I decided to move the root partition "/" to a logical volume on hdc5 and
> > > > all was going well until I deleted it from the ext2 system on hda6.
> > >
> > > How did you do that?
> > > Did you create an inital ram disk to load the lvm driver and activate
> > > the volume group?
> > > Otherwise you can't access your volume group(s) anyway from the /boot
> > > booted kernel.
> > >
> > > > So
> > > > now I have a perfectly good Linux system contained on the hdc5 PV which
> > > > I can't access.
> > > >
> > > > I have test system (Mandrake 7.2-b) on the hda drive.  It has the
> > > > 2.4.0-0.22 kernel distributed my Mandrake and I have been attempting to
> > > > recover using that system.  The problem is I keep getting these errors:
> > > >
> > > > ------------------------------------------------------------------------------
> > > > pvscan -- reading all physical volumes (this may take a while...)
> > > > pvscan -- ERROR "pv_read_all_pv(): lvm_dir_cache" reading physical
> > > > volumes
> > >
> > > This error means, that no (compatible) entries could be found either
> > > in /proc/partitions or, if /proc/partitions doesn't exist, in /dev.
> > >
> > > Please check that these sources are valid on your Mandrake 7.2-b test system
> > > and retry.
> > >
> > > >
> > > > [root@farpt1 /root]# vgscan -v
> > > > vgscan -- removing "/etc/lvmtab" and "/etc/lvmtab.d"
> > > > vgscan -- reading all physical volumes (this may take a while...)
> > > > vgscan -- no volume groups found
> > > > -------------------------------------------------------------------------------
> > > >
> > > > I was going to try a pvcreate for /dev/hdc5  but thought it would wipe
> > > > the partition clean and I don't want to start over if there is *any*
> > > > hope of recovering it.
> > > >
> > > > Please, if anyone knows a way to recover this volume,  I would be
> > > > extremely grateful for the help.
> > > >
> > > > Les Hazelton
> > >
> > > --
> > >
> 
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> 
> Heinz Mauelshagen                                 Sistina Software Inc.
> Senior Consultant/Developer                       Bartningstr. 12
>                                                   64289 Darmstadt
>                                                   Germany
> Mauelshagen@Sistina.com                           +49 6151 7103 86
>                                                        FAX 7103 96
> =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-

-- 
Les Hazelton
---------------------------------------------
Good journey, longevity and prosperity to all
