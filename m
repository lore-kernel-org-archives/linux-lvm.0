Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41IFKXu012826
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 14:15:20 -0400
Received: from vms173005pub.verizon.net (vms173005pub.verizon.net
	[206.46.173.5])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m41IF9rZ008113
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 14:15:09 -0400
Received: from [192.168.2.102] ([72.91.189.24]) by vms173005.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K0700LR3BRBUMD1@vms173005.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 01 May 2008 13:09:11 -0500 (CDT)
Date: Thu, 01 May 2008 14:15:03 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>
Message-id: <481A08A7.5010305@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4817C2FD.1010909@verizon.net> <4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net> <48187B91.4060901@verizon.net>
	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
	<4818AB1C.9030809@verizon.net> <4818BA5D.6070501@Media-Brokers.com>
	<4818D59A.8020906@verizon.net> <4818E262.4070105@redhat.com>
	<4818F2FC.5050907@verizon.net> <20080501154800.GA5941@us.ibm.com>
	<Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>
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

Mikulas Patocka wrote:
> ... If you mount the origin device with missing snapshot, you destroy 
> the snapshot (even if you don't touch it). The snapshot can no longer 
> be repaired.
>
> So it is safer to not activate device in this case then destroy data.
Why? What value is the old snapshot at this point? You just had a system 
reboot in the middle of a snapshotted backup so all you need to do is 
get the system up, redo another snapshot and retake your backup. I'm not 
interested in the old snapshot.
>
> Imagine, for example, you have origin and snapshot, you reconfigure 
> disks in some weird way that the snapshot disk is inaccessible, you 
> boot, and the system automatically starts without the snapshot. And 
> you lose any data that you stored on that snapshot.
What is on the old snapshot at this point is probably indeterminate anyway.
> You can with dmsetup (but it has deadlocks). Maybe someone could write 
> non-deadlocky snapshot-managing tool that wouldn't depend on lvm vgs, 
> pvs and lvs.
>
> Mikulas
Have not used dmsetup. If it has deadlocks, I don't think I want to use it.


Gerry
