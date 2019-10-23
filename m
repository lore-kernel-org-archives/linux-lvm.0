References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
	<f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
	<e282b0b3-e373-c454-8243-3b09c23dd2a1@izyk.ru>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <8a27504b-1b3a-7126-7ade-18f57b819ead@redhat.com>
Date: Wed, 23 Oct 2019 15:05:14 +0200
MIME-Version: 1.0
In-Reply-To: <e282b0b3-e373-c454-8243-3b09c23dd2a1@izyk.ru>
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Ilia Zykov <mail@izyk.ru>

Dne 23. 10. 19 v 14:20 Ilia Zykov napsal(a):
> On 23.10.2019 14:08, Gionatan Danti wrote:
>>
>> For example, consider a completely filled 64k chunk thin volume (with
>> thinpool having ample free space). Snapshotting it and writing a 4k
>> block on origin will obviously cause a read of the original 64k chunk,
>> an in-memory change of the 4k block and a write of the entire modified
>> 64k block to a new location. But writing, say, a 1 MB block should *not*
>> cause the same read on source: after all, the read data will be
>> immediately discarded, overwritten by the changed 1 MB block.
>>
>> However, my testing shows that source chunks are always read, even when
>> completely overwritten.
> 
> Not only read but sometimes write.
> I watched it without snapshot. Only zeroing was enabled. Before wrote
> new chunks "dd bs=1048576 ..." chunks were zeroed. But for security it's
> good. IMHO: In this case good choice firstly write chunks to the disk
> and then give this chunks to the volume.


Yep - we are recommending to disable zeroing as soon as chunksize >512K.

But for 'security' reason the option it's up to users to select what fits the 
needs in the best way - there is no  'one solution fits them all' in this case.

Clearly when you put a modern filesystem (ext4, xfs...) on top of thinLV - you 
can't read junk data - filesystem knows very well about written portions.
But if you will access thinLV device on 'block-level' with 'dd' command you 
might see some old data trash if zeroing is disabled...

For smaller chunksizes  zeroing is usually not a big deal - with bigger chunks 
it slows down initial provisioning in major way - but once the block is 
provisioned there are no further costs....

Regards

Zdenek
