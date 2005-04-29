Received: from agk.surrey.redhat.com (agk.surrey.redhat.com [172.16.10.74])
	by pobox.surrey.redhat.com (8.12.8/8.12.8) with ESMTP id j3TEOfkk013502
	for <linux-lvm@redhat.com>; Fri, 29 Apr 2005 15:24:41 +0100
Received: from agk by agk.surrey.redhat.com with local (Exim 4.34)
	id 1DRWQ5-0000xu-4G
	for linux-lvm@redhat.com; Fri, 29 Apr 2005 15:24:41 +0100
Date: Fri, 29 Apr 2005 15:24:41 +0100
From: Alasdair G Kergon <agk@redhat.com>
Subject: Re: [linux-lvm] LVM wedged after stopping some pvmove's
Message-ID: <20050429142441.GZ9049@agk.surrey.redhat.com>
References: <20050428185433.GH18051@phunnypharm.org>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20050428185433.GH18051@phunnypharm.org>
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

On Thu, Apr 28, 2005 at 02:54:33PM -0400, Ben Collins wrote:
>   VG swissdisk_1 metadata too large for circular buffer

1.  Check if the metadata is genuinely too large for the metadata area.
(eg vgcfgbackup into a file)

2.  If so, see if there's anything you can change to make it smaller
eg by changing LVs that are not involved in the pvmove.

We haven't written tools to resize the metadata area yet: you have
to ask for more space when you ran the original pvcreates.

If you really can't shrink it, there are workarounds involving
storing the metadata elsewhere: either on a new PV created with a 
larger metadata area that you add to the VG, or else in the filesystem.

Alternatively, depending what changes you've been making, you might be 
able to restore to a metadata backup - may lose changes if you've been 
updating the data in the areas moved though during the pvmove.

Alasdair
-- 
agk@redhat.com
