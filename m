Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i81LAF304301
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 17:10:15 -0400
Received: from mail2.m-cam.com ([63.124.102.77])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i81LAES0004771
	for <linux-lvm@redhat.com>; Wed, 1 Sep 2004 17:10:14 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail2.m-cam.com (Postfix) with ESMTP id 4D2F73E8EE
	for <linux-lvm@redhat.com>; Wed,  1 Sep 2004 17:05:16 -0400 (EDT)
Received: from mail2.m-cam.com ([127.0.0.1])
	by localhost (mail2.m-cam.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 08256-01 for <linux-lvm@redhat.com>;
	Wed,  1 Sep 2004 17:05:14 -0400 (EDT)
Received: from [192.168.1.21] (unknown [192.168.1.21])
	by mail2.m-cam.com (Postfix) with ESMTP id F098F3E8B9
	for <linux-lvm@redhat.com>; Wed,  1 Sep 2004 17:05:13 -0400 (EDT)
Message-ID: <41363AA0.5030107@m-cam.com>
Date: Wed, 01 Sep 2004 17:09:52 -0400
From: Arshavir Grigorian <ag@m-cam.com>
MIME-Version: 1.0
References: <412CE781.9000409@m-cam.com>
In-Reply-To: <412CE781.9000409@m-cam.com>
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Re: partition strategy
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
To: linux-lvm@redhat.com

Arshavir Grigorian wrote:

> Hi,
>
> This is my first post, so please bear with me.
>
> I have 2 free disk areas 230G and 231G. I hoping to take advantage of 
> RAID-0.
>
> Is it better to create 3 partitions 2 x230G + 1G - create a striped LV 
> over the first 2, then add the third to the volume group, then extend 
> the LV over to the new 1G extension (since LVM2 allows extending 
> striped lv-s). And if so, does the non-striped area get used as a last 
> resort (after the striped area is completely full)?
>
> OR
>
> Is it better to create 2 paritions 230G and 231G, put both in a vg, 
> create a striped lv and lvm will take care of striping to the 230G 
> mark, then writing linearly afterwards.
>
> TIA for any advice.
>
>
>
> Best,
>
> Arshavir
>
Hi,

I mailed the above message about a week ago and there have not been any 
reponses.
I am wondering whether there is a development list where I might have a 
better chance of getting an answer to my question (the HOWTO page did 
not mention any dev lists, so I am not sure).
Many thanks.


Arshavir
