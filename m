Return-Path: <smcconnell@clark.edu>
Date: Thu, 28 Jun 2001 10:35:21 -0700 (PDT)
From: Sean McConnell <smcconnell@clark.edu>
Subject: Re: [linux-lvm] lvm on alpha
In-Reply-To: <20010628102253.A24904@sistina.com>
Message-ID: <Pine.LNX.4.30.0106281024180.26338-100000@cs.clark.edu>
MIME-Version: 1.0
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
List-Id: <linux-lvm.redhat.com>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

yes i had tried it before, but it does the same thing

# pvcreate -vd /dev/sdb1
<1> lvm_get_iop_version -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_get_iop_version -- AFTER ioctl ret: 0
<1> lvm_get_iop_version -- LEAVING with ret: 10
pvcreate -- locking logical volume manager
<1> lvm_lock -- CALLED
<22> lvm_check_special -- CALLED
<22> lvm_check_special -- LEAVING
<1> lvm_lock -- LEAVING with ret: 0
pvcreate -- checking physical volume name "/dev/sdb1"
<1> pv_check_name -- CALLED with "/dev/sdb1"
<22> lvm_check_chars -- CALLED with name: "/dev/sdb1"
<22> lvm_check_chars -- LEAVING with ret: 0
<22> lvm_check_dev -- CALLED
<22> lvm_check_dev -- LEAVING with ret: 1
<1> pv_check_name -- LEAVING with ret: 0
pvcreate -- getting physical volume size
pvcreate -- checking partition type
pvcreate -- invalid partition type 0x1 for "/dev/sdb1" (must be 0x8e)

<1> lvm_unlock -- CALLED
<1> lvm_unlock -- LEAVING with ret: 0


a little more info:
it's an alpha lx164, i've done both 2.4.5 and 2.4.4 compiled specifically
for the lx with lvm in the kernel, made sure to get all the goods in that
the pages said to, the distro is redhat7, got the updated gcc when it came
out, so that shouldn't be a problem...fdisk didn't have lvm partition type
to choose from in the 2.2.17 i was running before, but now with the 2.4.x
kernels it's there, so i'm guessing the kernel likes it...but i know with
the 2.4 kernel the dev has been shuffled around.  Looking at the pvcreate
source if the partition type is 83 it should give me a specific answer
about it being ext2, but it still only gives 0x1 as the partition type.



On Thu, 28 Jun 2001, Heinz Mauelshagen wrote:

>
> Sean,
>
> your output looks like you run pvcreate on /dev/sdb rather than on /dev/sdb1.
> Did you try the later as well without success?
>
> Regards,
> Heinz    -- The LVM Guy --
>
>
>
> On Wed, Jun 27, 2001 at 10:41:25AM -0700, Sean McConnell wrote:
> >
> > i thought i had sent a prior email with the info, but
> > i guess not, well here it is:
> >
> > # fdisk -l /dev/sdb
> >
> > Disk /dev/sdb: 134 heads, 62 sectors, 1019 cylinders
> > Units = cylinders of 8308 * 512 bytes
> >
> >    Device Boot    Start       End    Blocks   Id  System
> > /dev/sdb1             1      1019   4232895   8e  Linux LVM
> >
> > # pvcreate -vd /dev/sdb
> > <1> lvm_get_iop_version -- CALLED
> > <22> lvm_check_special -- CALLED
> > <22> lvm_check_special -- LEAVING
> > <1> lvm_get_iop_version -- AFTER ioctl ret: 0
> > <1> lvm_get_iop_version -- LEAVING with ret: 10
> > pvcreate -- locking logical volume manager
> > <1> lvm_lock -- CALLED
> > <22> lvm_check_special -- CALLED
> > <22> lvm_check_special -- LEAVING
> > <1> lvm_lock -- LEAVING with ret: 0
> > pvcreate -- checking physical volume name "/dev/sdb"
> > <1> pv_check_name -- CALLED with "/dev/sdb"
> > <22> lvm_check_chars -- CALLED with name: "/dev/sdb"
> > <22> lvm_check_chars -- LEAVING with ret: 0
> > <22> lvm_check_dev -- CALLED
> > <22> lvm_check_dev -- LEAVING with ret: 1
> > <1> pv_check_name -- LEAVING with ret: 0
> > pvcreate -- getting physical volume size
> > pvcreate -- checking partition type
> > pvcreate -- invalid partition type 0x1 for "/dev/sdb" (must be 0x8e)
> >
> > <1> lvm_unlock -- CALLED
> > <1> lvm_unlock -- LEAVING with ret: 0
> >
> >
> > i can set the partition at 83 or 82 and it still says it's fat12
> >
> >
> > On Wed, 27 Jun 2001, Heinz Mauelshagen wrote:
> >
> > >
> > > Sean,
> > >
> > > could you provide your "fdisk -l" output on the disk(s) in question
> > > and the pvcreate output as well?
> > >
> > > Thanks,
> > > Heinz      -- The LVM guy --
> > >
> > > On Tue, Jun 26, 2001 at 03:50:31PM -0700, Sean McConnell wrote:
> > > >
> > > > I may just be blind, but do people have the lvm working
> > > > on alphas.  I compiled and tryied both 2.4.4 and 2.4.5
> > > > on Rh7 on my alpha, but no matter what pvcreate won't
> > > > see the partition type of any partition, just says
> > > > they're 0x1...
> > > > a simple NO will do unless there's a solution.
> > > > thanks
> > > >
> > > > sean mcconnell
> > > >
> > > >
> > > > _______________________________________________
> > > > linux-lvm mailing list
> > > > linux-lvm@sistina.com
> > > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > >
> > > *** Software bugs are stupid.
> > >     Nevertheless it needs not so stupid people to solve them ***
> > >
> > > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > >
> > > Heinz Mauelshagen                                 Sistina Software Inc.
> > > Senior Consultant/Developer                       Am Sonnenhang 11
> > >                                                   56242 Marienrachdorf
> > >                                                   Germany
> > > Mauelshagen@Sistina.com                           +49 2626 141200
> > >                                                        FAX 924446
> > > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > >
> >
> > --
> > Sean McConnell, smcconnell@clark.edu
> > Unix System Administrator
> > Computer Technology/Science
> > Clark College
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
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>

-- 
Sean McConnell, smcconnell@clark.edu
Unix System Administrator
Computer Technology/Science
Clark College
