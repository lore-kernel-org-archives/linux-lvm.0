References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
Date: Wed, 23 Oct 2019 12:46:23 +0200
MIME-Version: 1.0
In-Reply-To: <alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] exposing snapshot block device
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
To: LVM general discussion and development <linux-lvm@redhat.com>, "Stuart D. Gathman" <stuart@gathman.org>
Cc: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>

Dne 22. 10. 19 v 18:15 Stuart D. Gathman napsal(a):
> On Tue, 22 Oct 2019, Zdenek Kabelac wrote:
> 
>> Dne 22. 10. 19 v 17:29 Dalebj�rk, Tomas napsal(a):
>>> But, it would be better if the cow device could be recreated in a faster 
>>> way, mentioning that all blocks are present on an external device, so that 
>>> the LV volume can be restored much quicker using "lvconvert --merge" command.
> 
>> I do not want to break your imagination here, but that is exactly the thing 
>> you can do with thin provisioning and thin_delta tool.
> 
> lvconvert --merge does a "rollback" to the point at which the snapshot
> was taken.� The master LV already has current data.� What Tomas wants to
> be able to do a "rollforward" from the point at which the snapshot was
> taken.� He also wants to be able to put the cow volume on an
> extern/remote medium, and add a snapshot using an already existing cow.
> 
> This way, restoring means copying the full volume from backup, creating
> a snapshot using existing external cow, then lvconvert --merge instantly 
> logically applies the cow changes while updating the master
> LV.
> 
> Pros:
> 
> "Old" snapshots are exactly as efficient as thin when there is exactly
> one.� They only get inefficient with multiple snapshots.� On the other
> hand, thin volumes are as inefficient as an old LV with one snapshot.
> An old LV is as efficient, and as anti-fragile, as a partition.� Thin
> volumes are much more flexible, but depend on much more fragile database
> like meta-data.


Just few 'comments' - it's not really comparable - the efficiency of thin-pool 
metadata outperforms old snapshot in BIG way (there is no point to talk about 
snapshots that takes just couple of MiB)

There is also BIG difference about the usage of old snapshot origin and snapshot.

COW of old snapshot effectively cuts performance 1/2 if you write to origin.

> For this reason, I always prefer "old" LVs when the functionality of
> thin LVs are not actually needed.� I can even manually recover from
> trashed meta data by editing it, as it is human readable text.

On the other hand you can loose  COW snapshot at any moment in time
if your 'COW' storage is no big enough - this is very different
from thin-poo.....

Regards

Zdenek
