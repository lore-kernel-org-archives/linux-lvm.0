Received: from mx1.redhat.com (ext-mx02.extmail.prod.ext.phx2.redhat.com
	[10.5.110.6])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id oBV3h4GI015502
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2010 22:43:04 -0500
Received: from BLADE3.ISTI.CNR.IT (blade3.isti.cnr.it [194.119.192.19])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oBV3grN0015841
	for <linux-lvm@redhat.com>; Thu, 30 Dec 2010 22:42:53 -0500
Received: from SCRIPT-SPFWL-DAEMON.mx.isti.cnr.it by mx.isti.cnr.it
	(PMDF V6.5-x5 #31825) id <01NW23CT2TY8NG5X4A@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Fri, 31 Dec 2010 04:41:48 +0100 (MET)
Received: from conversionlocal.isti.cnr.it by mx.isti.cnr.it
	(PMDF V6.5-x5 #31825) id <01NW23CSHOXSNG5X49@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Fri, 31 Dec 2010 04:41:47 +0100 (MET)
Received: from [10.0.0.61]
	(dynamic-adsl-78-12-75-177.clienti.tiscali.it [78.12.75.177])
	by mx.isti.cnr.it (PMDF V6.5-x5 #31826)
	with ESMTPSA id <01NW23CRRY3ANRB8YK@mx.isti.cnr.it> for
	linux-lvm@redhat.com; Fri, 31 Dec 2010 04:41:46 +0100 (MET)
Date: Fri, 31 Dec 2010 04:41:55 +0100
From: Spelic <spelic@shiftmail.org>
In-reply-to: <Pine.LNX.4.64.1012301402010.22982@bmsred.bmsi.com>
Message-id: <4D1D5103.6030706@shiftmail.org>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4D1A9FAF.6050401@shiftmail.org> <4D1B3F6A.4070309@shiftmail.org>
	<Pine.LNX.4.64.1012292136500.19697@bmsred.bmsi.com>
	<4D1BF8DF.20908@shiftmail.org>
	<Pine.LNX.4.64.1012301402010.22982@bmsred.bmsi.com>
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

On 12/30/2010 08:12 PM, Stuart D. Gathman wrote:
> On Thu, 30 Dec 2010, Spelic wrote:
>
>    
>> Also there is still the mystery of why times appear *randomly* related to the
>> number of devices, chunk sizes, and stripe sizes! if the rmw cycle was the
>> culprit, how come I see:
>> raid5, 4 devices, 16384k chunk: 41sec (4.9MB/sec)
>> raid5, 6 device, 4096k chunk: 2m18sec ?!?! (1.44 MB/sec!?)
>> the first has much larger stripe size of 49152K , the second has 20480K !
>>      
> Ok, next theory.  Pvmove works by allocating a mirror for each
> contiguous segment of the source LV, update metadata

Ok never mind, I found the problem:
LVM probably uses O_DIRECT, right?
Well it's absymally slow on MD parity raid (I checked with dd on the 
bare MD device just now) and I don't know why it's so slow. It's not 
because of the rmw because it's slow even the second time I try, when it 
does not read anything anymore because all reads are in cache already.

I understand this is probably to be fixed at MD side (and I will report 
the problem to linux-raid, but I see it has already been discussed 
without much results)
However...
...is there any chance you might fix it at lvm side too, changing LVM to 
use nondirect IO so to "support" MD?
In my raid5 array between direct and nondirect (dd bs=1M or smaller) 
there's the difference of 2.1MB/s to 250MB/sec, and would probably be 
greater on larger arrays.
Also in raid10 nondirect is much faster for small transfer sizes like 
bs=4K (28MB/sec to 160MB/sec) but not at 1M, however LVM probably uses 
low transfer sizes, right?

Thank you
