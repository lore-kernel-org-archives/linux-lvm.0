Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3UE1jcc010603
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 10:01:45 -0400
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3UE1HK6016547
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 10:01:17 -0400
Received: from [192.168.2.102] ([72.91.189.24]) by vms173001.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K0500D8S5LD6W91@vms173001.mailsrvcs.net> for
	linux-lvm@redhat.com; Wed, 30 Apr 2008 09:00:50 -0500 (CDT)
Date: Wed, 30 Apr 2008 10:00:49 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <4817ECAF.4020806@verizon.net>
Message-id: <48187B91.4060901@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4817C2FD.1010909@verizon.net> <4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net>
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

I ran e2fsck against the new logvol and it found the filesystem and the 
journal but
the filesystem was corrupted with hundreds of errors.  At this point I 
just reformatted
the device and now I'm loading the backup onto it.

How do I handle the LVM metadata?  The restored metadata will not be 
correct.  Or does
LVM have a way to figure this out?


Gerry
