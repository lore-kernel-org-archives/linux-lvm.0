Received: from [10.65.0.147] (nbansal.pnq.redhat.com [10.65.0.147])
	by pobox-2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l9M4fMki010195
	for <linux-lvm@redhat.com>; Mon, 22 Oct 2007 00:41:23 -0400
Message-ID: <471C29F2.5090408@redhat.com>
Date: Mon, 22 Oct 2007 10:11:22 +0530
From: Humble Chirammal <hchiramm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvreduce
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

Hi All,
  One of the customer ran  "lvreduce" command without reducing the 
filesystem (resize2fs ).  After the system was rebooted got this error.

<<snip>>

The filesystem size (according to the superblock) is 19922944 blocks
The physical size of the device is 13369344 blocks
Either the superblock or the partition table is likely to be corrupt!
 <<snip>>

Is there any way for data recovery???

Welcomes your valid responses

Regards
Humble
