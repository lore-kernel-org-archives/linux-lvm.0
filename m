Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5OCSq015004
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 08:28:52 -0400
Received: from mta07-svc.ntlworld.com (mta07-svc.ntlworld.com [62.253.162.47])
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i5OCSoe1013598
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 08:28:50 -0400
Received: from [192.168.1.13] ([80.4.1.184]) by mta07-svc.ntlworld.com
	(InterMail vM.4.01.03.37 201-229-121-137-20020806) with ESMTP
	id <20040624122900.ILGK5696.mta07-svc.ntlworld.com@[192.168.1.13]>
	for <linux-lvm@redhat.com>; Thu, 24 Jun 2004 13:29:00 +0100
Message-ID: <40DAC904.5050801@ntlworld.com>
Date: Thu, 24 Jun 2004 13:28:52 +0100
From: Rupert Hair <rupert.hair@ntlworld.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Disk problems half way through a pvmove! HELP!
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Pvmove was doing its work, happily moving data from one of my old disks 
(hdh a 160GB Maxtor) but when it got to 46.5% all disk access stopped. 
I had a look at the console and sure enough there were hundreds of "hdh: 
lost interrupt" errors.  Some googleing has turned up the following 
explanation:

"Looking at the kernel source revealed only that this message appears 
when the kernel gets bored waiting for an interrupt from IDE controller 
(which takes some time, hence the long delays)."

Could anyone tell me if this is correct and any ideas what might cause 
this?  I'm running:
	Kernel: 2.6.5-mm1 (for the DM mirror target support)
	LVM version:     2.00.08 (2003-11-14)
	Library version: 1.00.17-ioctl (2004-04-19)
	Driver version:  4.1.0
with a LVM2 VG (vgconverted from LVM1) spread across various Maxtor IDE 
disks.  I tried a pvscan -v to post here but it hung just after "Walking 
through all physical volumes".

Does anyone have any advice on what to do in this situation?  My box is 
still up but I guess pvmove isn't going to finish on its own (but you 
can hopefully give me more details on this) so what would happen if I 
had to kill it?  Would I be left with a dead VG or just some data on 
either disk?

Finally: As pvmove doesn't seem to have any options for moving a 
specific portion of the data from a drive how can I recover from this if 
I am left with some data on this potentially bad drive?

Thanks in advance for any info or advice,

Rupert
