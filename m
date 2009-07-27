Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6R6JYbb020276
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 02:19:34 -0400
Received: from eastrmmtao105.cox.net (eastrmmtao105.cox.net [68.230.240.47])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6R6JIPL028990
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 02:19:18 -0400
Received: from eastrmimpo03.cox.net ([68.1.16.126]) by eastrmmtao105.cox.net
	(InterMail vM.7.08.02.01 201-2186-121-102-20070209) with ESMTP id
	<20090727061918.WPID14338.eastrmmtao105.cox.net@eastrmimpo03.cox.net>
	for <linux-lvm@redhat.com>; Mon, 27 Jul 2009 02:19:18 -0400
Message-ID: <4A6D46E5.2000100@cox.net>
Date: Mon, 27 Jul 2009 01:19:17 -0500
From: Ron Johnson <ron.l.johnson@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm2 confused about double UUID
References: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>	<4A6CF9C0.6020902@cox.net>	<alpine.DEB.2.01.0907261808300.6426@bogon.housecafe.de>	<4A6D1739.2040708@cox.net>
	<alpine.DEB.2.01.0907262020090.6426@bogon.housecafe.de>
In-Reply-To: <alpine.DEB.2.01.0907262020090.6426@bogon.housecafe.de>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

On 2009-07-26 22:30, Christian Kujau wrote:
> On Sun, 26 Jul 2009 at 21:55, Ron Johnson wrote:
>> So the issue seems really the deeper fact that you've got two physical devices
>> with the same UUID.  All your lvm issues tumble out from there.
>>
>> Is that a good summary?
> 
> Yes, that's it. I know, having 2 physical volumes with the same UUID is 
> not cool and is certainly not supported, but due to the split that's what 
> I have here now and I assumed that I could convince LVM via the filter 
> directive to use a certain device for vg02. I mean, vg02 is working fine, 
> but I really want to format either sdb or sdc, but I'm afraid of 
> destroying something in the LVM layout...
> 
> Let me ask another thing: when I assume for a moment that "pvs" is lying 
> and really sdc is used for vg02, I'd go ahead and 1) pvcreate sdb, thus 
> assigning a new UUID to sdb and 2) remove the filter from lvm.conf. LVM 
> should not complain any more (since we have 2 different UUIDs now) and I/O 
> still goes to sdc, as it is now apparently. If things go wrong, how can I 
> restore the LVM header on sdb? (Would "pvcreate --uuid <old-UUID>" do the 
> trick? Or restoring with dd? How many bytes are changed when using 
> pvcreate?)

Now you're getting beyond my pay grade.

But with uuidgen and tune2fs, you could give sdc1 a new UUID.  That 
would hose lvm, though, and you'd have to do surgery in /etc/lvm.

I'd go the safe/sure route and backup sdc2 if possible (have you 
written anything new to it since breaking the mirror?), and start 
over, dropping it from lvm. refdisking it (is there such a word?), 
etc, etc.

-- 
Scooty Puff, Sr
The Doom-Bringer
