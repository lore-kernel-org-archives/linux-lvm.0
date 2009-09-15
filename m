Received: from mx1.redhat.com (ext-mx09.extmail.prod.ext.phx2.redhat.com
	[10.5.110.13])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8FM3q3L001794
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 18:03:52 -0400
Received: from mail168.messagelabs.com (mail168.messagelabs.com
	[216.82.253.195])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8FM3YmH026558
	for <linux-lvm@redhat.com>; Tue, 15 Sep 2009 18:03:34 -0400
From: "Larsen, Peter" <PLarsen@CIBER.com>
Date: Tue, 15 Sep 2009 16:03:26 -0600
Subject: RE: RE: [linux-lvm] vg availability during boot
Message-ID: <36341C0C45B7054AA3F17AB74ED869EB1257F85F@CDC-EXMBP3.ciber.cbr.inc>
References: <4AAFD056.2030100@tonarchiv.ch>
In-Reply-To: <4AAFD056.2030100@tonarchiv.ch>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

That's another good reason to rely on UUID instead of the /dev device name. If you see how MD does things, and LVM internally, you'll find all device references are by UUID. Why not use that more foolproof method? As long as the device is online, it doesn't matter what bus id it gets. 

--  
   Peter H. Larsen

-----Original Message-----
From: linux-lvm-bounces@redhat.com [mailto:linux-lvm-bounces@redhat.com] On Behalf Of Till Wimmer
Sent: Tuesday, September 15, 2009 1:35 PM
To: LVM general discussion and development
Subject: Re: RE: [linux-lvm] vg availability during boot

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


_______________________________________________
linux-lvm mailing list
linux-lvm@redhat.com
https://www.redhat.com/mailman/listinfo/linux-lvm
read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
