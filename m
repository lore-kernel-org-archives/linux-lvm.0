Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9ALPIjl027459
	for <linux-lvm@redhat.com>; Tue, 10 Oct 2006 17:25:18 -0400
Received: from broaderband.net ([82.153.231.242])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9ALPGaL025808
	for <linux-lvm@redhat.com>; Tue, 10 Oct 2006 17:25:16 -0400
Received: from localhost ([127.0.0.1])
	by broaderband.net with esmtp (Exim 4.20) id 1GXNku-0002MY-NV
	for linux-lvm@redhat.com; Tue, 10 Oct 2006 20:59:12 +0100
Message-ID: <452BFBF9.3060301@overnetdata.com>
Date: Tue, 10 Oct 2006 21:00:57 +0100
From: Anthony Wright <anthony@overnetdata.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Using LVM snapshots for hourly backups
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

I'm trying to work out if there's a way to use LVM snapshots to create 
hourly backups of my data. I realise that this doesn't protect me 
against disk/machine failure, but it would really handy in cases where I 
want easy access to historical files, e.g where I accidentally 
change/delete a file or I want to compare historical files/directories 
to the current versions to see what's been changed.

I thought a really simple and ingeneous approach would be to use LVM 
snapshots so that each hour I make a snapshot, and remove the snapshot 
from 24 hours ago, thus having a rolling hourly backup. However when I 
tried this I ended up with 24 snapshots of the original volume which 
means a single change to the original volume causes each snapshot to do 
a Copy on Write of the changed block, so if I change one block on the 
original volume the snapshots create 24 copies of the original volume 
which isn't very good for disk performance or disk usage!!

What I'd really want is to daisy-chain the snapshots so that 
snapshot-3hours is a snapshot of snapshot-2hours, which is a snapshot of 
snapshot-1hour, which is a snapshot of the original volume, thus if a 
block in the original volume changes only snapshot-1hour is changed and 
once a snapshot is older than an hour it cannot change any more.

I notice that you can't make snapshots of snapshots, so I suspect what 
I'm looking for isn't possible, but I thought I check and if it isn't 
possible suggest it as a really useful feature for the future. Your 
thoughts/comments would be welcome.

Thanks,

Tony Wright.
