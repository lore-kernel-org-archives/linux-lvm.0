Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l7FK3p1w011890
	for <linux-lvm@redhat.com>; Wed, 15 Aug 2007 16:03:51 -0400
Received: from vms048pub.verizon.net (vms048pub.verizon.net [206.46.252.48])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l7FK3oXr022700
	for <linux-lvm@redhat.com>; Wed, 15 Aug 2007 16:03:50 -0400
Received: from [192.168.1.13] ([209.172.69.66])
	by vms048.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0JMT0019EZPYC312@vms048.mailsrvcs.net> for
	linux-lvm@redhat.com; Wed, 15 Aug 2007 15:03:36 -0500 (CDT)
Date: Wed, 15 Aug 2007 13:03:33 -0700
From: Lothar Werzinger <lothar@tradescape.biz>
Message-id: <200708151303.33774.lothar@tradescape.biz>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Content-disposition: inline
Subject: [linux-lvm] Is this possible with LVM?
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
To: linux-lvm@redhat.com

Hi,

I have a Lenovo Thinkpad T61 with a second disk drive for the Ultrabay.

I created one PV on the internal and external (Ultrabay) each
I created a VG with these two PVs.
I created a LV (LV1) that uses exclusively PV intern
I created a LV (LV2) that uses both PVs in striped mode.

So far everything works fine.

What I would like to do is to unmount LV2 and be able to remove the external 
disk from the Ultrabay to replace it with a DVD drive while still be able to 
acess the filesystem on LV1 (which uses only space on the internal disk).
I would like to do this to backup data from LV1 to DVD-RW.

Is this possible with LVM? How would I go and prepare the external disk for 
removal? How would I reconnect if I insert the disk again.

Thanks in advance!

Lothar
