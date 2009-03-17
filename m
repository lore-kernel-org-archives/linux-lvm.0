Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2HIHGas006527
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 14:17:17 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2HIH2pc014493
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 14:17:02 -0400
Received: from ns1.futuresource.com (ns3.futuresource.com [10.207.192.125])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n2HIH25V028425
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 13:17:02 -0500
Received: from [10.207.193.131] (les-xp.futuresource.com [10.207.193.131])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n2HIH2r00369
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 13:17:02 -0500
Message-ID: <49BFE91E.4030600@gmail.com>
Date: Tue, 17 Mar 2009 13:17:02 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>	<20090313203812.GK7445@agk.fab.redhat.com>	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>	<49BC511E.5040402@esiway.net>	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>	<49BFC936.8000508@esiway.net>
	<Pine.LNX.4.64.0903171243310.28733@bmsred.bmsi.com>
In-Reply-To: <Pine.LNX.4.64.0903171243310.28733@bmsred.bmsi.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Stuart D. Gathman wrote:
> On Tue, 17 Mar 2009, Marco Colombo wrote:
> 
>> It seems to me that in my setup, disabling the caches on the disks does
>> bring data to the platters, and that noone is "lying" about fsync.
>>
>> Now I'm _really_ confused.
> 
> That's been my claim all along - that the broken fsync only affects
> on disk cache.  LVM itself does not reorder writes in any way - it just
> fails to pass along the write barrier.  fsync() does *start* writing
> the dirty buffers (implemented in the fs code).  It just doesn't 
> wait for the writes to finish getting to the platters.  Apparently,
> it does wait for the write to get to the drive (but I'm not certain).

Given that fsync() is supposed to return the status of the completion of 
the physical write, that sounds broken to me.  Do the LVM's in question 
here have more than one underlying device, and does it matter?

-- 
   Les Mikesell
    lesmikesell@gmail.com
