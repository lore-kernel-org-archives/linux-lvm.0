Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i83F5d308189
	for <linux-lvm@redhat.com>; Fri, 3 Sep 2004 11:05:39 -0400
Received: from mail2.m-cam.com ([63.124.102.77])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i83F5Xf8013977
	for <linux-lvm@redhat.com>; Fri, 3 Sep 2004 11:05:33 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail2.m-cam.com (Postfix) with ESMTP id DE7213E8EE
	for <linux-lvm@redhat.com>; Fri,  3 Sep 2004 11:00:51 -0400 (EDT)
Received: from mail2.m-cam.com ([127.0.0.1])
	by localhost (mail2.m-cam.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 12400-10 for <linux-lvm@redhat.com>;
	Fri,  3 Sep 2004 11:00:48 -0400 (EDT)
Received: from [192.168.1.21] (unknown [192.168.1.21])
	by mail2.m-cam.com (Postfix) with ESMTP id 9C9513E8B9
	for <linux-lvm@redhat.com>; Fri,  3 Sep 2004 11:00:48 -0400 (EDT)
Message-ID: <4138882E.40400@m-cam.com>
Date: Fri, 03 Sep 2004 11:05:18 -0400
From: Arshavir Grigorian <ag@m-cam.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Re: partition strategy
References: <412CE781.9000409@m-cam.com>
	<41363AA0.5030107@m-cam.com>	<20040902174230.GG6264@agk.surrey.redhat.com>	<4137A15E.30208@m-cam.com>
	<20040903124909.GN6264@agk.surrey.redhat.com>
In-Reply-To: <20040903124909.GN6264@agk.surrey.redhat.com>
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

Alasdair G Kergon wrote:

>>>>>Is it better to create 3 partitions 2 x230G + 1G 
>>>>>Is it better to create 2 paritions 230G and 231G, put both in a vg, 
>>>>>          
>>>>>
>
>  
>
>>>ie the first option.  
>>>      
>>>
>I meant the second option:-)
>
>  
>
>>Could you, please tell me what I am doing wrong? TIA.
>>    
>>
> 
>  
>
>>casals:~# lvextend -l +134 /dev/vg00/lvol0 /dev/hdc3
>> Using stripesize of last segment 8KB
>> Insufficient allocatable extents suitable for parallel use for logical 
>>volume lvol0: 118816 required
>>    
>>
>
>If you don't specify the stripe settings, lvextend uses whatever
>the last segment of the LV you're extending uses i.e. 2 stripes in 
>this case.  So you need to specify -i1 to add a new segment with
>just one stripe.
>
>Alasdair
>  
>
Many thanks. It all makes sense now.
The way I got it working is just creating 2 partititions, getting the 
number of extends from the smaller partition, creating a striped lv with 
that paritition count, then extending it to the remaining the extents as 
with a single stripe.


Arshavir
