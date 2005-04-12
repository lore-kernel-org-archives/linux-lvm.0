Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3C2o6O19340
	for <linux-lvm@redhat.com>; Mon, 11 Apr 2005 22:50:06 -0400
Received: from defender.int.cjs226.com (cpe-70-113-64-6.austin.res.rr.com
	[70.113.64.6])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3C2o4oh019479
	for <linux-lvm@redhat.com>; Mon, 11 Apr 2005 22:50:04 -0400
Received: from [192.168.1.21] ([192.168.1.1])
	by defender.int.cjs226.com (8.12.8/8.12.8) with ESMTP id j3C2An10031962
	for <linux-lvm@redhat.com>; Mon, 11 Apr 2005 21:10:49 -0500
Message-ID: <425B37D8.7060801@cjs226.com>
Date: Mon, 11 Apr 2005 21:52:08 -0500
From: Clif Smith <redhat@cjs226.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] invalid physical volume
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

I'm running lvm-1.0.8-9 on RHES3 and am receiving the following when I 
try to utilize a volume from an EMC array:
# pvcreate /dev/emcpowera
pvcreate -- invalid physical volume "/dev/emcpowera"

The OS sees the volume fine:
# fdisk -l /dev/emcpowera
Disk /dev/emcpowera: 10.7 GB, 10737418240 bytes
255 heads, 63 sectors/track, 1305 cylinders
Units = cylinders of 16065 * 512 = 8225280 bytes

I can create a partition and then a filesystem without issue, but I 
really need to use it within LVM.

Any ideas?
