Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2VCGSqF009249
	for <linux-lvm@redhat.com>; Thu, 31 Mar 2016 08:16:28 -0400
References: <CAAYit8QYf0yTHSumcpTdVBRN6uvwNj3v4NHyThKOZen92WZY-Q@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56FD151C.8060500@redhat.com>
Date: Thu, 31 Mar 2016 14:16:28 +0200
MIME-Version: 1.0
In-Reply-To: <CAAYit8QYf0yTHSumcpTdVBRN6uvwNj3v4NHyThKOZen92WZY-Q@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Bugs in DM_DEVICE_STATUS ioctl no_flush flag
	settings
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

Dne 21.3.2016 v 13:06 Ming-Hung Tsai napsal(a):
> Hi,

Hi

Thanks for valuable deep code scanning.


>
> Here are some patches related to DM_DEVICE_STATUS ioctl handling in dm-thin.
>
> ------------------------------------------------------------------
> 1. Fix incorrect no_flush flag settings when querying device utilization
>
> The parameter lv is NULL when querying thin-pool metadata percent (and also the
> dlid parameter), thus I use the target_type string instead.
>


Yes - forgotten state - fixed just a bit differently.

> ------------------------------------------------------------------
> 2. Set no_flush flag when querying device info to avoid freeze
>

Yes - will need to do - but this also applies on cache device.
So working on larger fix for both.


> ------------------------------------------------------------------
> 3. Fix _metadatapercent_disp to not to handle thin volumes
>


Actually I always planned to 'display' highest_mapped_sector -
so I did now upstreamed it now (as it seemed arg was unused).

So "Meta%" shows what's been the highest written sector as percent.
We do plan to add either switch or new field to show those '%' in
form of byte sizes in future...

Not yet sure how useful or confusing this info is for now...
But i.e. it's interesting to see  how much data is written
by mkfs.ext4/xfs/reiserfs  and how far writes goes on a thin device.

Time for complains...

>
> Beside these patches, I think that the mechanism to obtain lv data utilization
> should be revised. Given a thin pool vg1/tp1, I hope that the command
>
> # lvs vg1/tp1 -o lv_attr,data_percent,metadata_percent
>
> should run DM_DEVICE_STATUS ioctl only once.

Yes - planned - but there is always not enough time to do house-keeping job
and new features are pushed more strongly :(....


> To achieve this, we should calculate the percents in early phase,
> then cache the calculated percents in struct lv_with_info_and_seg_status,
> thus the column handlers _datapercent_disp() and _metadatapercent_disp()
> could obtain the cached percents.
>
> The follow is my proposed approach, inspired by lvm-cache's implementation:
>
> (1) Declare a new structure for cache percents:

Yeah - I've been create lv_cache struct with this in mind.

However the whole issue should be seen more generically in 'OO-way'.

So we do want to have 'status' object with reporting methods,
and this object should be filled by 'segment' method.

The complexity grows however as we do have some segments being related
to other segments - that's why we currently have very ugly code hack
inside to do filling of most status struct in one place - which is totally 
unextendable - but ATM was the quickest way to achieve reasonable goal.

So another TODO job once there is time for it...
A LOT of work should be really done through segment methods instead of placing 
quirks across whole code base - we need more hands....

For now I'm rather conservative about large code-base changes till Heinz's 
raid branch is fully merged.

Regards

Zdenek

PS: I'm amazed some else is able to read lvm2 code.
