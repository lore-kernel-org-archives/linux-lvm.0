Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id i5FHjnj2013085
	for <linux-lvm@redhat.com>; Tue, 15 Jun 2004 18:45:49 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1BaI0L-0002Yh-3D
	for linux-lvm@redhat.com; Tue, 15 Jun 2004 18:45:49 +0100
Date: Tue, 15 Jun 2004 18:45:48 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20040615174548.GB6302@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] filesystem resizing
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

I've checked into CVS the current development version of filesystem 
resizing support.  Not ready for production use:
It still needs thorough testing and it's not sufficiently
robust to be included in a release yet.
(e.g. it needs to check the filesystem isn't mounted before fsck
or resizing - or if it is mounted, it should choose an online resizer 
if available.  And I haven't got as far as checking the arguments
passed to resizers yet.)

To use it, you add --resizefs (-r) to the lvextend/reduce/resize 
arguments.  

--nofsck skips the fsck.

Definitions for additional filesystems need adding.

Patches & reports of successful testing (or bugs) welcome!

Alasdair
-- 
agk@redhat.com
