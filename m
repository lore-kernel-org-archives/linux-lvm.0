References: <f158d4decb9c99fec72c600553ef519b@assyoma.it>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <b6977938-ecdb-46d8-9c45-8ac048f713b1@redhat.com>
Date: Fri, 22 Jun 2018 22:13:34 +0200
MIME-Version: 1.0
In-Reply-To: <f158d4decb9c99fec72c600553ef519b@assyoma.it>
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Thin metadata volume bigger than 16GB ?
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

Dne 22.6.2018 v 20:10 Gionatan Danti napsal(a):
> Hi list,
> I wonder if a method exists to have a >16 GB thin metadata volume.
> 
> When using a 64 KB chunksize, a maximum of ~16 TB can be addressed in a single 
> thin pool. The obvious solution is to increase the chunk size, as 128 KB 
> chunks are good for over 30 TB, and so on. However, increasing chunksize is 
> detrimental for efficiency/performance when heavily using snapshot.
> 
> Another simple and very effective solution is to have multiple thin pools, ie: 
> 2x 16 GB metadata volumes with 64 KB chunksize is good, again, for over 30 TB 
> thin pool space.
> 
> That said, the naive but straightforward would be to increase maximum thin 
> pool size. So I have some questions:
> 
> - is the 16 GB limit an hard one?

Addressing is internally limited to use lower amount of bits.

> - there are practical consideration to avoid that (eg: slow thin_check for 
> very bug metadata volumes)?

Usage of memory resources, efficiency.

> - if so, why I can not find any similar limit (in the docs) for cache metadata 
> volumes?

ATM we do not recommend to use cache with more then 1.000.000 chunks for 
better efficiency reasons although on bigger machines bigger amount of chunks 
are still quite usable especially now with cache metadata format 2.

> - what is the right thing to do when a 16 GB metadata volume fill-up, if it 
> can not be expanded?

ATM drop data you don't need  (fstrim filesystem).

So far there were not many request to support bigger size although there are 
plans to improve thin-pool metadata format for next version.

Regards

Zdenek
