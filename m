Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iA89d3r03590
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 04:39:03 -0500
Received: from rwcrmhc12.comcast.net (rwcrmhc12.comcast.net [216.148.227.85])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id iA89d2X1030856
	for <linux-lvm@redhat.com>; Mon, 8 Nov 2004 04:39:02 -0500
Date: Mon, 8 Nov 2004 01:40:08 -0800
From: "David S." <dgs@gs.washington.edu>
Subject: Re: [linux-lvm] VGs not detected at startup
Message-ID: <20041108094008.GA26201@goldfinger.local>
References: <88707567.20041108091624@stud.fhbb.ch>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <88707567.20041108091624@stud.fhbb.ch>
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: Markus Wiedmer - FHBB <markus.wiedmer@stud.fhbb.ch>, LVM general discussion and development <linux-lvm@redhat.com>

> 
> I'm running lvm2.00.25 on kernel 2.6.9, but I have problems with
> detecting the VGs.Immediately after bootup, vgscan returns: no volume
> groups found, same for lvscan and pvscan. I have my root
> partition on my Primary IDE-Drive (hda) and the VGs lie on the
> serial-ATA-Drive (sda).
> 
> Now after I run fdisk on /dev/sda (just run it an quit again). all my
> VGs mysteriously appear on the next vgscan.
> 
> I guess I'm missing something, but I can't see what. Does anyone know
> this problem?

Yes, I certainly know this problem.  I'm running LVM2 2.00.15 and device
mapper 1.00.17 on a 2.6.9 (x86) kernel.  'Vgscan' fails to find an vloumes
running from the system initialization script, but works fine a few seconds
(I'm guessing) later run from 'rc.local'.  I've tried a few things to "fix"
this, all to no effect.

David S.

> 
> Thanks in advance
> 
> markus
> 
> 
> -- 
> Mit freundlichen Gr?ssen
> Markus Wiedmer - FHBB
> 



> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
