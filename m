Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBLJQo115995
	for <linux-lvm@redhat.com>; Wed, 21 Dec 2005 14:26:50 -0500
Received: from eastrmmtao02.cox.net (eastrmmtao02.cox.net [68.230.240.37])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id jBLJQiqX016342
	for <linux-lvm@redhat.com>; Wed, 21 Dec 2005 14:26:44 -0500
Received: from [192.168.0.9] (really [70.179.95.46]) by eastrmmtao02.cox.net
	(InterMail vM.6.01.05.02 201-2131-123-102-20050715) with ESMTP
	id <20051221192503.JGQI14821.eastrmmtao02.cox.net@[192.168.0.9]>
	for <linux-lvm@redhat.com>; Wed, 21 Dec 2005 14:25:03 -0500
Message-ID: <43A9AC7C.6020606@cox.net>
Date: Wed, 21 Dec 2005 14:26:52 -0500
From: Old Fart <rascal.jumper-747@cox.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem with 2.6.15-rc5
References: <E1Ep9J3-00016R-4k@highlab.com>
In-Reply-To: <E1Ep9J3-00016R-4k@highlab.com>
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
> I'm seeing almost immediate, perfectly repeatable hard lockups in
> 2.6.15-rc5 and 2.6.15-rc5-mm3, when using sata_mv, RAID, and LVM together.
>
> Everything works fine (nice & fast & reliable) when I do LVM of raw SATA
> disks, and RAID of SATA disks works, but when I put it all together (4
> disks into a RAID-5 or RAID-6, and use the array as a PV), it crashes
> within seconds.  Nothing on the console, no Caps Lock, no magic sysrq,
> no network ping.
>
> This is on a Dell Poweredge 700 with a Marvell 6081 PCI-X controller
> and 4 Seagate Barracuda disks.
>
> Software is Debian Etch, gcc is 4.0.3 20051201 (prerelease Debian
> 4.0.2-5).  mdadm 1.12.0, LVM 2.02.01, libdevicemapper 1.02.02, and
> dm-driver 4.5.0.
>
> Any advice is appreciated...  My kernel config is attached.
>
>   
FWIW, I have a setup similar to yours with Intel ich5 and sata promise, 
software raid5 PVs and root partitions on LVs.  During the install of 
etch I had to go to terminal 2 during the partitioning process to get 
the raid devices started and then do lvm vgscan, etc, so the partitioner 
properly saw the LVs.  Even so, a recent netinst of etch failed using 
this method and borked one of my arrays.  An earlier etch CD install 
worked ok with the fiddling done in TTY2.  I have seen the same 
characteristics when installing other distros (Fedora 5, XOSLinuxPC 
(really hard to do), Ubuntu, Gentoo, Fedora 4, Mandriva) not starting 
the raid sets and then not being able to initialize the LVs and have had 
to use the TTY2 approach.  A notable exception was SuSE which did it 
right from the start.  Gentoo is really hard to do, I had to hack the 
initrd to get the raid nodes made and run vgscan, vgchange, etc.  Good 
luck!!

-- 
Regards,

Old Fart
