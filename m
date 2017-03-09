References: <468f35bf-96b3-ccea-7549-37781d31e492@assyoma.it>
	<aa2e89d0-18a4-acda-9267-6ff5479a5895@redhat.com>
	<b7633987-709e-34ee-4e87-b3f5e8d73335@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <eff2bc4d-8008-7c02-cbdb-ac6ef66129f8@redhat.com>
Date: Thu, 9 Mar 2017 12:53:57 +0100
MIME-Version: 1.0
In-Reply-To: <b7633987-709e-34ee-4e87-b3f5e8d73335@assyoma.it>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Possible bug in thin metadata size with Linux MDRAID
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Gionatan Danti <g.danti@assyoma.it>

Dne 9.3.2017 v 12:24 Gionatan Danti napsal(a):
> On 08/03/2017 19:55, Zdenek Kabelac wrote:
>>
>> Hi
>>
>> If you do NOT specify any setting - lvm2 targets 128M metadata size.
>>
>> If you specify '--chunksize'  lvm2 tries to find better fit and it happens
>> to be slightly better with 256M metadata size.
>>
>> Basically - you could specify anything to the last bit - and if you
>> don't lvm2 does a little 'magic' and tries to come with 'reasonable'
>> defaults for given kernel and time.
>>
>> That said - I've in my git tree some rework of this code - mainly for
>> better support of metadata profiles.
>> (And my git calculation gives me 256K chunksize + 128M metadata size -
>> so there was possibly something not completely right in version 166)
>>
>>
>
> 256 KB chunksize would be perfectly reasonable
>
>>> Why I saw two very different metadata volume sizes? Chunksize was 128
>>> KB in
>>> both cases; the only difference is that I explicitly specified it on the
>>> command line...
>>
>> You should NOT forget - that using 'thin-pool' without any monitoring
>> and automatic resize is somewhat 'dangerous'.
>>
>
> True, but I should have no problem if not using snapshot or overprovisioning -
> ie when all data chunks are allocated (filesystem full) but no
> overprovisioned. This time, however, the created metadata pool was
> *insufficient* to even address the provisioned data chunks.

Hmm - it would be interesting to see your 'metadata' -  it should be still
quite good fit 128M of metadata for 512G  when you are not using snapshots.

What's been your actual test scenario ?? (Lots of LVs??)

But as said - there is no guarantee of the size to fit for any possible use 
case - user  is supposed to understand what kind of technology he is using,
and when he 'opt-out' from automatic resize - he needs to deploy his own
monitoring.

Otherwise you would have to simply always create 16G metadata LV if you do not 
want to run out of metadata space.


> I am under impression that 128 KB size was chosen because this was MD chunk
> size. Indeed further tests seem to confirm this.

Ahh yeah - there was small issue - when the 'hint' for device geometry was 
used it has started from 'default' 64K size - instead of already counted 256K 
chunk size.


Regards

Zdenek
