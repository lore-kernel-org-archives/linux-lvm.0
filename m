From: "Heinz J . Mauelshagen" <mauelshagen@sistina.com>
Subject: Re: [linux-lvm] about snapshot
Message-ID: <20020604150300.B17699@sistina.com>
References: <OFFE9BA733.A06B07FF-ON48256BCE.002BC32B@legend.com.cn>
Mime-Version: 1.0
In-Reply-To: <OFFE9BA733.A06B07FF-ON48256BCE.002BC32B@legend.com.cn>; from lilha@legend.com.cn on Tue, Jun 04, 2002 at 04:13:16PM +0800
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
Date: Tue Jun  4 08:08:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Tue, Jun 04, 2002 at 04:13:16PM +0800, lilha@legend.com.cn wrote:
> 
> i have a question about snapshot in lvm.
> why implementing snapshot in vm, there is any reason about it ?


Implementing snapshot support in the LVM has the big advantage that any
arbitrary software *without* snapshot capabilities of its own, which uses
LVM logical volumes (like filesystems, database systems, ...) can take
advantage of the generic LVM snapshot feature (for backups, online recovery,
...) out of the box.

> why not do snapshot in filesystem,such as snapfs?

Filesystem snapshot support is a particular case which helps covering
a particular area (namely filesystems :), but not all the others, where an
application makes direct use of the underlying LVM device.

> and what are the advantage and disadvantage in it?

An application/filesystem level snapshot implementation has the potential
to minimize housekeeping overhead on snapshot metadata, because it can
just store the necessary minimized amount of metadata and is likely faster.

LVM as a block device layer entity is just capable to handle blocks and
therefore needs to keep track of changed blocks rather than for eg. typically
smaller metadata like filesystem inodes.

IOW: application/filesystem snapshots *force* a paritcular snapshot
     implementation which is costly but can offer better performance.

     LVM offers a generic snapshot feature avoiding costly
     application/filesystem level enhancements but buys this with
     some more housekeeping overhead.

> 
> thanks for any reply.
> 
> TIA for your help and sorry for my poor English.
> 
> Echo
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html

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
