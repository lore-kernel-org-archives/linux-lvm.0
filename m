Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5UI3t004839
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 14:03:55 -0400
Received: from ITWMXGP02.MED.HARVARD.EDU (itwmxgp02.med.harvard.edu
	[134.174.150.67])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i5UI3oXn010093
	for <linux-lvm@redhat.com>; Wed, 30 Jun 2004 14:03:50 -0400
Message-ID: <40E2FFB1.6060301@hms.harvard.edu>
Date: Wed, 30 Jun 2004 14:00:17 -0400
From: Mark Komarinski <mkomarinski@hms.harvard.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Snapshots with Debian 2.4.26
Reply-To: mkomarinski@hms.harvard.edu,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Right.  I'm off breaking all the rules here.  Here's what I have:

Debian backport of 2.4.26 (only change was adding 64G support)
Debian stable (1.0.4 it says)

I want to use snapshots for backing up oracle, but here's what I have:

cliff:~# lvcreate -l1 -s -n oracle_control_1_snap /dev/vg00/oracle_control_1
lvcreate -- INFO: using default snapshot chunk size of 64 KB for 
"/dev/vg00/oracle_control_1_snap"
lvcreate -- doing automatic backup of "vg00"
lvcreate -- logical volume "/dev/vg00/oracle_control_1_snap" 
successfully created

cliff:~# mount /dev/vg00/oracle_control_1_snap /snapshot/oracle/
mount: block device /dev/vg00/oracle_control_1_snap is write-protected, 
mounting read-only
mount: wrong fs type, bad option, bad superblock on 
/dev/vg00/oracle_control_1_snap,
        or too many mounted file systems
cliff:~#

(The size of the lv that I'm doing a snapshot of is 1 64M extent, so 
doing a 1 extent in size should be enough, yes?)

My understanding is that this is a result of the VFS patch not being 
applied.  But there doesn't seem to be a VFS patch for 2.4.26.

Any ideas?  I can provide whatever additional information you need, but 
this is really strange.

-Mark

-- 
Mark Komarinski				mkomarinski@hms.harvard.edu
Sr. Linux/UNIX System Administrator	http://wqcg.med.harvard.edu
West Quad Computing Group
Harvard Medical School
