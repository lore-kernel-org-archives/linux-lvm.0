Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k39HVixo008620
	for <linux-lvm@redhat.com>; Sun, 9 Apr 2006 13:31:44 -0400
Received: from charybdis.ellipsis.cx (charybdis.ellipsis.cx [64.119.36.29])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k39HVhRd026116
	for <linux-lvm@redhat.com>; Sun, 9 Apr 2006 13:31:44 -0400
From: Joel Uckelman <uckelman@nomic.net>
Date: Sun, 09 Apr 2006 19:31:33 +0200
Sender: uckelman@ellipsis.cx
Message-Id: <20060409173133.AC8FDEA78@charybdis.ellipsis.cx>
Subject: [linux-lvm] can't use swap after switch to LVM  
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I just switched my desktop FC5 system from using software RAID over regular
partitions to using software RAID over LVM; everything works fine, except
I can't enable my swap.

On boot, I get the following messages:

   device-mapper: device 9:1 too small for target
   device-mapper: dm-linear: Device lookup failed
   device-mapper: error adding target to table
   .
   .
   .
   Unable to find swap-space signature

My swap volume is listed like this in my /etc/fstab:

   /dev/VolGroup00/LogVol01 swap swap defaults 0 0

If I try to format the swap volume, mkswap tells me that it's too small:

   # mkswap /dev/mapper/VolGroup00-LogVol01
   mkswap: error: swap area needs to be at least 40kB

But 'lvm lvs' reports that's it's 1GB:

   LogVol01 VolGroup00 -wi-d-     1.00G

I've tried deleting and recreating the swap volume:

   # lvm lvremove VolGroup00/LogVol01
   # lvm lvcreate -L 1024M -n LogVol01 VolGroup00
   device-mapper: reload ioctl failed: Invalid argument
   Failed to activate new LV.

Does anyone have an idea of what's going wrong here?

-- 
J.
