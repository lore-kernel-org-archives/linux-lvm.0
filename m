Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l46756BM016603
	for <linux-lvm@redhat.com>; Sun, 6 May 2007 03:05:06 -0400
Received: from mta5.srv.hcvlny.cv.net (mta5.srv.hcvlny.cv.net [167.206.4.200])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l46755M5024687
	for <linux-lvm@redhat.com>; Sun, 6 May 2007 03:05:05 -0400
Received: from www.jtgfashionsinc.homelinux.org
	(ool-182d1070.dyn.optonline.net [24.45.16.112]) by
	mta5.srv.hcvlny.cv.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTP id <0JHL009UUU5V2GS0@mta5.srv.hcvlny.cv.net> for
	linux-lvm@redhat.com; Sun, 06 May 2007 01:34:45 -0400 (EDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by www.jtgfashionsinc.homelinux.org (Postfix) with ESMTP id
	8E34EE97CD	for
	<linux-lvm@redhat.com>; Sun, 06 May 2007 01:34:36 -0400 (EDT)
Date: Sun, 06 May 2007 01:32:07 -0400
From: Ed Martin <me@edman007.com>
Message-id: <463D6857.7080704@edman007.com>
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Subject: [linux-lvm] Snapshot questions
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
To: linux-lvm@redhat.com

Hi,
	I have been looking into doing snapshots with LVM and i have found the 
documentation is very light on how they work. Sorry for all the 
questions, they are probably very easy and i realize its a lot but the 
documentation says almost nothing about this and i would really like to 
know. Even just pointing me to something that answers this would be 
nice. So far all i have found is tldp.org and that has about 1 page on 
snapshots and there are about 100 other sites listing the same text 
(almost word for word) So I'm going to ask my questions here and 
hopefully get an idea on how it all works.

First what exactly is the size of a snapshot used for? Is the the total 
difference (changed data) between the snapshot and the active LV that it 
was created against? What happens if i have multiple snapshots? are the 
snapshots changed data shared, so if i have LV1, make snap1 from LV1, 
then change LV1 it uses space in snap1 correct? what if i then add snap2 
created from LV1, does modifying LV1 remove free space from snap1 and 
snap2, or just snap2?

If snapshots only use the space that has been changed between it and the 
   LV it was created from then does that imply that a new snapshot uses 
zero space on the VG (if i made its size 1GB) and grow as data is 
changed, or does it use 1GB of space on the VG immediately, basically i 
want to know if the specified size of the snapshots is allowed to sum to 
more then the space on the VG (so if the VG is 200GB, and i put a 100GB 
LV on it, am i limited to 10 10GB snaps (to sum to the 100GB), or can i 
put 10 50GB snaps on it (which would probably only have a very small 
percent of usage) and let then get auto-deleted as space runs out?

I saw that snapshots are deleted when the LV is full, does this mean 
when the snapshot differers by more then the changes made since it was 
created? if so what snapshot gets deleted? is it just the one that ran 
out of space? what if there was a snapshot that came before it that has 
not run out of space?

What about fragmentation, does LVM handle 50 snapshots of a single VG 
(against a single LV), or will that cause massive fragmentation? does 
LVM have problems with high numbers of snapshots, or is 50+ considered 
normal?

And for the last question, I'm building a backup server, right now I'm 
taking a RAID, putting LVM on it, and I'm thinking about taking weekly 
snapshots of the backup data to allow me to rollback (for as far back as 
the disk can take me). does this sound like a good idea, or should i try 
something else? what is bad about this plan if its a bad idea? do you 
have any other recommendations to do something like that? the backup 
server is going to be very low load too with all disk idle almost all 
the time except when performing a backup (for a few hours every night)

Thanks in advance for answering any of these questions

	--Ed Martin
