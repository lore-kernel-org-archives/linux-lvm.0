Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.25])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3RC1WgO014014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 08:01:33 -0400
Received: from smtp1.dds.nl (smtpgw.dds.nl [91.142.252.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 259A07AE94
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 12:01:29 +0000 (UTC)
Received: from webmail.dds.nl (app1.dds.nl [81.21.136.61])
	by smtp1.dds.nl (Postfix) with ESMTP id CC5B07F045
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 14:01:26 +0200 (CEST)
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 27 Apr 2016 12:01:26 +0000
From: Xen <list@xenhideout.nl>
In-Reply-To: <aa73a4aa76ae5f2c67a14f8e00fc3792@dds.nl>
References: <aa73a4aa76ae5f2c67a14f8e00fc3792@dds.nl>
Message-ID: <2cf5fa112c1092a4c95092824625eb61@dds.nl>
Subject: Re: [linux-lvm] thin handling of available space
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

I was talking about the idea to communicate to a filesystem the amount 
of available blocks.

I noticed https://bugzilla.redhat.com/show_bug.cgi?id=1189215 named "LVM 
Thin: Handle out of space conditions better" which was resolved by 
Zdenek Kabelac (hey Zdenek) and which gave rise to (apparently) the new 
warning you get when you overprovision.



But this warning when overprovisioning does not solve any problems in a 
running system.

You /still/ want to overprovision AND you want a better way to handle 
out of space conditions.

A number of items were suggested in that bug:

1) change the default "resize thin-p at 100%" setting in lvm.conf
2) warn users that they have insufficient space in a pool to cover a 
fully used thinLV
3) change default wait time from 60sec after an out-of-space condition 
to something longer

Corey Marthaler suggested that only #2 was implemented, and this bug (as 
mentioned) was linked in an errata mentioned at the end of the bug.


So since I have already talked about it here with my lengthy rambling 
post ;-) I would like to at least here "formally" suggest a #4 and ask 
whether I should comment on that bug or supply/submit a new one about 
it?


So my #4 would be:

4) communicate and dynamically update a list of free blocks being sent 
to the filesystem layer on top of a logical volume (LV) such that the 
filesystem itself is aware of shrinking free space.

Logic implies:
- any thin LV seeing more blocks being used causes the other filesystems 
in that thin pool to be updated with new available blocks (or numbers) 
if this amount becomes less than the filesystem normally would think it 
had

- any thin LV that sees blocks being discarded by the filesystem causes 
the other filesystems in that thin pool to be updated with newly 
available blocks (or numbers) op to the moment that the real available 
space agrees once more with the virtual available space (real free >= 
virtual free)

Meaning that this feedback would start happening for any thin LV when 
the real available space in the thin pool cq. volume group (depending on 
how that works at that point in that place in that configuration) 
becomes less then the virtual available space for the thin volume (LV)

This would mean that the virtual available space would in effect 
dynamically shrink and grow with the real available space as an 
envelope.

The filesystem may know this as an adjusted total available space 
(number of blocks) or as an adjusted number of unavailable blocks. It 
would need to integrate this in its free space calculation. For a user 
tool such as "df" there are 3 ways to update this changing information:

1. dynamically adjust the total available blocks
2. dynamically adjust the amount of free blocks
3. introduce a new field of "unavailable"

Traditional "df" is "total = used + free", the new one would be "total = 
used + free + unavailable".

For any user tool not working in blocks but simply available space 
(bytes) likely only the amount of free space being reported, would 
change.

One may choose to hide the information in "df" and introduce a new flag 
that shows unavailable as well?

Then only the amount of free blocks reported, would change, and the 
numbers just don't add up visibly.

It falls along the line of the "discard" family of communications that 
were introduced in 2008 (https://lwn.net/Articles/293658/).

I DO NOT KNOW if this already exists but I suppose it doesn't. I do not 
know a lot about the filesystem system. I just took the liberty to ask 
Jonathan Corwell erm Corbet whether this is possible :p.

Anyway, hopefully I am not being too much of a pain here. Regards.
