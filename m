Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5ME1uu23356
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 10:01:56 -0400
Received: from ctg-msnexc01.staff.berbee.com (msn-office-flr2.binc.net
	[64.73.12.254])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j5ME1kVx020428
	for <linux-lvm@redhat.com>; Wed, 22 Jun 2005 10:01:50 -0400
Message-ID: <42B96F3E.9090402@berbee.com>
Date: Wed, 22 Jun 2005 09:01:34 -0500
From: Alan Jurgensen <jurgensen@berbee.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM is low
References: <42B6ECDB.8050100@adsis.fr>
	<42B95A45.1080308@adsis.fr>	<42B96078.8090504@dsvr.net>
	<42B96CFF.9050505@adsis.fr>
In-Reply-To: <42B96CFF.9050505@adsis.fr>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, greg@adsis.fr

Why dont you create a 'regular' reiserfs partition on the same server 
and re-try your transfer.

Comparing to another server isnt really fair; too many other factors: OS 
level, Network, Config, Server Load, Hardware, Disks, etc.

Scp isn't a good gauge of disk performance, as its bottlenecks are 
network and CPU (decryption). Why not try 'bonnie', a disk benchmarker.


>>
>> Could you try explaining "really low" some more?
>>  
>>
> I copy lots of files with scp, from an old server to this new one with 
> LVM. The system is unsuable during the copy, but not with a server 
> with standards partitions...
>

-- 

----------------------------------------------------------------------
Alan W. Jurgensen - Berbee Information Networks - jurgensen@berbee.com 
