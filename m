Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3R1QsKs029091
	for <linux-lvm@redhat.com>; Sat, 26 Apr 2008 21:26:54 -0400
Received: from smtp05.atlngahp.sys.nuvox.net (smtp-out5.atlngahp.sys.nuvox.net
	[70.43.63.23])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3R1QSQF006341
	for <linux-lvm@redhat.com>; Sat, 26 Apr 2008 21:26:31 -0400
Received: from smtp.media-brokers.com (70.43.81.99.nw.nuvox.net [70.43.81.99])
	by smtp05.atlngahp.sys.nuvox.net (8.13.1/8.13.1) with ESMTP id
	m3R1QPcb007642
	for <linux-lvm@redhat.com>; Sat, 26 Apr 2008 21:26:25 -0400
Received: from [127.0.0.1] (c-76-97-174-240.hsd1.ga.comcast.net
	[76.97.174.240])
	by smtp.media-brokers.com (Postfix) with ESMTPSA id 0D3DA371AEF
	for <linux-lvm@redhat.com>; Sat, 26 Apr 2008 21:26:25 -0400 (EDT)
Message-ID: <4813D644.7080003@Media-Brokers.com>
Date: Sat, 26 Apr 2008 21:26:28 -0400
From: Charles Marcus <CMarcus@Media-Brokers.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Offline fsck (checking snapshots)
References: <48110C2D.5020800@kadzban.is-a-geek.net>
In-Reply-To: <48110C2D.5020800@kadzban.is-a-geek.net>
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

Bryan Kadzban wrote:
> I've gotten a script that I think is reasonable, that handles this.
> With some help from others, it now works with XFS as well as ext2/3, and
> it's supposed to also work with JFS.  Since it requires LVM, I think it
> might make sense to put something like it into the LVM userspace tools.

Sounds interesting... but any particular reason you're ignoring reiserfs?
