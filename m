Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3A6ZAK0020027
	for <linux-lvm@redhat.com>; Thu, 10 Apr 2008 02:35:10 -0400
Received: from server.onart.com.tr (dsl.static81214109175.ttnet.net.tr
	[81.214.109.175] (may be forged))
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3A6Ywrk021914
	for <linux-lvm@redhat.com>; Thu, 10 Apr 2008 02:34:59 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by server.onart.com.tr (Postfix) with ESMTP id AA75E3340001
	for <linux-lvm@redhat.com>; Thu, 10 Apr 2008 09:34:42 +0300 (EEST)
Received: from server.onart.com.tr ([127.0.0.1])
	by localhost (server.onart.com.tr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dIO6zhqpOLKP for <linux-lvm@redhat.com>;
	Thu, 10 Apr 2008 09:34:41 +0300 (EEST)
Received: from [10.0.0.12] (unknown [10.0.0.12])
	(using SSLv3 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by server.onart.com.tr (Postfix) with ESMTP id 3C8A956FC1B1
	for <linux-lvm@redhat.com>; Thu, 10 Apr 2008 09:34:41 +0300 (EEST)
Message-ID: <47FDB513.8080302@onart.com.tr>
Date: Thu, 10 Apr 2008 09:34:59 +0300
From: Mufit Eribol <hme@onart.com.tr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Problem with partition table on LV
References: <47EE2926.3020201@onart.com.tr> <20080329224010.GA6475@laptop.home>
In-Reply-To: <20080329224010.GA6475@laptop.home>
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

David Robinson wrote:
>> Disk /dev/sdc doesn't contain a valid partition table
>>     
>
> That's not an error. Its simply saying that there is no partition table on sdc.
> You don't necessarily need a partition table. A lot of people actually setup
> their system like this, especially when the device is from a SAN.
>
>   
>>  --- Physical volume ---
>>  PV Name               /dev/sdc
>>     
>
> LVM is using the correct device. You don't need to change anything.
>
>   
>> [root@server ~]# pvscan
>>  PV /dev/sdc   VG raid_vg0   lvm2 [744.97 GB / 480.00 MB free]
>>  Total: 1 [744.97 GB] / in use: 1 [744.97 GB] / in no VG: 0 [0   ]
>>     
>
> --Dave
Sorry for being late. Thank you very much for your reply, Dave. I feel 
better.

Best wishes,
Mufit
