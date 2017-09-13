Received: from mx1.redhat.com (ext-mx07.extmail.prod.ext.phx2.redhat.com
	[10.5.110.31])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3AFB460F87
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 17:41:17 +0000 (UTC)
Received: from smtp2.signet.nl (smtp2.signet.nl [83.96.147.103])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 3DB96C04B952
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 17:41:14 +0000 (UTC)
Received: from webmail.dds.nl (app2.dds.nl [81.21.136.118])
	by smtp2.signet.nl (Postfix) with ESMTP id 2DD4640B74C7
	for <linux-lvm@redhat.com>; Wed, 13 Sep 2017 19:41:12 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Sep 2017 19:41:12 +0200
From: Xen <list@xenhideout.nl>
In-Reply-To: <1da2cfbb-4443-b8fa-8a61-55a8c6574db7@redhat.com>
References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<7d0d218c420d7c687d1a17342da5ca00@xenhideout.nl>
	<6e9535b6-218c-3f66-2048-88e1fcd21329@redhat.com>
	<2cea88d3e483b3db671cc8dd446d66d0@xenhideout.nl>
	<f00db013-56a5-87f5-dd98-37d603ea1b9b@redhat.com>
	<9115414464834226be029dacb9b82236@xenhideout.nl>
	<50f67268-a44e-7cb7-f20a-7b7e15afde3a@redhat.com>
	<5cb21c879cfff0b1916e823b85d35909@xenhideout.nl>
	<87a619a2-cefc-3b4e-a709-0906053503e9@redhat.com>
	<bd0c1d0e-172a-f6c1-039f-8724dc8d007e@assyoma.it>
	<1da2cfbb-4443-b8fa-8a61-55a8c6574db7@redhat.com>
Message-ID: <1539b0efb711bf19c78a9fc509f37d42@xenhideout.nl>
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: linux-lvm@redhat.com

Zdenek Kabelac schreef op 12-09-2017 23:57:

> Users interested in thin-provisioning are really mostly interested in
> performance - especially on multicore machines with lots of fast
> storage with high IOPS throughput  (some of them even expect it should
> be at least as good as linear....)

Why don't you hold a survey?

And not phrase it in terms of "Would you like to sacrifice performance 
for more safety?"

But please.

Ask people:

1) What area does the LVM team needs to focus on for thin provisioning:

a) Performance and keeping performance intact
b) Safety and providing good safeguards against human and program error
c) User interface and command line tools
d) Monitoring and reporting software and systems
e) Graphical user interfaces
f) Integration into default distributions and support for booting/grub

And then allow people to score these things with a percentage or to 
distribute some 20 points across these 6 points.

Invent more points as needed.

Give people 20 points to distribute across some 8 areas of interest.

Then ask people what areas are most interesting to them.

So topics could be:
(a) Performance (b) Robustness (c) Command line user interface (d) 
Monitoring systems (e) Graphical user interface (f) Distribution support

So ask people. Don't assume.

(NetworkManager team did this pretty well by the way. They were really 
interested in user perception some time ago).

> if you will keep thinking for a while you will at some point see the 
> reasoning.

Only if your reasoning is correct. Not if your reasoning is wrong.

I could also say to you, we could also say to you "If you think longer 
on this you will see we are right". That would probably be more accurate 
even.

> Repeated again - whoever targets for 100% full thin-pool usage has
> misunderstood purpose of thin-provisioning.....

Again, no one "targets" for 100% full. It is just an eventuality we need 
to take care of.

You design for failure.

A nuclear plant who did not take account of operator drunkenness and had 
no safety measures in place to ensure that would not lead to 
catastrophe, would be a very bad nuclear plant.

Human error can be calculated into the design. In fact, it must.

DESIGN FOR HUMAN WEAKNESS.

NOT EVERYONE IS PERFECT and human faults happen.

If I was a customer and I was paying your bills, you would never respond 
like this.

We like some assurance that things do not go immediate mayhem the moment 
someone somewhere slacks off and falls asleep.

We like to design in advance so we do not have to keep a constant eye 
out.

We build "structure" so that the structure works for us, and not 
constant vigilance.

Constant vigilance can fail. Structure cannot.

Focus on "being" not "doing".
