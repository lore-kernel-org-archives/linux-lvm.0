Return-Path: <root@srv.sistina.com>
Date: Fri, 1 Jun 2001 14:08:05 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] How do I find out if my logic volume is striped or not?
Message-ID: <20010601140805.B9156@sistina.com>
References: <20010530191028.9476.MRLIST@activestate.com> <20010531143457.A4310@sistina.com> <20010531100027.EC5A.MRLIST@activestate.com>
Mime-Version: 1.0
In-Reply-To: <20010531100027.EC5A.MRLIST@activestate.com>; from mrlist@ActiveState.com on Thu, May 31, 2001 at 10:08:06AM -0700
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Thu, May 31, 2001 at 10:08:06AM -0700, Eric Wang wrote:
> I am trying to achive the best performance
> here is my situation

Eric,
in your IDE case you could gain performance setting up a striped LV
on hda *or* hdb and hdc.
IDE devices sitting on the same adaptor suffer from io constraints
and therefore don't give you parallel thrughput.

> 
> #vgdisplay -v
> --- Volume group ---
> VG Name               TITAN
> VG Access             read/write
> VG Status             available/resizable
> VG #                  0
> MAX LV                256
> Cur LV                1
> Open LV               0
> MAX LV Size           255.99 GB
> Max PV                256
> Cur PV                3
> Act PV                3
> VG Size               98.65 GB
> PE Size               4 MB
> Total PE              25255
> Alloc PE / Size       19482 / 76.1 GB
> Free  PE / Size       5773 / 22.55 GB
> VG UUID               c2I7Km-QuZy-O3GK-nUXL-WtAC-VHRO-r75ivY
> 
> --- Logical volume ---
> LV Name                /dev/TITAN/home
> VG Name                TITAN
> LV Write Access        read/write
> LV Status              available
> LV #                   1
> # open                 0
> LV Size                76.1 GB
> Current LE             19482
> Allocated LE           19482
> Stripes                2
> Stripe size (KByte)    4
> Allocation             next free
> Read ahead sectors     120
> Block device           58:0
> 
> 
> --- Physical volumes ---
> PV Name (#)           /dev/hda9 (3)
> PV Status             available / allocatable
> Total PE / Free PE    5649 / 5649
> 
> PV Name (#)           /dev/hdb1 (1)
> PV Status             available / allocatable
> Total PE / Free PE    9803 / 63
> 
> PV Name (#)           /dev/hdc1 (2)
> PV Status             available / allocatable
> Total PE / Free PE    9803 / 63
> 
> I am trying to create stripped lv here, how I am going to do that?

You already created one; see the lines above saying "Stripes 2" and
"Stripe size (KByte)    4".

> 
> anyway an odd problem is after create a stripped lv then vgextent the vg
> with /dev/hda9, but I can't lvextent the lv 
> # lvextend -L+20G /dev/TITAN/home
> lvextend -- extending logical volume "/dev/TITAN/home" to 96.1 GB
> lvextend -- not enough free/allocatable physical extents to extend logical volume "/dev/TITAN/home"
> 
> what was the problem?

That's a constraint of the LVM which will disapear in a post 1.0 release.
If you want to extend on multiple PVs you need to go with a linear LV.

Regards,
Heinz    -- The LVM Guy --

> 
> 
> On Thu, 31 May 2001 14:34:57 +0200
> "Heinz J. Mauelshagen" <Mauelshagen@sistina.com> wrote:
> 
> > 
> > Eric,
> > 
> > lvdisplay shows lines beginning with "Stripes" and "Stripe size (KByte)"
> > in case you use it on a striped LV and /proc/lvm/global displays 
> > information as well.
> > 
> > On Wed, May 30, 2001 at 07:11:36PM -0700, Eric Wang wrote:
> > > Hi all,
> > > 
> > > How do I find out if my logic volume is striped or not?
> > > lvdisplay seems not produce this information.
> > > 
> > > Thanks 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
> > 
> > -- 
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
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
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
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
