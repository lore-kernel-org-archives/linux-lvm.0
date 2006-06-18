Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5I8t5S9011521
	for <linux-lvm@redhat.com>; Sun, 18 Jun 2006 04:55:05 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k5I8t3Xv004081
	for <linux-lvm@redhat.com>; Sun, 18 Jun 2006 04:55:04 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1Frt3e-0002CP-IK
	for linux-lvm@redhat.com; Sun, 18 Jun 2006 10:55:02 +0200
Received: from ip68-5-63-223.oc.oc.cox.net ([68.5.63.223])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 18 Jun 2006 10:55:02 +0200
Received: from mailinglists by ip68-5-63-223.oc.oc.cox.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sun, 18 Jun 2006 10:55:02 +0200
From: "Shaun" <mailinglists@unix-scripts.com>
Date: Sun, 18 Jun 2006 01:51:56 -0700
Message-ID: <e7347a$3te$1@sea.gmane.org>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] snapshots and backups
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm looking at using snapshots to take a full backup.  I've been search 
around Google a bit and so far most of the how-to's I find are always 
creating a snapshot, then mounting it, copying the data, unmounting it and 
removing it.  My question is why are they doing this?  Is it because they 
assume they only need data from one area of the drive or is there a better 
reason for doing this?  I want to take a full backup and leave the snapshot 
incase I need to restore it quickly.

-- 

~Shaun 
