Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jBLLNd118891
	for <linux-lvm@redhat.com>; Wed, 21 Dec 2005 16:23:39 -0500
Received: from highlab.com (ecae158-153-dhcp.colorado.edu [128.138.158.153])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jBLLNRl3016264
	for <linux-lvm@redhat.com>; Wed, 21 Dec 2005 16:23:27 -0500
Received: from seb (helo=highlab.com)
	by highlab.com with local-esmtp (Exim 4.50) id 1EpBR7-0001CJ-Gi
	for linux-lvm@redhat.com; Wed, 21 Dec 2005 14:23:49 -0700
Subject: Re: [linux-lvm] problem with 2.6.15-rc5 
In-reply-to: <43A9AC7C.6020606@cox.net> 
References: <E1Ep9J3-00016R-4k@highlab.com> <43A9AC7C.6020606@cox.net>
Date: Wed, 21 Dec 2005 14:23:49 -0700
From: Sebastian Kuzminsky <seb@highlab.com>
Message-Id: <E1EpBR7-0001CJ-Gi@highlab.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Old Fart <rascal.jumper-747@cox.net> wrote:
> Sebastian Kuzminsky wrote:
> > I'm seeing almost immediate, perfectly repeatable hard lockups in
> > 2.6.15-rc5 and 2.6.15-rc5-mm3, when using sata_mv, RAID, and LVM together.
> >   
> FWIW, I have a setup similar to yours with Intel ich5 and sata promise, 
> software raid5 PVs and root partitions on LVs.  During the install of 
> etch I had to go to terminal 2 during the partitioning process to get 
> the raid devices started and then do lvm vgscan, etc, so the partitioner 
> properly saw the LVs.  Even so, a recent netinst of etch failed using 
> this method and borked one of my arrays.  An earlier etch CD install 
> worked ok with the fiddling done in TTY2.  I have seen the same 
> characteristics when installing other distros (Fedora 5, XOSLinuxPC 
> (really hard to do), Ubuntu, Gentoo, Fedora 4, Mandriva) not starting 
> the raid sets and then not being able to initialize the LVs and have had 
> to use the TTY2 approach.  A notable exception was SuSE which did it 
> right from the start.  Gentoo is really hard to do, I had to hack the 
> initrd to get the raid nodes made and run vgscan, vgchange, etc.  Good 
> luck!!

It's not an install problem.  The system's up and running, I just added
some more hardware.  I can make the RAIDs fine and the LVM components
fine, but when I use them together the system hangs.


-- 
Sebastian Kuzminsky
