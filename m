Return-Path: <root@srv.sistina.com>
Date: Wed, 30 May 2001 11:40:10 +0200
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Converting my Root file system to LVM [last
Message-ID: <20010530114010.E30938@sistina.com>
References: <200105232106.f4NL6Bl01557@dixie.dyndns.org> <20010528104951.D26710@sistina.com> <20010529113604.A28657@mail.wave.co.nz> <20010529091217.A25011@sistina.com> <20010530125142.A27177@mail.wave.co.nz>
Mime-Version: 1.0
In-Reply-To: <20010530125142.A27177@mail.wave.co.nz>; from markv@wave.co.nz on Wed, May 30, 2001 at 12:51:43PM +1200
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

On Wed, May 30, 2001 at 12:51:43PM +1200, Mark van Walraven wrote:
> On Tue, May 29, 2001 at 09:12:17AM +0000, Heinz J. Mauelshagen wrote:
> > > When/if you do this, please consider systems with root on LVM.  Building a
> > > ramdisk and pivoting root to that seems clumsy at best.  Perhaps vgchange
> > > could have an option to request a metadata flush, which is deferred until
> > > the relevant volumes are closed?
> > 
> > Mark,
> > I am not sure if I get you right here...
> 
> Probably because I didn't make sense.  I was thinking that the metadata
> write could be scheduled to pend until all LVs were closed.  But that
> doesn't help, because root is never unmounted ...
> 
> > But in case a metadata write at VG deactivation is needed in the future,
> > the update would take place *before* the try to unload it from the kernel.
> 
> Do you mean that the metadata write might be a separate operation to
> deactivation, permitted even before the LVs were closed?

Yes.

> 
> > This is a valid sequence IMO, because reasons for unloadable metadata are
> 
> s/unloadable/non-unloadable/ ?

???

unloading metadata means to remove it from the kernel; IOW: delete the tables
and structures the LVM kernel part holds in order to access LVs et al.

> 
> > open LVs caused by hanging applications (database systems et al.) or unmounted
> > filesystems which don't influence the correctness of the LVM metadata anyway.
> 
> How about filesystems mounted read-only?  My current shutdown sequence goes:
> 
> 	/etc/rc6.d/S40umountfs:
> 		swapoff -a
> 		umount -f -a -r
> 		mount -n -o remount,ro /
> 
> 	/etc/rc6.d/S50lvm:
> 		/sbin/vgchange -A n -a n
> 
> 	/etc/rc6.d/S90reboot:
> 		reboot -d -f -i
> 
> Which doesn't work because root is on an LV.  But even if the lvm
> shutdown script could write the metadata while root was open, the VGDA
> would still end up recording an active VG and open LV, unless you had
> something analogous to "re-mount read-only" for LVs and VGs.

We don't have metadata update operations defined so far anyway.
It is just an option for the future and such status issues will be covered then.

BTW: we do have readonly LVs (which prohibits write acces to the LVs data)
and VGs (which prohibits adding/removing PVs to/from to the VG).

> 
> Regards,
> 
> Mark.
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
