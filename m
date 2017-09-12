References: <76b114ca-404b-d7e5-8f59-26336acaadcf@assyoma.it>
	<0c6c96790329aec2e75505eaf544bade@assyoma.it>
	<8fee43a1-dd57-f0a5-c9de-8bf74f16afb0@gmail.com>
	<872ad7be3b36e2eb0afc080fa781d84d@assyoma.it>
	<e580b78b-0aaa-d075-5009-278d26823a7c@redhat.com>
	<e3bc609f-a1fd-e2e8-e431-4820cd9f9487@assyoma.it>
	<b51c8dfd-bdd0-2e38-cc47-bef358bbc8e6@redhat.com>
From: Gionatan Danti <g.danti@assyoma.it>
Message-ID: <0ef779b9-1725-4764-0664-0002344532dd@assyoma.it>
Date: Tue, 12 Sep 2017 18:57:21 +0200
MIME-Version: 1.0
In-Reply-To: <b51c8dfd-bdd0-2e38-cc47-bef358bbc8e6@redhat.com>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Reserve space for specific thin logical volumes
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

On 12/09/2017 14:03, Zdenek Kabelac wrote:> # lvs -a
>    LV              VG Attr       LSize  Pool Origin Data%  Meta%  Move 
> Log Cpy%Sync Convert
>    [lvol0_pmspare] vg ewi-------  2,00m
>    lvol1           vg Vwi-a-tz-- 20,00m pool        40,00
>    pool            vg twi-aotz-- 10,00m             80,00  1,95
>    [pool_tdata]    vg Twi-ao---- 10,00m
>    [pool_tmeta]    vg ewi-ao----  2,00m
> [root@linux export]# lvcreate -V10 vg/pool
>    Using default stripesize 64,00 KiB.
>    Reducing requested stripe size 64,00 KiB to maximum, physical extent 
> size 32,00 KiB.
>    Cannot create new thin volume, free space in thin pool vg/pool 
> reached threshold.
> 
> # lvcreate -s vg/lvol1
>    Using default stripesize 64,00 KiB.
>    Reducing requested stripe size 64,00 KiB to maximum, physical extent 
> size 32,00 KiB.
>    Cannot create new thin volume, free space in thin pool vg/pool 
> reached threshold.
> 
> # grep thin_pool_autoextend_threshold /etc/lvm/lvm.conf
>      # Configuration option activation/thin_pool_autoextend_threshold.
>      # thin_pool_autoextend_threshold = 70
>      thin_pool_autoextend_threshold = 70
> 
> So as you can see - lvm2 clearly prohibits you to create a new thinLV
> when you are above defined threshold.

Hi Zdenek,
this is very good news (for me at least). Thank you very much for 
pointing me that!

Anyway, I can not find the relative configuration variable in lvm.conf. 
I am on 2.02.166(2)-RHEL7, should I use a newer LVM version to set this 
threshold?

> To keep things single for a user - we have a single threshold value.
> 
> 
> So what else is missing ?

This is a very good step, indeed. However, multiple threshold (maybe 
attached/counted against the single thin volume, in a manner similar to 
how refreservation does for ZVOLs) would be even better (in my use case, 
at least).

> Unfortunatelly lvm2 nor dm  can be responsible for whole kernel logic and
> all user-land apps...

Again, I am *not* saying, nor asking, that.

I would simply like to use thinp without fearing that "forgotten" 
snapshot fill up the thin pool. I have shown how this can easily 
achieved with ZVOLs and careful use/setting of the refreservation value, 
without any upper layer knowledge and/or intra-layer communications.

> So you are already happy right  :) ?

Sure! :)
Thanks.

-- 
Danti Gionatan
Supporto Tecnico
Assyoma S.r.l. - www.assyoma.it
email: g.danti@assyoma.it - info@assyoma.it
GPG public key ID: FF5F32A8
