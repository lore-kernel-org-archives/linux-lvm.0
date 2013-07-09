Message-ID: <51DC1BBF.9090405@redhat.com>
Date: Tue, 09 Jul 2013 16:18:39 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
	<51DBDDE8.3010206@redhat.com>
	<CAKAA-nnZUvBuHmRaD9mn19gC51GfiihmweaJXTDRfRN92mstag@mail.gmail.com>
	<51DBFFC4.6070501@redhat.com>
	<CAKAA-nk2wszQn3QYz6QW3GPf+MB07TD2C3iA97OJZQtBU27WAA@mail.gmail.com>
	<51DC0E38.7060903@redhat.com>
	<CAKAA-nkJOgQtjmQwaFg0bBvDABf9j-VxmfvM-ZsU35mn2Tf+vQ@mail.gmail.com>
In-Reply-To: <CAKAA-nkJOgQtjmQwaFg0bBvDABf9j-VxmfvM-ZsU35mn2Tf+vQ@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Very slow i/o after snapshotting
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
To: Micky <mickylmartin@gmail.com>
Cc: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 9.7.2013 16:04, Micky napsal(a):
>> Do you write to the snapshot ?
>
> Not so often but there is like 1-5% usage allocation.
>
>> It's known FACT that performance of old snapshot is very far from being
>> ideal - it's very simply implementation - for a having consistent system to
>> make a backup of the volume - so for backup it doesn't really matter how
>> slow is that (it just needs to remain usable)
>
> True. But in case of domains running on a hypervisor, the purpose of doing
> a live backup slingshots and dies! I know it's not LVM's fault but
> sluggishness is!

Well here we are at lvm list - thus discussing lvm metadata and command line 
issues -  do you see slow command line execution ?

I think you are concerned about the perfomance of dm device - which
is a level below lvm  (kernel level)

Do not take is as some excuse - just we should use correct terms.


>
>> I'd suggest to go with much smaller chunks - i.e. 4-8-16KB - since if you
>> update a single 512 sector  -  512KB of data has to be copied!!! so really
>> bad idea, unless you overwrite large continuous portion of a device.
>
> I just tried that and got 2-3% improvement.
> Here are the gritty details, if someone's interested.
>    --- Logical volume ---
>    LV Write Access        read/write
>    LV snapshot status     active destination for lvma
>    LV Status              available
>    # open                 1
>    LV Size                200.10 GiB
>    Current LE             51226
>    COW-table size         100.00 GiB

Well here is the catch I guess.

While the snapshot might be reasonable enough with sizes like 10GiB,
it's getting much much worse when it scales up.

If you intent to use  100GiB snapshot - please consider thin volumes here.
Use upstream git and report bugs if something doesn't work.
There is not going to be a fix for  old-snaps - the on-disk format it quite 
unscalable.  Thin is the real fix for your problems here.
Also note - you will get horrible start-up times for snapshot of this size...


>> And yes - if you have rotational hdd - you need to expect horrible seek
>> times as well when reading/writing from snapshot target....
>
> Yes, they do. But I reproduced this one with multiple machines (and kernels)!

Once again - there is no hope  old-snaps could become magically faster unless
completely rewritten - and that what's thin provisioning is basically about ;)
We've tried to make everything much faster and smarter.
So do not ask for fixing old snapshots - they are simply unfixable for large
COW sizes - it's been designed for something very different then you try to 
use it for...

>
>> And yes - there are some horrible Segate hdd drives (as I've seen just
>> yesterday) were 2 disk reading programs at the same time may degrade 100MB/s
>> -> 4MB/s (and there is no  dm involved)
>
> Haha, no doubt. Seagates' are the worst ones. IMHO, Hitachi's drives
> run cooler and
> that's what Nagios tells me!

Just simple check is how fast parallel 'dd' you get from  /dev/sda partition - 
if you get approximately halve the speed  of single 'dd' - then you have good 
enough drive (Hitachi is usually pretty good).

Zdenek
