Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id o5TLY09P013449
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2010 17:34:01 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id o5TLXmIM013333
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2010 17:33:49 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
	o5TLXimo001581
	for <linux-lvm@redhat.com>; Tue, 29 Jun 2010 14:33:47 -0700
Message-ID: <4C2A66B8.9010900@tlinx.org>
Date: Tue, 29 Jun 2010 14:33:44 -0700
From: "Linda A. Walsh" <lvm@tlinx.org>
MIME-Version: 1.0
References: <4BF5A883.7060503@tlinx.org>	<20100521051021.GA1412@maude.comedia.it>	<4BF62CBF.3070702@tlinx.org>	<20100522072321.GB12294@maude.comedia.it>	<4BFEA099.9020005@redhat.com>	<4C1EE9ED.9080201@tlinx.org>	<25E3A700-B320-4F84-8694-4DE5AD4D0A83@redhat.com>	<4C246A7A.50202@tlinx.org>
	<4C28F050.9090703@Media-Brokers.com>
In-Reply-To: <4C28F050.9090703@Media-Brokers.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] RAID chunk size & LVM 'offset' affecting RAID
	stripe alignment
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

Charles Marcus wrote:
> On 2010-06-25 4:36 AM, Linda A. Walsh wrote:
>> Doug Ledford wrote:
>>> Correction: all reads benefit from larger chunks now a days.  The only
>>> reason to use smaller chunks in the past was to try and get all of
>>> your drives streaming data to you simultaneously, which effectively
>>> made the total aggregate throughput of those reads equal to the
>>> throughput of one data disk times the number of data disks in the
>>> array.  With modern drives able to put out 100MB/s sustained by
>>> themselves, we don't really need to do this any more, ....
> 
>> I would regard 100MB/s as moderately slow.  For files in my
>> server cache, my Win7 machine reads @ 110MB/s over the network,
> 
> My understanding is Gigabit ethernet is only capable of topping out at
> about 30MB/s, so, I'm curious what kind of network you have? 10GBe? Fiber?
----
   Why would gigabit ethernet top out at less than 1/4th
it's theoretical speed?  What would possibly cause such poor performance?
Are you using xfs as a file system?  It's the optimal file system for high
performance with large files.

Gigabit ethernet should have a max theoretical somewhere around 120MB/s.  If
there was no overhead, it would be 125MB/s, so 120MB allows for 4% overhead.

My tests used 'samba3' to transfer files.   Both the server and the 
win7 box use Intel Gigabit PCIe cards bought off Amazon.
My local net uses a 9000 byte MTU (9014 frame size).

   Tests had a win7-64 client talking to a SuSE 11.2(x86-64) 
w/2.6.34 vanilla  kernel.  File system is xfs over LVM2.

   Linear writes are measurable at 115MB/s.  Writes to disk are the same
since my local disk does ~670MB/s writes which can easily handle
network bandwidth (670MB/s is direct, through the buffer cache,
I get about 2/3rd's that: 448MB/s).  
  
	Win7 reading 4GB file from the server's Cache gets 110MB/s. 
From disk it's about 13-14% slower, even though the disk's read
speed (for a 48G file) is 826MB/s.   The disk used for the
testing is a RAID50 based on 7200RPM SATA disks.


1. Read (file in memory on server):
/l> dd if=test1 of=/dev/null bs=256M count=16
16+0 records in
16+0 records out
4294967296 bytes (4.3 GB) copied, 39.024 s, 110 MB/s

2. Read (file NOT in memory on server):
/t/test> dd if=file2 of=/dev/null bs=1G count=4 oflag=direct
4+0 records in
4+0 records out
4294967296 bytes (4.3 GB) copied, 44.955 s, 95.5 MB/s

3. Write (file written to server memory buffs):
/l> dd of=test1 if=/dev/zero bs=256M count=16 conv=notrunc oflag=direct
16+0 records in
16+0 records out
4294967296 bytes (4.3 GB) copied, 37.37 s, 115 MB/s

4. Write (write with 'file+metadata sync'):
/t/test> dd of=file2 if=/dev/zero bs=1G count=2 oflag=direct conv=nocreat,fsync
2+0 records in
2+0 records out
2147483648 bytes (2.1 GB) copied, 18.765 s, 114 MB/s

5. Write (to verify write speed, including write to disk, this next test
write out twice the amount of memory the server has):

/t/test> dd of=file2 if=/dev/zero bs=1G count=48 oflag=direct conv=nocreat,fsync
48+0 records in
48+0 records out
51539607552 bytes (52 GB) copied, 449.427 s, 115 MB/s

Writing to disk has no effect on network write speed -- as expected.
Reads have some effect, causing about 13-14% slowdown to 95.5MB.s


In both cases, running 'xosview' showed the expected network bandwidth being
used. Also, FWIW -- my music only hiccuped occasionally during the write activity.
Oddly enough, it didn't hiccup at all during the read test (I was listening to
flacs from the server, while doing the I/O tests).  xosview was also displaying
from the server over the net -- so there was entirely 'zero' background network
traffic.
