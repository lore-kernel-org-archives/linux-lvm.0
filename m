From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] strange behavior with 1.0.5 on Linux 2.4.19?
Message-ID: <20021109130628.B12935@sistina.com>
References: <20021009133650.E23965@sistina.com> <1035782975.3398.128.camel@gopher> <20021028101739.F16452@sistina.com> <1035866273.9074.74.camel@gopher> <20021029101033.A22193@sistina.com> <1035921224.1276.24.camel@gopher> <20021031134804.A491@sistina.com> <1036104859.21418.104.camel@pslgregory> <20021105152824.E27825@sistina.com> <1036727077.7035.50.camel@pslgregory>
Mime-Version: 1.0
In-Reply-To: <1036727077.7035.50.camel@pslgregory>; from gkade@bigbrother.net on Thu, Nov 07, 2002 at 07:44:36PM -0800
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
Date: Sat Nov  9 06:12:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Gregory,

this proves my assumption right that something is fishy with the high
memory support in your SMP environment.

I guess that it might work as well in case you make a single processor kernel
_with_ high memory enabled and repeat the very same test and that it might
be a highmem/smp problem still to be fixed.

Anyone else with hints?

Regards,
Heinz    -- The LVM Guy --


On Thu, Nov 07, 2002 at 07:44:36PM -0800, Gregory Ade wrote:
> On Tue, 2002-11-05 at 06:28, Heinz J . Mauelshagen wrote:
> 
> > > > If you have a chance to reconfigure the failing system temporarily,
> > > > running what you did before should reproduce the same problems (segfault
> > > > on snapshot creation after fresh reboot) in case there's _no_ bug in the
> > > > large/high memory support.
> > > > My assumption is that it will not.
> 
> > There's no need to physically remove any DIMMs. Just cook up a kernel
> > without the patches you mentioned to get that elefant going and
> > without high memory support.
> 
> Okay, I disabled high memory support (only change from production
> kernel), rebooted with this test kernel, and tried to create a snapshot:
> 
> root@burpr(pts/0):~ 26 # lvcreate --snapshot --extents 512 --name
> tmp_snap /dev/vg00/tmp
> lvcreate -- INFO: using default snapshot chunk size of 64 KB for
> "/dev/vg00/tmp_snap"
> lvcreate -- doing automatic backup of "vg00"
> lvcreate -- logical volume "/dev/vg00/tmp_snap" successfully created
> 
> 
> It worked just fine:
> 
> root@burpr(pts/1):log 28 # lvdisplay /dev/vg00/tmp
> --- Logical volume ---
> LV Name                /dev/vg00/tmp
> VG Name                vg00
> LV Write Access        read/write
> LV snapshot status     source of
>                        /dev/vg00/tmp_snap [active]
> LV Status              available
> LV #                   2
> # open                 1
> LV Size                2 GB
> Current LE             512
> Allocated LE           512
> Allocation             next free
> Read ahead sectors     120
> Block device           58:1
> 
> So I removed it:
> 
> root@burpr(pts/1):log 29 # lvremove /dev/vg00/tmp_snap
> lvremove -- do you really want to remove "/dev/vg00/tmp_snap"? [y/n]: y
> lvremove -- doing automatic backup of volume group "vg00"
> lvremove -- logical volume "/dev/vg00/tmp_snap" successfully removed
> 
> 
> No kernel oops or BUG in the dmesg.
> 
> Again, the _ONLY DIFFERENCE_ between this test kernel and the production
> kernel is the high-memory support option.  On the test kernel, it is
> off, and on the production kernel, it is set to 64GB.
> 
> Hope this helps.
> 
> -- 
> Gregory K. Ade <gkade@bigbrother.net>
> http://bigbrother.net/~gkade
> OpenPGP Key ID: EAF4844B  keyserver: pgpkeys.mit.edu

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
