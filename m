References: <1575245610.821680.1505258554456.ref@mail.yahoo.com>
	<1575245610.821680.1505258554456@mail.yahoo.com>
	<052d4c46af896716c0f47132f4ddfb8d@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b0d6b9a1-19fa-5e88-e031-d30d7386dfe8@redhat.com>
Date: Wed, 13 Sep 2017 10:15:44 +0200
MIME-Version: 1.0
In-Reply-To: <052d4c46af896716c0f47132f4ddfb8d@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>, matthew patton <pattonme@yahoo.com>

Dne 13.9.2017 v 09:53 Gionatan Danti napsal(a):
> Il 13-09-2017 01:22 matthew patton ha scritto:
>>> Step-by-step example:
>>  > - create a 40 GB thin volume and subtract its size from the thin
>> pool (USED 40 GB, FREE 60 GB, REFER 0 GB);
>>  > - overwrite the entire volume (USED 40 GB, FREE 60 GB, REFER 40 GB);
>>  > - snapshot the volume (USED 40 GB, FREE 60 GB, REFER 40 GB);
>>
>> And 3 other threads also take snapshots against the same volume, or
>> frankly any other volume in the pool.
>> Since the next step (overwrite) hasn't happened yet or has written
>> less than 20GB, all succeed.
>>
>>  > - completely overwrite the original volume (USED 80 GB, FREE 20 GB,
>> REFER 40 GB);
>>
>> 4 threads all try to write their respective 40GB. Afterall, they got
>> the green-light since their snapshot was allowed to be taken.
>> Your thinLV blows up spectacularly.
>>
>>  > - a new snapshot creation will fails (REFER is higher then FREE).
>> nobody cares about new snapshot creation attempts at this point.
>>
>>
>>> When do you decide it ?  (you need to see this is total race-lend)
>>
>> exactly!
> 
> I all the examples I did, the snapshot are suppose to be read-only or at least 
> never written. I thought that it was implicitly clear due to ZFS (used as 
> example) being read-only by default. Sorry for not explicitly stating that.
> 

Ohh this is pretty major constrain ;)

But as pointed out multiple times - with scripting around various fullness 
moments of thin-pool - several different actions can be programmed around,
starting from fstrim, ending with plain erase of unneeded snapshot.
(Maybe erasing unneeded files....)

To get most secure application - such app should actually avoid using 
page-cache (using direct-io)  in such case you are always guaranteed
to get exact error at the exact time (i.e. even without journaled mounting 
option for ext4....)


> After the last write, the cloned cvol1 is clearly corrputed, but the original 
> volume has not problem at all.

Surely there is good reason we keep 'old snapshots' still with us - although 
everyone knows it's implementation has aged :)

There are cases where this copying into separate COW areas simply works better 
- especially for temporary living object with low number of 'small' changes.

We even support  old-snapshot for thin-volumes for this reason - so you can 
use 'bigger' thin-pool chunks - but for temporary snapshot for taking backups
you can take old snapshot of thin volume...


> 
> This was more or less the case with classical, fat LVM: a snapshot runnig out 
> of space *will* fail, but the original volume remains unaffected.

Partially this might get solved in 'some' cases with fully provisioned thinLVs 
within thin-pool...

What comes to my mind as possible supporting solution is -
adding possible enhancement on LVM2 side could be  'forcible' removal of 
running volumes  (aka lvm2 equivalent  of 'dmsetup remove --force')

ATM lvm2 prevents you to remove 'running/mounted' volumes.

I can well imagine  LVM will let you forcible  replace such LV with error 
target  - so instead of  thinLV  - you will have  single 'error' target 
snapshot - which could be possibly even  auto-cleaned once the volume 
use-count drops bellow 0  (lvmpolld/dmeventd monitoring whatever...)

(Of course - we are not solving what happens to application using/running out 
of such error target - hopefully something not completely bad....)

This way - you get very 'powerful' weapon to be used in those 'scriplets'
so you can drop uneeded volumes ANYTIME you need to and reclaim its resources...

Regards

Zdenek
