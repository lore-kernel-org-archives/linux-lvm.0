Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id p52NuPkn023092
	for <linux-lvm@redhat.com>; Thu, 2 Jun 2011 19:56:25 -0400
Received: from smtp.smtpout.orange.fr (smtp03.smtpout.orange.fr
	[80.12.242.125])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id p52NuOA2016660
	for <linux-lvm@redhat.com>; Thu, 2 Jun 2011 19:56:24 -0400
Date: Fri, 3 Jun 2011 01:56:21 +0200
From: vincent <lvmml@vinvin.dyndns.org>
Message-ID: <20110602235621.GL14222@vinvin.dyndns.org>
MIME-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Mirror: write operations and consistency checking
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Greeting LVM developers and users,

I've been using the LVM mirror on several LVs and for some time now,
using a core log. I'm tired of the resource intensive initialization on
each boot, and I'm considering using a flash device as the third disk
for the mirror's log.

My question is thus: are there some write operations happening onto the
log while there is no activity on the mirror's files? Is there some kind
of periodic background thread checking for the consistency of the mirror
and writing the status to the log, or is it safe to use a flash disk for
low activity mirrors?

From what I understood, a bit is used on the log for each region
(512k-default) on the mirror. Does It means that if a 100M file is
written on the mirror, the log will be written 200 times on the same
block? Or is there a queue that holds log write operations and syncs
them to the log disk periodically to prevent that? That would be nice,
and even nicer if it was adjustable.

Thanks,

Vincent
