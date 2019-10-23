References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
	<f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
	<0dd80515-d4db-273f-2ee4-78981c11b2c8@redhat.com>
	<0fde933f-1e8d-60de-cada-4a49a67129c4@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <13d450bf-f6ad-7db8-eec1-88c4eb473287@redhat.com>
Date: Wed, 23 Oct 2019 17:37:22 +0200
MIME-Version: 1.0
In-Reply-To: <0fde933f-1e8d-60de-cada-4a49a67129c4@assyoma.it>
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

Dne 23. 10. 19 v 16:37 Gionatan Danti napsal(a):
> On 23/10/19 14:59, Zdenek Kabelac wrote:
>> Dne 23. 10. 19 v 13:08 Gionatan Danti napsal(a):
>>> Talking about thin snapshot, an obvious performance optimization which 
>>> seems to not be implemented is to skip reading source data when overwriting 
>>> in larger-than-chunksize blocks.
> 
> "For example, consider a completely filled 64k chunk thin volume (with 
> thinpool having ample free space). Snapshotting it and writing a 4k block on 
> origin will obviously cause a read of the original 64k chunk, an in-memory 
> change of the 4k block and a write of the entire modified 64k block to a new 
> location. But writing, say, a 1 MB block should *not* cause the same read on 
> source: after all, the read data will be immediately discarded, overwritten by 
> the changed 1 MB block."
> 
> I would expect that such large-block *thin* snapshot rewrite behavior would 
> not cause a read/modify/write, but it really does.
> 
> Is this a low-hanging fruit or there are more fundamental problem avoiding 
> read/modify/write in this case?

Hi

If you use 1MiB chunksize for thin-pool and you use  'dd' with proper bs size
and you write 'aligned' on 1MiB boundary (be sure you user  directIO, so you 
are not a victim of some page cache flushing...) - there should not be any 
useless read.

If you still do see such read - and you can easily reproduce this with latest 
kernel - report a bug please with your reproducer and results.

Regards

Zdenek
