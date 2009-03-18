Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2I0bM1g024145
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 20:37:22 -0400
Received: from nazgul.esiway.net (Nazgul.ESIWAY.NET [193.194.16.154])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2I0b5Uw031428
	for <linux-lvm@redhat.com>; Tue, 17 Mar 2009 20:37:06 -0400
Received: from Megathlon.ESI (Ghost.esi.it [193.194.16.225])
	by nazgul.esiway.net (8.13.8/8.13.8) with ESMTPS id n2I0b5DY008096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-lvm@redhat.com>; Wed, 18 Mar 2009 01:37:05 +0100
Received: from frodo.esi (Frodo.ESI [10.10.10.13])
	by Megathlon.ESI (8.14.1/8.14.1) with ESMTP id n2I0b4tm002702
	for <linux-lvm@redhat.com>; Wed, 18 Mar 2009 01:37:05 +0100
Message-ID: <49C04230.80603@esiway.net>
Date: Wed, 18 Mar 2009 01:37:04 +0100
From: Marco Colombo <linux-lvm@esiway.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] fsync() and LVM
References: <49BA9BF9.3070507@esiway.net><Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>	<20090313203812.GK7445@agk.fab.redhat.com>	<7B7881568CF40E4388B615CD06F87B98098BDA@clara.maurer-it.com>	<Pine.LNX.4.64.0903141028190.6115@bmsred.bmsi.com>	<49BC511E.5040402@esiway.net>	<Pine.LNX.4.64.0903161314310.22113@bmsred.bmsi.com>	<49BFC936.8000508@esiway.net>	<Pine.LNX.4.64.0903171243310.28733@bmsred.bmsi.com>
	<49BFE91E.4030600@gmail.com>
In-Reply-To: <49BFE91E.4030600@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Les Mikesell wrote:
> Stuart D. Gathman wrote:
>>
>> That's been my claim all along - that the broken fsync only affects
>> on disk cache.  LVM itself does not reorder writes in any way - it just
>> fails to pass along the write barrier.  fsync() does *start* writing
>> the dirty buffers (implemented in the fs code).  It just doesn't wait
>> for the writes to finish getting to the platters.  Apparently,
>> it does wait for the write to get to the drive (but I'm not certain).
> 
> Given that fsync() is supposed to return the status of the completion of
> the physical write, that sounds broken to me.  Do the LVM's in question
> here have more than one underlying device, and does it matter?
> 

According to my tests, you get a 50x speedup when you turn the cache on.
It means that fsync is waiting for something to happen, and this "something"
happens 50 times faster only when you turn the disk write-back cache on.

It seems to me that the only explanation is that fsync is waiting for disk
I/O to complete (and not just to begin otherwise the time would be the same).
With the cache enabled, the disk reports completion when the data is in the
cache (write-back behaviour), with cache disabled it waits for the data
to be on platters (write-thru behaviour).

.TM.
