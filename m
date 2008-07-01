Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m61BEIpv031211
	for <linux-lvm@redhat.com>; Tue, 1 Jul 2008 07:14:18 -0400
Received: from shearer.org (erizo.shearer.org [210.10.97.33])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m61BDcfr029429
	for <linux-lvm@redhat.com>; Tue, 1 Jul 2008 07:13:39 -0400
Received: from localhost ([127.0.0.1]:35137 helo=shearer.org)
	by shearer.org with esmtp (Dan's MTA 1.0) id 1KDdng-0007Jt-Bw
	for linux-lvm@redhat.com; Tue, 01 Jul 2008 20:43:32 +0930
Received: from dan by erizo.shearer.org with local (Spammer Slammer 3.141)
	id 1KDdng-0007Jq-41
	for linux-lvm@redhat.com; Tue, 01 Jul 2008 20:43:32 +0930
Date: Tue, 1 Jul 2008 20:43:32 +0930
From: Dan Shearer <dan@shearer.org>
Subject: Re: [linux-lvm] Backup of ROOT Partition.
Message-ID: <20080701111332.GG7369@erizo.shearer.org>
References: <48694ABE.2080307@globetrotter.net>
	<486A0EFE.8020805@kadzban.is-a-geek.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <486A0EFE.8020805@kadzban.is-a-geek.net>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Jul 01, 2008 at 07:03:26AM -0400, Bryan Kadzban wrote:

> If you mean taking a snapshot and leaving it around forever *as* the
> backup, then that will work -- but the more backups you have, the slower
> LVM gets (currently).  This is because of the copy-on-write code: every
> time the root logical volume changes, all of the snapshots need to be
> updated.  If you only have one or two snapshots, this isn't so bad, but
> if you had (say) 20, writing to your real root LV would slow to a crawl.
> 
> There is some code hanging around somewhere that I *think* is supposed
> to handle this better, but I don't know the status...

You may be referring to ddsnap, go to
http://code.google.com/p/zumastor/source/browse and look at
svn/trunk/ddsnap. And you can check out and build from google code too
of course.

I find it difficult to tell where this is going though, there doesn't
seem to be disagreement between the people who maintain ddsnap and the
people who maintain lvm2, but I haven't found any statements about what
the way forward is.

Any comments from lvm2 maintainers?

-- 
Dan Shearer
dan@shearer.org
