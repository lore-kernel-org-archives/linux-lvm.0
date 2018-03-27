References: <597ba4e4-2028-ed62-6835-86ae9015ea5b@assyoma.it>
	<fa1aa317-d9cd-749f-5da0-3f15bf8c4dd1@redhat.com>
	<02958f63-ba2b-a6b5-1629-69581c1af316@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5efcabfd-fad5-a228-8887-b9f4d38d2d1d@redhat.com>
Date: Tue, 27 Mar 2018 12:18:08 +0200
MIME-Version: 1.0
In-Reply-To: <02958f63-ba2b-a6b5-1629-69581c1af316@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Higher than expected metadata usage?
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
To: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 27.3.2018 v 11:40 Gionatan Danti napsal(a):
> On 27/03/2018 10:30, Zdenek Kabelac wrote:
>> Hi
>>
>> Well just for the 1st. look -� 116MB for metadata for 7.21TB is *VERY* small 
>> size. I'm not sure what is the data 'chunk-size'� - but you will need to 
>> extend pool's metadata sooner or later considerably - I'd suggest at least 
>> 2-4GB for this data size range.
> 
> Hi Zdenek,
> as shown by the last lvs command, data chunk size is at 4MB. Data chunk size 
> and metadata volume size where automatically selected at thin pool creation - 
> ie: they are default values.
> 
> Indeed, running "thin_metadata_size -b4m -s7t -m1000 -um" show 
> "thin_metadata_size - 60.80 mebibytes estimated metadata area size"
> 
>> Metadata itself are also allocated in some internal chunks - so releasing a 
>> thin-volume doesn't necessarily free space in the whole metadata chunks thus 
>> such chunk remains allocated and there is not a more detailed free-space 
>> tracking as space in chunks is shared between multiple thin volumes and is 
>> related to efficient storage of b-Trees...
> 
> Ok, so removing a snapshot/volume can free a lower than expected metadata 
> amount. I fully understand that. However, I saw the *reverse*: removing a 
> volume shrunk metadata (much) more than expected. This also mean that snapshot 
> creation and data writes on the main volume caused a *much* larger than 
> expected increase in metadata usage.

As said - the 'metadata' usage is chunk-based and it's journal driven (i.e. 
there is never in-place overwrite of valid data) - so the data storage pattern 
always depends on existing layout and its transition to new state.

> 
>> There is no 'direct' connection between releasing space in data and metadata 
>> volume - so it's quite natural you will see different percentage of free 
>> space after thin volume removal between those two volumes.
> 
> I understand that if data is shared between two or more volumes, deleting a 
> volume will not change much from a metadata standpoint. However, this is true 
> for the data pool also: it will continue to show the same utilization. After 
> all, removing a shared volume only means that data chunk are mapped in another 
> volume.
> 
> However, I was under impression that a more or less direct connection between 
> allocated pool data chunk and metadata existed: otherwise, a tool as 
> thin_metadata_size lose its scope.
> 
> So, where am I wrong?


Tool for size estimation is giving some 'rough' first guess/first choice number.

The metadata usage is based in real-word data manipulation - so while it's 
relatively easy to 'cup'  a single thin LV metadata usage - once there is a 
lot of sharing between many different volumes - the exact size estimation
is difficult - as it depend on the order how the 'btree' has been constructed.

I.e. it is surely true the i.e. defragmentation of thin-pool may give you a 
more compact tree consuming less space - but the amount of work needed to get 
thin-pool into the most optimal configuration doesn't pay off.  So you need to 
live with cases, where the metadata usage behaves in a bit unpredictable 
manner - since it's more preferred speed over the smallest consumed space - 
which could be very pricey in terms of CPU and memory usage.

So as it has been said - metadata is 'accounted' in chunks for a userspace app 
(like lvm2 is or what you get with 'dmsetup status') - but how much free space 
is left in these individual chunks is kernel internal...

It's time to move on, you address 7TB and you 'extremely' care about couple MB 
'hint here' - try to investigate how much space is wasted in filesystem itself ;)



Regards

Zdenek
