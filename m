Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5AFYm009604
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 11:34:48 -0400
Received: from mail.ukfsn.org (s2.ukfsn.org [217.158.120.143])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5AFYgXn014797
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 11:34:42 -0400
Received: from localhost (lucy.ukfsn.org [127.0.0.1])
	by mail.ukfsn.org (Postfix) with ESMTP id 6E870E6A8B
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 16:32:32 +0100 (BST)
Received: from mail.ukfsn.org ([127.0.0.1])
	by localhost (lucy.ukfsn.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 11717-05 for <linux-lvm@redhat.com>;
	Thu, 10 Jun 2004 16:32:32 +0100 (BST)
Received: from oak.dgreaves.com (modem-2300.putangitangi.dialup.pol.co.uk
	[81.78.200.252]) by mail.ukfsn.org (Postfix) with ESMTP id B533BE6A83
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 16:32:31 +0100 (BST)
Received: from ash.dgreaves.com.dgreaves.com ([10.0.0.126])
	by oak.dgreaves.com with esmtp (Exim 4.20) id 1BYRbH-0007Ye-Mb
	for linux-lvm@redhat.com; Thu, 10 Jun 2004 16:36:19 +0100
Message-ID: <40C87F8A.7080304@dgreaves.com>
Date: Thu, 10 Jun 2004 16:34:34 +0100
From: David Greaves <david@dgreaves.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM2 seems to chop performance by 33%
References: <40C86F52.4090500@dgreaves.com>
	<200406101105.47606.StuartHarper@tampabay.rr.com>
In-Reply-To: <200406101105.47606.StuartHarper@tampabay.rr.com>
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

Thanks

I'd tried that, but no real change. I started 1t 128k and also tried 
64k, 256k :) (oh, and 1k)

dd if=/dev/video_vg/video_lv of=/dev/null bs=4k count=256k
262144+0 records in
262144+0 records out
1073741824 bytes transferred in 24.130318 seconds (44497624 bytes/sec)

dd if=/dev/md0 of=/dev/null bs=4k count=256k
262144+0 records in
262144+0 records out
1073741824 bytes transferred in 15.404947 seconds (69701105 bytes/sec)

David

PS wait 'til you see what I'm getting through Rieserfs on top of it!
<sigh>
cu:/huge/editing/tmp# time dd if=dummy.deleteme of=/dev/null bs=4k 
count=256k
262144+0 records in
262144+0 records out
1073741824 bytes transferred in 31.627904 seconds (33949193 bytes/sec)
so throughput down by a factor of 2...
but 1 step at a time....

Stuart Harper wrote:

>While doing backups of my LVM2 drive, I've found that setting the DD block 
>size to 4096 greatly improved my performance. Formerly, DDs on my 240G LVM 
>were taking 23hrs to complete with a block size of 512 or 1024. The same 
>volume now takes less than 2 hours with a block size of 4096. Large numbers 
>did not seem to increase DD speed.
>
>On Thursday 10 June 2004 10:25 am, David Greaves wrote:
>  
>
>>65Mb/s on the raid5 device
>>44Mb/s on the lv
>>
>>Is this expected?
>>
>>Kernel 2.6.6
>>
>>representative dd's:
>>
>>cu:/huge/editing/tmp# time dd if=/dev/video_vg/video_lv of=/dev/null
>>bs=1024k count=4k
>>David
>>    
>>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>
