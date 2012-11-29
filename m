Message-ID: <50B73B45.6040104@redhat.com>
Date: Thu, 29 Nov 2012 11:39:01 +0100
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <2726839.KTFC4Ya9jJ@laptop>
In-Reply-To: <2726839.KTFC4Ya9jJ@laptop>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Questions about thin pools and segment properties
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 29.11.2012 04:07, ben napsal(a):
> If I start with a pool like this:
>
> lvs --all --segments -o +chunksize,discards
>    LV            VG   Attr      #Str Type      SSize   Chunk  Discards
>    pool1         vg1  twi-a-tz-    1 thin-pool 100.00m 64.00k passdown
>    [pool1_tdata] vg1  Twi-aot--    1 linear     50.00m     0
>    [pool1_tdata] vg1  Twi-aot--    1 linear     50.00m     0
>    [pool1_tmeta] vg1  ewi-aot--    1 linear      2.00m     0
>
> My first question is if I look at "pool1" with liblvm2pp will
> there ever be more than one segment? I know "pool1_tdata"


For now yes - thin pool volume should (and internally must have)
only 1 segment.


> can have more but it looks like "pool1" is just one.
> My second question is if discards and chunksize are segment
> properties, can a pool have more than one setting of either?


LV is container of segments - segment has its type - and they have their 
properties. The problem is there is not very clear distinction/definition
what is actually property of  LV and what is property of lvsegment  and a lot
of segment properties have landed historically as LV property.

There is some black magic internally to handle things properly.
But lvm2 will not allow you to create i.e. linear volume with thin pool 
segment inside (unless there is a bug).

My proposal here would be - to probably auto magically check for
segment properties in the first LV segment if they are queried via
lv property call. (Agk ?) - that would probably made the live easier.

Zdenek
