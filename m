Return-Path: <root@srv.sistina.com>
Date: Mon, 28 May 2001 16:07:49 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Symbol not found when pvcreating...
Message-ID: <20010528160749.A21043@sistina.com>
References: <3B0E7C7C.E434D0AE@in.tum.de> <20010528113839.J26710@sistina.com> <3B1234CC.CC273F94@in.tum.de>
Mime-Version: 1.0
In-Reply-To: <3B1234CC.CC273F94@in.tum.de>; from vidalrod@informatik.tu-muenchen.de on Mon, May 28, 2001 at 01:21:48PM +0200
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

On Mon, May 28, 2001 at 01:21:48PM +0200, David Vidal Rodriguez wrote:
> >
> > > Another --developer-- question:
> > > I've looked at the LVM code and a structure called partition, #include'd
> > > from <linux/genhd.h>, which contains the relevant information of a
> > > partition. What I don't understand is how to get this information from
> > > the kernel/drive (syscall, ioctl???). I'd be glad if somebody explained
> > > that to me briefly.
> >
> > That's just needed for the generic disk interface.
> > It doesn't make any sense to create a partition table on a logical volume.
> 
> What I meant is how to get the partition data, such as partition id, start, end,
> etc.,  from a _real_ partition (you have get it in order to know if we are
> initializing a PV on a partition marked as 0x8E). That sounds a bit off-topic, I
> know...

Well, you can get it with my example; excluding the partition
type identifier :-(

TTBOMK you can use the e2fsprogs library to get that as well.


> 
> Cheers,
> --
>   ------------------------------------------------------------------------
>  David Vidal R. (vidalrod <at> in DOT tum DOT de)
>  http://dvr.ismad.com
>  "Ein Computer ohne Windows ist wie ein Fisch ohne Fahrrad."
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
