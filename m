From: Andreas Dilger <adilger@turbolabs.com>
Subject: Re: [linux-lvm] lvm-1.0.1 not working with DAC960/2.2.20
Message-ID: <20011127102808.A730@lynx.no>
References: <wvbshoy54w.fsf@freeze.oslo.dnmi.no> <20011127111424.A8179@sistina.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20011127111424.A8179@sistina.com>; from mauelshagen@sistina.com on Tue, Nov 27, 2001 at 11:14:24AM +0100
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
Date: Tue Nov 27 11:26:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Nov 27, 2001  11:14 +0100, Heinz J . Mauelshagen wrote:
> 
> Checked it in.

But now it is broken.

> On Tue, Nov 27, 2001 at 09:44:47AM +0100, Adrian Phillips wrote:
> > --- tools/lib/lvm_check_partitioned_dev.c.orig  Tue Nov 27 09:16:03 2001
> > +++ tools/lib/lvm_check_partitioned_dev.c       Tue Nov 27 09:42:38 2001
> > @@ -140,7 +140,8 @@
> >         "md",                   /* Multiple Disk driver (SoftRAID)   */
> >         "loop",                 /* Loop device              */
> >         "dasd",                 /* DASD disk (IBM S/390, zSeries)      */
> > -       "dac960",               /* DAC960              */
> > +       "rd",                   /* DAC960 2.2          */
> > +       "dac960",               /* DAC960 2.4          */
> >         "nbd",                  /* Network Block Device              */
> >         "ida",                  /* Compaq SMART2              */
> >         "cciss",                /* Compaq CCISS array              */

Note that this will break other things, because you also need to update
the LVM_DEVICE_TYPE_<foo> defines when you change this array (it was
Joe or Alistair that wrote it this way, not me).  It would also break to
add a new enum value for DAC960, because it means we need to look for two
values elsewhere in the code (e.g. lvm_partition_count).

I just checked in a fix, which cleans up this code a bit and makes it
impossible to get wrong in the future.

Cheers, Andreas
--
Andreas Dilger
http://sourceforge.net/projects/ext2resize/
http://www-mddsp.enel.ucalgary.ca/People/adilger/
