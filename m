Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2DK8uEw001484
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 16:08:56 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2DK8W2R002724
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 16:08:32 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n2DK8T5w004818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 16:08:30 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n2DK8TMK002762
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 16:08:29 -0400
Date: Fri, 13 Mar 2009 16:08:29 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] fsync() and LVM
In-Reply-To: <49BA9BF9.3070507@esiway.net>
Message-ID: <Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
References: <49BA9BF9.3070507@esiway.net>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 13 Mar 2009, Marco Colombo wrote:

> Hi, I'm a long time user of both PostgreSQL and LVM. So far I've been quite
> happy with both. But a recent thread on the PostgreSQL list made me
> unconfortable. What is this thing they're referring to, fsync()'s being
> ignored? Makes me feel like I'm running on thin ice, without even
> knowing. Before I start phasing out LVM from all my PostgreSQL installations
> (as they suggest), I'd like to hear some kind of confirmation.

> http://archives.postgresql.org/pgsql-general/2009-03/msg00204.php

The discussion doesn't make a lot of sense.  fsync() is a filesystem
call - it can't possibly be handled (or ignored) at a lower level because the
lowel level doesn't know which blocks belong to the file.
I *can* imagine that perhaps the raw block writes used by the filesystem
code might be ignored - or improperly cached.  Clearly, they are not
ignored (filesystems do get updated) - so if there is any substance to
the charge, it must be that LVM reorders writes somehow.  Caching
doesn't really break anything - it is the *reordering* of writes that
could be a problem.  A "write barrier" says "finish these writes before you
start any more, but otherwise reorder how you like".  I did some experiments
with iostat, and I am convinced that LVM does not itself do any reordering of
writes.

Here is my theory as to what is really going on:

LVM is not really "ignoring" fsync(), because it would never see it.
However, in the presence of hardware writeback caching in disk drives,
fsync() would need to tell the hardware to "finish all these writes
before you start any more" (i.e. - a write barrier) for fsync() to be
effective. 

I suspect that LVM simply fails to pass the *write barrier* through
to underlying layers (i.e. ignores the writebarrier call).  Thus, you should be
fine if you simply turn off writeback caching in your disk drives.  If you
could guarrantee that disk drives would be powered long enough after the main
system stops - even a drive write back cache would not be much of a risk.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
