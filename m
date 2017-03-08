References: <468f35bf-96b3-ccea-7549-37781d31e492@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <aa2e89d0-18a4-acda-9267-6ff5479a5895@redhat.com>
Date: Wed, 8 Mar 2017 19:55:00 +0100
MIME-Version: 1.0
In-Reply-To: <468f35bf-96b3-ccea-7549-37781d31e492@assyoma.it>
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

Dne 8.3.2017 v 17:14 Gionatan Danti napsal(a):
> Hi list,
> I would like to understand if this is a lvmthin metadata size bug of if I am
> simply missing something.
>
> These are my system specs:
> - CentOS 7.3 64 bit with kernel 3.10.0-514.6.1.el7
> - LVM version 2.02.166-1.el7_3.2
> - two linux software RAID device, md127 (root) and md126 (storage)
>
> MD array specs (the interesting one is md126)
> Personalities : [raid10]
> md126 : active raid10 sdd2[3] sda3[0] sdb2[1] sdc2[2]
>       557632000 blocks super 1.2 128K chunks 2 near-copies [4/4] [UUUU]
>       bitmap: 1/5 pages [4KB], 65536KB chunk
>
> md127 : active raid10 sdc1[2] sda2[0] sdd1[3] sdb1[1]
>       67178496 blocks super 1.2 512K chunks 2 near-copies [4/4] [UUUU]
>       bitmap: 0/1 pages [0KB], 65536KB chunk
>
> As you can see, /dev/md126 has a 128KB chunk size. I used this device to host
> a physical volume and volume group on which I created a thinpool of 512GB.
> Then, I create a thin logical volume of the same size (512 GB) and started to
> fill it. Somewhere near (but not at) the full capacity, I saw the volume
> offline due to metadata exhaustion.
>
> Let see how the logical volume was created and how it appear:
> [root@blackhole ]# lvcreate --thin vg_kvm/thinpool -L 512G; lvs -a -o +chunk_size
>   Using default stripesize 64.00 KiB.
>   Logical volume "thinpool" created.
>   LV               VG        Attr       LSize   Pool Origin Data% Meta%  Move
> Log Cpy%Sync Convert Chunk
>   [lvol0_pmspare]  vg_kvm    ewi------- 128.00m
>                                  0
>   thinpool         vg_kvm    twi-a-tz-- 512.00g             0.00   0.83
>                             128.00k
>   [thinpool_tdata] vg_kvm    Twi-ao---- 512.00g
>                                  0
>   [thinpool_tmeta] vg_kvm    ewi-ao---- 128.00m
>                                  0
>   root             vg_system -wi-ao----  50.00g
>                                  0
>   swap             vg_system -wi-ao----   7.62g
>                                  0
>
> The metadata volume is quite smaller (~2x) than I expected, and not big enough
> to reach 100% data utilization. Indeed, thin_metadata_size show a minimum
> metadata volume size of over 130 MB:
>
> [root@blackhole ]# thin_metadata_size -b 128k -s 512g -m 1 -u m
> thin_metadata_size - 130.04 mebibytes estimated metadata area size for
> "--block-size=128kibibytes --pool-size=512gibibytes --max-thins=1"
>
> Now, the interesting thing: by explicitly setting --chunksize=128, the
> metadata volume is 2x bigger (and in line with my expectations):

Hi

If you do NOT specify any setting - lvm2 targets 128M metadata size.

If you specify '--chunksize'  lvm2 tries to find better fit and it happens
to be slightly better with 256M metadata size.

Basically - you could specify anything to the last bit - and if you don't lvm2 
does a little 'magic' and tries to come with 'reasonable' defaults for given 
kernel and time.

That said - I've in my git tree some rework of this code - mainly for better 
support of metadata profiles.
(And my git calculation gives me 256K chunksize + 128M metadata size - so 
there was possibly something not completely right in version 166)


> Why I saw two very different metadata volume sizes? Chunksize was 128 KB in
> both cases; the only difference is that I explicitly specified it on the
> command line...

You should NOT forget - that using 'thin-pool' without any monitoring and 
automatic resize is somewhat 'dangerous'.

So while lvm2 is not (ATM) enforcing automatic resize when data or metadata 
space has reached predefined threshold  - I'd highly recommnend to use it.

Upcoming version 169 will provide even support for 'external tool' to be 
called when threshold levels are surpassed for even more advanced 
configuration options.


Regards

Zdenek


NB. metadata size is not related to mdraid in any way.
