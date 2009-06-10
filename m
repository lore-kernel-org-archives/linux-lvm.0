Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n5AIsbKS027688
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 14:54:37 -0400
Received: from mailmx.futuresource.com (mailmx.futuresource.com [208.10.26.74])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n5AIsOrw013739
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 14:54:24 -0400
Received: from ns1.futuresource.com ([10.207.192.125])
	by mailmx.futuresource.com (8.13.8/8.13.8) with ESMTP id n5AIsNEg030569
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 13:54:23 -0500
Received: from [10.207.193.131] (xplmikesell.esignalcorp.com [10.207.193.131])
	by ns1.futuresource.com (8.11.6/8.11.6) with ESMTP id n5AIsMr31381
	for <linux-lvm@redhat.com>; Wed, 10 Jun 2009 13:54:22 -0500
Message-ID: <4A30015D.1010409@gmail.com>
Date: Wed, 10 Jun 2009 13:54:21 -0500
From: Les Mikesell <lesmikesell@gmail.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Data deduplication in LVM?
References: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>
In-Reply-To: <4855BFEA-C772-4B98-A18E-C406FD5737DD@karlsbakk.net>
Content-Transfer-Encoding: 7bit
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Roy Sigurd Karlsbakk wrote:
> Hi all
> 
> I've been reading up a little about data deduplication, and have been in 
> search for an OSS filesystem with dedup without much luck. While testing 
> snapshots and so on in LVM, I started wondering if dedup would be better 
> off in LVM than in the filesystem. Would it be possible/efficient to add 
> dedup to the LVM layer, or perhaps a layer above LVM? This could make 
> dedup work for all or most of filesystems. Make a hash table with 4k (or 
> whatever) blocks, make virtual blocks pointing to the physical blocks 
> and run a remapping/deduping job at night. If written to, copy-on-write 
> could be used to increase speed.
> 
> Is this nonsense, or might it be an idea?

This is "supposed" to be coming in the next OpenSolaris/ZFS release (per 
the roadmap with the just-released 2009.06 version).

-- 
   Les Mikesell
    lesmikesell@gmail.com
