Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iAIHNcr14236
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 12:23:38 -0500
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iAIHNRwJ005706
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 12:23:27 -0500
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id 5C2E7E6A96
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 17:21:13 +0000 (GMT)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 28488-03 for <linux-lvm@redhat.com>;
	Thu, 18 Nov 2004 17:21:13 +0000 (GMT)
Received: from oak.dgreaves.com (modem-1848.parera.dialup.pol.co.uk
	[81.78.183.56]) by mail.ukfsn.org (Postfix) with ESMTP id 211A2E6A86
	for <linux-lvm@redhat.com>; Thu, 18 Nov 2004 17:21:12 +0000 (GMT)
Received: from ash.dgreaves.com ([10.0.0.101])
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1CUq4R-0007ZC-TG
	for linux-lvm@redhat.com; Thu, 18 Nov 2004 17:27:47 +0000
Message-ID: <419CDA86.6050503@dgreaves.com>
Date: Thu, 18 Nov 2004 17:23:18 +0000
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Software RAID 5 Resizing and LVM
References: <OF26153F74.622A298A-ON86256F4F.005C138B-86256F4F.005CBE3E@austinlogistics.com>
	<1100732495.2496.6.camel@Slacktop.local>
In-Reply-To: <1100732495.2496.6.camel@Slacktop.local>
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

For those googling this thread, can I also suggest looking at EVMS.

I'm in the same situation and it appears that EVMS now have an md raid 5 
grow facility that manages this up through an 'lvresize' operation and 
into a xfs_growfs.

I have a 5x250Gb raid5 with lvm2 - I want to grow to 6x250Gb.

Seems neat and doesn't have the 'may eat your babies' threats of raidreconf.

I've not tried it yet so YMMV.

David
PS I'm LVM2 too


Adam K-F wrote:

>Thanks Jon,
>
>What I was trying to achieve was a a single, really big raid drive that
>I could _easily_ expand later on down the track.  It only needs to have
>the single filesystem on it (i'm going to use reiserfs) which has to be
>resizable (using resize_reiserfs).
>
>So yeah, I ended figuring out what i actally needed to do in the end,
>after playing with LVM, which incidently was a bit of fun :)  I've found
>an application for it for my other file server. As they say, all's well
>that ends well :)
>
>Adam
>  
>
>
> ------------------------------------------------------------------------
>
>I asked pretty much that exact question on Monday! :)  The only difference
>was that mine is a hardware RAID.  Someone replied with a possible
>workaround if you're using LVM2, but if you're using LVM1 like me, and you
>pvcreate'd your PV across the entire disk like me, then you're screwed like
>me. :(
>
>If you partitioned the logical disk and pvcreate'd a partition, then you
>should be able to create a new partition on the newly-available space, then
>pvcreate a second PV and add it into the VG.  The wonders of 20/20
>hindsight.
>
>Cheers,
>
>Jon Etkins
>IT Administration & Support
>Austin Logistics, Inc
>ph:  (512) 651-5641
>fax: (512) 329-5625
>
>
>linux-lvm-bounces@redhat.com wrote on 11/16/2004 05:29:54 PM:
>
>  
>
>>I've been playing around with adding disks to a software RAID 5 array,
>>    
>>
>and it
>  
>
>>works fine.  However, i have LVM running over the top of that and i can't
>>figure out how to enlarge the Phisical Volume to encompass the newly
>>    
>>
>added
>  
>
>>capacity on the raid device.  Has anyone achieved this at all?
>>
>>Am I barking up the wrong tree here? If so, how would you go about
>>adding drives
>>to a software RAID 5 device, and actually adding the new space to
>>the filesystem
>>inside the RAID device?
>>
>>Thanks in advance
>>
>>Adam
>>
>>----------------------------------------------------------------
>>This message was sent using IMP, the Internet Messaging Program.
>>
>>_______________________________________________
>>linux-lvm mailing list
>>linux-lvm@redhat.com
>>https://www.redhat.com/mailman/listinfo/linux-lvm
>>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>>    
>>
