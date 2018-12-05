References: <20181205061938.vbkwk6ydnehacxml@chelmska.waw.pl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <bdb0d980-2e33-bba3-6d81-747d8143699d@redhat.com>
Date: Wed, 5 Dec 2018 15:23:21 +0100
MIME-Version: 1.0
In-Reply-To: <20181205061938.vbkwk6ydnehacxml@chelmska.waw.pl>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] lvmcache writethrough synchronisation at system
	startup
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
To: LVM general discussion and development <linux-lvm@redhat.com>, Marcin Wolcendorf <antymat+redhat@chelmska.waw.pl>

Dne 05. 12. 18 v 7:19 Marcin Wolcendorf napsal(a):
> Hi Everyone,
> 
> Recently I have set up a simple lvmcache on my machine. This is a write-through
> cache, so in my view it should never be necessary to copy data from the
> cachepool to the origin LV. But this is exactly what happens: on system start
> the
> 
> lvs -o+cache_policy,cache_settings,cache_mode
> 
> displays something like:
>    LV     VG   Attr       LSize   Pool     Origin       Data%  Meta%  Move Log Cpy%Sync Convert CachePolicy CacheSettings CacheMode
>    home   main Cwi-aoC---  21.83t [cache1] [home_corig] 99.99  0.55            90.39            smq                       writethrough
> 
> and for a next day or two it writes the whole cachepool to the origin. The data
> on the cached LV seems fine as long as sha512 is concerned.
> 
> Is this supposed to be that way?
> 
> My setup:
> I have 2 mdraid devices: one 24T raid6, one 1T raid1, and one separate SSD. All
> are LUKS-encrypted, SSD is partitioned into MBR boot partition, encrypted /boot
> partition and a big encrypted partition for a PV. The encrypted block devices
> (except /boot) are PVs in my VG. The 24T RAID holds the origin LV, the 1T RAID
> is made into a cachepool.

Hi

I'd say in your case it's very important which version of kernel is in use, as 
there very couple fixes solving this issue in not too long history.


Secondary issue is - it's always good idea there is correct shutdown process
instead of just 'power-off' althouhg in 'writethrough' case it should not be 
that big issue (but here applies the advice number one - use recent kernels).


Regards

Zdenek
