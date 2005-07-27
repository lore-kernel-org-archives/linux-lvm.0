Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j6RHKrV00539
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 13:20:53 -0400
Received: from aragorn.bbn.com (aragorn.bbn.com [128.33.0.62])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id j6RHKfWC026428
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 13:20:46 -0400
Received: from [128.89.72.74] (mgillen2.dsl.bbn.com [128.89.72.74])
	by aragorn.bbn.com (8.12.7/8.12.7) with ESMTP id j6RHKUDc002319
	for <linux-lvm@redhat.com>; Wed, 27 Jul 2005 13:20:30 -0400 (EDT)
Message-ID: <42E7C25E.10606@mattgillen.net>
Date: Wed, 27 Jul 2005 13:20:30 -0400
From: Matthew Gillen <me@mattgillen.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mirroring a Drive for load-balancing AND failover
References: <ca4f7e300507270144720cef7b@mail.gmail.com>	<42E786B9.2080400@mattgillen.net>
	<20050727142440.GA4954@null.msp.redhat.com>
In-Reply-To: <20050727142440.GA4954@null.msp.redhat.com>
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

AJ Lewis wrote:
> On Wed, Jul 27, 2005 at 09:06:01AM -0400, Matthew Gillen wrote:
> 
>>Fury wrote:
>>
>>>I've racked my brain on this one, so hopefully someone will be of some help.
>>>
>>>I'm trying to set up two servers which share a drive and do not have a
>>>Single Point of Failure.  They are on a local network with each other.
>>> The best solution would be to have /dev/sda1 on one server mirrored
>>>with /dev/sda1 on the second server.
>>>...
>>>A second solution was to use GFS/GNBD.  I can export each drive to the
>>>other server, and do RAID 1 (on both servers) between the local
>>>/dev/sda1 and the remote gnbd device.  I then format the raid device
>>>with GFS so both servers can mount it.
>>>
>>>Surprisingly, this last system works.  Both systems can mount the
>>>drive and read-write to it.  However, if either server in this
>>>configuration drops dead, the other server cannot deal with the dead
>>>gnbd device, and the raid device and mount point are no longer usable.
>>> I'm sure there are numerous other problems with this setup, also.
>>>
>>>So I'm looking for ideas.  With two servers, how can I mirror a drive
>>>in real-time, and allow for failover?
>>
>>You might want to use something more like iSCSI + RAID:
>>http://linux-iscsi.sourceforge.net/
> 
> 
> How is that different than GNBD + RAID?  The issue isn't the network
> transport, it's recovery of a RAID on two nodes simultaneously.
I don't think he was even worried about recovery, although you're right
and that's another problem.  I read that he couldn't access anything
after a failure of one server, which is what I was addressing.

Honestly, I don't know how GNBD works.  But if it makes makes the remote
volume look local and doesn't report problems in a way that RAID
understands (or at all), I can see how things would hang (just like a
client system would hang if an NFS server for a mounted filesystem went
down).  I imagine (but I don't know from personal experience) that iSCSI
(with the ConnFailTimeout=x sec) would report a failed write and RAID
knows how to handle that.

But, like I said, I don't know for sure about any of this, since I
haven't tried it.  However, the page:
http://linas.org/linux/raid.html
mentions iSCSI, so it appears that some people have gotten it to work.
--Matt
