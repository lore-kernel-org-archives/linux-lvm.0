Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m41KLkYg011532
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:21:46 -0400
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m41KLNLI024458
	for <linux-lvm@redhat.com>; Thu, 1 May 2008 16:21:23 -0400
Received: from [192.168.2.102] ([72.91.189.24]) by vms173001.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K0700MVUHV06XA5@vms173001.mailsrvcs.net> for
	linux-lvm@redhat.com; Thu, 01 May 2008 15:21:01 -0500 (CDT)
Date: Thu, 01 May 2008 16:21:00 -0400
From: Gerry Reno <greno@verizon.net>
Subject: Re: [linux-lvm] F7 will not boot after running backup w/snapshot
In-reply-to: <481A221D.80209@Media-Brokers.com>
Message-id: <481A262C.7080908@verizon.net>
MIME-version: 1.0
Content-transfer-encoding: 7bit
References: <4817C2FD.1010909@verizon.net>	<4817D97D.8060805@verizon.net>
	<4817ECAF.4020806@verizon.net>	<48187B91.4060901@verizon.net>
	<1c748a490804300809s304f7fdfx55aeb0fd9c6cc7ab@mail.gmail.com>
	<4818AB1C.9030809@verizon.net>	<4818BA5D.6070501@Media-Brokers.com>
	<4818D59A.8020906@verizon.net>	<4818E262.4070105@redhat.com>
	<4818F2FC.5050907@verizon.net>	<20080501154800.GA5941@us.ibm.com>
	<Pine.LNX.4.64.0805011223590.32190@engineering.redhat.com>
	<481A08A7.5010305@verizon.net>	<481A0E28.5030108@Media-Brokers.com>
	<481A1C09.7070508@verizon.net>	<481A1D32.6020705@Media-Brokers.com>
	<481A1FAF.5050303@verizon.net> <481A221D.80209@Media-Brokers.com>
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

At least in the case where the snapshot is read-only (LVM1 default, LVM2 
by config?), if the snapshot is lost, invalid, not removed from VG prior 
to reboot, when LVM comes back up it should see this and immediately 
know that it can just vgreduce VG --removemissing for the old snapshot.  
In the case of rw (no LVM1, LVM2 default), it should be a user choice 
and LVM should prompt the user at boot as to whether to remove this old 
snapshot so it can attempt to activate the VG.  Unless the user knows 
that there were non-backup related lvm mods written during the snapshot 
(eg: pvmove) then the user will just answer yes and the system should 
boot.  This is how LVM should operate in this scenario.

Gerry
