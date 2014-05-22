Received: from [10.34.131.19] (dhcp131-19.brq.redhat.com [10.34.131.19])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s4MEho51027165
	for <linux-lvm@redhat.com>; Thu, 22 May 2014 10:43:50 -0400
Message-ID: <537E0D25.7010108@redhat.com>
Date: Thu, 22 May 2014 16:43:49 +0200
From: Zdenek Kabelac <zkabelac@redhat.com>
MIME-Version: 1.0
References: <20140522101837.GB14236@redhat.com>
In-Reply-To: <20140522101837.GB14236@redhat.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Testing the new LVM cache feature
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

Dne 22.5.2014 12:18, Richard W.M. Jones napsal(a):
>
> I've set up a computer in order to test the new LVM cache feature.  It
> has a pair of 2 TB HDDs in RAID 1 configuration, and a 256 GB SSD.
> The setup will be used to store large VM disk images in an ext4
> filesystem, to be served both locally and over NFS.
>
> Before I start I have some questions about this feature:
>
> (1) Is there a minimum recommended version of LVM or kernel to use?  I
> currently have lvm2-2.02.106-1.fc20.x86_64, which mentions LVM cache
> in the lvm(8) man page.  I have kernel 3.14.3-200.fc20.x86_64.

With these new targets usually always applies - the newer the kernel and tools 
are - the better for you.

>
> (2) There is no lvmcache(7) man page in any released version of LVM2.
> Was this man page ever created or is lvm(8) the definitive
> documentation?

It's now in upstream git as a separate man page (moved from lvm(8))

> (3) It looks as if cached LVs cannot be resized:
> https://www.redhat.com/archives/lvm-devel/2014-February/msg00119.html
> Will this be fixed in future?  Is there any workaround -- perhaps

Yes - cache is still missing a lot of feature - it needs further
integration with tools like  cache_check, cache_repair....

So far it's really only for a preview - I'd not consider to use it
for anything serious yet.

> removing the caching layer, resizing the original LV, then recreating
> the cache?  I really need to be able to resize LVs :-)

Surely this feature will be implemented.
Meanwhile - you have to drop cache, resize LV, reattach cache...
(drop cache - means to remove cache)

> (4) To calculate the size of the cache metadata LV, do I really just
> divide by 1000, min 8 MB?  It's that simple?  Doesn't it depend on
> dm-cache block size?  Or dm-cache algorithm?  How can I choose block
> size and algorithm?

Well this is where your experimenting may begin.
However for now  lvm2 doesn't allow you to play with algorithms - the lvchange 
interface is not yet upstream...

> (5) Is there an explicit command for flushing the cache layer back to
> the origin LV?

To be developed...

> (6) Is the on-disk format stable for future kernel/LVM upgrades?

Well it's still experiemental - so if there will be found some huge problem,
which requires to change/modify format it may happen.

Zdenek
