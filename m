Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.12])
	by int-mx03.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8FHZinm007452
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 13:35:44 -0400
Received: from hosting.substring.ch (hosting.substring.ch [88.80.216.55])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8FHZVe9019703
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 13:35:32 -0400
Received: from [192.168.178.25] (i59F70745.versanet.de [89.247.7.69])
	(authenticated bits=0)
	by hosting.substring.ch (8.13.8/8.13.8/Debian-3) with ESMTP id
	n8FHZP4F028549
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT)
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 19:35:26 +0200
Message-ID: <4AAFD056.2030100@tonarchiv.ch>
Date: Tue, 15 Sep 2009 19:35:18 +0200
From: Till Wimmer <g4-lisz@tonarchiv.ch>
MIME-Version: 1.0
Subject: Re: RE: [linux-lvm] vg availability during boot
Content-Transfer-Encoding: 7bit
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

> Did you rebuild initrd? During boot, initrd uses staticly linked modules to load what otherwise would be kernel modules. It does, if LVM is enabled, do a vgchange -y a as part of that process. Since LVM is part of the default initrd, it may be the drivers for your SAN that you need to get in place - remember to include the high-end Ethernet drivers too that your NAS (I presume?) uses. 
>
Hi,

i have a quite similar problem with my server. But in my case, it occurs from time to time only.
Before i had another issue with mounting the root partition because of swapped SCSI IDs (sda becomes sdb, sdc, becomes sda, and so on). But i could solve this with ext2fs labels.

I'm using Debian Lenny.

Is the vgchange -ay in initrd executed for every volume group or is this hard coded by update-initrd?

Could the swapping of SCSI-IDs be the reason for this issue, too?


Thank you,
TW
