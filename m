Return-Path: <root@srv.sistina.com>
Date: Wed, 2 May 2001 11:08:56 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] LVM & high system load
Message-ID: <20010502110856.A30791@sistina.com>
References: <3AEF2F97.E70A8CA7@loria.fr> <200105012325.RAA27700@lynx.turbolabs.com>
Mime-Version: 1.0
In-Reply-To: <200105012325.RAA27700@lynx.turbolabs.com>; from adilger@turbolinux.com on Tue, May 01, 2001 at 05:25:36PM -0600
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

On Tue, May 01, 2001 at 05:25:36PM -0600, Andreas Dilger wrote:
> Dominique Larchey writes:
> > I point out that /dev/mmedia/music resides on /dev/hda5
> > 
> > time dd if=/dev/mmedia/music of=/dev/null bs=512
> > count=200000               0m37.113s
> > time dd if=/dev/hda5 of=/dev/null bs=512
> > count=200000                       0m35.437s
> 
> LVM shows 4.7% overhead.  This is not so great.
> 
> > Ok I am ridiculous ... this has nothing to do with LVM.
> > It has to do with DMA set off by default by linux 2.4.
> > This is the reason of poor IO perf. and CPU eating.
> > 
> > After DMA is set on,
> > 
> > time dd if=/dev/mmedia/music of=/dev/null bs=512
> > count=200000               0m12.934s
> > time dd if=/dev/hda5 of=/dev/null bs=512
> > count=200000                       0m12.110s
> 
> Good news - not an LVM problem.  Bad news - LVM shows 6.8% overhead.

Did nothing else produce io load while the test on the LV was running?

Did you repeat tests in order to get statistic certainty?


> 
> > Perhaps poor perf. for the other person is also DMA related ?-)
> 
> No, the other person has drastically different performance with LVM for
> 512-byte I/O compared to raw disk.  For 64k-byte I/O performance on LVM
> and raw disk are the same.  I _suppose_ that if I/O is done in small
> chunks that PIO mode will have more overhead.  Maybe worth asking if
> CPU is high when he is doing 512-byte I/Os.

Yep.

> 
> Cheers, Andreas
> -- 
> Andreas Dilger                               Turbolinux filesystem development
> http://sourceforge.net/projects/ext2resize/
> http://www-mddsp.enel.ucalgary.ca/People/adilger/
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
