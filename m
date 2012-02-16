Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q1GEgT3K010732
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 09:42:29 -0500
Received: from qmta01.westchester.pa.mail.comcast.net
	(qmta02.westchester.pa.mail.comcast.net [76.96.62.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1GEgLfF015618
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 09:42:21 -0500
Message-ID: <4F3D15CC.1080901@mohawksoft.com>
Date: Thu, 16 Feb 2012 09:42:20 -0500
From: Mark Woodward <markw@mohawksoft.com>
MIME-Version: 1.0
References: <4F3D03AE.2050502@mohawksoft.com>
	<20120216135702.GA6212@redhat.com>
In-Reply-To: <20120216135702.GA6212@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Snapshots
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
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 02/16/2012 08:57 AM, Mike Snitzer wrote:
> On Thu, Feb 16 2012 at  8:25am -0500,
> Mark Woodward<markw@mohawksoft.com>  wrote:
>
>> I have been looking into LVM2 for a while now and while I think it
>> is useful for a range of applications, its seems pretty limited in
>> overall scope.
>>
>> Is there any active development happening? Most of the code seems
>> like bug-fixes or minor tweaks. Is the snapshot system being
>> improved? Specifically, snapshots of snapshots? thin provisioned
>> snapshots or auto-expand (i.e. snapshots don't run out of space).
>> If you look at technologies like ZFS snapshots are far better
>> supported, but ZFS will probably never be real under Linux, and it
>> really is far more than is really needed.
>>
>> So, I guess my questions are these: Is LVM in maintenance mode or is
>> there active development? If it is being actively developed, is
>> there a road map and is there a group or site specifically dedicated
>> to the development?
> Um, where are you even getting this idea that LVM2 is in maintenance
> mode?  Or that snapshots haven't improved?
>
> Sorry to come off defensive but your entire post is founded on incorrect
> understanding.

Understood, I apologize.
> Anyway, if you look at the change history of the lvm2 repository (be it
> cvs or git, cvs commits are mirrored to git) you'll see there have been
> regular changes flowing in and most recently a very extensive evolution
> of the code to add support for thin provisioning with highly efficient
> snapshots (ala btrfs or ZFS).
I guess I missed that. I need to check out the changes, looks like you 
have auto-grow with monitoring? I was looking more towards the 
"snapshots of snapshots" ability. Is that on the radar?

> try: git clone git://sources.redhat.com/git/lvm2
>
> take a look at the WHATS_NEW file and tell me what you think.
>
> Mike
