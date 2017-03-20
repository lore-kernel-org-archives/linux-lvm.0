References: <468f35bf-96b3-ccea-7549-37781d31e492@assyoma.it>
	<aa2e89d0-18a4-acda-9267-6ff5479a5895@redhat.com>
	<b7633987-709e-34ee-4e87-b3f5e8d73335@assyoma.it>
	<eff2bc4d-8008-7c02-cbdb-ac6ef66129f8@redhat.com>
	<25ba200c-7c26-ef51-4e89-d6c3f4dba395@assyoma.it>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <0a3aa51f-ef59-9330-2b74-0891ebf00c51@assyoma.it>
Date: Mon, 20 Mar 2017 10:47:16 +0100
MIME-Version: 1.0
In-Reply-To: <25ba200c-7c26-ef51-4e89-d6c3f4dba395@assyoma.it>
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
To: Zdenek Kabelac <zkabelac@redhat.com>, LVM general discussion and development <linux-lvm@redhat.com>

Hi all,
any comments on the report below?

Thanks.

On 09/03/2017 16:33, Gionatan Danti wrote:
> On 09/03/2017 12:53, Zdenek Kabelac wrote:
>>
>> Hmm - it would be interesting to see your 'metadata' -  it should be
>> still
>> quite good fit 128M of metadata for 512G  when you are not using
>> snapshots.
>>
>> What's been your actual test scenario ?? (Lots of LVs??)
>>
>
> Nothing unusual - I had a single thinvol with an XFS filesystem used to
> store an HDD image gathered using ddrescue.
>
> Anyway, are you sure that a 128 MB metadata volume is "quite good" for a
> 512GB volume with 128 KB chunks? My testing suggests something
> different. For example, give it a look at this empty thinpool/thinvol:
>
> [root@gdanti-laptop test]# lvs -a -o +chunk_size
>   LV               VG        Attr       LSize   Pool     Origin Data%
> Meta%  Move Log Cpy%Sync Convert Chunk
>   [lvol0_pmspare]  vg_kvm    ewi------- 128.00m
>                                      0
>   thinpool         vg_kvm    twi-aotz-- 500.00g                 0.00
> 0.81                             128.00k
>   [thinpool_tdata] vg_kvm    Twi-ao---- 500.00g
>                                      0
>   [thinpool_tmeta] vg_kvm    ewi-ao---- 128.00m
>                                      0
>   thinvol          vg_kvm    Vwi-a-tz-- 500.00g thinpool        0.00
>                                      0
>   root             vg_system -wi-ao----  50.00g
>                                      0
>   swap             vg_system -wi-ao----   3.75g
>                                      0
>
> As you can see, as it is a empty volume, metadata is at only 0.81% Let
> write 5 GB (1% of thin data volume):
>
> [root@gdanti-laptop test]# lvs -a -o +chunk_size
>   LV               VG        Attr       LSize   Pool     Origin Data%
> Meta%  Move Log Cpy%Sync Convert Chunk
>   [lvol0_pmspare]  vg_kvm    ewi------- 128.00m
>                                      0
>   thinpool         vg_kvm    twi-aotz-- 500.00g                 1.00
> 1.80                             128.00k
>   [thinpool_tdata] vg_kvm    Twi-ao---- 500.00g
>                                      0
>   [thinpool_tmeta] vg_kvm    ewi-ao---- 128.00m
>                                      0
>   thinvol          vg_kvm    Vwi-a-tz-- 500.00g thinpool        1.00
>                                      0
>   root             vg_system -wi-ao----  50.00g
>                                      0
>   swap             vg_system -wi-ao----   3.75g
>                                      0
>
> Metadata grown by the same 1%. Accounting for the initial 0.81
> utilization, this means that a near full data volume (with *no*
> overprovisionig nor snapshots) will exhaust its metadata *before* really
> becoming 100% full.
>
> While I can absolutely understand that this is expected behavior when
> using snapshots and/or overprovisioning, in this extremely simple case
> metadata should not be exhausted before data. In other words, the
> initial metadata creation process should be *at least* consider that a
> plain volume can be 100% full, and allocate according.
>
> The interesting part is that when not using MD, all is working properly:
> metadata are about 2x their minimal value (as reported by
> thin_metadata_size), and this provide ample buffer for
> snapshotting/overprovisioning. When using MD, the bad iteration between
> RAID chunks and thin metadata chunks ends with a too small metadata volume.
>
> This can become very bad. Give a look at what happens when creating a
> thin pool on a MD raid whose chunks are at 64 KB:
>
> [root@gdanti-laptop test]# lvs -a -o +chunk_size
>   LV               VG        Attr       LSize   Pool Origin Data% Meta%
> Move Log Cpy%Sync Convert Chunk
>   [lvol0_pmspare]  vg_kvm    ewi------- 128.00m
>                                 0
>   thinpool         vg_kvm    twi-a-tz-- 500.00g             0.00   1.58
>                             64.00k
>   [thinpool_tdata] vg_kvm    Twi-ao---- 500.00g
>                                 0
>   [thinpool_tmeta] vg_kvm    ewi-ao---- 128.00m
>                                 0
>   root             vg_system -wi-ao----  50.00g
>                                 0
>   swap             vg_system -wi-ao----   3.75g
>                                 0
>
> Thin metadata chunks are now at 64 KB - with the *same* 128 MB metadata
> volume size. Now metadata can only address ~50% of thin volume space.
>
>> But as said - there is no guarantee of the size to fit for any possible
>> use case - user  is supposed to understand what kind of technology he is
>> using,
>> and when he 'opt-out' from automatic resize - he needs to deploy his own
>> monitoring.
>
> True, but this trivial case should really works without
> tuning/monitoring. In short, let fail gracefully on a simple case...
>>
>> Otherwise you would have to simply always create 16G metadata LV if you
>> do not want to run out of metadata space.
>>
>>
>
> Absolutely true. I've written this email to report a bug, indeed ;)
> Thank you all for this outstanding work.
>

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
