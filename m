From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] Overlapping logical volumes
Message-ID: <20031103111117.F1850@sistina.com>
References: <1293.435T2650T11474321tom@carrott.org>
Mime-Version: 1.0
In-Reply-To: <1293.435T2650T11474321tom@carrott.org>; from tom@carrott.org on Sat, Nov 01, 2003 at 07:07:53PM +1200
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
Date: Mon Nov  3 04:11:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Sat, Nov 01, 2003 at 07:07:53PM +1200, Tom Parker wrote:
> Hi,
> 
> I have just experianced a rather nasty bug in lvextend. I grew a logical
> volume and it used extents that were already in use for another logical
> volume.

You're the first reporting.
Do you have abn archive copy in /etc/lvmconf representing that situation still ?
If so, send it to me please <mge@sistina.com>.

> 
> I'm using Debian Woody and Linux 2.4.22 (unpatched Linus kernel.org sources)
> 
> amislave:/# lvextend --help
> 
> Logical Volume Manager 1.0.4
> Heinz Mauelshagen, Sistina Software  02/05/2002 (IOP 10)
> 
> Luckily I noticed the corrupting filesystems fairly quickly and was able to
> mostly recover the situation with minimal losses. Currently I still have the
> two overlapping logical volumes and a lot less trust in the LVM than I had
> before.
> 
> Is there a program that can validate the logical volume configuration and
> ensure that no physical extent is allocated to more the one logical volume?

vgck

> 
> When extending a logical volume, or creating a new one, is anything written to
> the newly allocated extents?

While extending, the answer is no.
If creating, the answer is ye, unless you "lvcreate -Zn ...".

> If this were to happen again, and I discovered
> the problem before I made use of the extra space or a new logical volume,
> would I have any corruption of the first logical volume to use the extents in
> question?

As said, use "lvcreate -Zn ..." in order to avoid writing zerores to the first
KB of the new LV (this is necessary because fs mounts can crash your system
otherwise on an un'fscked LV).

> 
> To finish my data recovery, I would like to allocate another large logical
> volume, I'm somewhat wary of doing this without a tool to ensure that the
> group is valid.

Do an "lvcreate -Zn ...", run vgck and check the "lvdisplay -v ..." output
on all your LVs if there's any overlaps again. If so, that's the archive copy
you want to send to me.

> 
> --
> Tom Parker - tom@carrott.org
>            - http://www.carrott.org
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/

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
