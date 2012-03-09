Message-ID: <4F5A2955.3080603@redhat.com>
Date: Fri, 09 Mar 2012 17:01:25 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <4F50CEB1.7040601@profitbricks.com>
	<20120302171712.GA14405@redhat.com>
	<4F54936E.8030801@profitbricks.com>
In-Reply-To: <4F54936E.8030801@profitbricks.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Sebastian Riemer <sebastian.riemer@profitbricks.com>, Mike Snitzer <snitzer@redhat.com>

Dne 5.3.2012 11:20, Sebastian Riemer napsal(a):
> On 02/03/12 18:17, Mike Snitzer wrote:
>>>
>>> I've also tested to explicitly set the --poolmetadatasize to 16 GiB and
>>> the data pool to 100 GiB, but same result. I also did some benchmarks.
>>> Performance wasn't that bad, but could be really better (at least doubled).
>>>
>>
>> You haven't actually shown how you attempted to make use of a 100GB and
>> 16GB metadatasize.
>>
>> But the maximum metadata device size is 17112760320 sectors (or 15.9375
>> GB).
>>
>> So try with 15GB (even though that is way larger than you need for 100GB
>> of data).
> 
> I've tried these commands:
>     vgcreate test /dev/md/test*
>     lvcreate -i 12 -I 64 -L 100G --poolmetadatasize 16G -T test/pool
> 
> I don't see any chance to select the meta-data device in LVM like it is
> possible with dmsetup.
> 
>>> Here are my commands:
>>>    vgcreate test /dev/md/test*
>>>    lvcreate -i 12 -I 64 -L 16G -T test/pool
>>>    lvcreate -V 45G -T test/pool -n test00
> 
> This is like it is described in the man page of lvcreate. There it is
> documented as a single lvcreate command.
> 
> This creates five dm devices in /dev/mapper:
> test-pool: 16,106,127,360 Bytes, 254:3, table: 0 31457280 linear 254:2 0
> 
> test-pool_tdata: 16,106,127,360 Bytes, 254:1,


Ok - for now the logic goes like if you pass a list of PVs on lvcreate command
line than metadata is allocated from the last one - but it's
current undocumented behavior which may change between version - so nothing
I'd suggest for use - but may work for now.

So for strip of 12 devices you would need 13 PVs  - then strip should occupy
first 12 - and metadata device should land on the final 13 PV.

In the near future there will be  lvconvert support, where you just select an
LV for metadata and another LV for data pool -  should be quite easy to use then.

For now - you could always use 'pvmove -n pool_tmeta  srcPV  dstPV' to
relocate metadata extents on a PV you want - since metadata shouldn't be too
large the operation should be quite fast.


> table: 0 31457280 striped 12 128 9:127 2048 9:126 2048 9:125 2048 9:124
> 2048 9:123 2048 9:122 2048 9:121 2048 9:120 2048 9:119 2048 9:118 2048
> 9:117 2048 9:116 2048
> 
> test-pool_tmeta: 4,194,304 Bytes, 254:0, table: 0 8192 linear 9:116 2623488
> 
> test-pool-tpool: 16,106,127,360 Bytes, 254:2
> table: 0 31457280 thin-pool 254:0 254:1 128 0 0
> 
> test-test00: 48,318,382,080 Bytes, 254:4, table: 0 94371840 thin 254:2 1
> 
>>> Seems like pool meta-data and pool data aren't separated at current
>>> development state.

They are separated and in fact, internally they behave like allocation of
mirror log device.

Zdenek
