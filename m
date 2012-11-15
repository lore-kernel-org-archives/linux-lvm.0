Received: from mx1.redhat.com (ext-mx15.extmail.prod.ext.phx2.redhat.com
	[10.5.110.20])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id qAFA91Zj025407
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2012 05:09:01 -0500
Received: from tropek.jajcus.net (tropek.jajcus.net [84.205.176.49])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id qAFA8wB9021021
	for <linux-lvm@redhat.com>; Thu, 15 Nov 2012 05:08:59 -0500
Date: Thu, 15 Nov 2012 11:08:53 +0100
From: Jacek Konieczny <jajcus@jajcus.net>
Message-ID: <20121115100852.GA19632@jajo.eggsoft>
References: <20121114151612.GD14396@jajo.eggsoft> <50A4B14F.5050700@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <50A4B14F.5050700@gmail.com>
Subject: Re: [linux-lvm] Why do lvcreate with clvmd insist on VG being
 available on all nodes?
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: Zdenek Kabelac <zdenek.kabelac@gmail.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Thu, Nov 15, 2012 at 10:09:35AM +0100, Zdenek Kabelac wrote:
> > work properly, as I would expect (make the volume available/unavailable
> > on the node). But an attempt to create a new volume:
> >
> > lvcreate -n new_volume -L 1M shared_vg
> >
> > fails with:
> >
> > Error locking on node 1: Volume group for uuid not found: Hlk5NeaVF0qhDF20RBq61EZaIj5yyUJgGyMo5AQcLfZpJS0DZUcgj7QMd3QPWICL
> >
> 
> 
> Haven't really tried to understand what are you trying to achieve,
> but if you want to have node being activated only on one cluster node,
> you may easily use    lvcreate -aey  option.
> 
> If you are using default clustered operation - it's not surprising,
> the operation is refused if other nodes are not responding.

Hmmm didn't though about the initial activation. In fact, I don't need
that volume activated as soon as it is created. You are right, I should
try 'lvcreate -aey' or 'lvcreate -an'.

My stupid mistake, indeed.

'lvcreate -an -Z n' and 'lvcreate -aey' do work in such case.

Though, LVM have some problems with tracking the exclusive activations
later…

> > Indeed, the VG is not available at the standby node at that moment. But,
> > as it is not available there, I see no point in locking it there.
> 
> Well - you would need to write your own type of locking with support
> of 'standby'  currently clvmd doesn't work with such state (and it's not
> quite clear to me how it actually should even work).
> So far either node is in cluster or is fenced.

I will try to make this work somehow… I don't think a node in standby
(or when one of the VGs is not available there) should be quite
different that one fenced.

> > When clvmd is stopped on the inactive node and 'clvmd -S' has been run
> > on the active node, then both 'lvchange' and 'lvcreate' work as
> > expected, but that doesn't look like a graceful switch-over. And another
> > 'clvmd -S' stopped clvmd all together (this seems like a bug to me)
> >
> > And one more thing bothers me… my system would be very scalable to many
> > nodes, where only two share active storage (when using DRBD). But this
> > won't work if LVM would refuse some operations when any VG is not
> > available on all nodes.
> 
> Obviously using clustered VG in non-clustered environment isn't smart plan.
> What you could do - is to   disable clustering support on VG

Clusters do not have to be symmetrical. Cluster when different nodes
have a bit different set of resources available are still clusters.

I do need clustering locking – in case a volume group is available on
a few nodes it must not be possible to more than one node use any of the
logical volumes there.

> Note - you may always go around any locking problem with the above config 
> option - just do not report then problems with broken disk content and badly
> activated volumes on cluster nodes.

I am aware of the risks. That is why I do use clvmd. I don't quite
understand some of the clvmd behaviour and I wrote here to know if there
are some other risks taken into account by clvmd that I am not aware of.

It seem I still need some work and learning to make it work properly. 

Greets,
        Jacek
