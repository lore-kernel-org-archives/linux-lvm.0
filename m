References: <CAAYit8RUbKP9ntgsDZTjMeSNBLz55Ms3pVY22i9EhfZWncPP7A@mail.gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <79da4c0b-e2cc-01db-1bde-1b662f896edd@redhat.com>
Date: Mon, 4 Dec 2017 11:50:38 +0100
MIME-Version: 1.0
In-Reply-To: <CAAYit8RUbKP9ntgsDZTjMeSNBLz55Ms3pVY22i9EhfZWncPP7A@mail.gmail.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Why LVM doesn't send the dm-thin delete message
 immediately after volume creation failure
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ming-Hung Tsai <mingnus@gmail.com>

Dne 4.12.2017 v 05:30 Ming-Hung Tsai napsal(a):
> Hi All,
> 
> I'm not sure if it is a bug or an intention. If there's error in
> volume creation, the function _lv_create_an_lv() invokes lv_remove()
> to delete the newly created volume. However, in the case of creating
> thin volumes, it just queues a "delete" message without sending it
> immediately. The pending message won't be process until the next
> lvcreate.
> 
> Why not send it before the end of _lv_create_an_lv(), to ensure the
> synchronization between LVM and kernel? (i.e., no dangling volume in
> kernel metadata, and the transaction ID is also synced)
> 

Hi

This is unfortunately not as easy as it might look like.

This error path is quite hard and lvm2 is not yet fully capable to handle all 
variants here.

So ATM it tries to do 'less harm' so possible further recovery is more simple.

The reason here is this - when kernel 'thin-pool' is deleting  any thin device 
it needs some 'free' metadata space to handle this operation (as it never 
overwrite existing btrees and uses journaling).

When thin-pool fails to create new thin device - there is likely big 
possibility the reason for failure is 'out-of-metadata' condition.

Clearly there is no point in trying to 'delete' anything if thin-pool hits 
this state.

ATM lvm2's  'lvcreate' command is incapable to do 'metadata' resize operation
to gain some more space for successful delete operation - so as such this
is left for separate 'repair'.

As always applies - do not force thin-pool to run at its corner case - since 
it's not yet possible to completely automated in all scenarios.

As a protection - lvm2 should not let you even create a new thinLV if the free 
space in metadata is above some certain safe-level - but clearly there is race
of  time-of-check & time-of-use - so if there is some major load pushed into 
thin-pool and at the some time there is try of create - we still may hit 
dead-spot (especially for small sized metadata).

So this briefly explain why we rather queue 'delete' instead of directly 
pushing it to thin-target.

To enhances this logic - we would need we more 'statuses' during operation for 
making sure we are not operating on already overfilled thin-pool - this will 
eventually happen...

Regards

Zdenek
