Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5O6N3028677
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 02:23:03 -0400
Received: from loner.lunanet.biz (pos2.dataventures.com [207.188.144.124] (may
	be forged))
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5O6N0e1026698
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 02:23:02 -0400
Received: from junior (junior.lunanet.biz [192.168.102.1])
	by loner.lunanet.biz (8.12.9/8.12.9) with ESMTP id i5O6NI6t024337
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 00:23:21 -0600 (MDT)
Received: from dante.lunanet.biz ([192.168.101.20] helo=www.lunanet.biz)
	by junior with esmtp (Exim 4.30) id 1BdNYz-0000Np-OD
	for linux-lvm@redhat.com; Thu, 24 Jun 2004 00:18:21 -0600
Message-ID: <59032.192.168.101.20.1088057904.squirrel@192.168.101.20>
In-Reply-To: <200406221410.14271.kevcorry@us.ibm.com>
References: <35454.192.168.101.20.1087928919.squirrel@192.168.101.20>
	<200406221410.14271.kevcorry@us.ibm.com>
Date: Thu, 24 Jun 2004 00:18:24 -0600 (MDT)
Subject: Re: [linux-lvm] 2.6.7 and snapshots
From: "Donald Thompson" <dlt@lunanet.biz>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: linux-lvm@redhat.com

> On Tuesday 22 June 2004 1:28 pm, Donald Thompson wrote:
>> Sorry I'm getting desperate...
>>
>> Whats the status on dm patches for 2.6.7? The patches available for
>> 2.6.7-rc3 (the latest I've been able to obtain) don't insert cleanly
>> into
>> a vanilla 2.6.7 and its looking like it might be very difficult to hand
>> patch the rejects. Due to security issues with 2.6.6, I'm very eager to
>> get the 2.6.7 kernel installed, but I'm held back due to a snapshot
>> requirement. I'm happy to test 'untested' patches if need be. If its a
>> matter of man hours to port the patches to 2.6.7, I can help with that
>> as
>> well, but being lazy I'd rather not reinvent the wheel if something is
>> already available or going to be soon.
>
> I would recommend simply grabbing the latest -bk or -mm patch for 2.6.7.
> Most
> of what you're interested in will be in that patch, and will be in 2.6.8
> whenever it is released. The only reason you'll need -udm at this point is
> if
> you are using/testing dm-multipath.
>
> http://www.kernel.org/pub/linux/kernel/v2.6/snapshots/patch-2.6.7-bk5.bz2

patch-2.6.7-bk6 worked. bk5 was not very stable for me, having problems
unrelated to lvm. Thanks for pointing me in the right direction.

-Don
