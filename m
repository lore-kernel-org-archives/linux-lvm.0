Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9FHh5r19980
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 13:43:05 -0400
Received: from email.careercast.com (email.careercast.com [216.39.101.233])
	by mx1.redhat.com (8.12.11/8.12.10) with SMTP id i9FHh42W001774
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 13:43:04 -0400
Subject: Re: [linux-lvm] LVM2 features
From: Clint Byrum <cbyrum@spamaps.org>
In-Reply-To: <20041015150823.GB6352@omnifarious.org>
References: <20041010032631.GO32455@omnifarious.org>
	<a06110401bd95356589a8@[192.168.10.11]>
	<20041015150823.GB6352@omnifarious.org>
Date: Fri, 15 Oct 2004 10:42:58 -0700
Message-Id: <1097862178.21375.20.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 2004-10-15 at 08:08 -0700, Eric Hopper wrote:
> On Fri, Oct 15, 2004 at 10:15:07AM +0200, John Seifarth wrote:
> > Eric Hopper posted the query below last weekend, but I've seen no 
> > replies on the list.
> 
> Here are the things I've seen...
> 

<snip>

> pvmove has lots of weird and arcane limitations that make no sense to me
> at all.  It acted very strangely and seemed to lock parts of my system
> when I tried it with a fresh Fedora Core 2 install, and I've been afraid
> to try it since.  I see lots of messages flying back and forth about
> people having to hand-construct command lines to move specific extents
> because of some odd limitation of pvmove.
> 
> I also see little hard information about these limitations or why they
> exist.  I see all kinds of confused posts stating that this detail or
> that detail is the reason some particular operation doesn't work quite
> right.
> 


As a user on the outside who loved LVM1, and has grown to love LVM2, I
have to say I disagree with your points. This one, for instance, isn't
true. The hard data is that the allocation routines in pvmove don't yet
understand how to split the destination among two non-contiguous blocks
of physical extents. So, even if vgdisplay shows 100GB free, and you
only want to move 30GB .. you *might* have to move it in pieces, if the
free space isn't in a contiguous block.

Is that as nice as pvmove in lvm1? No. Are the other positives in LVM2
worth dealing with this minor inconvenience? IMHO, Yes!

> I used to know some of the LVM developers personally, and this list used
> to be much more open about the internal workings of LVM and there used
> to be people who would state plainly and authoritatively what was
> causing some particular problem.  I remember fondly the debates over
> getting /boot onto an LVM partition.
> 

I haven't seen any dodging. What I've seen is a tad less active
participation in the mailing list by the developers. This makes sense to
me.. they're busy making LVM2 better.

> I don't know what's happened or why.
> 
> From the outside, it seems as if LVM2 (which by all accounts is much
> higher quality code) was rushed into production before it was
> feature-comparable to LVM1, and all the developers are embarassed about
> it and not talking frankly about what's wrong.  If this were not Open
> Source, I'd say the company they worked for was discouraging them from
> discussing the limitations openly and leaving the users to guess and
> talk amongst themselves about them.
> 

This attitude confuses me. Open Source code doesn't really get "rushed
to production". If it sucks, people don't use it. There are no big
emotional attachments to it like with commercial software, where huge
amounts of licensing costs get spent on bad software. I haven't seen
anything "wrong." Bugs happen, and they're being fixed fairly quickly. 

Maybe its just that this list has reduced in importance wrt LVM2?

-- 
Clint Byrum <cbyrum@spamaps.org>
