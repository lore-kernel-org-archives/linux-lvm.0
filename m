Received: from [10.40.200.18] (ovpn-200-18.brq.redhat.com [10.40.200.18])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u2LFduq4029150
	for <linux-lvm@redhat.com>; Mon, 21 Mar 2016 11:39:57 -0400
References: <899CF6EA-902E-4407-BF59-8BB3671E94C6@gmail.com>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <56F015CB.6050406@redhat.com>
Date: Mon, 21 Mar 2016 16:39:55 +0100
MIME-Version: 1.0
In-Reply-To: <899CF6EA-902E-4407-BF59-8BB3671E94C6@gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] lvm cache on debian 8, missing cache information
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Dne 21.3.2016 v 14:30 Manuel Bernal Llinares napsal(a):
> Hi guys,
>
> I’m trying to set up lvmcache for a backup volume I use for time machine.
>
> I’ve seen there is quite a lot of very good documentation about this, but also out of sync between different linux systems, e.g. I can’t get those cache* attributes when running lvs on debian 8.
>
> As you can see under this lines, “tmachine” is a cached LVM volume
> # lvs -a
>    LV                     VG          Attr       LSize   Pool           Origin           Data%  Meta%  Move Log Cpy%Sync Convert
>    backups                blackhole   -wi-ao----   5,00t
>    clasificador           blackhole   -wi-ao----   1,00t
>    [lvol0_pmspare]        blackhole   ewi------- 592,00m
>    nfs_home               blackhole   -wi-ao----   1,00t
>    tmachine               blackhole   Cwi-aoC---   3,00t tmachine_cache [tmachine_corig]
>    tmachine_cache         blackhole   Cwi---C--- 231,67g
>    [tmachine_cache_cdata] blackhole   Cwi-ao---- 231,67g
> [tmachine_cache_cmeta] blackhole   ewi-ao---- 592,00m
>    [tmachine_corig]       blackhole   owi-aoC---   3,00t
>
> Even with a couple of mac computers sending its time machine data for a while, the cache seems to not be working.
>
> This are the parameters described by “dmsetup status” when run on that volume:
>
> # dmsetup status /dev/blackhole/tmachine
> 0 6442450944 cache 8 12849/151552 128 11886/3795648 17772 177033 2798405 1620326 0 3856 1 1 writeback 2 migration_threshold 2048 mq 10 random_threshold 4 sequential_threshold 512 discard_promote_adjustment 1 read_promote_adjustment 4 write_promote_adjustment 8
>
> I’ve tested another cache alternative (flashcache) before, and the parameter "sequential_threshold” sounds familiar to me, I suspect it is the one making the cache flag the data transfer as “sequential”, passing it through to the backend (slow) device, instead of using the cache to absorb the writing traffic, and clean dirty blocks later, behavior I saw when using flashcache.
>
> “sequential_threshold” is configured, by default, with a value of 512, but I haven’t been able to find what’s that 512, maybe extents, bytes, kb, mb? Unfortunately, I haven’t been able to find a way, at least in Debian, to change those parameters, neither creating the cache nor once it’s already been created.
>
> Any ideas?


'mq' policy is rather obsoleted.

Now it's suggested to use  'smq' which should be better in all aspects.
So please try usage of new 'smq' first (which happens to have no configurables 
ATM - it's auto-tunning and consumes less memory).

You also need relatively new lvm2 to show all cache settings via lvm2 'lvs' attrs.

Regards

Zdenek
