Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m3UHOFbu029898
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 13:24:15 -0400
Received: from vms042pub.verizon.net (vms042pub.verizon.net [206.46.252.42])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m3UHO4q0015369
	for <linux-lvm@redhat.com>; Wed, 30 Apr 2008 13:24:04 -0400
Received: from [192.168.2.102] ([72.91.189.24])
	by vms042.mailsrvcs.net (Sun Java System Messaging Server 6.2-6.01
	(built Apr
	3 2006)) with ESMTPA id <0K0500IGOEZGOEU0@vms042.mailsrvcs.net> for
	linux-lvm@redhat.com; Wed, 30 Apr 2008 12:23:42 -0500 (CDT)
Date: Wed, 30 Apr 2008 13:23:40 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
Message-id: <4818AB1C.9030809@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4817C2FD.1010909@verizon.net> <4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net> <48187B91.4060901@verizon.net>
	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
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

Larry,
  There was only maybe ten minutes between the time the backup finished 
and the hang.  The system was very quiet at the time.  The backups run 
overnight when there is almost no system activity.  I had only recently 
begun using snapshots and I was surprised to see a machine get into this 
state while running a backup w/snapshot.  I use a 256M ramdisk as the 
snapshot vol.  Prior to introducing snapshots this machine had run 
without any problems during backups.  I could not tell what exactly 
caused the hang.  There was no indication that the snapshot had run out 
of space and I doubt that it did.  The issue for me is that no matter 
what happened to cause a hang that LVM should never get into a state 
where it cannot start the system.  The backup had completed backing up 
the root filesystem (which was last) when the hang occurred.  What that 
did was to leave the volume that contained the root filesystem in an 
inconsistent state at reboot since the snapshot logvol was not removed.  
LVM should have recognized that the inconsistency was due to a snapshot 
logvol and corrected the problem at boot and brought up the VolGroup 
sans snapshot device since it's worthless at that point anyway.  My 
concern is that there is a bug somewhere in the snapshot mechanism.  
I've seen other people report what they said were corruption problems 
resulting from snapshots.

Regards,
Gerry


Larry Dickson wrote:
> Gerry, for the benefit of the rest of us who are depending on snapshot -
>  
> Was there much writing and/or reading going on between the time your 
> backup was made, and the time of the hang?
>  
> I know that snapshot works by putting an extra load on every write to 
> the origin volume. Is there any reason, known to knowledgeable LVM 
> designers on this list, why this should lead to "hundreds of errors" 
> when a system hang takes place? I assume stuff got caught in a 
> half-committed state, but _hundreds_... ???
>  
> Thanks,
>  
> Larry
>  
