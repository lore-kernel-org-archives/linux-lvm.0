Subject: Re: [linux-lvm] LVM Snapshots for remote archiving.
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <401807B2.6060900@gene.concordia.ca>
References: <4016EE45.1050300@gene.concordia.ca>
	 <1075246162.25365.16.camel@david.internal.NorcrossGroup.com>
	 <4017E699.5020703@gene.concordia.ca>
	 <1075310348.25365.43.camel@david.internal.NorcrossGroup.com>
	 <401807B2.6060900@gene.concordia.ca>
Message-Id: <1075394278.25365.93.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Date: Thu Jan 29 11:52:02 2004
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

On Wed, 2004-01-28 at 14:04, Chris Beck wrote:

> >I don't think that is a trivial issue, and I think the code would have
> >to implemented in the kernel.
> >  
> >
> Why the kernel? ... surely reading the flag tables could be done in user 
> space?  I think you have the necessary logic spot on.

I don't think the COW flag table is accessible from userspace, but I
could be wrong.

FYI: I am a LVM user, not a developer.

> 
> >New code would also have to be developed to apply the above blocks.
> >  
> >
> Hmmm.  I can mess around in perl and java as well as the next guy, but 
> my c-fu is weak, very weak.  How much would it cost to sponsor someone 
> to do this do you think?

I don't have any idea.  If your serious, I would recommend doing it with
LVM 2 (requires DM in the kernel), since DM is part of 2.6.x vanilla and
2.6.x will not likely ever support LVM 1.x.

In that case, I would post on the dm-devel list.  There seem to be a few
non-Sistina people that are very knowledgable and post regularily.

http://lists.sistina.com/mailman/listinfo/dm-devel

FYI: Since Sistina is in the process of being bought by Redhat, I doubt
they would consider a new project (or sub-project) right now.

HTH
Greg
-- 
Greg Freemyer
