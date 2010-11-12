Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id oACNaoRX012283
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 18:36:50 -0500
Received: from q7.q7.com (q7.q7.com [69.168.48.248])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id oACNaZ9C024479
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 18:36:35 -0500
Received: from charon.spiretech.com (charon.spiretech.com [69.168.63.193])
	(authenticated bits=0)
	by q7.q7.com (8.13.8/8.13.8) with ESMTP id oACNaVfD021822
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Fri, 12 Nov 2010 15:36:35 -0800
Message-ID: <4CDDCF7E.4070006@q7.com>
Date: Fri, 12 Nov 2010 15:36:30 -0800
From: Joe Pruett <joey@q7.com>
MIME-Version: 1.0
References: <AANLkTi=+iwZLBxZFzhb++KMevOy55QJrg9xg9Ey2w_kX@mail.gmail.com>
	<4CDDBF95.9040104@q7.com>
In-Reply-To: <4CDDBF95.9040104@q7.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] advice for curing terrible snapshot performance?
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
To: LVM general discussion and development <linux-lvm@redhat.com>

i just did a bit of poking around and discovered that snapshots have
their own chunk size that is used for the copy on write magic.  and it
defaults to 4k, and you can only increase that to 512k.  a simple test
of creating a 1g file went from 240mbytes/sec to 4mbytes/sec with 4k
chunk, and 12mbytes/sec with 512k chunk.  so i'm not sure what the
bottleneck is, but is surely is there.

On 11/12/2010 02:28 PM, Joe Pruett wrote:
> my understanding of how the lvm does snapshots is that a write causes a
> lookup to see if that extent is dirty or clean.  a dirty extent just
> writes directly, a clean extent causes a copy from the main volume to
> the snapshot volume and some amount of bookkeeping to track that the
> block is now dirty and then the write completes to the main lv.  so a
> test where you are creating a bunch of updates would cause a write to
> turn into a read and two writes, so i'd expect more like a 3x hit.  and
> i guess that the bookkeeping may have some sync calls in it, which could
> cause some major stalls as caches flush.
>
> have you tested the snapshots under normal load, and not test load?  you
> may be seeing the worst possible behavior (which is good to know), but
> may not really occur under typical usage.
