Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m4KD8LHr017710
	for <linux-lvm@redhat.com>; Tue, 20 May 2008 09:08:21 -0400
Received: from gruber.hi.inet (31.Red-213-96-98.staticIP.rima-tde.net
	[213.96.98.31])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m4KD89Me007146
	for <linux-lvm@redhat.com>; Tue, 20 May 2008 09:08:10 -0400
Message-ID: <4832CD09.1040609@gfi-info.com>
Date: Tue, 20 May 2008 15:07:21 +0200
From: =?ISO-8859-1?Q?Raquel_Real_L=F3pez?= <rreal@gfi-info.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Kernel panic - not syncing: No init found. Try	passing
	init= option to,kernel
References: <483135CF.1080809@gfi-info.com> <20080519124014.GA5134@redhat.com>
In-Reply-To: <20080519124014.GA5134@redhat.com>
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

Hello and thank Heinz for your help!

I could restore the system.
That's what I did it:
- It was booted with a rescue disk
- It was mounted the system files.
- Then, chroot /mnt/sysimage
- vgreduce /dev/sdb1 to remove the disk from the volume group.
- Finally, shutdown -r now

But I'm not sure how remove the disk from pvscan:
pvscan -- reading all physical volumes (this may take a while...)
pvscan -- ACTIVE   PV "/dev/sda2" of VG "disk1Vol" [68.13 GB / 0 free]
pvscan -- inactive PV "/dev/sdb1" is in no VG  [62.43 MB]
pvscan -- total: 2 [68.20 GB] / in use: 1 [68.14 GB] / in no VG: 1 
[62.43 MB]


Now it's inactive. Can I remove totally?

Thanks
