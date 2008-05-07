Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4710FNW027657
	for <linux-lvm@redhat.com>; Tue, 6 May 2008 21:00:15 -0400
Received: from scan.5ninesdata.com (scan.5ninesdata.com [208.66.134.12])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m47102nY006000
	for <linux-lvm@redhat.com>; Tue, 6 May 2008 21:00:03 -0400
Received: from 5ninesdata.com (localhost [127.0.0.1])
	by scan.5ninesdata.com (Spam Firewall) with ESMTP id AEF193A7088
	for <linux-lvm@redhat.com>; Tue,  6 May 2008 19:59:45 -0500 (CDT)
Received: from 5ninesdata.com (mail.5ninesdata.com [208.66.134.10]) by
	scan.5ninesdata.com with ESMTP id yRRSzjBBSTxnW9mp
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=NO) for
	<linux-lvm@redhat.com>; Tue, 06 May 2008 19:59:45 -0500 (CDT)
Message-ID: <4820FF09.4000309@stthomasepc.org>
Date: Tue, 06 May 2008 20:59:53 -0400
From: Tod <tod@stthomasepc.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] vgdisplay can't see volume group after upgrade
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

I'm trying to upgrade (yum) from FC6 to FC8.  I started by upgrading to 
FC7 but that hosed something giving me a kernel panic trying to find 
/dev/root so I figured I'd push ahead to FC8 to see if that would 
resolve my problem.

I have one small /boot partition on my first drive the rest of it and a 
second drive is all lvm.  Once I discovered the problem with the FC8 
upgrade I rebooted back to my FC6 kernel.  Everything boots fine but 
vgdisplay shows nothing.  When I run system-config-lvm it sees the 
second lvm partition of my first drive unallocated, as well as the 
entire second drive.

I can back everything up and just reinstall but I've upgraded fedora 
using yum before and while there were problems I always found a way to 
make it work.  This one has me stumped.  I believe the kernel panic 
_might_ be coming from the fact the kernel doesn't recognize my managed 
volumes.  Maybe the lvm meta information is trashed?

If anybody can help I'd appreciate it.  Any diagnostics or hints would 
be appreciated.  I can reinstall but I'd like to get it working on my 
own so I can learn something.

I'll be happy to post any system information necessary if it will help. 
  Also, I did prepare for the upgrade by applying labels and validating 
fstab, and grub.conf before proceeding.

Thanks - Tod
