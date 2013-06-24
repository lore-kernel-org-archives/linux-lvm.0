Message-ID: <51C80174.1000005@redhat.com>
Date: Mon, 24 Jun 2013 10:21:08 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <16dd71d1.f00b.13f3e5336d3.Coremail.magazine.lihuiba@163.com>
	<51BB351E.4020707@alteeve.ca> <51C3F636.6030900@redhat.com>
	<285a5112.4df2.13f7172e2eb.Coremail.magazine.lihuiba@163.com>
In-Reply-To: <285a5112.4df2.13f7172e2eb.Coremail.magazine.lihuiba@163.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] LVM high availability
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
Cc: Digimer <lists@alteeve.ca>, lihuiba <magazine.lihuiba@163.com>, Marian Csontos <mcsontos@redhat.com>

Dne 23.6.2013 16:32, lihuiba napsal(a):
>
>>>> 3) how about thin pool and volumes?
>>>
>>
>>Thin-pool may be active on single-node only. In cluster only exclusive
>>activation is allowed and can not be activated elsewhere even "read-only".
>>
>>It should work fine without cluster locking while read-only everywhere,
>>except you can not enforce read-only on the pool. (There is a bug for that.)
>>
>>Attempting to write to pool active elsewhere, may render the pool's view
>>corrupted on other nodes. So when writing to pool, you should at least
>>deactivate the pool and all thin volumes on all other nodes, and
>>reactivate afterwards.
>
> I don't think out why thin volumes can not be active on multiple nodes even read-only.
>
> It is intuitive that activating thin volumes in read-only mode will neither change it's own
>
> meta-data nor the pool's.
>
> If I "force" the thin volumes to be active by, for example, changing the source code,
>
> what errors will occur?


lvm2 code currently doesn't support activation of all thin pool related LVs in 
read-only mode - there is some work being done in this area - but still not 
finished.

Zdenek
