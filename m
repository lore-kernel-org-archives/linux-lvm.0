Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GEJQYH025651
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 10:19:26 -0400
Received: from campbell-lange.net (no.rdns-yet.ukservers.com [78.110.169.69]
	(may be forged))
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GEJClH011829
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 10:19:12 -0400
Received: from veselin by campbell-lange.net with local (Exim 4.69)
	(envelope-from <veselin@campbell-lange.net>) id 1K8FY3-00062A-3h
	for linux-lvm@redhat.com; Mon, 16 Jun 2008 15:19:07 +0100
Date: Mon, 16 Jun 2008 15:19:07 +0100
From: Veselin Kantsev <veselin@campbell-lange.net>
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
Message-ID: <20080616141907.GH3765@campbell-lange.net>
References: <20080616135319.GA29234@campbell-lange.net>
	<4856715A.6050107@wpkg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4856715A.6050107@wpkg.org>
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

Hello Tomasz,
thank you much for the prompt reply.

The server has 6119216k of RAM in total.
And most of it is shown as used all the time (To my knowledge thats just how
linux utilizes ram). 

But from memory, the last time the server froze during copying (goes
back to normal once I kill the copy process) I didn't notice any extreme
RAM usage or swapping.


As I'm rotating LVM snapshots weekly, there are 7 snapshots on the system
at all times, and 1 of them is active(the last one taken).

The script that I use for creating the snapshots, checks the current day
of the week removes last weeks snapshot and creates new one.

So:
On monday, check if snapshot.monday exists, lvremove it and lvcreate new
snapshot.monday.
On tuesday, remove snapshot.tuesday if exists, then create new
snapshot.tuesday.
And so on.


Do you see a flaw in this process that might be causing the issues?

Regards,
Veselin


On Mon, Jun 16, 2008 at 03:57:46PM +0200, Tomasz Chmielewski wrote:
> Veselin Kantsev schrieb:
>> Hello,
>> I'm using LVM snapshots on the following configuration:
>>
>> Debian lenny (2.6.24-1-amd64)
>>
>> LVM version:     2.02.33 (2008-01-31)
>> Library version: 1.02.24 (2007-12-20)
>> Driver version:  4.12.0
>>
>> 3ware 9000 Storage Controller device driver for Linux v2.26.02.010
>>
>> I have a Logical volume running off a RAID5 for all my data.
>> I recently started making daily LVM snapshots of this Logical volume.
>>
>> The problem I'm experiencing now is that the server freezes if I try
>> write a big chunk of data to the LVM volume.
>>
>> Writing is OK on the second RAID (which holds the Debian OS)
>>
>> Is there some known problem with writing lots of data to LVs while using
>> LVM snapshots?
>
> What is your RAM usage as you write to the snapshot?
>
> Snapshots take some memory, and if you have lots of snapshots or they're  
> just big, you can run out of memory.
>
> Is it a possibility for you?
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
