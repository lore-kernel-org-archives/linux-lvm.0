Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i85Gj8322269
	for <linux-lvm@redhat.com>; Sun, 5 Sep 2004 12:45:08 -0400
Received: from kidushin.jct.ac.il (kidushin.jct.ac.il [147.161.1.19])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i85GiuS1007426
	for <linux-lvm@redhat.com>; Sun, 5 Sep 2004 12:45:07 -0400
Message-ID: <413B427A.5090301@jct.ac.il>
Date: Sun, 05 Sep 2004 19:44:42 +0300
From: Yedidia Klein <yedidia@jct.ac.il>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Suggested Kernel and LVM version for
	production	storage
References: <413195B2.3050103@jct.ac.il>
	<20040902175654.GH6264@agk.surrey.redhat.com>
In-Reply-To: <20040902175654.GH6264@agk.surrey.redhat.com>
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

>On Sun, Aug 29, 2004 at 11:37:06AM +0300, Yedidia Klein wrote:
>  
>
>>Sometimes I'm getting the following errors, and get all my LVM 
>>FileSystem Blocked .. (mean I can't access the files on these partitions 
>>and have to reboot for getting access again)
>>    
>>
> 
>  
>
>>   Aug 26 01:00:02 nazir kernel: device-mapper: 
>>                         Unable to allocate hash table space 
>>    
>>
>
>i.e. There wasn't enough memory available to set up the snapshot.
>What sizes:  How big is the LV & snapshot?
>
main partition is 500GB and I've two snapshots, weekly that is 100G and 
daily that is 60G

> 
>What chunk size?  [Try changing.]
>  
>
chunk is 8.00 KB (what is the suggested value ??)

>Is there just one snapshot?
>  
>
as I wrote there are two..

>Check your memory usage.
>  
>
my hardware memory is almost full 860/1000, but the swap isn't that used 
(it's now 3.3/2000) do the device mapper need more real mem ?? does it 
worth to increase the swap ?

tnx,

--Yedidia

>Alasdair
>  
>
