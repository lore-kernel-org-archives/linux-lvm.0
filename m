Return-Path: <root@srv.sistina.com>
Date: Tue, 24 Apr 2001 18:02:49 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Lost harddrive space
Message-ID: <20010424180249.K31988@sistina.com>
References: <20010412182856.A26530@sistina.com>
Mime-Version: 1.0
In-Reply-To: <no.id>; from erik@rigtorp.com on Thu, Apr 12, 2001 at 08:19:34PM +0200
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

On Thu, Apr 12, 2001 at 08:19:34PM +0200, Erik Rigtorp wrote:
> My harddrive is 61.4GB i think. I think LVM is great software, it should 
> be standard in all ditributions.
> 
> /Erik
> 
> #fdisk -l
> 
> Disk /dev/hda: 255 heads, 63 sectors, 7476 cylinders
> Units = cylinders of 16065 * 512 bytes
> 
>    Device Boot    Start       End    Blocks   Id  System
> /dev/hda1   *         1        61    489951   83  Linux
> /dev/hda2            62      7476  59560987+  8e  Unknown

59560987 / 1024 / 1024 == 56.8.

No lost space whatshowever.

> 
> 
> #pvdisplay /dev/hda2
> 
> --- Physical volume ---
> PV Name               /dev/hda2
> VG Name               erkki
> PV Size               56.8 GB / NOT usable 1.03 MB [LVM: 177 KB]
> PV#                   1
> PV Status             available
> Allocatable           yes
> Cur LV                3
> PE Size (KByte)       4096
> Total PE              14541
> Free PE               12237
> Allocated PE          2304
> PV UUID               IUz7yE-MP2i-QwJ2-23GW-70cu-P2Fw-7Jn0xA
> 
> 
> 
> -----Original Message-----
> From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
> To: linux-lvm@sistina.com
> Date: Thu, 12 Apr 2001 18:28:56 +0000
> Subject: Re: [linux-lvm] Lost harddrive space
> 
> > On Thu, Apr 12, 2001 at 05:51:30PM +0200, Erik Rigtorp wrote:
> > > Hi!
> > > 
> > > I have a 60999.46 MB linux lvm partition. But when I pvcreate it and 
> > > pvdisplay /dev/hda2 it says the physical volume is only 56.8GB and
> > 1.03MB 
> > > not used. Where are those lost Gigs? I use the lvm that comes with
> > the 
> > > 2.4.3 kernel.
> > 
> > Could you provide "pvdisplay /dev/hda2" and "fdisk -l /dev/hda" please?
> > 
> > It is likely caused by the math:
> > 
> >  1 GB = 2^30 Byte
> > 
> > > 
> > > /Erik
> > > 
> > > 
> > > _______________________________________________
> > > linux-lvm mailing list
> > > linux-lvm@sistina.com
> > > http://lists.sistina.com/mailman/listinfo/linux-lvm
> > 
> > -- 
> > 
> > Regards,
> > Heinz    -- The LVM Guy --
> > 
> > *** Software bugs are stupid.
> >     Nevertheless it needs not so stupid people to solve them ***
> > 
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
> > -=-=-=-
> > 
> > Heinz Mauelshagen                                 Sistina Software Inc.
> > Senior Consultant/Developer                       Am Sonnenhang 11
> >                                                   56242 Marienrachdorf
> >                                                   Germany
> > Mauelshagen@Sistina.com                           +49 2626 141200
> >                                                        FAX 924446
> > =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
> > -=-=-=-
> > _______________________________________________
> > linux-lvm mailing list
> > linux-lvm@sistina.com
> > http://lists.sistina.com/mailman/listinfo/linux-lvm
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm

-- 

Regards,
Heinz    -- The LVM Guy --

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
