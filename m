Return-Path: <root@srv.sistina.com>
Date: Wed, 28 Feb 2001 12:22:38 +0000
From: "Heinz J. Mauelshagen" <Mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Possible to raise Max LV?
Message-ID: <20010228122238.D4361@srv.sistina.com>
References: <20010227131526.1C48E3FDB@math.ohio-state.edu> <200102271658.f1RGwkl27047@webber.adilger.net> <20010227132358.A24164@math.ohio-state.edu> <3A9C87A1.7205F1DC@wrkhors.com>
Mime-Version: 1.0
In-Reply-To: <3A9C87A1.7205F1DC@wrkhors.com>; from lembark@wrkhors.com on Tue, Feb 27, 2001 at 11:07:45PM -0600
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

On Tue, Feb 27, 2001 at 11:07:45PM -0600, Steven Lembark wrote:
> 
> > I'm completely new to LVM, so can someone explain to me the purpose of
> > the PE's and why they default to 4M?  Is there some kind of performance
> > or space hit if I raise that to 16M (remember my setup: hardware RAID
> > array that is currently at ~250G, soon to be ~325G)?
> 

Linux LVM follows the paradigm of block oriented (like the AIX or HP ones)
rather than section oriented Volume Managers (like the Veritas one).

Therefore it deals with so called Physical Extents (or PEs) as the basic
allocation units. The actual LVM code supports up to ~64k extents per
Logical Volume. If you like to have Logical Volumes larger than ~256G in the
future you *need* to create your VG(s) with a PE size larger than the default
of 4M.

Even though that LVM constraint most likely will disappear in the future
you should plan for larger PE sizes now in case 256G per LV maximum size
is too small for you.

If you raise the PE size to 16M your metadata usage will be a little bit smaller
*but* the amount of free space after the metadata will likely be larger as
with 4M PE size due to the allocation policy of LVM. This choice will give
you a maximum LV size of 1T. Linux is limited to 2T per single block device
at this point in time. In Linux 2.5 that constraint will disapear too.

> also described in the docs.  
> 
> you might be better off splitting the space into smaller chunks.
> with that much space in one unit you will be hit hard if any of
> it fries -- backups or not.  do you have any files that really
> take up 325G?  if not you could split the space into multiple
> 128GB sections for separate use.  makes backups a whole lot 
> easier...  let alone restores.
> 
> -- 
>  Steven Lembark                                   2930 W. Palmer St.
>                                                  Chicago, IL  60647
>  lembark@wrkhors.com                                   800-762-1582
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
