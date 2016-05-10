Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u4AMFstH006634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Tue, 10 May 2016 18:15:54 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id AC00C80E42
	for <linux-lvm@redhat.com>; Tue, 10 May 2016 22:15:53 +0000 (UTC)
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.7/8.14.4/SuSE Linux 0.8) with ESMTP id
	u4ALlcpd053277
	for <linux-lvm@redhat.com>; Tue, 10 May 2016 14:47:41 -0700
Message-ID: <573256FA.80503@tlinx.org>
Date: Tue, 10 May 2016 14:47:38 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
In-Reply-To: <75be777705b8abc643a67ca9b90d7b1b@dds.nl>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] thin disk -- like overcomitted/virtual memory? (was Re:
 about the lying nature of thin)
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Xen wrote:
> You know mr. Patton made the interesting allusion that thin 
> provisioning is designed to lie and is meant to lie, and I beg to differ.
----
    Isn't using a thin memory pool for disk space similar to using
a virtual memory/swap space that is smaller than the combined sizes of all
processes?

    I.e.  Administrators can choose to decide whether to over-allocate
swap or paging file space or to have it be a hard limit -- and forgive me
if I'm wrong, but isn't this a configurable in /proc/sys/vm with the
over-commit parms (among others)?

    Doesn't over-commit in the LVM space have similar checks and balances
as over-commit in the VM space?  Whether it does or doesn't, shouldn't
the reasoning be similar in how they can be controlled?

    In regards to LVM overcommit -- does it matter (at least in the short
term), if that over-committed space is filled with "SPARSE" data files?.
I mean, suppose I allocate space for astronomical bodies -- in some 
areas/directions, I might have very SPARSE usage, vs. towards the core 
of a galaxy, I might expect less sparce usage. 

    If a file system can be successfully closed with 'no errors' -- 
doesn't that still mean it is "integrous" -- even if its sparse files 
don't all have enough room to be expanded?

    Does it make sense to think about a OOTS (OutOfThinSpace) daemon that
can be setup with priorities to reclaim space?

    I see 2 types of "quota" here. And I can see the metaphor of these 
types being extended into disk space:  Direct space, that physically 
present, and "indirect or *temporary* space" -- which you might try to 
reserve at the beginning of a job.  Your job could be configured to wait 
until the indirect space is available, or die immediately.  But 
conceivably indirect space is space on a robot-cartridge retrieval 
system that has huge amount of virtual space, but at the cost of needing 
to be loaded before your job can run. 

    Extending that idea -- the indirect space could be configured as 
"high priority space" -- meaning once it is allocated, it stays 
allocated *until* the job completes (in other words the job would have a 
low chance of being "evicted" by an OOTS damon), vs. most "extended 
space would have the priority of "temporary space" -- with processes 
using large amounts of such 'indirect space and having a low expectation 
of quick completion being high on the oots-daemon's list?

    Processes could also be willing to "give up memory and suspend" -- 
where, when called, a handler could give back Giga-or Tera bytes of memory
and save it's state as needing to restart the last pass.

    Lots of possibilities -- if LVM-this space is managed like 
memory-virtual space.  That means some outfits might choose to never 
over-allocate, while others might allow fraction.

    From how it sounds -- when you run out of thin space, what happens
now is that the OS keeps allocating more Virtual space that has no 
backing store (in memory or on disk)...with a notification buried in a 
system log
somewhere. 

    On my own machine, I've seen >50% of memory returned after
sending a '3' to /proc/sys/vm/drop_caches -- maybe similar emergency 
measures could help in the short term, with long term handling being as
similarly flexible as VM policies.

    Does any of this sound sensible or desirable?   How much effort is 
needed for how much 'bang'?
