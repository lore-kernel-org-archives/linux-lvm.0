Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i9F7unr30092
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 03:56:49 -0400
Received: from smtp.restena.lu (legolas.restena.lu [158.64.1.34])
	by mx1.redhat.com (8.12.11/8.12.10) with ESMTP id i9F7uldB001443
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 03:56:47 -0400
Received: from smtp.restena.lu (localhost [127.0.0.1])
	by smtp.restena.lu (8.12.11/8.12.11) with ESMTP id i9F7unRY007641
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 09:56:49 +0200
Received: from frodo.restena.lu (frodo.restena.lu [158.64.1.196])
	by smtp.restena.lu (8.13.1/8.13.1) with ESMTP id i9F7un9Y007632
	for <linux-lvm@redhat.com>; Fri, 15 Oct 2004 09:56:49 +0200
MIME-Version: 1.0
Message-ID: <OFAE4BBAD4.BB974E50-ONC1256F2E.002AAEE7-C1256F2E.002BA651@restena.lu>
From: gilles.massen@restena.lu
Date: Fri, 15 Oct 2004 09:56:45 +0200
Subject: [linux-lvm] access to hhardware copy: conflicting uuids
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
To: linux-lvm@redhat.com

Hello everyone,

I am stuck with a problem with hardware copies: I have an IBM Fastt 
Storage with the Flashcopy and  Volumecopy features, which allows me to 
copy a complete drive. However, when making such a copy of a PV (only one 
in my VG for the time beeing) I'm unable to access the PV on the same 
host. The reason: "Found duplicate PV". 
Is there a way to access such an hardware-copy LVMed drive on the same 
host where the original drive is already in use? If yes, how? And if I 
tried to access it on another host, could it conflict if on the second 
host exists a VG with the same name?

Any insights are greatly appreciated...

Best,
Gilles

--
RESTENA - DNS-LU
6, rue Coudenhove-Kalergi
L-1359 Luxembourg
tel: (+352) 424409
fax: (+352) 422473
