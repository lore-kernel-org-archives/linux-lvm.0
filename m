Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9C7fWr30628
	for <linux-lvm@redhat.com>; Tue, 12 Oct 2004 03:41:32 -0400
Received: from mta03-svc.ntlworld.com (mta03-svc.ntlworld.com [62.253.162.43])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9C7fU0A003134
	for <linux-lvm@redhat.com>; Tue, 12 Oct 2004 03:41:30 -0400
Received: from vrumpet.tarind.com ([81.99.126.240]) by mta03-svc.ntlworld.com
	(InterMail vM.4.01.03.37 201-229-121-137-20020806) with ESMTP
	id <20041012073931.YNCQ25095.mta03-svc.ntlworld.com@vrumpet.tarind.com>
	for <linux-lvm@redhat.com>; Tue, 12 Oct 2004 08:39:31 +0100
From: Toby Dickenson <toby@tarind.com>
Date: Tue, 12 Oct 2004 08:41:14 +0100
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200410120841.14323@trumpet.tarind.com>
Subject: [linux-lvm] PV corruption: allocated PE > total PE
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
To: linux-lvm@redhat.com

Ive just noticed that one of my PVs has more allocated PE's than the total 
available, leading to a negative amount of free space:

vrumpet root # pvdisplay -d /dev/hda5
  --- Physical volume ---
  PV Name               /dev/hda5
  VG Name               myvg
  PV Size               11.72 GB / not usable 33.65 MB
  Allocatable           yes
  PE Size (KByte)       32768
  Total PE              374
  Free PE               4294967278
  Allocated PE          392
  PV UUID               TXK2VM-UWdP-dMbY-yz4c-Nq3b-GM32-B56udb

This is on a gentoo linux system, kernel 2.6.6. The latest LVM userland in 
gentoo is 2.00.08, I havent tried anything more recent, but there doesnt seem 
anything relevant in the change log. These VGs were originally created using 
LVM1 on a 2.4 kernel.

Any suggestions?

Thanks in advance,
