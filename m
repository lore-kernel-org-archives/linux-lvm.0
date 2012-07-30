Message-ID: <501657B5.2010603@redhat.com>
Date: Mon, 30 Jul 2012 11:45:25 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <50128239.4030208@profihost.ag>
In-Reply-To: <50128239.4030208@profihost.ag>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] metadata problems while testing lvm2 git with
	dm_thin_pool
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
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Stefan Priebe - Profihost AG <s.priebe@profihost.ag>

Dne 27.7.2012 13:57, Stefan Priebe - Profihost AG napsal(a):
> Hello list,
>
> i'm testing dm_thin_pool with lvm2 right now. And i'm always running into the
> situation that the metadata get's full.
>
> Kernel: 3.5-rc7
> lvm/dmeventd: up2date git version 186a2772
>
> I created my thin disk like this:
> lvcreate -L 10G -T thinvol/pool1 -V 100G --name disk1
>
> After some autoresizing lvs looks like this:
> # lvs
>    LV    VG      Attr     LSize   Pool  Origin Data%  Move Log Copy% Convert
>    disk1 thinvol Vwi-a-tz 100,00g pool1         22,95
>    pool1 thinvol twi-a-tz  33,77g               67,97

It's easier to read size of tpool and tmeta device and its fullness with
'lvs -a -o+metadata_percent'


> # dmsetup table
> thinvol-pool1: 0 70811648 linear 253:4 0
> thinvol-disk1: 0 209715200 thin 253:4 1
> thinvol-pool1-tpool: 0 70811648 thin-pool 253:2 253:3 128 0 0
> thinvol-pool1_tdata: 0 20971520 linear 8:17 2048
> thinvol-pool1_tdata: 20971520 49840128 linear 8:17 20998144
> MYVOL-thin_pool2_tdata: 0 20971520 linear 8:129 2048
> MYVOL-thin_pool2_tdata: 20971520 31227904 linear 8:129 20998144
> thinvol-pool1_tmeta: 0 24576 linear 8:17 20973568
> MYVOL-thin_pool2_tmeta: 0 24576 linear 8:129 20973568

dmsetup status is also use

It looks like you have started with quit small default mda size for thinpool.
Then you have slowly increased the size of thin data pool device - but so far
there is no support of resize for thin metadata.

So in case you plan to increase heavily the size of data pool - you need to 
create large metadata device from the beginning.

Size like '--poolmedatasize 400M' should do the trick and should give you 
pretty decent space to live with. Also the bigger chunk size you will use for 
provisioning, the smaller the consumption of metadata device will be.
(Current default is 64KB - if you could live with i.e. 512KB - you will safe
a lot of metadata space).

Resize of metadata is going to be implemented upstream with newest tools and 
kernels soon - but so far you have to live with current limits.

Zdenek
