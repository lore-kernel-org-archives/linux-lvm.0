References: <418002318.647314.1505245480415.ref@mail.yahoo.com>
	<418002318.647314.1505245480415@mail.yahoo.com>
	<4dcfc4a557e98e0f98c6a1d568538d07@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <41419c78-953e-cb78-ade7-c9fc611a92fb@redhat.com>
Date: Wed, 13 Sep 2017 00:16:10 +0200
MIME-Version: 1.0
In-Reply-To: <4dcfc4a557e98e0f98c6a1d568538d07@assyoma.it>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>, matthew patton <pattonme@yahoo.com>

Dne 12.9.2017 v 23:36 Gionatan Danti napsal(a):
> Il 12-09-2017 21:44 matthew patton ha scritto:

> Again, please don't speak about things you don't know.
> I am *not* interested in thin provisioning itself at all; on the other side, I 
> find CoW and fast snapshots very useful.


Not going to comment KVM storage architecture - but with this statemnet -
you have VERY simple usage:


Just minimize chance for overprovisioning -

let's go by example:

you have  10  10GiB volumes  and you have 20 snapshots...


to not overprovision - you need 10 GiB * 30 LV  = 300GiB thin-pool.

if that sounds too-much.

you can go with 150 GiB - to always 100% cover all 'base' volumes.
and have some room for snapshots.


Now the fun begins - while monitoring is running -
you get callback for  50%, 55%... 95% 100%
at each moment  you can do whatever action you need.


So assume 100GiB is bare minimum for base volumes - you ignore any state with 
less then 66% occupancy of thin-pool and you start solving problems with 85% 
(~128GiB)- you know some snapshot is better to be dropped.
You may try 'harder' actions for higher percentage.
(you need to consider how many dirty pages you leave floating your system
and other variables)

Also you pick with some logic the snapshot which you want to drop -
Maybe the oldest ?
(see airplane :) URL link)....

Anyway - you have plenty of time to solve it still at this moment
without any danger of losing write operation...
All you can lose is some 'snapshot' which might have been present a bit 
longer...  but that is supposedly fine with your model workflow...

Of course you are getting in serious problem, if you try to keep all these 
demo-volumes within 50GiB with massive overprovisioning ;)

There you have much hard times what should happen what should be removed and 
where is possibly better to STOP everything and let admin decide what is the 
ideal next step....

Regards

Zdenek
