References: <468f35bf-96b3-ccea-7549-37781d31e492@assyoma.it>
	<aa2e89d0-18a4-acda-9267-6ff5479a5895@redhat.com>
	<b7633987-709e-34ee-4e87-b3f5e8d73335@assyoma.it>
	<eff2bc4d-8008-7c02-cbdb-ac6ef66129f8@redhat.com>
	<25ba200c-7c26-ef51-4e89-d6c3f4dba395@assyoma.it>
	<0a3aa51f-ef59-9330-2b74-0891ebf00c51@assyoma.it>
	<7a5221fc-6c6c-8af3-91ec-66fe68b1cdde@redhat.com>
	<c229158c-9669-ead2-ba1e-ea7d6b0d04f2@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <5fe94876-f695-0cf0-2277-e6fde5f91ba6@redhat.com>
Date: Mon, 20 Mar 2017 12:01:43 +0100
MIME-Version: 1.0
In-Reply-To: <c229158c-9669-ead2-ba1e-ea7d6b0d04f2@assyoma.it>
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
To: Gionatan Danti <g.danti@assyoma.it>, LVM general discussion and development <linux-lvm@redhat.com>

Dne 20.3.2017 v 11:45 Gionatan Danti napsal(a):
> On 20/03/2017 10:51, Zdenek Kabelac wrote:
>>
>> Please check upstream behavior (git HEAD)
>> It will still take a while before final release so do not use it
>> regularly yet (as few things still may  change).
>
> I will surely try with git head and report back here.
>
>>
>> Not sure for which other comment you look for.
>>
>> Zdenek
>>
>>
>>
>
> 1. you suggested that a 128 MB metadata volume is "quite good" for a 512GB
> volume and 128KB chunkgs. However, my tests show that a near full data volume
> (with *no* overprovisionig nor snapshots) will exhaust its metadata *before*
> really becoming 100% full.
>
> 2. On a MD RAID with 64KB chunk size, things become much worse:
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
> So, I am missing something or the RHEL 7.3-provided LVM has some serious
> problems identifing correct metadata volume size when running on top of a MD
> RAID device?


As said - please try with HEAD - and report back if you still see a problem.
There were couple issue fixed along this path.

In my test it seems  500G needs at least 258M with 64K chunksize.

On the other hand - it's never been documented that thin-pool without 
monitoring is supposed to fit single LV AFAIK - it's basically needed that 
user knows what he is using when he uses  thin-provisioning  - but of course 
we continuously try to improve things to be more usable.

Zdenek
