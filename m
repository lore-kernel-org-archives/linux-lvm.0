References: <c1598cf7-442e-13c5-5877-c6e2667bb4bd@gmail.com>
	<909d4cae-ddd2-3951-eee8-8dec8faa6f22@redhat.com>
	<def626d9-52ef-4761-ebe0-3a29bd664bb1@gmail.com>
	<f1f7dfc1-dfd8-a023-5305-2065446a890e@redhat.com>
	<alpine.LRH.2.21.1910221142290.1156@fairfax.gathman.org>
	<f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <f73ab6ce-ba22-34f8-7153-e876b13fab5c@assyoma.it>
Date: Wed, 23 Oct 2019 13:08:37 +0200
MIME-Version: 1.0
In-Reply-To: <f3a53c24-1f91-e5f5-e7e1-091b886da44a@redhat.com>
Content-Language: it-IT
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Zdenek Kabelac <zkabelac@redhat.com>, "Stuart D. Gathman" <stuart@gathman.org>
Cc: =?UTF-8?Q?Dalebj=c3=b6rk=2c_Tomas?= <tomas.dalebjork@gmail.com>

On 23/10/19 12:46, Zdenek Kabelac wrote:
> Just few 'comments' - it's not really comparable - the efficiency of 
> thin-pool metadata outperforms old snapshot in BIG way (there is no 
> point to talk about snapshots that takes just couple of MiB)

Yes, this matches my experience.

> There is also BIG difference about the usage of old snapshot origin and 
> snapshot.
> 
> COW of old snapshot effectively cuts performance 1/2 if you write to 
> origin.

If used without non-volatile RAID controller, 1/2 is generous - I 
measured performance as low as 1/5 (with fat snapshot).

Talking about thin snapshot, an obvious performance optimization which 
seems to not be implemented is to skip reading source data when 
overwriting in larger-than-chunksize blocks.

For example, consider a completely filled 64k chunk thin volume (with 
thinpool having ample free space). Snapshotting it and writing a 4k 
block on origin will obviously cause a read of the original 64k chunk, 
an in-memory change of the 4k block and a write of the entire modified 
64k block to a new location. But writing, say, a 1 MB block should *not* 
cause the same read on source: after all, the read data will be 
immediately discarded, overwritten by the changed 1 MB block.

However, my testing shows that source chunks are always read, even when 
completely overwritten.

Am I missing something?

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
