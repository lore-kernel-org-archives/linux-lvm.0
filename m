From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] lvm and md
Message-ID: <20030307150941.A9634@sistina.com>
References: <3E6803F3.5060507@exavio.com.cn>
Mime-Version: 1.0
In-Reply-To: <3E6803F3.5060507@exavio.com.cn>; from peter@exavio.com.cn on Fri, Mar 07, 2003 at 10:29:07AM +0800
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
Date: Fri Mar  7 08:11:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Peter,
both ways are fine depending on your priorities.

I'ld prefer to group disks together with MD for resilience (i.e RAID1)
and then use those as LVM physical volumes to have the flexibility to allocate
space to logical volumes online.

More convenient this way rather than changing raidtabs which cause interruptions
to your volumes on size changes.

Because a core feature of LVM is to resize logical volumes online, the given
resizing capabilities of filesystems (i.e. reiser, xfs) allow you to
grow the filesystem online as well.


On Fri, Mar 07, 2003 at 10:29:07AM +0800, Peter Yao wrote:
> Should we build lvm volumns on top of soft raid(md) or build md on top 
> of lvm volumns?
> I prefer to build md on top of lvm volumns because lvm can hide the 
> hardware details from md. Just want to know how do you think about this.
> Or any URLs? Thanks.
> -- 
> Peter Yao
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
