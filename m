Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j9ICNxV29527
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 08:23:59 -0400
Received: from redweb.harvee.org (dsl093-191-107.nyc2.dsl.speakeasy.net
	[66.93.191.107])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j9ICNuKf021131
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 08:23:56 -0400
Received: from localhost.localdomain (localhost [127.0.0.1])
	by redweb.harvee.org (Postfix) with ESMTP id E0EFD76D44
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 08:23:55 -0400 (EDT)
Received: from harvee.harvee.org (harvee-xeno.harvee.org [192.168.25.100])
	by redweb.harvee.org (Postfix) with ESMTP id 9049476D44
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 08:23:55 -0400 (EDT)
Received: from [192.168.0.30] (unknown [192.168.0.30])
	by harvee.harvee.org (Postfix) with ESMTP id 2B99F3C03B
	for <linux-lvm@redhat.com>; Tue, 18 Oct 2005 08:23:55 -0400 (EDT)
Message-ID: <4354E961.4040906@harvee.org>
Date: Tue, 18 Oct 2005 08:24:01 -0400
From: "Eric S. Johansson" <esj@harvee.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Incorrect metadata area header checksum
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

I could really use some advice here.  Is this something to worry about 
something I can fix?

  pvdisplay
   Incorrect metadata area header checksum
   Incorrect metadata area header checksum
   Incorrect metadata area header checksum
   Incorrect metadata area header checksum
   --- Physical volume ---
   PV Name               /dev/md0
   VG Name               raid_vg
   PV Size               232.88 GB / not usable 0
   Allocatable           yes
   PE Size (KByte)       4096
   Total PE              59618
   Free PE               1960
   Allocated PE          57658
   PV UUID               5o1utA-eN0O-yJqx-4N0Q-NrjT-EpRn-dxyAyT

   --- NEW Physical volume ---
   PV Name               /dev/sda1
   VG Name
   PV Size               232.88 GB
   Allocatable           NO
   PE Size (KByte)       0
   Total PE              0
   Free PE               0
   Allocated PE          0
   PV UUID               Q2UgM6-QG6D-Lrdi-KnAT-Uw7w-6j75-kAO0l3


   Incorrect metadata area header checksum
