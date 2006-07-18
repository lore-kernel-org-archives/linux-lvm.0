Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6IJGMdr021318
	for <linux-lvm@redhat.com>; Tue, 18 Jul 2006 15:16:22 -0400
Received: from chaos.chaos.ao.net (root@chaos.ao.net [208.5.40.6])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6IJGFfq021050
	for <linux-lvm@redhat.com>; Tue, 18 Jul 2006 15:16:16 -0400
Received: from [205.244.242.67] (mutley.ao.net [205.244.242.67])
	by chaos.chaos.ao.net (8.13.6/8.13.6/Debian-1) with ESMTP id
	k6IJGErk023279
	for <linux-lvm@redhat.com>; Tue, 18 Jul 2006 15:16:15 -0400
Message-ID: <44BD337D.8070005@chaos.ao.net>
Date: Tue, 18 Jul 2006 15:16:13 -0400
From: "Harik A'ttar" <harik@chaos.ao.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Error setting up a mirrored lv
References: <D81E5F9261AA644D90FF7B8E4005881737C122@PDBEX02E.pdb.fsc.net>
In-Reply-To: <D81E5F9261AA644D90FF7B8E4005881737C122@PDBEX02E.pdb.fsc.net>
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

Laurenz, Dirk wrote:
> Hi,
> 
> i'm doing this:
> 
>>> hgest3301:~/LVM2.2.02.06 # lvcreate -m1 -n lvmirror -L 10G 
>>> vgtest /dev/dm-55 /dev/dm-56
>>>   Not enough PVs with free space available for parallel allocation.
>>>   Consider --alloc anywhere if desperate.

> 
> what's wrong? 
> Is there any documentation out there?
> Why do we need three pvs? for a mirror?
> Are there any other options?

As you noticed, you need a log partition.  dm-mirror is a bit smarter 
then the basic MD raid1 in that it uses a log disk to keep track of 
write completions for synchronization.  I've only recently got a kernel 
that supports modern mirror, but it looks like the log file sticks at a 
single extent even with a 20gb mirror (all my free space).

Is there a reason that the mirror is on a separate volume rather then a 
serialized metadata chunk at the end of each?  Just for seektime 
performance reasons?
