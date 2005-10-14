Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9EDYOV15544
	for <linux-lvm@redhat.com>; Fri, 14 Oct 2005 09:34:24 -0400
Received: from eproxy.vsaa.lv (eproxy.vsaa.lv [81.198.191.140])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9EDYL7v006192
	for <linux-lvm@redhat.com>; Fri, 14 Oct 2005 09:34:22 -0400
Message-ID: <434FB3D0.5010704@hq.vsaa.lv>
Date: Fri, 14 Oct 2005 16:34:08 +0300
From: Rich <rich@hq.vsaa.lv>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] xfs_freeze & lvm2
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

i am not subscribed, so i would be thankful if i could get a reply with 
cc. thanks.

i tried making snapshots of xfs filesystem on lvm2. if xfs was frozen, 
lvcreate stopped at

	Suspending space-data
          dm suspend space-data  N

issuing xfs_freeze -u allowed the process to continue.
in this list, Thu, 09 Jun 2005 Klaus Strebel wrote :

"with LVM2 the XFS filesystem is 'frozen' automaticly on the mount 
-onouuid,ro ( not quite sure, but probably also for LVM1 ..., think it's 
in the XFS code ).
So, forget xfs_freeze."

as i understand it, consistent copy is created when lvcreate is issued, 
not when snapshot volume is mounted - is this right ?
if so, shouldn't filesystem also be frozen when a snapshot volume is 
created ?
if it actually is done together with snapshot, does this mean that i 
really can forget about xfs_freeze and just create snapshots ?
must i specify ro in mount options or is this optional ?
-- 
  Rich
