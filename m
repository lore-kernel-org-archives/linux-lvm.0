References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<872ad7be3b36e2eb0afc080fa781d84d@assyoma.it>
	<e580b78b-0aaa-d075-5009-278d26823a7c@redhat.com>
	<e3bc609f-a1fd-e2e8-e431-4820cd9f9487@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b51c8dfd-bdd0-2e38-cc47-bef358bbc8e6@redhat.com>
Date: Tue, 12 Sep 2017 14:03:32 +0200
MIME-Version: 1.0
In-Reply-To: <e3bc609f-a1fd-e2e8-e431-4820cd9f9487@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 12.9.2017 v 13:34 Gionatan Danti napsal(a):
> On 12/09/2017 13:01, Zdenek Kabelac wrote:
>> There is very good reason why thinLV is fast - when you work with thinLV -
>> you work only with data-set for single thin LV.
>>
>>
>> Sad/bad news here - it's not going to work this way....
> 
> No, I absolutely *do not want* thinp to automatically dallocate/trash some 
> provisioned blocks. Rather, I all for something as "if free space is lower 
> than 30%, disable new snapshot *creation*"
> 



# lvs -a
   LV              VG Attr       LSize  Pool Origin Data%  Meta%  Move Log 
Cpy%Sync Convert
   [lvol0_pmspare] vg ewi-------  2,00m 

   lvol1           vg Vwi-a-tz-- 20,00m pool        40,00 

   pool            vg twi-aotz-- 10,00m             80,00  1,95 

   [pool_tdata]    vg Twi-ao---- 10,00m 

   [pool_tmeta]    vg ewi-ao----  2,00m 

[root@linux export]# lvcreate -V10 vg/pool
   Using default stripesize 64,00 KiB.
   Reducing requested stripe size 64,00 KiB to maximum, physical extent size 
32,00 KiB.
   Cannot create new thin volume, free space in thin pool vg/pool reached 
threshold.

# lvcreate -s vg/lvol1
   Using default stripesize 64,00 KiB.
   Reducing requested stripe size 64,00 KiB to maximum, physical extent size 
32,00 KiB.
   Cannot create new thin volume, free space in thin pool vg/pool reached 
threshold.

# grep thin_pool_autoextend_threshold /etc/lvm/lvm.conf
	# Configuration option activation/thin_pool_autoextend_threshold.
	# thin_pool_autoextend_threshold = 70
	thin_pool_autoextend_threshold = 70

So as you can see - lvm2 clearly prohibits you to create a new thinLV
when you are above defined threshold.


To keep things single for a user - we have a single threshold value.


So what else is missing ?


>> lvm2 also DOES protect you from creation of new thin-pool when the fullness
>> is about lvm.conf defined threshold - so nothing really new here...
> 
> Maybe I am missing something: this threshold is about new thin pools or new 
> snapshots within a single pool? I was really speaking about the latter.

Yes - threshold applies to 'extension' as well as to creation of new thinLV.
(and snapshot is just a new thinLV)

> Let me repeat: I do *not* want thinp to automatically drop anything. I simply 
> what it to disallow new snapshot/volume creation when unallocated space is too 
> low

as said - already implemented....

  Committed (fsynced) writes are safe, and this is very good. However, *many*
> application do not properly issue fsync(); this is a fact of life.
> 
> I absolutely *do not expect* thinp to automatically cope well with this 
> applications - I full understand & agree that application *must* issue proper 
> fsyncs.
> 

Unfortunatelly lvm2 nor dm  can be responsible for whole kernel logic and
all user-land apps...


Yes - anonymous pages cache is somewhat Achilles' heel - but it's not a 
problem of thin-pool - all other 'provisioning' systems has some troubles....

So we really cannot fix it here.

You would need to prove that different strategy is better and fix linux kernel 
for this.

Until this moment - you need use well written user-land apps :) properly 
syncing written data - or not use thin-provisioning (and others).

You can also minimize amount of 'dirty' pages to avoid loosing too much data
in case you hit full thin-pool unexpectedly.....

You can sync every second to minimize amount of dirty pages....

Lots of things....  all of them will in some other the other impact system 
performance....


> In the past, I testified that XFS take its relatively long time to recognize 
> that a thin volume is unavailable - and many async writes can be lost in the 
> process. Ext4 + data=journaled did a better job, but a) it is not the default 
> filesystem in RH anymore and b) data=journaled is not the default option and 
> has its share of problems.

journaled is very 'secure' - but also very slow....

So depends what you aim for.

But this really cannot be solved on DM side...

> So, if in the face of a near-full pool, thinp refuse me to create a new 
> filesystem, I would be happy :)

So you are already happy right  :) ?
Your wish is upstream already for quite some time ;)

Regards

Zdenbek
