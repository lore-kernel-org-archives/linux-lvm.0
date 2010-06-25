Received: from mx1.redhat.com (ext-mx06.extmail.prod.ext.phx2.redhat.com
	[10.5.110.10])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5P8aTdt015606
	for <linux-lvm@redhat.com>; Fri, 25 Jun 2010 04:36:30 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5P8aGqI032211
	for <linux-lvm@redhat.com>; Fri, 25 Jun 2010 04:36:17 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o5P8aAse017979
	for <linux-lvm@redhat.com>; Fri, 25 Jun 2010 01:36:13 -0700
Message-ID: <4C246A7A.50202@tlinx.org>
Date: Fri, 25 Jun 2010 01:36:10 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4BF5A883.7060503@tlinx.org>	<20100521051021.GA1412@maude.comedia.it>	<4BF62CBF.3070702@tlinx.org>	<20100522072321.GB12294@maude.comedia.it>	<4BFEA099.9020005@redhat.com>
	<4C1EE9ED.9080201@tlinx.org>
	<25E3A700-B320-4F84-8694-4DE5AD4D0A83@redhat.com>
In-Reply-To: <25E3A700-B320-4F84-8694-4DE5AD4D0A83@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] RAID chunk size & LVM 'offset' affecting
	RAID	stripe alignment
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Doug Ledford wrote:
> Correction: all reads benefit from larger chunks now a days.  The only
> reason to use smaller chunks in the past was to try and get all of
> your drives streaming data to you simultaneously, which effectively
> made the total aggregate throughput of those reads equal to the
> throughput of one data disk times the number of data disks in the
> array.  With modern drives able to put out 100MB/s sustained by
> themselves, we don't really need to do this any more, ....
---
	I would regard 100MB/s as moderately slow.  For files in my
server cache, my Win7 machine reads @ 110MB/s over the network, so as
much as file-io slows down network response, 100MB would be on
the slow side.  I hope for at least 2-3 times that with software
RAID, but with hardware raid 5-6X that is common.  Write speeds 
run maybe 50-100MB/s slower?

> and if we aren't
> attempting to get this particular optimization (which really only
> existed when you were doing single threaded sequential I/O anyway,
> which happens to be rare on real servers), then larger chunk sizes
> benefit reads because they help to ensure that reads will, as much as
> possible, only hit one disk.  If you can manage to make every read you
> service hit one disk only, you maximize the random I/O ops per second
> that your array can handle.
---
	I was under the impression that rule of thumb was that IOPs of
a RAID array were generally equal to that of 1 member disk, because 
normally they operate as 1 spindle.  It seems like in your case, you
are only using the RAID component for the redundancy rather than the
speedup.

	If you want to increase IOPs, above the single spindle
rate, then I had the impression that using a multi-level RAID would
accomplish that -- like RAID 50 or 60?    I.e. a RAID0 of 3 RAID5's
would give you 3X the IOP's  (because, like in your example, any
read would likely only use a fraction of a stripe), but you would
still benefit from using multiple devices for a read/write to get
speed.  I seem to remember something about multiprocessor checksumming
going into some recent kernels that could allow practical multi-level
RAID in software.


>>  in response to my
>> observation that my 256K-data wide stripes (4x64K chunks) would be
>> skewed by a
>> chunk size on my PV's that defaulted to starting data at offset 192K
....
>  So, we end up touching two stripes instead
> of one and we have to read stuff in, introducing a latency delay,
> before we can write our data out.
----
	Duh...missing the obvious, I am!  Sigh.  
	I think I got it write...oi veh!  If not, well...
dumping and restoring that much data just takes WAY too long.  
(beginning to think 500-600MB read/writes are too slow...
actually for dump/restore -- I'm lucky when I get an 8th of that).
