From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Creating LV's with _very large_ PV's
Message-ID: <20011212090415.A629@sistina.com>
References: <3C167AD5.60700@chaven.com>
Mime-Version: 1.0
In-Reply-To: <3C167AD5.60700@chaven.com>; from lists@chaven.com on Tue, Dec 11, 2001 at 03:29:57PM -0600
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
Date: Wed Dec 12 02:03:01 2001
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Steve,

you can just ut all 3 into one Volume Group.
In case you want to have Logical Volumes larger than ~256GB, you need
to create the VG with larger extent size than the default of 4MB
by "vgcreate -s 64m YourVGName /dev/YourPV[1-3]".

Current LVM can handle up to ~64k extents per LV which causes the limit
of ~256GB with the default Physical Extent size of 4MB.
This is a LV *not* a Physical Volume limit. You can have as many Extents on
a PV as you like and as many PVs as Linux support in a VG (you need to use
the -p option of vgcreate to raise the default of 128 PVs in this case though).

With 64MB as in the example above, you could have LVs up to 4TB in size.
This is theoretical though, because Linux 2.4 limits every block device (and
LVs are just one example of those) to 2TB (eventually 1TB in case of particular
drivers) which will be raised in 2.5.

Regards,
Heinz    -- The LVM Guy --


On Tue, Dec 11, 2001 at 03:29:57PM -0600, List User wrote:
> 
> I am running Mandrake 8.1 here and am looking to create a very large array.
> I have Promise UltraTrak 100 TX8 external arrays which format each out to
> approx 670GB as one large volume.
> 
> Initially I wanted to add just this one to a volume group but couldn't. 
>  Said something
> to the regards of physical volume is too large.  It spewed something 
> that looked like
> 256GB is the largest PV that it can handle?!?
> 
> Anyway, the real goal is to have three of these arrays (670*3) each 
> array will be
> one physical volume.  The three together would be added to create an approx
> 2TB array.
> 
> Is this possible?  Feasible?  
> 
> Or do I have to carve each tower into multiple parts which I don't 
> really want to do.
> 
> 
> Steve
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
