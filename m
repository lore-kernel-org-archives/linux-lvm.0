Message-Id: <3C6312C9.BFE99F9F@oracle.com>
From: David Brower <David.Brower@oracle.com>
MIME-Version: 1.0
References: <E16YxFv-0006mX-00@hermes.sistina.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: linux-lvm digest, Vol 1 #513 - 12 msgs
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
Date: Thu Feb  7 17:55:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

OK w/me.   

-dB

linux-lvm-request@sistina.com wrote:
> 
> Send linux-lvm mailing list submissions to
>         linux-lvm@sistina.com
> 
> To subscribe or unsubscribe via the World Wide Web, visit
>         http://lists.sistina.com/mailman/listinfo/linux-lvm
> or, via email, send a message with subject or body 'help' to
>         linux-lvm-request@sistina.com
> 
> You can reach the person managing the list at
>         linux-lvm-admin@sistina.com
> 
> When replying, please edit your Subject line so it is more specific
> than "Re: Contents of linux-lvm digest..."
> 
> Today's Topics:
> 
>    1. Re: Backup costs (was: LVM reimplementationre) (Scott Laird)
>    2. Re: File Corruption on LVM LV's in same VG (Erik Zweers)
>    3. Logical Volume disappears (Wolfe, Gordon W)
>    4. Re: Logical Volume disappears (Andreas Dilger)
>    5. Re: Logical Volume disappears (Heinz J . Mauelshagen)
>    6. Re: Logical Volume disappears (Heinz J . Mauelshagen)
>    7. Re: Logical Volume disappears ('Andreas Dilger')
>    8. using 160GB IDE drives under linux with LVM. (Terje Kvernes)
>    9. Re: using 160GB IDE drives under linux with LVM. (Chad C. Walstrom)
>   10. Re: using 160GB IDE drives under linux with LVM. (James Hawtin)
>   11. Re: using 160GB IDE drives under linux with LVM. (Andreas Dilger)
>   12. RE: using 160GB IDE drives under linux with LVM. (John Moser)
> 
> --__--__--
> 
> Message: 1
> Date: Thu, 7 Feb 2002 08:23:42 -0800 (PST)
> From: Scott Laird <laird@internap.com>
> To: <linux-lvm@sistina.com>
> Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
> Reply-To: linux-lvm@sistina.com
> 
> I just bought 10TB for $4.5/GB.  That's 5 4U systems, each with 16 160GB
> drives and one GigE interface.  A couple similar systems in my lab (14
> 100GB drives) benchmark at 110 MB/sec reading, 85 MB/sec writing with
> software RAID5.  With NFS over GigE, I can get 50 MB/sec sustained before
> PCI bus contention starts to be a problem.
> 
> You can almost certainly spend less money if you try hard enough, but I
> wanted systems that wouldn't need 24x7 handholding :-).
> 
> Scott
> 
> On Thu, 7 Feb 2002, Richard Barbara wrote:
> >
> > Does anyone have an opinion as to what the cost of storage should be (say
> > in $ /Gbyte) to enable wider use of 'direct to disk' backup?
> > Would tape emulation help in this issue?
> >
> > ----------
> > > From: Jeff Layton <laytonjb@bellsouth.net>
> > > To: linux-lvm@sistina.com
> > > Subject: Re: [linux-lvm] Backup costs (was: LVM reimplementationre)
> > > Date: Thursday, 7 February 2002 13:04
> > >
> > > James Mello wrote:
> > >
> > > > >    Large amounts of data brings in even more issues. How do
> > > > > you stream Petabytes of data to tape in a resonable of time?
> > > > > Unless you spend HUGE amounts of money to buy multiple
> > > > > silos to handle slices of the data and put in a fantastic network
> > > > > to handle the traffic, you can't backup in a reasonable amount
> > > > > of time. In this case, disk is your only choice. The data size
> > > > > break point between disk and tape depends on lots of things,
> > > > > but that point is moving downward all the time (perhaps in
> > > > > the Terabyte range).
> > > >
> > > > Petabytes are another matter entirely. If you must absolutely have that
> > > > much data backed up, you start looking at more exotic solutions.
> > Backing
> > > > up solely to disk is *way* to expensive, hence the wonderful, but of
> > > > poorly implemented idea of HSM.... Disk and tape :)
> > >
> > > Yes, HSM has never panned out the way it was supposed to.
> > > However, try backing up Petabytes with tape in a reasonable
> > > amount of time. While I've never configure such a system,
> > > the numbers from systems I have seen indicate that disk is
> > > much cheaper than tape (even if tape is a feasible solution
> > > because of speed).
> > >
> > > Jeff
> > >
> > >
> > > >
> > > >         -- Cheers
> > > >         -- James
> > > >
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > >
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> 
> --__--__--
> 
> Message: 2
> Subject: Re: [linux-lvm] File Corruption on LVM LV's in same VG
> From: Erik Zweers <zweers@execulink.com>
> To: linux-lvm@sistina.com
> Date: 07 Feb 2002 12:39:00 -0500
> Reply-To: linux-lvm@sistina.com
> 
> There are no error messages on the console.  This box does do a fair
> amount of work and has no other issues.  The box has a second VG
> consisting of SCSI drives.  If there were memory problems I would expect
> this VG to contain errors too.
> 
> I did a MD5sum on the physical device twice and it returned the same sum
> (while doing this on a file in a filesystem under LVM returns different
> values each time).
> 
> Are there any good indepth tools that could analyze the structure of the
> volume?  Everything I've seen sofar seems to just offer a summary.  The
> box still has not been rebooted as I want to understand the problem
> first.  I'm looking at using LVM for a production server and need to
> find out whats wrong to go ahead with that project.
> 
> On Tue, 2002-02-05 at 13:41, Andreas Dilger wrote:
> > On Feb 05, 2002  13:11 -0500, Erik Zweers wrote:
> > > The system was repaired and believed to be running properly, until
> > > yesterday where we discovered that some of our ISO's were wrong,
> > > consistently wrong in inconsistent locations.  I've pasted in a record
> > > of the symptoms.  If anyone has any advice on what else to diagnose (if
> > > your intrested in what is wrong) or how to repair It would be greatly
> > > appreciated.
> >
> > I would suspect RAM or IDE problems.  If LVM is broken, it will stay
> > broken, and if it is working it will stay working in the absence of
> > other problems.  The failure symptoms would not look like this.
> >
> > > I have not rebooted the machine yet, wanting to be sure that any
> > > diagnoses that can be done is done.
> >
> > Any output in dmesg?
> >
> > > [root@ike iso]# cmp -l enigma-i386-disc1.iso ~carl/enigma-i386-disc1.iso
> > > 2549832  77  67
> > > 13431928 177 167
> > > 14489440 376 366
> > > 27451404 177 173
> > > 33149724 376 336
> > > 86298228 177 167
> > > 116907524 372 332
> > > 119130964  77  67
> > > 121124171 376 356
> > >
> > >
> > > [root@ike iso]# cmp -l enigma-i386-disc1.iso ~carl/enigma-i386-disc1.iso
> > > 2549832  77  67
> > > 11455071 177 167
> > > 13431928 177 167
> > > 18043044 277 273
> > > 24780964 277 273
> > > 86298228 177 167
> > > 94133044 370 330
> > > 106966431 177 167
> >
> > Looks exclusively like single-bit errors.  Either RAM or IDE cable/driver.
> > If it was RAM you would also have oopses or errors elsewhere.  Try turning
> > off UDMA on the drive, update the IDE driver, new cable, etc.
> >
> > > | wc -l     62
> > > [root@ike iso]# ls -l enigma-i386-disc1.iso
> > > -rw-r--r--    1 root     root     677961728 Feb  4 20:31
> > > enigma-i386-disc1.iso
> > >
> > > [root@ike iso]# fsck -n /dev/ide/iso
> > > Parallelizing fsck version 1.23 (15-Aug-2001)
> > > e2fsck 1.23, 15-Aug-2001 for EXT2 FS 0.5b, 95/08/09
> > > Warning!  /dev/ide/iso is mounted.
> > > /dev/ide/iso: clean, 24/1281696 files, 1351397/2560000 blocks
> >
> > Given that you only have single-bit error rates in the order of 1/10^7,
> > the chance of such an error happening in the ext2 metadata is unlikely.
> >
> > Cheers, Andreas
> > --
> > Andreas Dilger
> > http://sourceforge.net/projects/ext2resize/
> > http://www-mddsp.enel.ucalgary.ca/People/adilger/
> >
> >
> 
> --__--__--
> 
> Message: 3
> From: "Wolfe, Gordon W" <gordon.w.wolfe@boeing.com>
> To: "IBM-linux-lvm (E-mail)" <linux-lvm@sistina.com>
> Date: Thu, 7 Feb 2002 10:20:28 -0800
> Subject: [linux-lvm] Logical Volume disappears
> Reply-To: linux-lvm@sistina.com
> 
> > I'm having a very strange problem.  Perhaps you guys can help me.
> >
> >
> > I needed to make a public repository for the contents of five CD's, so I
> > set up a Linux server using SuSE 2.2.16 on S/390 under z/VM.  For five
> > CD's, I figured two volumes ought to hold the contents.  An rpm query
> > shows lvm-0.8-157, which is what came with the SuSe distribution.
> >
> > I added two 3390-3 full-pack volumes to Linux and did a dasdfmt on them.
> > I went into YAST and created a logical volume group "vgcd" and a logical
> > volume "lvcd" using these two volumes.
> > I did a mke2fs on the logical volume /dev/vgcd/lvcd
> > I was able to mount /dev/vgcd/lvcd as /mnt and was able to do a "df' and
> > see them and copy some files to them
> >
> > So far, so good.  Everything looking just fine.
> >
> > Now, the wierd part:
> > I manually umounted /dev/vgcd/lvcd, shut down and rebooted Linux.
> > After the reboot, the device /dev/vgcd/lvcd does not exist.
> > vgscan says "vgscan -- no volume groups found"
> > pvscan says "pvscan -- no valid physical volumes found"
> > vgck says "vgck -- no volume groups found"
> > pvdisplay /dev/vgcd/lvcd says "invalid physical volume name
> > "/dev/vgcd/lvcd"
> > ls /dev/lvcd says "No such file or directory"
> > If I go back into YAST to do it all over, it says I can't create volume
> > group "vgcd" because it already exists.  But it doesn't show up in the
> > list of volume groups.
> >
> >
> > Can any of you point me in the right direction to see what the problem is?
> >
> >
> "Never trust any computer you can lift."
> Gordon Wolfe, Ph.D. (425)865-5940
> VM Technical Services, The Boeing Company
> 
> --__--__--
> 
> Message: 4
> Date: Thu, 7 Feb 2002 11:58:36 -0700
> From: Andreas Dilger <adilger@turbolabs.com>
> To: "Wolfe, Gordon W" <gordon.w.wolfe@boeing.com>
> Cc: "IBM-linux-lvm (E-mail)" <linux-lvm@sistina.com>
> Subject: Re: [linux-lvm] Logical Volume disappears
> Reply-To: linux-lvm@sistina.com
> 
> On Feb 07, 2002  10:20 -0800, Wolfe, Gordon W wrote:
> > I needed to make a public repository for the contents of five CD's, so I
> > set up a Linux server using SuSE 2.2.16 on S/390 under z/VM.  For five
> > CD's, I figured two volumes ought to hold the contents.  An rpm query
> > shows lvm-0.8-157, which is what came with the SuSe distribution.
> 
> OK, well lvm-0.8 is _very_ old and undoubtably has a _huge_ number of
> bugs.  You should be able to use the recent LVM version on 2.2 kernels
> still.
> 
> > > I manually umounted /dev/vgcd/lvcd, shut down and rebooted Linux.
> > After the reboot, the device /dev/vgcd/lvcd does not exist.
> > vgscan says "vgscan -- no volume groups found"
> > pvscan says "pvscan -- no valid physical volumes found"
> 
> You probably need to add the names of the DASD devices to the list
> that LVM searches.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
> --__--__--
> 
> Message: 5
> Date: Thu, 7 Feb 2002 20:03:16 +0100
> From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Logical Volume disappears
> Reply-To: linux-lvm@sistina.com
> 
> In case /dev/vgcd/ still exists, "rm -rf" it and retry.
> 
> On Thu, Feb 07, 2002 at 10:20:28AM -0800, Wolfe, Gordon W wrote:
> > > I'm having a very strange problem.  Perhaps you guys can help me.
> > >
> > >
> > > I needed to make a public repository for the contents of five CD's, so I
> > > set up a Linux server using SuSE 2.2.16 on S/390 under z/VM.  For five
> > > CD's, I figured two volumes ought to hold the contents.  An rpm query
> > > shows lvm-0.8-157, which is what came with the SuSe distribution.
> > >
> > > I added two 3390-3 full-pack volumes to Linux and did a dasdfmt on them.
> > > I went into YAST and created a logical volume group "vgcd" and a logical
> > > volume "lvcd" using these two volumes.
> > > I did a mke2fs on the logical volume /dev/vgcd/lvcd
> > > I was able to mount /dev/vgcd/lvcd as /mnt and was able to do a "df' and
> > > see them and copy some files to them
> > >
> > > So far, so good.  Everything looking just fine.
> > >
> > > Now, the wierd part:
> > > I manually umounted /dev/vgcd/lvcd, shut down and rebooted Linux.
> > > After the reboot, the device /dev/vgcd/lvcd does not exist.
> > > vgscan says "vgscan -- no volume groups found"
> > > pvscan says "pvscan -- no valid physical volumes found"
> > > vgck says "vgck -- no volume groups found"
> > > pvdisplay /dev/vgcd/lvcd says "invalid physical volume name
> > > "/dev/vgcd/lvcd"
> > > ls /dev/lvcd says "No such file or directory"
> > > If I go back into YAST to do it all over, it says I can't create volume
> > > group "vgcd" because it already exists.  But it doesn't show up in the
> > > list of volume groups.
> > >
> > >
> > > Can any of you point me in the right direction to see what the problem is?
> > >
> > >
> > "Never trust any computer you can lift."
> > Gordon Wolfe, Ph.D. (425)865-5940
> > VM Technical Services, The Boeing Company
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> --
> 
> Regards,
> Heinz    -- The LVM Guy --
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
> --__--__--
> 
> Message: 6
> Date: Thu, 7 Feb 2002 20:04:19 +0100
> From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Logical Volume disappears
> Reply-To: linux-lvm@sistina.com
> 
> On Thu, Feb 07, 2002 at 11:58:36AM -0700, Andreas Dilger wrote:
> > On Feb 07, 2002  10:20 -0800, Wolfe, Gordon W wrote:
> > > I needed to make a public repository for the contents of five CD's, so I
> > > set up a Linux server using SuSE 2.2.16 on S/390 under z/VM.  For five
> > > CD's, I figured two volumes ought to hold the contents.  An rpm query
> > > shows lvm-0.8-157, which is what came with the SuSe distribution.
> >
> > OK, well lvm-0.8 is _very_ old and undoubtably has a _huge_ number of
> > bugs.  You should be able to use the recent LVM version on 2.2 kernels
> > still.
> 
> That's true, but this should at least work.
> 
> >
> > > > I manually umounted /dev/vgcd/lvcd, shut down and rebooted Linux.
> > > After the reboot, the device /dev/vgcd/lvcd does not exist.
> > > vgscan says "vgscan -- no volume groups found"
> > > pvscan says "pvscan -- no valid physical volumes found"
> >
> > You probably need to add the names of the DASD devices to the list
> > that LVM searches.
> 
> SuSE's S/390 Linux supports them.
> 
> >
> > Cheers, Andreas
> > --
> > Andreas Dilger
> > http://sourceforge.net/projects/ext2resize/
> > http://www-mddsp.enel.ucalgary.ca/People/adilger/
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> --
> 
> Regards,
> Heinz    -- The LVM Guy --
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
> --__--__--
> 
> Message: 7
> Date: Thu, 7 Feb 2002 14:28:40 -0700
> From: "'Andreas Dilger'" <adilger@turbolabs.com>
> To: "Wolfe, Gordon W" <gordon.w.wolfe@boeing.com>
> Cc: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] Logical Volume disappears
> Reply-To: linux-lvm@sistina.com
> 
> On Feb 07, 2002  12:59 -0800, Wolfe, Gordon W wrote:
> > That's the whole problem.  The CD's I need to have on line are the new SuSE
> > Linux SLES7 which has the new LVM on it.  I can't install it until I get the
> > data on the CDs mounted where I can use it, which means I need LVM first.
> 
> Well, rather than configring your DASD to be logical volumes, then copying
> CD images there, you could just create 4 minidisks, copy the CD images into
> the raw devices, and mount them directly.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
> --__--__--
> 
> Message: 8
> To: linux-lvm@sistina.com
> Organization: the friends of LVM
> From: Terje Kvernes <terjekv@math.uio.no>
> Date: 07 Feb 2002 22:33:46 +0100
> Subject: [linux-lvm] using 160GB IDE drives under linux with LVM.
> Reply-To: linux-lvm@sistina.com
> 
>   first, I'm sorry for asking here, but I'm close enough on topic (I
>   hope :) and I know there are bright heads who deal with linux at
>   this level out there.  I've also looked through google, and at the
>   kernel IDE-documentation.  and the little thing that lingers is
>   128GiB.
> 
>   fdisk is only able to address 128GiB, that's rather obvious.  if I
>   make one partition, it's about that size, and if I make two
>   partitions, the first one 100GiB, the last one will only be about
>   28GiB.  if I pvcreate the device itself it helps a little, but not
>   much.  /proc/lvm/global then returns the size as 134152192KB.
> 
>   now, I've added SCSI-devices that where > 500GiB with ease into LVM,
>   but here I stumble.  is there some easy solution out there that I've
>   missed?
> 
>   the box currently runs vanilla 2.4.16, only patched with LVM-1.0.1
>   from 26/11.  patches or anything people want to toss at this will be
>   highly appreciated.  we have two of these beasts from Maxtor, and
>   stand to loose about 60GiB of space, which isn't all that neat.
> 
> --
> Terje
> 
> --__--__--
> 
> Message: 9
> Date: Thu, 7 Feb 2002 16:08:32 -0600
> From: "Chad C. Walstrom" <chewie@wookimus.net>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
> Reply-To: linux-lvm@sistina.com
> 
> --sm4nu43k4a2Rpi4c
> Content-Type: text/plain; charset=unknown-8bit
> Content-Disposition: inline
> Content-Transfer-Encoding: quoted-printable
> 
> On Thu, Feb 07, 2002 at 10:33:46PM +0100, Terje Kvernes wrote:
> >   fdisk is only able to address 128GiB, that's rather obvious.  if I
> >   make one partition,=20
> 
> Why make a partition at all?  Why not just make a physical volume out of
> the whole disk?
> 
> NAME
>        pvcreate - initialize a disk or partition for use by LVM
> 
> SYNOPSIS
>        pvcreate  [-d|--debug] [-f[f]|--force [--force]] [-y|--yes] [-h|--he=
> lp]
>        [-v|--verbose] [-V|--version] PhysicalVolume [PhysicalVolume...]
> 
> DESCRIPTION
>        pvcreate initializes PhysicalVolume for later use by the Logical Vol=
> ume
>        Manager  (LVM).   Each  PhysicalVolume  can  be a disk partition, wh=
> ole
>        disk, meta device, or loopback file.  For DOS disk partitions, the p=
> ar=AD
>        tition  id  must be set to 0x8e using fdisk(8), cfdisk(8), or a equi=
> va=AD
>        lent.  For whole disk devices only the partition table must be  eras=
> ed,
>        which will effectively destroy all data on that disk.  This can be d=
> one
>        by zeroing the first sector with:
> 
>        dd if=3D/dev/zero of=3DPhysicalVolume bs=3D512 count=3D1
> 
>        Continue with vgcreate(8) to create a new volume group on  PhysicalV=
> ol=AD
>        ume,  or vgextend(8) to add PhysicalVolume to an existing volume gro=
> up.
> 
> --=20
> Chad Walstrom <chewie@wookimus.net>                 | a.k.a. ^chewie
> http://www.wookimus.net/                            | s.k.a. gunnarr
> Get my public key, ICQ#, etc. $(mailx -s 'get info' chewie@wookimus.net)
> 
> --sm4nu43k4a2Rpi4c
> Content-Type: application/pgp-signature
> Content-Disposition: inline
> 
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.0.6 (GNU/Linux)
> Comment: For info see http://www.gnupg.org
> 
> iD8DBQE8YvrgDMcLGCBsWv0RAncZAJ9fPwWiARodVV1zXxTT0DkaAFBaBgCfZnOq
> E0Cce/2D6Dpk+QpPbKUh/Zw=
> =/9v7
> -----END PGP SIGNATURE-----
> 
> --sm4nu43k4a2Rpi4c--
> 
> --__--__--
> 
> Message: 10
> Date: Thu, 7 Feb 2002 22:13:38 +0000 (GMT)
> From: James Hawtin <oolon@ankh.org>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
> Reply-To: linux-lvm@sistina.com
> 
> On 7 Feb 2002, Terje Kvernes wrote:
> 
> >   the box currently runs vanilla 2.4.16, only patched with LVM-1.0.1
> >   from 26/11.  patches or anything people want to toss at this will be
> >   highly appreciated.  we have two of these beasts from Maxtor, and
> >   stand to loose about 60GiB of space, which isn't all that neat.
> >
> 
> Whats your Extent size? if its the default 4MB that allows you to address
> 256GB in that volume group.... Please do a vgdisplay -v
> 
> You only use that disk for linux? do you need it to be partitioned at all?
> Do you want the whole of the disk to be available under LVM?  You could do
> your pvcreate on the whole device that would get arround partition table
> addressing problems.
> 
> James
> 
> --__--__--
> 
> Message: 11
> Date: Thu, 7 Feb 2002 15:18:11 -0700
> From: Andreas Dilger <adilger@turbolabs.com>
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
> Reply-To: linux-lvm@sistina.com
> 
> On Feb 07, 2002  22:33 +0100, Terje Kvernes wrote:
> >   [ Re: IDE 128GB disk limits ]
> >
> >   now, I've added SCSI-devices that where > 500GiB with ease into LVM,
> >   but here I stumble.  is there some easy solution out there that I've
> >   missed?
> >
> >   the box currently runs vanilla 2.4.16, only patched with LVM-1.0.1
> >   from 26/11.  patches or anything people want to toss at this will be
> >   highly appreciated.  we have two of these beasts from Maxtor, and
> >   stand to loose about 60GiB of space, which isn't all that neat.
> 
> This is a kernel IDE driver limit.  You need to patch with Andre Hedrik's
> IDE patches to support IDE devices over this size.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
> --__--__--
> 
> Message: 12
> From: "John Moser" <jmoser@erc.wisc.edu>
> To: <linux-lvm@sistina.com>
> Subject: RE: [linux-lvm] using 160GB IDE drives under linux with LVM.
> Date: Thu, 7 Feb 2002 16:45:03 -0600
> Reply-To: linux-lvm@sistina.com
> 
> Is this specific to 2.4.X kernels?  I'm running 2.5.0, and I just noticed
> that the 160 gig drives I was using are also partitioned at only 128Gigs.
> 
> -John Moser
> 
> -----Original Message-----
> From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> Behalf Of Andreas Dilger
> Sent: Thursday, February 07, 2002 4:18 PM
> To: linux-lvm@sistina.com
> Subject: Re: [linux-lvm] using 160GB IDE drives under linux with LVM.
> 
> On Feb 07, 2002  22:33 +0100, Terje Kvernes wrote:
> >   [ Re: IDE 128GB disk limits ]
> >
> >   now, I've added SCSI-devices that where > 500GiB with ease into LVM,
> >   but here I stumble.  is there some easy solution out there that I've
> >   missed?
> >
> >   the box currently runs vanilla 2.4.16, only patched with LVM-1.0.1
> >   from 26/11.  patches or anything people want to toss at this will be
> >   highly appreciated.  we have two of these beasts from Maxtor, and
> >   stand to loose about 60GiB of space, which isn't all that neat.
> 
> This is a kernel IDE driver limit.  You need to patch with Andre Hedrik's
> IDE patches to support IDE devices over this size.
> 
> Cheers, Andreas
> --
> Andreas Dilger
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> 
> --__--__--
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> End of linux-lvm Digest
