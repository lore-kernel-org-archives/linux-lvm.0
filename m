References: <C28D2468-1843-4019-A503-E566A305977D@mac.com>
	<d23b94a7-b5c5-4ee2-51c7-7dfa06cca3d2@redhat.com>
	<42E7ED35-B32E-4C02-976A-7A9E5380EEA8@mac.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <bb529703-849c-93ff-f40c-1de8a6f49ce6@redhat.com>
Date: Thu, 14 Sep 2017 11:00:46 +0200
MIME-Version: 1.0
In-Reply-To: <42E7ED35-B32E-4C02-976A-7A9E5380EEA8@mac.com>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Performance penalty for 4k requests on thin
	provisioned volume
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Dale Stephenson <dalestephenson@mac.com>

Dne 14.9.2017 v 00:39 Dale Stephenson napsal(a):
> 
>> On Sep 13, 2017, at 4:19 PM, Zdenek Kabelac <zkabelac@redhat.com> wrote:
>>
>> Dne 13.9.2017 v 17:33 Dale Stephenson napsal(a):
>>> Distribution: centos-release-7-3.1611.el7.centos.x86_64
>>> Kernel: Linux 3.10.0-514.26.2.el7.x86_64
>>> LVM: 2.02.166(2)-RHEL7 (2016-11-16)
>>> Volume group consisted of an 8-drive SSD (500G drives) array, plus an additional SSD of the same size.  The array had 64 k stripes.
>>> Thin pool had -Zn option and 512k chunksize (full stripe), size 3T with metadata volume 16G.  data was entirely on the 8-drive raid, metadata was entirely on the 9th drive.
>>> Virtual volume “thin” was 300 GB.  I also filled it with dd so that it would be fully provisioned before the test.
>>> Volume “thick” was also 300GB, just an ordinary volume also entirely on the 8-drive array.
>>> Four tests were run directlyagainst each volume using fio-2.2.8, random read, random write, sequential read, sequential write.  Single thread, 4k blocksize, 90s run time.
>>
>> Hi
>>
>> Can you please provide output of:
>>
>> lvs -a -o+stripes,stripesize,seg_pe_ranges
>>
>> so we can see how is your stripe placed on devices ?
> 
> Sure, thank you for your help:
> # lvs -a -o+stripes,stripesize,seg_pe_ranges
>    LV               VG     Attr       LSize   Pool     Origin Data%  Meta%  Move Log Cpy%Sync Convert #Str Stripe PE Ranges
>    [lvol0_pmspare]  volgr0 ewi-------  16.00g                                                            1     0  /dev/md127:867328-871423
>    thick            volgr0 -wi-a----- 300.00g                                                            1     0  /dev/md127:790528-867327
>    thin             volgr0 Vwi-a-t--- 300.00g thinpool        100.00                                     0     0
>    thinpool         volgr0 twi-aot---   3.00t                 9.77   0.13                                1     0  thinpool_tdata:0-786431
>    [thinpool_tdata] volgr0 Twi-ao----   3.00t                                                            1     0  /dev/md127:0-786431
>    [thinpool_tmeta] volgr0 ewi-ao----  16.00g                                                            1     0  /dev/sdb4:0-4095
> 
> md127 is an 8-drive RAID 0
> 
> As you can see, there’s no lvm striping; I rely on the software RAID underneath for that.  Both thick and thin lvols are on the same PV.
>>
>> SSD typically do needs ideally write 512K chunks.
> 
> I could create the md to use 512k chunks for RAID 0, but I wouldn’t expect that to have any impact on a single threaded test using 4k request size.  Is there a hidden relationship that I’m unaware of?


Yep - it seems the setup in this case is the best fit.

If you can reevaluate different setups you may possibly get much higher 
throughput.

My guess would be - the best targeting layout should be probably striping no 
more then 2-3 disks and use bigger striping block.

And then just 'join' 'smaller' arrays together in lvm2 in 1 big LV.


> 
>> (something like  'lvcreate -LXXX -i8 -I512k vgname’)
>>
> Would making lvm stripe on top of an md that already stripes confer any performance benefit in general, or for small (4k) requests in particular?

Rule #1 - try to avoid 'over-combining' things together.
  - measure performance from 'bottom'  upward in your device stack.
If the underlying devices gives poor speed - you can't make it better by any 
super0smart disk-layout on top of it.


> 
>> Wouldn't be 'faster' to just concatenate 8 disks together instead of striping - or stripe only across 2 disk - and then you concatenate 4 such striped areas…
>>
> For sustained throughput I would expect striping of 8 disks to blow away concatenation — however, for small requests I wouldn’t expect any advantage.  On a non-redundant array, I would expect a single threaded test using 4k requests is going to end up reading/writing data from exactly one disk regardless of whether the underlying drives are concatenated or stripes.
It always depends which kind of load you expect the most.

I suspect spreading 4K blocks across 8 SSD is likely very far away from ideal 
layout.

Any SSD is typically very bad with 4K blocks -  it you want to 'spread' the 
load on mores SSDs  do not use less the 64K stripe chunks per SSD - this gives 
you (8*64)  512K stripe size.

As for thin-pool chunksize -  if you plan to use lots of snapshots - keep the 
value lowest possible - 64K  or 128K thin-pool chunksize.

But I'd still suggest to reevaluate/benchmark setup where you will use much 
lower number of SSD for load spreading - and use bigger strip chunks per each 
device.  This should nicely improve performance in case of 'bigger' writes
and not that much slow things down with  4K loads....


> What is the best choice for handling 4k request sizes?

Possibly NVMe can do a better job here.

Regards

Zdenek
