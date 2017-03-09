References: <468f35bf-96b3-ccea-7549-37781d31e492@assyoma.it>
	<aa2e89d0-18a4-acda-9267-6ff5479a5895@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <b7633987-709e-34ee-4e87-b3f5e8d73335@assyoma.it>
Date: Thu, 9 Mar 2017 12:24:04 +0100
MIME-Version: 1.0
In-Reply-To: <aa2e89d0-18a4-acda-9267-6ff5479a5895@redhat.com>
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

On 08/03/2017 19:55, Zdenek Kabelac wrote:
>
> Hi
>
> If you do NOT specify any setting - lvm2 targets 128M metadata size.
>
> If you specify '--chunksize'  lvm2 tries to find better fit and it happens
> to be slightly better with 256M metadata size.
>
> Basically - you could specify anything to the last bit - and if you
> don't lvm2 does a little 'magic' and tries to come with 'reasonable'
> defaults for given kernel and time.
>
> That said - I've in my git tree some rework of this code - mainly for
> better support of metadata profiles.
> (And my git calculation gives me 256K chunksize + 128M metadata size -
> so there was possibly something not completely right in version 166)
>
>

256 KB chunksize would be perfectly reasonable

>> Why I saw two very different metadata volume sizes? Chunksize was 128
>> KB in
>> both cases; the only difference is that I explicitly specified it on the
>> command line...
>
> You should NOT forget - that using 'thin-pool' without any monitoring
> and automatic resize is somewhat 'dangerous'.
>

True, but I should have no problem if not using snapshot or 
overprovisioning - ie when all data chunks are allocated (filesystem 
full) but no overprovisioned. This time, however, the created metadata 
pool was *insufficient* to even address the provisioned data chunks.

> So while lvm2 is not (ATM) enforcing automatic resize when data or
> metadata space has reached predefined threshold  - I'd highly recommnend
> to use it.
>
> Upcoming version 169 will provide even support for 'external tool' to be
> called when threshold levels are surpassed for even more advanced
> configuration options.
>
>
> Regards
>
> Zdenek
>
>
> NB. metadata size is not related to mdraid in any way.
>
>
>

I am under impression that 128 KB size was chosen because this was MD 
chunk size. Indeed further tests seem to confirm this.

WITH 128 KB MD CHUNK SIZE:
[root@gdanti-laptop test]# mdadm --create md127 --level=raid10 
--assume-clean --chunk=128 --raid-devices=4 /dev/loop0 /dev/loop1 
/dev/loop2 /dev/loop3

[root@gdanti-laptop test]# pvcreate /dev/md127; vgcreate vg_kvm 
/dev/md127; lvcreate --thin vg_kvm --name thinpool -L 500G

[root@gdanti-laptop test]# lvs -a -o +chunk_size
   LV               VG        Attr       LSize   Pool Origin Data% 
Meta%  Move Log Cpy%Sync Convert Chunk
   [lvol0_pmspare]  vg_kvm    ewi------- 128.00m 
                                  0
   thinpool         vg_kvm    twi-a-tz-- 500.00g             0.00   0.80 
                             128.00k
   [thinpool_tdata] vg_kvm    Twi-ao---- 500.00g 
                                  0
   [thinpool_tmeta] vg_kvm    ewi-ao---- 128.00m 
                                  0
   root             vg_system -wi-ao----  50.00g 
                                  0
   swap             vg_system -wi-ao----   3.75g 
                                  0


WITH 256 KB MD CHUNK SIZE:
[root@gdanti-laptop test]# mdadm --create md127 --level=raid10 
--assume-clean --chunk=256 --raid-devices=4 /dev/loop0 /dev/loop1 
/dev/loop2 /dev/loop3

[root@gdanti-laptop test]# pvcreate /dev/md127; vgcreate vg_kvm 
/dev/md127; lvcreate --thin vg_kvm --name thinpool -L 500G

[root@gdanti-laptop test]# lvs -a -o +chunk_size
   LV               VG        Attr       LSize   Pool Origin Data% 
Meta%  Move Log Cpy%Sync Convert Chunk
   [lvol0_pmspare]  vg_kvm    ewi------- 128.00m 
                                  0
   thinpool         vg_kvm    twi-a-tz-- 500.00g             0.00   0.42 
                             256.00k
   [thinpool_tdata] vg_kvm    Twi-ao---- 500.00g 
                                  0
   [thinpool_tmeta] vg_kvm    ewi-ao---- 128.00m 
                                  0
   root             vg_system -wi-ao----  50.00g 
                                  0
   swap             vg_system -wi-ao----   3.75g 
                                  0


So it seems MD chunk size has a strong influence on LVM thin chunk choice.

Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
