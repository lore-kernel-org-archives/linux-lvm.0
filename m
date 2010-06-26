Received: from firewall.xsintricity.com
	(ovpn01.gateway.prod.ext.phx2.redhat.com [10.5.9.1])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5Q1onrf000517
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 25 Jun 2010 21:51:10 -0400
Received: from macbook.xsintricity.com (macbook.xsintricity.com [172.31.0.7])
	(authenticated bits=0)
	by firewall.xsintricity.com (8.14.4/8.14.3) with ESMTP id
	o5Q1omGO011965
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 25 Jun 2010 21:50:48 -0400
Message-Id: <94CECB52-BD2D-4ECB-B10E-D58DC37612F5@redhat.com>
From: Doug Ledford <dledford@redhat.com>
In-Reply-To: <4C246A7A.50202@tlinx.org>
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v936)
Date: Fri, 25 Jun 2010 21:50:48 -0400
References: <4BF5A883.7060503@tlinx.org>	<20100521051021.GA1412@maude.comedia.it>	<4BF62CBF.3070702@tlinx.org>	<20100522072321.GB12294@maude.comedia.it>	<4BFEA099.9020005@redhat.com>
	<4C1EE9ED.9080201@tlinx.org>
	<25E3A700-B320-4F84-8694-4DE5AD4D0A83@redhat.com>
	<4C246A7A.50202@tlinx.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: LVM general discussion and development <linux-lvm@redhat.com>

On Jun 25, 2010, at 4:36 AM, Linda A. Walsh wrote:
> Doug Ledford wrote:
>> Correction: all reads benefit from larger chunks now a days.  The  
>> only
>> reason to use smaller chunks in the past was to try and get all of
>> your drives streaming data to you simultaneously, which effectively
>> made the total aggregate throughput of those reads equal to the
>> throughput of one data disk times the number of data disks in the
>> array.  With modern drives able to put out 100MB/s sustained by
>> themselves, we don't really need to do this any more, ....
> ---
> 	I would regard 100MB/s as moderately slow.  For files in my
> server cache, my Win7 machine reads @ 110MB/s over the network, so as
> much as file-io slows down network response, 100MB would be on
> the slow side.  I hope for at least 2-3 times that with software
> RAID, but with hardware raid 5-6X that is common.  Write speeds run  
> maybe 50-100MB/s slower?

In practice you get better results than that.  Maybe not a fully  
linear scale up, but it goes way up.  My test system anyway was  
getting 400-500MB/s under the right conditions.

>> and if we aren't
>> attempting to get this particular optimization (which really only
>> existed when you were doing single threaded sequential I/O anyway,
>> which happens to be rare on real servers), then larger chunk sizes
>> benefit reads because they help to ensure that reads will, as much as
>> possible, only hit one disk.  If you can manage to make every read  
>> you
>> service hit one disk only, you maximize the random I/O ops per second
>> that your array can handle.
> ---
> 	I was under the impression that rule of thumb was that IOPs of
> a RAID array were generally equal to that of 1 member disk, because  
> normally they operate as 1 spindle.

With a small chunk size, this is the case, yes.

>  It seems like in your case, you
> are only using the RAID component for the redundancy rather than the
> speedup.

No, I'm trading off some speed up in sequential throughput for a speed  
up in IOPs.

> 	If you want to increase IOPs, above the single spindle
> rate, then I had the impression that using a multi-level RAID would
> accomplish that -- like RAID 50 or 60?    I.e. a RAID0 of 3 RAID5's
> would give you 3X the IOP's  (because, like in your example, any
> read would likely only use a fraction of a stripe), but you would
> still benefit from using multiple devices for a read/write to get
> speed.

In truth, whether you use a large chunk size, or smaller chunk sizes  
and stacked arrays, the net result is the same: you make the average  
request involve fewer disks, trading off maximum single stream  
throughput for IOPs.

My argument in all of this is that single threaded streaming  
performance is such a total "who cares" number, that you are silly to  
ever chase that particular beast.  Almost nothing in the real world  
that is doing I/O at speeds that we even remotely care about, is doing  
that I/O in a single stream.  Instead, it's various different threads  
of I/O to different places in the array and what we care about is that  
the array be able to handle enough IOPs that the array stays ahead of  
the load.  An exception to this rule might be something like the data  
acquisition equipment at CERN's HADRON collider.  That stuff dumps  
data in a continuous stream so fast that it makes my mind hurt.

>  I seem to remember something about multiprocessor checksumming
> going into some recent kernels that could allow practical multi-level
> RAID in software.

Red herring.  You can do multilevel raid without this feature, and  
this feature is currently broken so I wouldn't recommend using it.

>
>>> in response to my
>>> observation that my 256K-data wide stripes (4x64K chunks) would be
>>> skewed by a
>>> chunk size on my PV's that defaulted to starting data at offset 192K
> ....
>> So, we end up touching two stripes instead
>> of one and we have to read stuff in, introducing a latency delay,
>> before we can write our data out.
> ----
> 	Duh...missing the obvious, I am!  Sigh.  	I think I got it  
> write...oi veh!  If not, well...
> dumping and restoring that much data just takes WAY too long.   
> (beginning to think 500-600MB read/writes are too slow...
> actually for dump/restore -- I'm lucky when I get an 8th of that).
>
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
