Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j29M93n28580
	for <linux-lvm@redhat.com>; Wed, 9 Mar 2005 17:09:03 -0500
Received: from mail.utsl.gen.nz (210-54-92-184.ipnets.xtra.co.nz
	[210.54.92.184])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j29M8u9Q004170
	for <linux-lvm@redhat.com>; Wed, 9 Mar 2005 17:08:56 -0500
Message-ID: <422F73E8.4070707@vilain.net>
Date: Thu, 10 Mar 2005 11:08:40 +1300
From: Sam Vilain <sam@vilain.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Building up a RAID5 LVM home server (long)
	[0x05B52F13]
References: <422F679C.8010003@boyko.net>
In-Reply-To: <422F679C.8010003@boyko.net>
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
To: Andy Boyko <andy@boyko.net>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

Andy Boyko wrote:
>>The underlying principle, is keeping the MD layer as simple as possible,
>>so that you've got nice little resilient building blocks for your Volume
>>Group.  Never use concatenation, striping or RAID5 at the MD layer if
>>you've got LVM, it's simply in the wrong place!
> Could you by any chance explain this?  Assuming, say, five identical
> disks, is it really wrong to make an MD RAID-5 out of them, and then
> put an LVM LV atop that, for later extension?   I'm feeling pretty 
> dopey, 'cause I'm not immediately grasping what would be an alternative 
> MD/LVM/EVMS/whatever approach, assuming you do fundamentally want N-1 
> worth of available space from those disks.  What am I missing?

Sorry, I shouldn't have said "never".  All I'm saying is that most of
the time, you think you want this but in balance you probably want to
simply buy a few more disks, or bigger disks, instead of worrying
about an extra X% of space, which invariably will just increase
backup requirements anyway.

If you do have an equally sized (ideally also homogenous brand/model)
set of disks, *and you don't overly care about write performance or
excessive performance degradation in the case of a single failure*,
then sure, RAID 5 setup as you say is the right solution.

This is just an old saying repeated.

   RAID - Fast, Cheap, Reliable.  Pick any two.

fast+cheap = raid 0/striping
fast+reliable = raid 1 or 10
cheap+reliable = raid 5

Sam.
