Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3U0riTG024718
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 20:53:44 -0400
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3U0rXpB020892
	for <linux-lvm@redhat.com>; Tue, 29 Apr 2008 20:53:33 -0400
Received: from [192.168.2.102] ([72.91.189.24]) by vms173005.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K0400G564V1VX30@vms173005.mailsrvcs.net> for
	linux-lvm@redhat.com; Tue, 29 Apr 2008 19:47:26 -0500 (CDT)
Date: Tue, 29 Apr 2008 20:53:17 -0400
From: Gerry Reno <greno@verizon.net>
Message-id: <4817C2FD.1010909@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
Subject: [linux-lvm] F7 will not boot after running backup w/snapshot
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

I ran a backup today with a snapshot.  Sometime after the backup 
completed but before I could unmount and lvremove the snapshot the 
system became hung.  No choice but to cold boot.  When the system came 
up it showed a kernel panic on the screen.  Looking back up the screen I 
could see that it could not find a device with UUID blahblah for 
VolGroup00 (which is where the / drive is located) and then VolGroup00 
not found.  So ok, no problem, I just figure that the VolGroup00 is 
inconsistent and I can deal with this in rescue mode.  Wrong.  When I 
boot the F7 rescue from the dvd it says "You don't have any Linux 
partitions..."  What!?  I go into the shell but there is nothing under 
/mnt/sysimage.  So how do I recover from this?  How could a snapshot 
cause all this?

Gerry
