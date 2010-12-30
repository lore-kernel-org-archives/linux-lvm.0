Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oBU3EjNP025493
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2010 22:14:45 -0500
Received: from mx2.isti.cnr.it (mx2.isti.cnr.it [194.119.192.4])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBU3EX1n012319
	for <linux-lvm@redhat.com>; Wed, 29 Dec 2010 22:14:34 -0500
Received: from SCRIPT-SPFWL-DAEMON.mx.isti.cnr.it by mx.isti.cnr.it
	(PMDF V6.5-x5 #31825) id <01NW0O3C5WFKNG5IWL@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Thu, 30 Dec 2010 04:13:30 +0100 (MET)
Received: from conversionlocal.isti.cnr.it by mx.isti.cnr.it
	(PMDF V6.5-x5 #31825) id <01NW0O3BP0U8NG5IWA@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Thu, 30 Dec 2010 04:13:28 +0100 (MET)
Received: from [164.132.149.45] by mx.isti.cnr.it (PMDF V6.5-x5 #31826)
	with ESMTPSA id <01NW0O3A52IONQ2M0S@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Thu, 30 Dec 2010 04:13:27 +0100 (MET)
Date: Thu, 30 Dec 2010 04:13:35 +0100
From: Spelic <spelic@shiftmail.org>
In-reply-to: <Pine.LNX.4.64.1012292136500.19697@bmsred.bmsi.com>
Message-id: <4D1BF8DF.20908@shiftmail.org>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4D1A9FAF.6050401@shiftmail.org> <4D1B3F6A.4070309@shiftmail.org>
	<Pine.LNX.4.64.1012292136500.19697@bmsred.bmsi.com>
Subject: Re: [linux-lvm] pvmove painfully slow on parity RAID
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: linux-lvm@redhat.com

On 12/30/2010 03:42 AM, Stuart D. Gathman wrote:
> On Wed, 29 Dec 2010, Spelic wrote:
>    
>> I tried multiple times for every device with consistent results, so I'm pretty
>> sure these are actual numbers.
>> What's happening?
>> Apart from the amazing difference of parity raid vs nonparity raid, with
>> parity raid it seems to vary randomly with the number of devices and the
>> chunksize..?
>>      
> This is pretty much my experience with parity raid all around.  Which
> is why I stick with raid1 and raid10.
>    

Parity raid goes fast for me for normal filesystem operations, that's 
why I suppose there is some strict sequentiality is enforced here.

> That said, the sequential writes of pvmove should be fast for raid5 *if*
> the chunks are aligned so that there is no read/modify/write cycle.
>
> 1) Perhaps your test targets are not properly aligned?
>    

aligned to zero yes (arrays are empty now), but all raids have different 
chunk sizes and stripe sizes as I reported, which are all bigger than 
the lvm chunksize which is 1M for the VG.

> 2) Perhaps the raid5 implementation (hardware? linux md?
>     experimental lvm raid5?) does a read modify write even when it
>     doesn't have to.
>
> Your numbers sure look like read/modify/write is happening for some reason.
>    

Ok but strict sequentiality is probably enforced too much. There must be 
some barrier or flush & wait thing going on here at each tiny bit of 
information (at each lvm chunk maybe?). Are you a lvm devel?
Consider that a sequential dd write goes hundreds of megabytes per 
second on my arrays, not hundreds of... kilobytes!
Even random io goes *much* faster than this, if one stripe does not have 
to wait for another stripe to be fully updated (i.e. sequentiality not 
enforced from the application layer).
If pvmove ouputed 100MB before every sync or flush, I'm pretty sure I 
would see speeds almost 100 times higher.


Also there is still the mystery of why times appear *randomly* related 
to the number of devices, chunk sizes, and stripe sizes! if the rmw 
cycle was the culprit, how come I see:
raid5, 4 devices, 16384k chunk: 41sec (4.9MB/sec)
raid5, 6 device, 4096k chunk: 2m18sec ?!?! (1.44 MB/sec!?)
the first has much larger stripe size of 49152K , the second has 20480K !

Thank you
