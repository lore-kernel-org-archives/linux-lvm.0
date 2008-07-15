Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m6F6L1eL027584
	for <linux-lvm@redhat.com>; Tue, 15 Jul 2008 02:21:01 -0400
Received: from SMTP02.CITRIX.COM (smtp02.citrix.com [66.165.176.63])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m6F6KpJ3024367
	for <linux-lvm@redhat.com>; Tue, 15 Jul 2008 02:20:51 -0400
Subject: Re: [linux-lvm] vgchange -a memory consumption
From: Daniel Stodden <daniel.stodden@citrix.com>
In-Reply-To: <20080712165145.GC7155@agk.fab.redhat.com>
References: <1215842251.3751.53.camel@desktop>
	<20080712165145.GC7155@agk.fab.redhat.com>
Date: Mon, 14 Jul 2008 23:19:44 -0700
Message-Id: <1216102784.3751.78.camel@desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>


Hey Alasdair,

thanks a lot for the prompt reply.


 On Sat, 2008-07-12 at 17:51 +0100, Alasdair G Kergon wrote:
> On Fri, Jul 11, 2008 at 10:57:31PM -0700, Daniel Stodden wrote:
> > I'm running, lvm2-2.02.26.
>  
> Don't bother investigating that version - stuff got changed.
> Update to the latest release (or CVS) and try again.
> 
> > Why is that data reread? 
> 
> Because the two parts of the code are designed to be independent.  - The
> so-called "activation" code sits behind an API in a so-called "locking"
> module.  There's a choice of locking modules, and some send the requests
> around a cluster of machines - remote machines will only run the
> activation code and manage the metadata independently.  We just pass
> UUIDs through the cluster communication layer, never metadata itself.

Oooh - kay. I've only been looking at _file..() operations. In the
clustered version that sounds much more obvious.

> > Second: why isn't that memory freed after returning from
> > activate_lv?
>  
> It's released after processing the whole command.  If there are cases
> where too much is still being held while processing in the *current*
> version of the code, then yes, you might be able to free parts of it
> sooner.

I've been running on CVS today. The situation appears to have improved,
but only slightly. Still way to much memory going down the drain. 

BTW: Did CVS change the memlocking policy? I just noticed that I can run
beyond physical RAM now. Is that a bug or a feature?

I had a very long look at the path down activate/deactivate() in general
and the dm storage allocator in particular. If I nail a separate per-LV
pool over the cmd_context in _activate_lvs_in_vg() and empty it once per
cycle, things slow down a little [1], but the general problem vanishes. 

Now, overriding cmd->mem isn't exactly beautiful. Any better
suggestions? I need this fixed. And soon. :}

Second is revisions: I suppose something like the above would work as a
patch into elderly source RPMs as well. Such as the .26 I mentioned in
my original post. Any tips on this? I'd consider upgrading, but I've see
your advise against that on debian's launchpad, at least regarding .38
and .39. Which is hip?

So far, thank you very much again.

Best,
Daniel

[1] For a stack-alike allocator, I think dm_pool_free() generates a
rather scary number of individual brk()s while rewinding. But that's
certainly not a functional issue, and I may, again, be mistaken.
