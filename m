Received: from mx1.redhat.com (ext-mx13.extmail.prod.ext.phx2.redhat.com
	[10.5.110.18])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q25AKZMx028454
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2012 05:20:35 -0500
Received: from mail-ee0-f46.google.com (mail-ee0-f46.google.com [74.125.83.46])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q25AKXxm020881
	for <linux-lvm@redhat.com>; Mon, 5 Mar 2012 05:20:34 -0500
Received: by eekc41 with SMTP id c41so1417221eek.33
	for <linux-lvm@redhat.com>; Mon, 05 Mar 2012 02:20:33 -0800 (PST)
Message-ID: <4F54936E.8030801@profitbricks.com>
Date: Mon, 05 Mar 2012 11:20:30 +0100
From: Sebastian Riemer <sebastian.riemer@profitbricks.com>
MIME-Version: 1.0
References: <4F50CEB1.7040601@profitbricks.com>
	<20120302171712.GA14405@redhat.com>
In-Reply-To: <20120302171712.GA14405@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM Thin Provisioning size limited to 16 GiB?
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
Content-Type: text/plain; charset="us-ascii"
To: Mike Snitzer <snitzer@redhat.com>
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On 02/03/12 18:17, Mike Snitzer wrote:
>>
>> I've also tested to explicitly set the --poolmetadatasize to 16 GiB and
>> the data pool to 100 GiB, but same result. I also did some benchmarks.
>> Performance wasn't that bad, but could be really better (at least doubled).
>>
> 
> You haven't actually shown how you attempted to make use of a 100GB and
> 16GB metadatasize.
> 
> But the maximum metadata device size is 17112760320 sectors (or 15.9375
> GB).
> 
> So try with 15GB (even though that is way larger than you need for 100GB
> of data).

I've tried these commands:
    vgcreate test /dev/md/test*
    lvcreate -i 12 -I 64 -L 100G --poolmetadatasize 16G -T test/pool

I don't see any chance to select the meta-data device in LVM like it is
possible with dmsetup.

>> Here are my commands:
>>    vgcreate test /dev/md/test*
>>    lvcreate -i 12 -I 64 -L 16G -T test/pool
>>    lvcreate -V 45G -T test/pool -n test00

This is like it is described in the man page of lvcreate. There it is
documented as a single lvcreate command.

This creates five dm devices in /dev/mapper:
test-pool: 16,106,127,360 Bytes, 254:3, table: 0 31457280 linear 254:2 0

test-pool_tdata: 16,106,127,360 Bytes, 254:1,

table: 0 31457280 striped 12 128 9:127 2048 9:126 2048 9:125 2048 9:124
2048 9:123 2048 9:122 2048 9:121 2048 9:120 2048 9:119 2048 9:118 2048
9:117 2048 9:116 2048

test-pool_tmeta: 4,194,304 Bytes, 254:0, table: 0 8192 linear 9:116 2623488

test-pool-tpool: 16,106,127,360 Bytes, 254:2
table: 0 31457280 thin-pool 254:0 254:1 128 0 0

test-test00: 48,318,382,080 Bytes, 254:4, table: 0 94371840 thin 254:2 1

>> Seems like pool meta-data and pool data aren't separated at current
>> development state.
> 
> But in the above test, you've created a striped LV named /dev/test/pool
> of 16GB.
> 
> And you've written 11GB to the test00 thin device.  And you're running
> out of metadata space.
> 
> This implies to me that LVM2's size guesstimate for the proper data vs
> metadata size split for a 16GB volume isn't conservative enough
> (relative to metadata size).
> 
> Anyway, showing your 'dmsetup table' output would be helpful in the
> future.

The meta-data is on one of the striped devices used for the data. This
is wrong. LVM should support selecting a separate meta-data device!

Sebastian
