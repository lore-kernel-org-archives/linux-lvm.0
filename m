Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8RGo6tH030767
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 12:50:06 -0400
Received: from mail.davidb.org (mail.davidb.org [66.93.32.219])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k8RGo2WV004096
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 12:50:02 -0400
Received: from a64.davidb.org ([66.93.32.226])
	by mail.davidb.org with esmtpa (Exim 4.60 #1 (Debian))
	id 1GScbh-0000fY-SJ
	for <linux-lvm@redhat.com>; Wed, 27 Sep 2006 09:50:01 -0700
Message-ID: <451AABB5.8030301@davidb.org>
Date: Wed, 27 Sep 2006 09:49:57 -0700
From: David Brown <lvm@davidb.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Help, lvm2 snapshot and XFS ,	using xfs_freeze to
	do this, but then lvcreate hang.
References: <625ccb870609262203m400d149ax47ef5396dd96236@mail.gmail.com>	<451A0D03.9000204@davidb.org>
	<20060927133328.GA30026@boolecat.com>
In-Reply-To: <20060927133328.GA30026@boolecat.com>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Steve Feehan wrote:

> Are you saying that the lvcreate command literally executes xfs_freeze
> when used on a volume that happens to contain an XFS filesystem? Or
> that creating a snapshot is equivalent to using xfs_freeze?

Not literally, but the freeze/unfreeze is done by the dm driver in recent
kernels.  If your systems hangs on with the xfs_freeze -f, then you have a
kernel with this feature.  Just 'xfs_freeze -u' to allow the snapshot to be
created, and then continue to create the mirrors without a manual freeze.

Dave
