Message-ID: <51DC0E38.7060903@redhat.com>
Date: Tue, 09 Jul 2013 15:20:56 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAKAA-nmORsWxeOX1O0Hnv6nFx_1nM41CUULk15biAfuderXmGg@mail.gmail.com>
	<51DBDDE8.3010206@redhat.com>
	<CAKAA-nnZUvBuHmRaD9mn19gC51GfiihmweaJXTDRfRN92mstag@mail.gmail.com>
	<51DBFFC4.6070501@redhat.com>
	<CAKAA-nk2wszQn3QYz6QW3GPf+MB07TD2C3iA97OJZQtBU27WAA@mail.gmail.com>
In-Reply-To: <CAKAA-nk2wszQn3QYz6QW3GPf+MB07TD2C3iA97OJZQtBU27WAA@mail.gmail.com>
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

Dne 9.7.2013 14:43, Micky napsal(a):
> Thanks for the quick response.
>
> It is working fine without the LVM. It is just the snapshot which
> makes the things slow. For instance, take a snapshot of an LV that's
> running a DomU -- after that point on, the load inside that DomU will
> start to increase until the snapshot is removed. Same is with KVM. The
> only difference without hypervisor is, it is not terribly slow but
> still lags, like, you get 15MB/s after snapshot and ~90-100MB/s
> without snapshot being on the same volume!
>
> Even SSH becomes slow, output freezes and you get sudden outbursts
> after a few seconds.
>
> As for the reason of copying big chunks out of LVs -- it is simple --
> copy on write magic as short term image backup strategy! But I
> realized that the magic with LVM comes with a price and that is I/O
> latency ;)
>

Do you write to the snapshot ?

It's known FACT that performance of old snapshot is very far from being ideal 
- it's very simply implementation - for a having consistent system to make a 
backup of the volume - so for backup it doesn't really matter how slow is that 
(it just needs to remain usable)

You have just very simple list of blocks stored in COW devices together with 
list of exceptions.  And modified blocks are simple copied first (so there is 
no reference counting or anything resembling that...)

Using 512kB chunks is actually the worst idea for old snaps (well in fact any 
snaps) especially if they are coded in that way with exception store.

I'd suggest to go with much smaller chunks - i.e. 4-8-16KB - since if you 
update a single 512 sector  -  512KB of data has to be copied!!! so really bad 
idea, unless you overwrite large continuous portion of a device.

And yes - if you have rotational hdd - you need to expect horrible seek times 
as well when reading/writing from snapshot target....

And yes - there are some horrible Segate hdd drives (as I've seen just 
yesterday) were 2 disk reading programs at the same time may degrade 100MB/s 
-> 4MB/s (and there is no  dm involved)

Zdenek
