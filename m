Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3UIKGlb006370
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 14:20:16 -0400
Received: from vms173003pub.verizon.net (vms173003pub.verizon.net
	[206.46.173.3])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3UIK5et022241
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 14:20:05 -0400
Received: from [192.168.2.102] ([72.91.189.24]) by vms173003.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K0500CTKHG48JR2@vms173003.mailsrvcs.net> for
	linux-lvm@redhat.com; Wed, 30 Apr 2008 13:16:53 -0500 (CDT)
Date: Wed, 30 Apr 2008 14:19:45 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <4818AB1C.9030809@verizon.net>
Message-id: <4818B841.2010201@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4817C2FD.1010909@verizon.net> <4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net> <48187B91.4060901@verizon.net>
	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
	<4818AB1C.9030809@verizon.net>
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

Just to finish documenting the recovery from the corruption:

I was able to fully restore the root logvol and then I rebooted the 
system.  The system came up fine without having to make any special 
adjustments to LVM metadata.  It figured it out.  The only thing I 
noticed was a blizzard of SELinux avc denials.  So I ran a relabel and 
that seemed to cure those.  I did a 'cat /etc/lvm/backup/VolGroup00' and 
took a look at what was in there.  It was in the state that included the 
snapshot0 and my snapshot logvol.  I then did a vgdisplay -v and LVM 
rewrote the meta backup and when I checked it again the snapshot0 and my 
snapshot were gone.  So the system appears to be recovered and working 
again.


Gerry
