Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i31G8Rj12579
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 11:08:27 -0500
Received: from gw-nl3.philips.com (gw-nl3.philips.com [161.85.127.49])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i31G8Njj028396
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 11:08:24 -0500
Received: from smtpscan-nl2.philips.com (smtpscan-nl2.philips.com
	[130.139.36.22])
	by gw-nl3.philips.com (Postfix) with ESMTP id 3F0842C57D
	for <linux-lvm@redhat.com>; Thu,  1 Apr 2004 18:08:23 +0200 (MEST)
Received: from smtpscan-nl2.philips.com (localhost [127.0.0.1])
	by localhost.philips.com (Postfix) with ESMTP id 682A319C4C
	for <linux-lvm@redhat.com>; Thu,  1 Apr 2004 18:08:22 +0200 (MEST)
Received: from smtprelay-nl2.philips.com (smtprelay-eur2.philips.com
	[130.139.36.35])
	by smtpscan-nl2.philips.com (Postfix) with ESMTP id A3CF819C47
	for <linux-lvm@redhat.com>; Thu,  1 Apr 2004 18:08:21 +0200 (MEST)
Received: from ehvrmh02.diamond.philips.com (ehvrmh02-srv.diamond.philips.com
	[130.139.27.125]) 
	by smtprelay-nl2.philips.com (8.9.3p3/8.8.5-1.2.2m-19990317) with ESMTP
	id SAA18419
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 18:08:21 +0200 (MEST)
From: darren.miller@philips.com
Message-ID: <OF3EC95ADA.145C111F-ON80256E69.005828B5-80256E69.0058A6B3@philips.com>
Date: Thu, 1 Apr 2004 17:06:24 +0100
MIME-Version: 1.0
Subject: [linux-lvm] snapshots and 2.6.5.rc1 + udm1
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
To: LVM general discussion and development <linux-lvm@redhat.com>





Creating a snapshot now works and doesn't error.  nice.
Removing the snapshot now hangs the entire system, using lvremove
/dev/<VG>/<LV>

Also error appears when lilo is run after snapshot is created:

Warning: '/proc/partitions' does not match '/dev' directory structure.
    Name change: '/dev/dm-0' -> '/dev/mapper/vault-snapTue-cow'

/proc/partitions isn't writeable therefore cannot be fixed.



==============================================================================

Darren Miller
Senior Systems Support Engineer
Microsoft Certified Professional
SCO Advanced Certified Engineer
Infomation Systems Department (Core Server Support)
Philips Semiconductors,Milbrook Industrial Estate,Southampton,SO15
0DJ,England
Direct Dial In: +44 (0) 2380 312681
