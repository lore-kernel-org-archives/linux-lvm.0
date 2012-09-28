Received: from mx1.redhat.com (ext-mx16.extmail.prod.ext.phx2.redhat.com
	[10.5.110.21])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q8S2p7Ma005710
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2012 22:51:07 -0400
Received: from Ishtar.sc.tlinx.org (ishtar.tlinx.org [173.164.175.65])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q8S2p59J030117
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2012 22:51:06 -0400
Received: from [192.168.3.12] (Athenae [192.168.3.12])
	by Ishtar.sc.tlinx.org (8.14.5/8.14.4/SuSE Linux 0.8) with ESMTP id
	q8S2p3ME027225
	for <linux-lvm@redhat.com>; Thu, 27 Sep 2012 19:51:05 -0700
Message-ID: <50651097.2060200@tlinx.org>
Date: Thu, 27 Sep 2012 19:51:03 -0700
From: Linda Walsh <lvm@tlinx.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] access or interface to list of blocks that have changed
	via C.O.W.?
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

I'm trying to use snapshots that are active for a day or so to grab
differences between successive days for allowing me to display previous
versions of files over a month or so...

They aren't a replacement for my daily towero'hanoi-backups, but
they are a great deal easier to use.

The chink in my plan is the time it is taking to do a diff -- not really
a fatal chink but annoying.  It takes anywhere from 80-100 minutes for
rsync to sum up the changes and copy them to a third volume each day.

I figured well sheesh, the lvm should already know what sectors are
different.  If I could combine that info against a inode+blockmap, I might
get that diff computation down to under 10 minutes maybe under 5.

The contents of the files that are computed as differences by rsync usually
take a minute or less to actually copy into final volume -- anywhere between
800Mb - 2.5GB out of a 1TB volume.   So I I could shortcut that diff 
process,
might make it practical to do more than one snapshot a day;...

Is there some interface for getting at that information or would it have
to be written from scratch?


Thnks...

Linda
