Received: from mx1.redhat.com (ext-mx10.extmail.prod.ext.phx2.redhat.com
	[10.5.110.39])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u6KET6FU021760
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Wed, 20 Jul 2016 10:29:06 -0400
Received: from mail.gathman.org (unknown [50.248.53.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 1299463322
	for <linux-lvm@redhat.com>; Wed, 20 Jul 2016 14:28:57 +0000 (UTC)
Received: from elissa.gathman.org (elissa.gathman.org
	[IPv6:2001:470:8:809:11::1009]) (authenticated bits=0)
	by mail.gathman.org (8.14.4/8.14.4) with ESMTP id u6KC1j5H032447
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO)
	for <linux-lvm@redhat.com>; Wed, 20 Jul 2016 08:01:46 -0400
References: <CAOXD2Kufsndmiian5NwV5Cmg+CAZeiKRyzDRQdazbkOzs0LL9Q@mail.gmail.com>
From: Stuart Gathman <stuart@gathman.org>
Message-ID: <a95cdb46-e917-be2e-b317-63a9945d9757@gathman.org>
Date: Wed, 20 Jul 2016 08:01:45 -0400
MIME-Version: 1.0
In-Reply-To: <CAOXD2Kufsndmiian5NwV5Cmg+CAZeiKRyzDRQdazbkOzs0LL9Q@mail.gmail.com>
Content-Transfer-Encoding: 8bit
Subject: Re: [linux-lvm] Snapshots & data security
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On 07/19/2016 11:28 AM, Scott Sullivan wrote:
>
> Could someone please clarify if there is a legitimate reason to worry
> about data security of a old (removed) LVM snapshot?
>
> For example, when you lvremove a LVM snapshot, is it possible for data
> to be recovered if you create another LVM and it happens to go into
> the same area as the old snapshot we lvremoved?
>
> If this helps clarify, do we have to worry about security scrubbing a
> LVM snapshot for data security ?
Yes, the snapshot LV will contain (obsolete) copies of any sectors
(actually chunks) written to during the life of the snapshot.

However, you still have the live data in the same VG, so it doesn't
present any additional exposure.  Anyone with access to the raw disk can
just read the live LV as well as the snapshot. 

You real question, however, is probably about creating a new LV, and
whether reading that new LV will read old contents of the disk.  
Allocating a new LV only zeros the first 4k of the volume.  Reading the
LV will pick up all the leftover garbage from previous contents - a Very
Bad Thing security wise.   This is arguably a bug. 

Solutions I've seen proposed:

1) use dd to zero the volume after allocating - this is what you should
do today

2) allocate a snapshot of an existing image - this solves the security
problem but has performance problems

3) LVM should have an option to logically zero a new LV - this is simple
in concept, but maybe not so trivial to make bug free.  The LV allocates
a bitmap of all the chunks.  All chunks return zeros until written to. 
A 100G LV with 65k chunks would need only 200K for the bitmap - so the
overhead is quite small.  You could even keep the bitmap in chunks that
have never been written to, with a pointer in metadata, moving it around
as necessary - but that would be even harder to make bug free.
