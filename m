Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i3LKRkp26445
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 16:27:46 -0400
Received: from imf25aec.mail.bellsouth.net (imf25aec.mail.bellsouth.net
	[205.152.59.73])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i3LKRjMc022482
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 16:27:46 -0400
Received: from david.internal.NorcrossGroup.com ([68.213.19.251])
	by imf25aec.mail.bellsouth.net
	(InterMail vM.5.01.06.08 201-253-122-130-108-20031117) with ESMTP id
	<20040421202740.CFUM1818.imf25aec.mail.bellsouth.net@david.internal.NorcrossGroup.com>
	for <linux-lvm@redhat.com>; Wed, 21 Apr 2004 16:27:40 -0400
Subject: Re: [linux-lvm] About Extending LVM size with Hardware Raid
From: Greg Freemyer <freemyer-ml@NorcrossGroup.com>
In-Reply-To: <200404211741.i3LHfNcJ001319@smtp.doruk.net.tr>
References: <200404211741.i3LHfNcJ001319@smtp.doruk.net.tr>
Message-Id: <1082579089.15133.3.camel@david.internal.NorcrossGroup.com>
Mime-Version: 1.0
Date: Wed, 21 Apr 2004 16:24:49 -0400
Content-Transfer-Encoding: 7bit
Reply-To: freemyer-ml@NorcrossGroup.com,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Wed, 2004-04-21 at 13:38, Vahric MUHTARYAN wrote:
> Hi Everybody ?! 
> 
> 	Maybe everybody know Raid5 can extend easily. I'm using hardware
> raid and I wonder What extend utulity I have to use for system . resize or
> LVM .. 
> Because with hardware raid system looks all disks like a one logical disk at
> this moment How can I intorduce extended array to system ... 
> 
> 
> Thanks  
In that case you may not want to be using LVM.

Most of the Linux filesystems have an extend capability, so that is not
a problem.

I don't know how to get the kernel itself to rescan the hardware for
capacity changes.  Obviously you can reboot, but there must be a better
way.

I would look for SAN documentation that describes the resize process. 
The commands will likely be exactly the same from the Linux perspective.

Greg
-- 
Greg Freemyer
