Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l1KCwLup030909
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 07:58:21 -0500
Received: from lion.drogon.net (lion.drogon.net [195.10.231.26])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l1KCwHHL010212
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 07:58:18 -0500
Received: from lion.drogon.net (localhost [127.0.0.1])
	by lion.drogon.net (8.13.8/8.13.8) with ESMTP id l1KCwBIq032394
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 12:58:11 GMT
Received: from localhost (gordon@localhost)
	by lion.drogon.net (8.13.8/8.13.8/Submit) with ESMTP id l1KCwBWW032390
	for <linux-lvm@redhat.com>; Tue, 20 Feb 2007 12:58:11 GMT
Date: Tue, 20 Feb 2007 12:58:11 +0000 (GMT)
From: Gordon Henderson <gordon@drogon.net>
Message-ID: <Pine.LNX.4.64.0702201132560.27267@lion.drogon.net>
MIME-Version: 1.0
Subject: [linux-lvm] LVM & snapshots
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com


I tried LVM a few years back and "burnt my fingers" as it were - I found 
it slow and unstable, but times are changing, progress being made, etc. so 
does anyone have any input on it's current stability and usability?

Basically, I'm running out of steam on some backup servers I have - trying 
to copy several TB of data using cp -al, then rsyncing on top of it (and 
then copying the copy, etc. to give me 30 days of backups) has been 
working well for some time, but the data-set is increasing all the time, 
and the cp -al is currently taking 4-5 hours, so snapshotting via LVM is 
looking like it's something I think I ought to be looking into again.

The current data-set is 5TB, and having 150TB of storage isn't an option 
right now... Essentially I need to be able to keep 30 cycles (days) of 
snapshots on a server that is not a live server (ie. it's a huge disk 
array, in a secure bunker backing up several remote servers every day, and 
dumping the occasional snapshot to tape for archive. Data comes into the 
server via a 100Mb line & rsync from the remote servers).

So is LVM(2) up to this task these days, or should I really be looking at 
something else?

Cheers,

Gordon
