Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3R8cjNE004532
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 04:38:45 -0400
References: <1878ee4357f761c330210f82e80ead3d@dds.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <57207A94.5040004@redhat.com>
Date: Wed, 27 Apr 2016 10:38:44 +0200
MIME-Version: 1.0
In-Reply-To: <1878ee4357f761c330210f82e80ead3d@dds.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] swap on lvm cache
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
To: linux-lvm@redhat.com

On 27.4.2016 00:35, Xen wrote:
> Just a weird question here.
>
> Since swap should ordinarily be encrypted if you encrypt any part of your data
> at all, I have opted at this point to either put it inside a volume that might
> end up getting cached, or to disable that cache and put the swap in its place.
>
> What I am saying is that in my current scheme there is going to be a small
> cache drive and one part of the cache drive is going to serve unencrypted data
> and the other part is going to serve encrypted data.
>
> Supposing that, the swap would be in the encrypted part. But using cache
> (lvmcache) on swap is completely ludicrous right?

Hi

Yes, it would be seriously bad idea to use 'swap' on cached LV...

There are already unsolved issues with plain devices and swapping :)
and you want to put caching logic into this stack.

> Alternatively you could put the swap on the SSD (in this case) and not have
> any cache for the other part of the drive. What do you think? It makes no
> sense and it makes no difference, right.

Regards

Zdenek
