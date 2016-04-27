Received: from [10.34.131.9] (dhcp131-9.brq.redhat.com [10.34.131.9])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u3RBAEZI005699
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2016 07:10:15 -0400
References: <29e7f847e1150949aa52c58fa33cf8cd@dds.nl>
From: Zdenek Kabelac <zkabelac@redhat.com>
Message-ID: <57209E16.5090503@redhat.com>
Date: Wed, 27 Apr 2016 13:10:14 +0200
MIME-Version: 1.0
In-Reply-To: <29e7f847e1150949aa52c58fa33cf8cd@dds.nl>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] 2 questions on LVM cache
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

On 27.4.2016 12:50, Xen wrote:
> 1. Does LVM cache support discards of the underlying blocks (in the cache)
> when the filesystem discards the blocks?

It does in a devel branch - hopefully will be upstreamed shortly...

Regards

Zdenek
