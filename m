Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m5GDw9mZ007396
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 09:58:09 -0400
Received: from mx03.syneticon.net (mx03.syneticon.net [87.79.32.166])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m5GDvuu5029667
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 09:57:56 -0400
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by mx03.syneticon.net (Postfix) with ESMTP id 882779654
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 15:57:55 +0200 (CEST)
Received: from mx03.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id VEB+V7Sg6fWS for <linux-lvm@redhat.com>;
	Mon, 16 Jun 2008 15:57:47 +0200 (CEST)
Received: from [192.168.10.145] (koln-4d0b73de.pool.mediaWays.net
	[77.11.115.222]) by mx03.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon, 16 Jun 2008 15:57:47 +0200 (CEST)
Message-ID: <4856715A.6050107@wpkg.org>
Date: Mon, 16 Jun 2008 15:57:46 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Server hangs when writing to LVM volume due to LVM
	Snapshots
References: <20080616135319.GA29234@campbell-lange.net>
In-Reply-To: <20080616135319.GA29234@campbell-lange.net>
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

Veselin Kantsev schrieb:
> Hello,
> I'm using LVM snapshots on the following configuration:
> 
> Debian lenny (2.6.24-1-amd64)
> 
> LVM version:     2.02.33 (2008-01-31)
> Library version: 1.02.24 (2007-12-20)
> Driver version:  4.12.0
> 
> 3ware 9000 Storage Controller device driver for Linux v2.26.02.010
> 
> I have a Logical volume running off a RAID5 for all my data.
> I recently started making daily LVM snapshots of this Logical volume.
> 
> The problem I'm experiencing now is that the server freezes if I try
> write a big chunk of data to the LVM volume.
> 
> Writing is OK on the second RAID (which holds the Debian OS)
> 
> Is there some known problem with writing lots of data to LVs while using
> LVM snapshots?

What is your RAM usage as you write to the snapshot?

Snapshots take some memory, and if you have lots of snapshots or they're 
just big, you can run out of memory.

Is it a possibility for you?


-- 
Tomasz Chmielewski
http://wpkg.org
