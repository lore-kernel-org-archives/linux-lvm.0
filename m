Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i4KAiq022117
	for <linux-lvm@redhat.com>; Thu, 20 May 2004 06:44:52 -0400
Received: from localhost.localdomain (shoenix.xs4all.nl [213.84.65.61])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i4KAinGG027960
	for <linux-lvm@redhat.com>; Thu, 20 May 2004 06:44:51 -0400
Received: from shoenix.net (deathstar [127.0.0.1])
	by localhost.localdomain (8.12.8/8.12.8) with ESMTP id i4KAaaCR006581
	for <linux-lvm@redhat.com>; Thu, 20 May 2004 12:36:36 +0200
Message-ID: <40AC8A34.7090608@shoenix.net>
Date: Thu, 20 May 2004 12:36:36 +0200
From: Martijn Schoemaker <lvm@shoenix.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Bad block detection
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Hi all,

Dunno if this is the right place to put in this issue, but it has some
relation at least.

I run on a system with two 40Gb Maxtor hdd's. There are three partitions,
one boot which is mirrored using plain md, one swap which is also mirrored
with plain md and one partition with the rest of the diskspace which is
mirrored with md and brought completely under LVM. In this all my file-
systems (including root) lie.

Recently the LVM partitions on my first drive generated an
unrecoverable IO error (bad block). No problem, the mirror worked fine
so I ordered a new (exactly same) disk and swapped them out. While
syncinc the new disk another bad sector was encountered on the remaining
drive! Yep, this sucked bigtime since the mirror sync just restarted from
scratch. Fortunately my maxtor tools allowed me to 'repair' (swap out the
sector with a spare one) the problem so I could at least sync everything
to my new and faultless drive. Also, luckily the md software was so smart
not to mark my only remaining disk as 'faulty' otherwise I would have
been restoring backups ....

This second bad sector was in an LVM region which was not yet used, there-
for it was never detected. Since it was located in an unused section I was
lucky otherwise I would have had data corruption. (just imagine what would
have happened if I tried to add an LV while running on one disk!)

My question is, how can you prevent this ? I was personally thinking about
doing a badblock check every now and then to assure there are no lurking
problems. It would be nice to put in some sanity scanning feature in either
LVM or md so you can periodically scan for prone errors so you dont run
into problems when another disk is already failing. Or should you do it
yourself using cron or whatever ?

In my case I just was extremely lucky, but this is both a warning and a
query to see how you all think this could be prevented.

Cheers,
Martijn Schoemaker
