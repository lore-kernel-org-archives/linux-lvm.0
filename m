Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i61DR9029824
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2004 09:27:09 -0400
Received: from ITWMXGP02.MED.HARVARD.EDU (itwmxgp02.med.harvard.edu
	[134.174.150.67])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i61DR3Xn014616
	for <linux-lvm@redhat.com>; Thu, 1 Jul 2004 09:27:03 -0400
Message-ID: <40E4104B.70809@hms.harvard.edu>
Date: Thu, 01 Jul 2004 09:23:23 -0400
From: Mark Komarinski <mkomarinski@hms.harvard.edu>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Snapshots with Debian 2.4.26
References: <40E2FFB1.6060301@hms.harvard.edu>
In-Reply-To: <40E2FFB1.6060301@hms.harvard.edu>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Mark Komarinski wrote:
> Right.  I'm off breaking all the rules here.  Here's what I have:
> 
> Debian backport of 2.4.26 (only change was adding 64G support)
> Debian stable (1.0.4 it says)
> 
> I want to use snapshots for backing up oracle, but here's what I have:
> 
> cliff:~# lvcreate -l1 -s -n oracle_control_1_snap 
> /dev/vg00/oracle_control_1
> lvcreate -- INFO: using default snapshot chunk size of 64 KB for 
> "/dev/vg00/oracle_control_1_snap"
> lvcreate -- doing automatic backup of "vg00"
> lvcreate -- logical volume "/dev/vg00/oracle_control_1_snap" 
> successfully created
> 
> cliff:~# mount /dev/vg00/oracle_control_1_snap /snapshot/oracle/
> mount: block device /dev/vg00/oracle_control_1_snap is write-protected, 
> mounting read-only
> mount: wrong fs type, bad option, bad superblock on 
> /dev/vg00/oracle_control_1_snap,
>        or too many mounted file systems
> cliff:~#
> 
> (The size of the lv that I'm doing a snapshot of is 1 64M extent, so 
> doing a 1 extent in size should be enough, yes?)
> 
> My understanding is that this is a result of the VFS patch not being 
> applied.  But there doesn't seem to be a VFS patch for 2.4.26.
> 
> Any ideas?  I can provide whatever additional information you need, but 
> this is really strange.
> 
> -Mark
> 

I'll follow up to myself, as I found the problem.

I was able to find the 2.4.22 VFS patch which applied pretty cleanly 
(there was a DM patch, but since I'm not using it, there was nothing to 
apply).  Rebooted and it's working fine.

-Mark

-- 
Mark Komarinski				mkomarinski@hms.harvard.edu
Sr. Linux/UNIX System Administrator	http://wqcg.med.harvard.edu
West Quad Computing Group
Harvard Medical School
