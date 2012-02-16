Received: from mx1.redhat.com (ext-mx12.extmail.prod.ext.phx2.redhat.com
	[10.5.110.17])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q1GEfVX6010200
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 09:41:31 -0500
Received: from mailhost.ankh.org (ammut.ankh.org [93.97.41.159])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q1GEfU5I024748
	for <linux-lvm@redhat.com>; Thu, 16 Feb 2012 09:41:30 -0500
Received: from gtw.srd.co.uk ([82.69.77.54] helo=agnew.srd.co.uk)
	by mailhost.ankh.org with esmtp (Exim 4.63)
	(envelope-from <oolon@ankh.org>) id 1Ry1ll-0000Ti-3u
	for linux-lvm@redhat.com; Thu, 16 Feb 2012 13:53:09 +0000
Message-ID: <4F3D1593.9070609@ankh.org>
Date: Thu, 16 Feb 2012 14:41:23 +0000
From: James Hawtin <oolon@ankh.org>
MIME-Version: 1.0
References: <4F3D098F.4010709@profitbricks.com>
In-Reply-To: <4F3D098F.4010709@profitbricks.com>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Allocation Policy for Cloud Computing needed
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/options/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Sebastian Riemer wrote:
> Hi LVM list,
>
> I'm experimenting with storage for many QEMU/KVM virtual machines in
> cloud computing. I've got many concurrent IO processes and 24 hard
> drives. I've tested the scalability with a single IO reader process per
> hard drive. Single drives scale best and have the best performance of
> cause, but we need mirroring and volume management. So I've created MD
> RAID-1 arrays and created on each a VG and two LVs. This gives me good
> overall performance (up to 2 GB/s, HBA limit: 2.2 GB/s).
>
> Then, I've tested to put all my RAID-1 arrays into a single VG, because
> LV size should be adjustable over all hard drives. I've tried all
> allocation policies but none does what I want to achieve here. Yeah,
> that this isn't implemented fully is in the man page, ... .
>
> I want to have an allocation which distributes the LVs equally over the
> PVs as long as space is left and LVs aren't resized. The goal is to
> minimize the number of concurrent IO processes per hard drive (striping
> is total crap in this situation).
>
> I've tested LVM2 2.02.66 and kernel 3.0.15. Is something like that
> implemented in newer releases or is something like that intended to be
> implemented in near future? Or does someone want to implement this
> together with me?
>
> Thanks, cheers,
>
> Sebastian
>
>   
I wrote a script to do this, with LVM 1 that just extended the lv in 
chunks over a range of PVs until it was full. while it worked on LVM it 
produced lots of backups in /etc. I felt with the LVM stripe function 
that this was not necessary, and  could acheive the same thing by using 
large stripe size, as LVM allows concats of different stripeness it was 
not a problem extending the lv.

James.
