Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j26LH0n22002
	for <linux-lvm@redhat.com>; Sun, 6 Mar 2005 16:17:00 -0500
Received: from omx2.sgi.com (omx2-ext.sgi.com [192.48.171.19])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j26LGrUr013797
	for <linux-lvm@redhat.com>; Sun, 6 Mar 2005 16:16:54 -0500
Date: Mon, 7 Mar 2005 08:15:38 +1100
From: Nathan Scott <nathans@sgi.com>
Subject: Re: [linux-lvm] xfs and snapshots
Message-ID: <20050307081538.C2751595@wobbly.melbourne.sgi.com>
References: <87f94c3705030417156a2ea617@mail.gmail.com>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87f94c3705030417156a2ea617@mail.gmail.com>;
	from greg.freemyer@gmail.com on Fri, Mar 04, 2005 at 08:15:39PM
	-0500
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
To: Greg Freemyer <greg.freemyer@gmail.com>, LVM general discussion and development <linux-lvm@redhat.com>

On Fri, Mar 04, 2005 at 08:15:39PM -0500, Greg Freemyer wrote:
> Thanks to Nathan Scott, the new 2.6.11 kernel has a fix that should
> allow xfs_freeze to be called prior to the creating a snapshot.
> 
> It is still not required, but it should no longer cause problems.

Actually, for 2.6 kernels you shouldn't do a xfs_freeze before doing
a snapshot - this will result in a deadlocked snapshot, since the
freeze holds locks the snapshot code needs.  In 2.6, the DM snapshot
code knows how to do an xfs_freeze-equivalent call from within the
kernel.

We didn't find a clean way to resolve that issue yet, Christoph is
looking into it though.

cheers.

-- 
Nathan
