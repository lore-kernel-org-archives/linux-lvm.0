Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n6R3UgWI000581
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 23:30:42 -0400
Received: from moutng.kundenserver.de (moutng.kundenserver.de [212.227.17.10])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n6R3UQ0b027899
	for <linux-lvm@redhat.com>; Sun, 26 Jul 2009 23:30:27 -0400
Received: from localhost.housecafe.de ([127.0.0.1] helo=localhost)
	by bogon.housecafe.de with esmtp (Exim 4.69)
	(envelope-from <lists@nerdbynature.de>) id 1MVGuq-000394-Kr
	for linux-lvm@redhat.com; Mon, 27 Jul 2009 05:30:20 +0200
Date: Sun, 26 Jul 2009 20:30:20 -0700 (PDT)
From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: [linux-lvm] lvm2 confused about double UUID
In-Reply-To: <4A6D1739.2040708@cox.net>
Message-ID: <alpine.DEB.2.01.0907262020090.6426@bogon.housecafe.de>
References: <alpine.DEB.2.01.0907261703270.6426@bogon.housecafe.de>
	<4A6CF9C0.6020902@cox.net>
	<alpine.DEB.2.01.0907261808300.6426@bogon.housecafe.de>
	<4A6D1739.2040708@cox.net>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sun, 26 Jul 2009 at 21:55, Ron Johnson wrote:
> So the issue seems really the deeper fact that you've got two physical devices
> with the same UUID.  All your lvm issues tumble out from there.
> 
> Is that a good summary?

Yes, that's it. I know, having 2 physical volumes with the same UUID is 
not cool and is certainly not supported, but due to the split that's what 
I have here now and I assumed that I could convince LVM via the filter 
directive to use a certain device for vg02. I mean, vg02 is working fine, 
but I really want to format either sdb or sdc, but I'm afraid of 
destroying something in the LVM layout...

Let me ask another thing: when I assume for a moment that "pvs" is lying 
and really sdc is used for vg02, I'd go ahead and 1) pvcreate sdb, thus 
assigning a new UUID to sdb and 2) remove the filter from lvm.conf. LVM 
should not complain any more (since we have 2 different UUIDs now) and I/O 
still goes to sdc, as it is now apparently. If things go wrong, how can I 
restore the LVM header on sdb? (Would "pvcreate --uuid <old-UUID>" do the 
trick? Or restoring with dd? How many bytes are changed when using 
pvcreate?)

Christian.
-- 
BOFH excuse #281:

The co-locator cannot verify the frame-relay gateway to the ISDN server.
