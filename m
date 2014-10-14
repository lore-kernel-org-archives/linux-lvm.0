Received: from [10.10.63.83] (vpn-63-83.rdu2.redhat.com [10.10.63.83])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9ELN5WJ021785
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Tue, 14 Oct 2014 17:23:07 -0400
Mime-Version: 1.0 (Mac OS X Mail 7.3 \(1878.6\))
From: Brassow Jonathan <jbrassow@redhat.com>
In-Reply-To: <CAAH150aKPX-scGh3QCbOkPxwcH+PSHtLZ47ZMHN84mfQaFTgUA@mail.gmail.com>
Date: Tue, 14 Oct 2014 16:23:04 -0500
Message-Id: <70F2094F-5E1D-4276-91EF-762050D4FDBE@redhat.com>
References: <CAAH150aKPX-scGh3QCbOkPxwcH+PSHtLZ47ZMHN84mfQaFTgUA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"
To: LVM general discussion and development <linux-lvm@redhat.com>


On Oct 13, 2014, at 7:20 AM, Kees de Jong <keesdejong@gmail.com> wrote:

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

It really does depend on your workload.  We don�t have any general advice yet that I can share on how large the overall cache should be relative to the LV it is caching.  (We can compute how much space is needed for the metadata area for a given cache, which is why we can give advice on those numbers.)

You could try out various sizes and see what happens.  You could also do it a bit more deterministically by watching the number of used cache blocks vs the total cache blocks for you workload, as well as checking other reported metrics such as read/write hits/misses.  Currently, this information is had from �dmsetup status�.

 brassow
