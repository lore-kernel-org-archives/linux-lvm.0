Received: from [10.36.7.36] (vpn1-7-36.ams2.redhat.com [10.36.7.36])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9EDR6cI025765
	for <linux-lvm@redhat.com>; Tue, 14 Oct 2014 09:27:07 -0400
Message-ID: <543D24A9.9040907@redhat.com>
Date: Tue, 14 Oct 2014 15:27:05 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <CAAH150aKPX-scGh3QCbOkPxwcH+PSHtLZ47ZMHN84mfQaFTgUA@mail.gmail.com>
In-Reply-To: <CAAH150aKPX-scGh3QCbOkPxwcH+PSHtLZ47ZMHN84mfQaFTgUA@mail.gmail.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] How to calculate the LVM SSD cache size?
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

Dne 13.10.2014 v 14:20 Kees de Jong napsal(a):
> Hi,
>
>
>
> The documentation is not clear about how big the cache size should be
> for optimal performance. It only gives pointers about how big the meta
> data for the cache should be.
>
> "Create the cache metadata LV. This LV will hold cache pool metadata.
> The size of this LV should be 1000 times smaller than the cache data
> LV, with a minimum size of 8MiB."
>
> There is however an example in the man page with a 100GB OriginLV
> which apparently needs (at least) 10GB of cache size. But what is the
> math? I for example have 4 LV's I want to cache. 6GB, 60GB, 100GB and
> 2TB and I have a 240GB SSD which will act as the caching disk.
>
> Could someone please fill in the gaps here?
>
>

https://github.com/jthornber/thin-provisioning-tools/blob/master/caching/cache_metadata_size.cc

The recent lvm2 tools (git) should maintain the size of metadata device
at proper size for any given cache pool data device size.

Zdenek
