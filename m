Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LJRqp04653
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 15:27:52 -0400
Received: from behemoth.sci.local (e2hst160.csg.stercomm.com [204.214.2.160])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3LJRnMc012926
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 15:27:49 -0400
Received: from stercomm.com (localhost [127.0.0.1])
	by behemoth.sci.local (Postfix) with ESMTP id 8C3FAA2A
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 14:27:43 -0500 (CDT)
Message-ID: <4086CB2E.8020001@stercomm.com>
Date: Wed, 21 Apr 2004 14:27:42 -0500
From: Chris Cox <chris_cox@stercomm.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid
References: <200404211908.i3LJ82cJ003525@smtp.doruk.net.tr>
In-Reply-To: <200404211908.i3LJ82cJ003525@smtp.doruk.net.tr>
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Vahric MUHTARYAN wrote:
> 	Okey you mean create a new raid5 with new disks and add it to volume
> group okey you right . 
> 
> 	But My question is , Think that I have raid5 array with 3 disk ( I'm
> using ICP Raid controller card )  then I add 4.th disk to my raid array ( I
> know clearly that I can extend raid5 ) at this I have more disk space but I
> have to intorduce it to system , and I can't imagine How ?! it's easy if I
> have free partiton but I can't show this extended array like a free
> partition  :( 

If you truly can "extend raid5", you have a totally different disk
essentially.  It's nice that you have a HW raid that allows you to
extend RAID 5 (an icky mess for sure.. probably takes a while to
do the reshuffling).  I don't know how to tell LVM that the disk itself
has actually gotten bigger.  Interesting problem, I doubt there's
an answer for this though (but I could be wrong).

I think if I wanted an extensible array setup, I would consider
just aggregating a set of mirror'd drives into a volume group.
That way, I could just add two more disks, create a new hw logical
raid 1 drive, and add that to my volume group.  Something I will
consider doing.
