Received: from agk.fab.redhat.com (agk.fab.redhat.com [10.33.0.19])
	by ns3.rdu.redhat.com (8.13.8/8.13.8) with ESMTP id n141BXkq004643
	for <linux-lvm@redhat.com>; Tue, 3 Feb 2009 20:11:33 -0500
Received: from agk by agk.fab.redhat.com with local (Exim 4.34)
	id 1LUWIe-0006vc-6e
	for linux-lvm@redhat.com; Wed, 04 Feb 2009 01:11:32 +0000
Date: Wed, 4 Feb 2009 01:11:32 +0000
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] What causes this type of messages
Message-ID: <20090204011132.GK20668@agk.fab.redhat.com>
References: <4905EFD192EEDF4A9A19EEE98C32B7F70EC28F06@DBQV3005.na.corp.mckesson.com>
	<4905EFD192EEDF4A9A19EEE98C32B7F70EFB49CC@DBQV3005.na.corp.mckesson.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4905EFD192EEDF4A9A19EEE98C32B7F70EFB49CC@DBQV3005.na.corp.mckesson.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

On Tue, Feb 03, 2009 at 05:29:03PM -0600, Allen, Jack wrote:
>         What causes this type of messages when you do "vgdisplay -v"? 
>     Fixing up missing size (10.00 GB) for PV /dev/sdb1 

Incompatibilities between LVM2 versions to deal with a bug.
- Did you mix two versions of LVM2 (e.g. upgrade)?

The message is pretty harmless and should disappear after the metadata is next
updated.  (If it doesn't, try updating to a newer version.)

Alasdair
-- 
agk@redhat.com
