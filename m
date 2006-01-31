Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k0VMapQ15395
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 17:36:51 -0500
Received: from hotmail.com (bay16-f14.bay16.hotmail.com [65.54.186.64])
	by mx2.redhat.com (8.12.11/8.12.11) with ESMTP id k0VNbsmT008811
	for <linux-lvm@redhat.com>; Tue, 31 Jan 2006 18:37:54 -0500
Message-ID: <BAY16-F147D80F708C3F2B5C76237AF080@phx.gbl>
From: "Alexey Shinkin" <alexshinkin@hotmail.com>
Date: Wed, 01 Feb 2006 04:36:16 +0600
Mime-Version: 1.0
Subject: [linux-lvm] questions on LVM2 and device mapper
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi , All !

A couple of questions on LVM2 and device mapper :

1. How corresponds logical devices in DM and  logical volumes in LVM2 ?
  are they the same things ?

2. In LVM1 some I/O statistics were available for a LV (using ioctl we could 
see reads/writes for
each allocated PE in LV structure) . Is there such thing in LVM2 ?  How can 
I get a  number of reads/writes for a LV ?

Thanks

Alexey Shinkin

_________________________________________________________________
Express yourself instantly with MSN Messenger! Download today it's FREE! 
http://messenger.msn.click-url.com/go/onm00200471ave/direct/01/
