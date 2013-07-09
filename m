MIME-Version: 1.0
In-Reply-To: <51DC0E38.7060903@redhat.com>
References: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
	<51DBDDE8.3010206@redhat.com>
	<CAKAA-nnZUvBuHmRaD9mn19gC51GfiihmweaJXTDRfRN92mstag@mail.gmail.com>
	<51DBFFC4.6070501@redhat.com>
	<CAKAA-nk2wszQn3QYz6QW3GPf+MB07TD2C3iA97OJZQtBU27WAA@mail.gmail.com>
	<51DC0E38.7060903@redhat.com>
Date: Tue, 9 Jul 2013 19:04:10 +0500
Message-ID: <CAKAA-nkJOgQtjmQwaFg0bBvDABf9j-VxmfvM-ZsU35mn2Tf+vQ@mail.gmail.com>
From: Micky <mickylmartin@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: Marian Csontos <mcsontos@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

> Do you write to the snapshot ?

Not so often but there is like 1-5% usage allocation.

> It's known FACT that performance of old snapshot is very far from being
> ideal - it's very simply implementation - for a having consistent system to
> make a backup of the volume - so for backup it doesn't really matter how
> slow is that (it just needs to remain usable)

True. But in case of domains running on a hypervisor, the purpose of doing
a live backup slingshots and dies! I know it's not LVM's fault but
sluggishness is!

> I'd suggest to go with much smaller chunks - i.e. 4-8-16KB - since if you
> update a single 512 sector  -  512KB of data has to be copied!!! so really
> bad idea, unless you overwrite large continuous portion of a device.

I just tried that and got 2-3% improvement.
Here are the gritty details, if someone's interested.
  --- Logical volume ---
  LV Write Access        read/write
  LV snapshot status     active destination for lvma
  LV Status              available
  # open                 1
  LV Size                200.10 GiB
  Current LE             51226
  COW-table size         100.00 GiB
  COW-table LE           25600
  Allocated to snapshot  0.14%
  Snapshot chunk size    4.00 KiB
  Segments               1
  Allocation             inherit
  Read ahead sectors     auto
  - currently set to     16384
  Block device           253:26

> And yes - if you have rotational hdd - you need to expect horrible seek
> times as well when reading/writing from snapshot target....

Yes, they do. But I reproduced this one with multiple machines (and kernels)!

> And yes - there are some horrible Segate hdd drives (as I've seen just
> yesterday) were 2 disk reading programs at the same time may degrade 100MB/s
> -> 4MB/s (and there is no  dm involved)

Haha, no doubt. Seagates' are the worst ones. IMHO, Hitachi's drives
run cooler and
that's what Nagios tells me!
