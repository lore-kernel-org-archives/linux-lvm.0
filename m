References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
	<f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
	<0dd80515-d4db-273f-2ee4-78981c11b2c8@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <0fde933f-1e8d-60de-cada-4a49a67129c4@assyoma.it>
Date: Wed, 23 Oct 2019 16:37:38 +0200
MIME-Version: 1.0
In-Reply-To: <0dd80515-d4db-273f-2ee4-78981c11b2c8@redhat.com>
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>, "Stuart D. Gathman" <stuart@gathman.org>
Cc: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>

On 23/10/19 14:59, Zdenek Kabelac wrote:
> Dne 23. 10. 19 v 13:08 Gionatan Danti napsal(a):
>> Talking about thin snapshot, an obvious performance optimization which 
>> seems to not be implemented is to skip reading source data when 
>> overwriting in larger-than-chunksize blocks.
> 
> Hi
> 
> There is no such optimization possible for old snapshots.
> You would need to write ONLY to snapshots.
> 
> As soon as you start to write to origin - you have to 'read' original 
> data from origin, copy them to COW storage, once this is finished, you can
> overwrite origin data area with your writing I/O.
> 
> This is simply never going to work fast ;) - the fast way is thin-pool...
> 
> Old snapshots were designed for 'short' lived snapshots (so you can take
> a backup of volume which is not being modified underneath).
> 
> Any idea of improving this old snapshots target are sooner or later 
> going to end-up with thin-pool anyway :)� (we've been in this river many 
> many years back in time...)
> 
> 
>> For example, consider a completely filled 64k chunk thin volume (with 
>> thinpool having ample free space). Snapshotting it and writing a 4k 
>> block on origin 
> 
> There is no support of� snapshot of snapshot� with old snaps...
> It would be extremely slow to use...
> 
>> However, my testing shows that source chunks are always read, even 
>> when completely overwritten.
>>
>> Am I missing something?
> 
> Yep - you would need to always jump to your 'snapshot' - so instead of
> keeping 'origin' on� major:minor� - it would need to become a 'snapshot'...
> Seriously complex concept to work with - especially when there is 
> thin-pool...

Hi, I was speaking about *thin* snapshots here. Rewriting the example 
given above (for clarity):

"For example, consider a completely filled 64k chunk thin volume (with 
thinpool having ample free space). Snapshotting it and writing a 4k 
block on origin will obviously cause a read of the original 64k chunk, 
an in-memory change of the 4k block and a write of the entire modified 
64k block to a new location. But writing, say, a 1 MB block should *not* 
cause the same read on source: after all, the read data will be 
immediately discarded, overwritten by the changed 1 MB block."

I would expect that such large-block *thin* snapshot rewrite behavior 
would not cause a read/modify/write, but it really does.

Is this a low-hanging fruit or there are more fundamental problem 
avoiding read/modify/write in this case?

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
