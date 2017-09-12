MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Date: Wed, 13 Sep 2017 00:41:11 +0200
From: Gionatan Danti <g.danti@assyoma.it>
In-Reply-To: <41419c78-953e-cb78-ade7-c9fc611a92fb@redhat.com>
References: <418002318.647314.1505245480415.ref@mail.yahoo.com>
	<418002318.647314.1505245480415@mail.yahoo.com>
	<4dcfc4a557e98e0f98c6a1d568538d07@assyoma.it>
	<41419c78-953e-cb78-ade7-c9fc611a92fb@redhat.com>
Message-ID: <d994dea1f0b3a800cc8d546bf8d9214f@assyoma.it>
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
To: Zdenek Kabelac <zkabelac@redhat.com>
Cc: matthew, LVM general discussion and development <linux-lvm@redhat.com>

Il 13-09-2017 00:16 Zdenek Kabelac ha scritto:
> Dne 12.9.2017 v 23:36 Gionatan Danti napsal(a):
>> Il 12-09-2017 21:44 matthew patton ha scritto:
> 
>> Again, please don't speak about things you don't know.
>> I am *not* interested in thin provisioning itself at all; on the other 
>> side, I find CoW and fast snapshots very useful.
> 
> 
> Not going to comment KVM storage architecture - but with this statemnet 
> -
> you have VERY simple usage:
> 
> 
> Just minimize chance for overprovisioning -
> 
> let's go by example:
> 
> you have  10  10GiB volumes  and you have 20 snapshots...
> 
> 
> to not overprovision - you need 10 GiB * 30 LV  = 300GiB thin-pool.
> 
> if that sounds too-much.
> 
> you can go with 150 GiB - to always 100% cover all 'base' volumes.
> and have some room for snapshots.
> 
> 
> Now the fun begins - while monitoring is running -
> you get callback for  50%, 55%... 95% 100%
> at each moment  you can do whatever action you need.
> 
> 
> So assume 100GiB is bare minimum for base volumes - you ignore any
> state with less then 66% occupancy of thin-pool and you start solving
> problems with 85% (~128GiB)- you know some snapshot is better to be
> dropped.
> You may try 'harder' actions for higher percentage.
> (you need to consider how many dirty pages you leave floating your 
> system
> and other variables)
> 
> Also you pick with some logic the snapshot which you want to drop -
> Maybe the oldest ?
> (see airplane :) URL link)....
> 
> Anyway - you have plenty of time to solve it still at this moment
> without any danger of losing write operation...
> All you can lose is some 'snapshot' which might have been present a
> bit longer...  but that is supposedly fine with your model workflow...
> 
> Of course you are getting in serious problem, if you try to keep all
> these demo-volumes within 50GiB with massive overprovisioning ;)
> 
> There you have much hard times what should happen what should be
> removed and where is possibly better to STOP everything and let admin
> decide what is the ideal next step....
> 

Hi Zdenek,
I fully agree with what you said above, and I sincerely thank you for 
taking the time to reply.
However, I am not sure to understand *why* reserving space for a thin 
volume seems a bad idea to you.

Lets have a 100 GB thin pool, and wanting to *never* run out of space in 
spite of taking multiple snapshots.
To achieve that, I need to a) carefully size the original volume, b) ask 
the thin pool to reserve the needed space and c) counting the "live" 
data (REFER in ZFS terms) allocated inside the thin volume.

Step-by-step example:
- create a 40 GB thin volume and subtract its size from the thin pool 
(USED 40 GB, FREE 60 GB, REFER 0 GB);
- overwrite the entire volume (USED 40 GB, FREE 60 GB, REFER 40 GB);
- snapshot the volume (USED 40 GB, FREE 60 GB, REFER 40 GB);
- completely overwrite the original volume (USED 80 GB, FREE 20 GB, 
REFER 40 GB);
- a new snapshot creation will fails (REFER is higher then FREE).

Result: thin pool is *never allowed* to fill. You need to keep track of 
per-volume USED and REFER space, but thinp performance should not be 
impacted in any manner. This is not theoretical: it is already working 
in this manner with ZVOLs and refreservation, *without* 
involing/requiring any advanced coupling/integration between block and 
filesystem layers.

Don't get me wrong: I am sure that, if you choose to not implement this 
scheme, you have a very good reason to do that. Moreover, I understand 
that patches are welcome :)

But I would like to understand *why* this possibility is ruled out with 
such firmness.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
