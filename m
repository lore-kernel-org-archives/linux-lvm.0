Return-Path: <root@srv.sistina.com>
Date: Tue, 29 May 2001 09:12:17 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Converting my Root file system to LVM [last
Message-ID: <20010529091217.A25011@sistina.com>
References: <200105232106.f4NL6Bl01557@dixie.dyndns.org> <20010528104951.D26710@sistina.com> <20010529113604.A28657@mail.wave.co.nz>
Mime-Version: 1.0
In-Reply-To: <20010529113604.A28657@mail.wave.co.nz>; from markv@wave.co.nz on Tue, May 29, 2001 at 11:36:04AM +1200
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

On Tue, May 29, 2001 at 11:36:04AM +1200, Mark van Walraven wrote:
> On Mon, May 28, 2001 at 10:49:51AM +0000, Heinz J. Mauelshagen wrote:
> > There is *no* problem avoiding "vgchange -an" *today* because nothing is written
> > to disk running it.
> > 
> > The command tries to unload the LVM metadata from the kernel therefore
> > deactivating VGs and the access to LVs which can't work unless *all* LVs of
> > all VGs are closed (no FS mounted etc.).
> > 
> > However this might change in the future in regard that a metadata update might
> > be necessary.
> 
> When/if you do this, please consider systems with root on LVM.  Building a
> ramdisk and pivoting root to that seems clumsy at best.  Perhaps vgchange
> could have an option to request a metadata flush, which is deferred until
> the relevant volumes are closed?

Mark,
I am not sure if I get you right here...

But in case a metadata write at VG deactivation is needed in the future,
the update would take place *before* the try to unload it from the kernel.

This is a valid sequence IMO, because reasons for unloadable metadata are
open LVs caused by hanging applications (database systems et al.) or unmounted
filesystems which don't influence the correctness of the LVM metadata anyway.

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
