Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4IBHqvj029366
	for <linux-lvm@redhat.com>; Fri, 18 May 2007 07:17:53 -0400
Received: from webmail.streamline-computing.com
	(webmail.streamline-computing.com [82.133.39.164])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4IBHoMQ025894
	for <linux-lvm@redhat.com>; Fri, 18 May 2007 07:17:51 -0400
Received: from [212.159.87.168] (helo=[192.168.1.12])
	by webmail.streamline-computing.com with esmtpa (Exim 4.52)
	id 1Hp0Tt-0007My-Ht
	for linux-lvm@redhat.com; Fri, 18 May 2007 12:18:46 +0100
Message-ID: <464D8B43.6040703@streamline-computing.com>
Date: Fri, 18 May 2007 12:17:23 +0100
From: John Hearns <john.hearns@streamline-computing.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Inactive volume at boot time
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
To: LVM general discussion and development <linux-lvm@redhat.com>

I've just had a system which had a problem mounting a logical volume.
SuSE 9.3 and

I log in and lvscan says the volume is inactive.
vgchange -a y and it is active, and mounts first time.
In the boot log:

Scanning for LVM volume groups...
   Reading all physical volumes.  This may take a while...
   No volume groups found
Activating LVM volume groups...
   No volume groups found

Is there any other way of checking why it couldn't find the volumes at 
boot time? The two physical drives are seen OK just before the LVM start.
I guess another reboot will be the acid test, just wondering if there is 
another diagnostic I can run.

-- 
      John Hearns
      Senior HPC Engineer
      Streamline Computing,
      The Innovation Centre, Warwick Technology Park,
      Gallows Hill, Warwick CV34 6UW
      Office: 01926 623130 Mobile: 07841 231235
