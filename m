Message-ID: <3C064B55.A08A71C6@berbee.com>
From: Scott P <pichelma@berbee.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM limit on PE's/size?
References: <3C03CEB1.E5D5D447@berbee.com> <20011127112556.D730@lynx.no> <3C03F0C7.DB486DAD@berbee.com> <20011129151608.E1283@sistina.com>
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
Date: Thu Nov 29 08:52:02 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

Heinz,

Thanks for clarifying further, I appreciate the extra info!

-Scott


"Heinz J . Mauelshagen" wrote:

> Scott,
>
> with your PE size of 32MB, you can achieve to create LVs up to 2TB in size
> (actually it is a little bit less than 2TB, because every LV can have up
> to 64K - 2 extents). You can have multiple 2TB LVs this way, because your
> VG capacity is in no means limited to 2TB! In theory you could have 128 SCSI
> IDs with 8 LUNs each providing up to 1 or 2TB in 1 VG.
>
> Because your PVs are smaller than 1TB in size, you will not suffer from
> the block adrdessing sign bit danger Andreas was explaining in his email.
>
> In general you should plan for the largest possible Logical Volume size
> during the lifetime of a Volume Group and set the Physical Extent size
> (vgcreate -s) acordingly. Even though Linux does not support more than 2TB
> per block device today, it will be in the future and you won't suffer from
> the LVM1 constraint ITR.
>
> Regards,
> Heinz    -- The LVM Guy --
>
> On Tue, Nov 27, 2001 at 02:00:07PM -0600, Scott P wrote:
> > Andreas,
> >
> > Thanks so much for the insight!
> >
> > Here is some ouput, it looks like we might be ok?
> > Please comment, if possible, thanks...
> >
> > -Scott
> >
> > [root@ptb3 pichelma]# /sbin/pvdisplay /dev/sdb1
> > --- Physical volume ---
> > PV Name               /dev/sdb1
> > VG Name               exp300_2
> > PV Size               440.71 GB / NOT usable 26.75 MB [LVM: 176 KB]
> > PV#                   2
> > PV Status             available
> > Allocatable           yes (but full)
> > Cur LV                1
> > PE Size (KByte)       32768
> > Total PE              14102
> > Free PE               0
> > Allocated PE          14102
> > PV UUID               1gKwp2-dotn-0WJU-5FwZ-uScI-OyMH-SHVw5F
> >
> >
> > [root@ptb3 pichelma]# /sbin/pvdisplay /dev/sdc1
> > --- Physical volume ---
> > PV Name               /dev/sdc1
> > VG Name               exp300_2
> > PV Size               440.71 GB / NOT usable 26.75 MB [LVM: 176 KB]
> > PV#                   1
> > PV Status             available
> > Allocatable           yes (but full)
> > Cur LV                1
> > PE Size (KByte)       32768
> > Total PE              14102
> > Free PE               0
> > Allocated PE          14102
> > PV UUID               ciUWIf-i9OO-okne-Fs6R-fjU1-NPpr-Ml4p8L
> >
> >
> > [root@ptb3 pichelma]# /sbin/pvdata -P /dev/sdb1
> > --- Physical volume ---
> > PV Name               /dev/sdb1
> > VG Name               exp300_2
> > PV Size               440.71 GB / NOT usable 26.75 MB [LVM: 176 KB]
> > PV#                   2
> > PV Status             available
> > Allocatable           yes (but full)
> > Cur LV                1
> > PE Size (KByte)       32768
> > Total PE              14102
> > Free PE               0
> > Allocated PE          14102
> > PV UUID               1gKwp2-dotn-0WJU-5FwZ-uScI-OyMH-SHVw5F
> >
> >
> > [root@ptb3 pichelma]# /sbin/pvdata -P /dev/sdc1
> > --- Physical volume ---
> > PV Name               /dev/sdc1
> > VG Name               exp300_2
> > PV Size               440.71 GB / NOT usable 26.75 MB [LVM: 176 KB]
> > PV#                   1
> > PV Status             available
> > Allocatable           yes (but full)
> > Cur LV                1
> > PE Size (KByte)       32768
> > Total PE              14102
> > Free PE               0
> > Allocated PE          14102
> > PV UUID               ciUWIf-i9OO-okne-Fs6R-fjU1-NPpr-Ml4p8L
> >
> >
> >
> > Andreas Dilger wrote:
> >
> > > On Nov 27, 2001  11:34 -0600, Scott P wrote:
> > > > We are planning to add a 3 rd EXP300 array to out current server w/ 2
> > > > EXP300's in place already!  We WILL surpass the 1 TB size, if possible?
> > >
> > > Depends if the driver does 32-bit block numbers with signed or unsigned
> > > values.  The absolute maximum supported by 2.4 kernels is 2TB devices.
> > > I don't know if 2.2 will support > 1TB devices, but it is possible.
> > >
> > > > Linux ptb3 2.2.19 #2 SMP Tue Jul 24 11:53:29 CDT 2001 i686 unknown
> > > >
> > > > We are using:
> > > > lvm_0.9.1_beta7
> > > > reiserfsprogs-3.x.0j
> > >
> > > Get newer LVM tools, like 1.0.1, because the old ones have lots more bugs.
> > > Beta 7 has the PE alignment bug, so you should upgrade the tools even if
> > > you can't upgrade the kernel.
> > >
> > > > Here is the current filesystem and size:
> > > >
> > > > /dev/exp300_2/exp300_lv2 924160464 891307744  32852720      97% /files1
> > >
> > > > Q: Why are my logical volumes limited to 256 GB in size?
> > > > A: This is NO absolute limit but it depends on the physical extent size
> > > > you configured at volume group creation time.
> > >
> > > Check what "pvdata -P /dev/whatever" tells you about the PE size.  If
> > > it is 16386kB, then you are limited to 1TB in size.  If it is larger
> > > than that, you _may_ be able to go past 1TB, but you may not, depending
> > > on whether your drivers and kernel work properly or not.
> > >
> > > Cheers, Andreas
> > > --
> > > Andreas Dilger
> > > http://sourceforge.net/projects/ext2resize/
> > > http://www-mddsp.enel.ucalgary.ca/People/adilger/
> > >
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> >
> >
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
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
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
