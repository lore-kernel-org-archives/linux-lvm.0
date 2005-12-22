Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBMHDm128131
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 12:13:48 -0500
Received: from eastrmmtao04.cox.net (eastrmmtao04.cox.net [68.230.240.35])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBMHDgi0013980
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 12:13:42 -0500
Received: from [192.168.0.9] (really [70.179.95.46]) by eastrmmtao04.cox.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20051222171056.WDJF19943.eastrmmtao04.cox.net@[192.168.0.9]>
	for <linux-lvm@redhat.com>; Thu, 22 Dec 2005 12:10:56 -0500
Message-ID: <43AADECD.7010106@cox.net>
Date: Thu, 22 Dec 2005 12:13:49 -0500
From: Old Fart <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] more info on the hang with 2.6.15-rc5
References: <E1EpIfb-0001e2-GR@highlab.com>
In-Reply-To: <E1EpIfb-0001e2-GR@highlab.com>
Content-Transfer-Encoding: 7bit
Reply-To: rascal.jumper-747@cox.net.spamorama.redhat.com,
	LVM general discussion and development <linux-lvm@redhat.com>
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

Sebastian Kuzminsky wrote:
> Now it works, but I dont trust it one bit.
>
> I had been seeing almost immediate, perfectly repeatable hard lockups
> in 2.6.15-rc5 and 2.6.15-rc5-mm3, when using sata_mv, RAID, and LVM
> together.  Nothing in the syslog or on the console, and the system is
> totally unresponsive to the keyboard & network.
>
> My hardware setup is: four Seagate Barracuda 500 GB disks, on a Marvell
> MV88SX6081 8-port SATA-II PCI-X controller, on a PCI-X bus (64/66).
>
> The disks work great when accessed directly.  They work great when used
> as four PVs for LVM, and when assembled into a 4-disk RAID-6.
>
> But when I make a RAID-6 array out of them, and use the array as a PV,
> the system would hang completely, within seconds.  (This is with LVM
> 2.02.01, libdevicemapper 1.02.02, and dm-driver 4.5.0.)
>
> I turned on all the debugging options in the kernel config hoping to get
> some insight, but this "debug" kernel doesnt crash.  It's running fine,
> and I'm pounding on it.  A timing problem in the interaction between
> LVM and RAID?  Some kind of wierd heisenbug....
>
>
> I'd be happy to do any debugging tests people suggest.
>
>
>   
This won't be much help, but, there are some indications of a kernel 
problem with raid.  The problems may be fedora specific, but, currently 
fedora rawhide is following the upstream kernel.  See: 
https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=176179

good luck.

-- 
Regards,

Old Fart
