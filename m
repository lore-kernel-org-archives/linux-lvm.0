Date: Tue, 16 Oct 2001 14:34:25 +0200
From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] replace bad hard disc
Message-ID: <20011016143425.A5299@sistina.com>
References: <110278234233.20011015163039@difi.de> <20011016105533.A4318@sistina.com> <20011016121634.A2856@sky.net>
Mime-Version: 1.0
In-Reply-To: <20011016121634.A2856@sky.net>; from U.Wiederhold@gmx.net on Tue, Oct 16, 2001 at 12:16:34PM +0200
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

On Tue, Oct 16, 2001 at 12:16:34PM +0200, Ulrich Wiederhold wrote:
> * Heinz J . Mauelshagen <mauelshagen@sistina.com> [011016 10:55]:
> > 
> > Stefan,
> > 
> > add a new hard drive to your system and create (at least) an LVM partition
> > (Type 0x8E) on it. Let's call the new one /dev/sde1 and your flaky one
> > /dev/sdd1 just for the purpose of this example.
> > 
> > Then:
> > 
> > pvcreate /dev/sde1
> > vgextend Stonki2 /dev/sde1
> > pvmove /dev/sdd1 /dev/sde1
> > vgreduce Stonki2 /dev/sdd1
> > 
> 
> Hello,
> will pvmove work if /dev/sde1 is already added to Stonki2 if there is
> enough space available on /dev/sde1 ?
> 
> Reason: I have a vg containing 5 HDs that includes a small 4GB one. I
> would like to remove this one without adding another HD. Enough space is
> available.

Uli,

yes pvmove will work. Say your 4G PV is accessed via /dev/sdc1 then
you just run "pvmove /dev/sdc1" and it'll search for free space on the other
PVs to relocate data to. If your LV(s) with data allocated on /dev/sdc1 are
striped, you need to have enough space for the particular stripes on /dev/sdc1
on another PV in the VG, which doesn't have other stripes of the very same LV(s)
allocated.

> 
> Regards
> Uli
> 
> -- 
> 'The box said, 'Requires Windows 95 or better', so i installed Linux - TKK 5
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
