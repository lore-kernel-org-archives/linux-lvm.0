Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GFBSip007201
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 11:11:28 -0400
Received: from campbell-lange.net (no.rdns-yet.ukservers.com [78.110.169.69]
	(may be forged))
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GFAKCs016306
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 11:10:20 -0400
Date: Mon, 16 Jun 2008 16:10:14 +0100
From: Veselin Kantsev <veselin@campbell-lange.net>
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
Message-ID: <20080616151014.GJ3765@campbell-lange.net>
References: <20080616135319.GA29234@campbell-lange.net>
	<4856715A.6050107@wpkg.org>
	<20080616141907.GH3765@campbell-lange.net>
	<48567DF8.7080600@wpkg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <48567DF8.7080600@wpkg.org>
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
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Tomasz,

Here is some more hardware info related to HDDs and RAID card:

Unit  UnitType  Status         %RCmpl  %V/I/M  Stripe  Size(GB)  Cache AVrfy
------------------------------------------------------------------------------
u0    RAID-1    OK             -       -       -       232.82    ON    OFF
u1    RAID-5    OK             -       -       64K     2095.44   ON    OFF

Port   Status           Unit   Size        Blocks        Serial
---------------------------------------------------------------
p0     OK               u0     232.88 GB   488397168     6RY461CT
p1     OK               u0     232.88 GB   488397168     6RY44PSH
p2     OK               u1     698.63 GB   1465149168    WD-WCAPT0527412
p3     OK               u1     698.63 GB   1465149168    WD-WCAPT0537910
p4     OK               u1     698.63 GB   1465149168    WD-WCAPT0527026
p5     OK               u1     698.63 GB   1465149168    WD-WCAPT0527156
p6     NOT-PRESENT      -      -           -             -
p7     NOT-PRESENT      -      -           -             -

Name  OnlineState  BBUReady  Status    Volt     Temp     Hours LastCapTest
---------------------------------------------------------------------------
bbu   On           Yes       OK        OK       OK       0     xx-xxx-xxxx



Output from "free":

             total       used       free     shared    buffers cached
Mem:       6119216    5964204     155012          0     393880 2291796
-/+ buffers/cache:    3278528    2840688
Swap:      3903784       1940    3901844



The snapshots are 180GB each.

The current writing process freezes and working with the LV becomes
impossible both locally and through the network.

I've also noticed that any users browsing the LV via samba or
netatalk (the LV is shared on the network) report that the network share
slows down to the point where they cannot browse the folders any more.

Otherwise the system remains operational as it is installed on a
sepparate RAID1. 

When the problem occurs, killing the process thats writing to the LV, 
helps.



By the way, there is a second server with different specs but using LVM
snapshots in the same fashion and I've managed to reproduce the same
problem.

Regards,
Veselin

On Mon, Jun 16, 2008 at 04:51:36PM +0200, Tomasz Chmielewski wrote:
> Veselin Kantsev schrieb:
>> Hello Tomasz,
>> thank you much for the prompt reply.
>>
>> The server has 6119216k of RAM in total.
>
> That's quite a bit..
> You would need terabytes of snapshots to fill it.
> So perhaps it hangs for a different reason.
>
> Capacitors? Hardware?
>
>
>> And most of it is shown as used all the time (To my knowledge thats just how
>> linux utilizes ram). 
>
> Please show the output of "free" command. The "buffers/cache" line is  
> your current RAM usage, excluding buffers (more or less).
>
>
>> But from memory, the last time the server froze during copying (goes
>> back to normal once I kill the copy process) I didn't notice any extreme
>> RAM usage or swapping.
>
> Kernel data in memory used for snapshots will not be swapped out.
>
>
>> As I'm rotating LVM snapshots weekly, there are 7 snapshots on the system
>> at all times, and 1 of them is active(the last one taken).
>
> (...)
>
>> Do you see a flaw in this process that might be causing the issues?
>
> Unless you have terabytes of data in snapshots, it shouldn't be a problem.
>
> Does it freeze for good? Machine stops responding, stops logging, etc.?
>
>
> -- 
> Tomasz Chmielewski
> http://wpkg.org
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
