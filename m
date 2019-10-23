References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
	<f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <0dd80515-d4db-273f-2ee4-78981c11b2c8@redhat.com>
Date: Wed, 23 Oct 2019 14:59:50 +0200
MIME-Version: 1.0
In-Reply-To: <f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>, "Stuart D. Gathman" <stuart@gathman.org>
Cc: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>

Dne 23. 10. 19 v 13:08 Gionatan Danti napsal(a):
> On 23/10/19 12:46, Zdenek Kabelac wrote:
>> Just few 'comments' - it's not really comparable - the efficiency of 
>> thin-pool metadata outperforms old snapshot in BIG way (there is no point to 
>> talk about snapshots that takes just couple of MiB)
> 
> Yes, this matches my experience.
> 
>> There is also BIG difference about the usage of old snapshot origin and 
>> snapshot.
>>
>> COW of old snapshot effectively cuts performance 1/2 if you write to origin.
> 
> If used without non-volatile RAID controller, 1/2 is generous - I measured 
> performance as low as 1/5 (with fat snapshot).
> 
> Talking about thin snapshot, an obvious performance optimization which seems 
> to not be implemented is to skip reading source data when overwriting in 
> larger-than-chunksize blocks.

Hi

There is no such optimization possible for old snapshots.
You would need to write ONLY to snapshots.

As soon as you start to write to origin - you have to 'read' original data 
from origin, copy them to COW storage, once this is finished, you can
overwrite origin data area with your writing I/O.

This is simply never going to work fast ;) - the fast way is thin-pool...

Old snapshots were designed for 'short' lived snapshots (so you can take
a backup of volume which is not being modified underneath).

Any idea of improving this old snapshots target are sooner or later going to 
end-up with thin-pool anyway :)  (we've been in this river many many years 
back in time...)


> For example, consider a completely filled 64k chunk thin volume (with thinpool 
> having ample free space). Snapshotting it and writing a 4k block on origin 

There is no support of  snapshot of snapshot  with old snaps...
It would be extremely slow to use...

> However, my testing shows that source chunks are always read, even when 
> completely overwritten.
> 
> Am I missing something?

Yep - you would need to always jump to your 'snapshot' - so instead of
keeping 'origin' on  major:minor  - it would need to become a 'snapshot'...
Seriously complex concept to work with - especially when there is thin-pool...

Regards

Zdenek
