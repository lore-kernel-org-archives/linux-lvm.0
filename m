Received: from mx1.redhat.com (ext-mx08.extmail.prod.ext.phx2.redhat.com
	[10.5.110.32])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id tARF6giw012393
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO)
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 10:06:42 -0500
Received: from clarity.mcc.ac.uk (clarity.mcc.ac.uk [130.88.200.144])
	by mx1.redhat.com (Postfix) with ESMTPS id AA82AC0D222A
	for <linux-lvm@redhat.com>; Fri, 27 Nov 2015 15:06:40 +0000 (UTC)
Received: from asmtp2.its.manchester.ac.uk ([130.88.13.150])
	by clarity.mcc.ac.uk with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
	(Exim 4.85 (FreeBSD)) (envelope-from <tony.arnold@manchester.ac.uk>)
	id 1a2Kbe-0008MX-4Z
	for linux-lvm@redhat.com; Fri, 27 Nov 2015 15:06:38 +0000
Received: from zaphod.itservices.manchester.ac.uk ([130.88.201.81]:59112)
	by asmtp2.its.manchester.ac.uk with esmtpsa
	(TLSv1.2:DHE-RSA-AES128-SHA:128) (Exim 4.83)
	(envelope-from <tony.arnold@manchester.ac.uk>) id 1a2Kbd-00019F-L0
	for linux-lvm@redhat.com; Fri, 27 Nov 2015 15:06:37 +0000
References: <5654335A.5050702@manchester.ac.uk>
	<22100.38142.696227.209012@quad.stoffel.home>
	<5656DEFB.7020602@manchester.ac.uk>
	<22104.26567.940712.83748@quad.stoffel.home>
From: Tony Arnold <tony.arnold@manchester.ac.uk>
Message-ID: <5658717C.5060200@manchester.ac.uk>
Date: Fri, 27 Nov 2015 15:06:36 +0000
MIME-Version: 1.0
In-Reply-To: <22104.26567.940712.83748@quad.stoffel.home>
Content-Transfer-Encoding: 7bit
Subject: Re: [linux-lvm] Problems creating/converting large logical volume
 to RAID1
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

John,

On 27/11/15 14:25, John Stoffel wrote:

> 
> I suspect it could have been made to work, but in my experience,
> there's a very active MD developer (Neil, who would love more help!)
> who does a great job of the pure RAID features that MD provides.
> 
> The DM guys are more based on logical block management in my
> experience, and so don't do nearly as much in the RAID side of
> things.
> 
> But in any case, the above setup works really well, and gives you a
> good seperation of the layers and is easy to manage and control.
> 
> I'm planning on migrating all my setup to a lvm-cache setup, with a
> pair of 4TB disk mirrored (and possibly a third mirror of two striped
> 2Tb drives... belt and suspenders!) with a pair of MX200 SSDS, 500Gb
> for boot and cache duties.  Should be a nice fast setup, and take less
> power as well.

That sounds interesting and also fun!

My next step is to get the rest of the partitions on my two disks (/boot
etc) mirrored so if I lose one of the disks the system will still boot
up and run. I've seen some guidance on how to do this.

Regards,
Tony.
-- 
Tony Arnold, IT Security Analyst, University of Manchester.
T: +44 (0) 161 275 6093, F: +44 (0) 705 344 3082,
M: +44 (0) 773 330 0039, E: tony.arnold@manchester.ac.uk
