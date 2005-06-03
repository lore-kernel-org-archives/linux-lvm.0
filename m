Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j53MRuhf010599
	for <linux-lvm@redhat.com>; Fri, 3 Jun 2005 23:27:56 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DeKdw-0004wI-Fz
	for linux-lvm@redhat.com; Fri, 03 Jun 2005 23:27:56 +0100
Date: Fri, 3 Jun 2005 23:27:56 +0100
From: Alasdair G Kergon <agk@redhat.com>
Message-ID: <20050603222756.GM15809@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Update on LVM2 mirror support
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
To: linux-lvm@redhat.com

LVM2 CVS now contains the first version of mirroring support.
This is *not* production-ready!

So far: use -m with lvcreate to make new mirrored volumes.
Default is -m0 (no mirrors); -m1 gives you 2 identical images.

Use lvs -a to list all lvs, including the internal ones.

NB xxchange -an doesn't work yet: you have to remove the internal
LVs separately afterwards with 'dmsetup remove'.


I'm particularly interested in hearing about any existing features
that the recent changes have broken:-)


Alasdair
-- 
agk@redhat.com
