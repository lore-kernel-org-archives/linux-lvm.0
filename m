Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l3EF041S024979
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 11:00:04 -0400
Received: from extmail.dtnet.de (extmail.dtnet.de [87.193.12.202])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l3EF02oP026838
	for <linux-lvm@redhat.com>; Sat, 14 Apr 2007 11:00:03 -0400
Message-ID: <4620E73F.50100@dtnet.de>
Date: Sat, 14 Apr 2007 16:37:51 +0200
From: Daniel Schwager <daniel.schwager@dtnet.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Limitation: Snapshots does not work in
	cluster	enviroment ?
References: <4620D7E3.9090609@dtnet.de>
	<20070414145250.GI26983@agk.fab.redhat.com>
In-Reply-To: <20070414145250.GI26983@agk.fab.redhat.com>
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



Alasdair G Kergon schrieb:
> On Sat, Apr 14, 2007 at 03:32:19PM +0200, Daniel Schwager wrote:
>   
>> So, is it not possible to create a LVM2 snapshot on one server and use
>> it in another server ?
>>     
>  
> Not simultaneously.  Origin+Snapshot(s) can only be used on one machine
> at once.
>   
So, i want to use snapshot1 on server1, snapshot2 on server2. The 
original LV
(where the snapshot is created from) is not in use (not mounted on any 
server).

Is this possible ?
>   
>> QUESTION: Is this limitation also valid for my verion:
>>     
>  
> These are limitiations of the kernel implementation, not userspace.
>
>   
Is there a kernel-patch available ?

regards

Danny
