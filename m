Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i62NIs008088
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 19:18:54 -0400
Received: from webmail.datafx.com.au (mail03.datafx.com.au [203.149.65.13]
	(may be forged))
	by mx1.redhat.com (8.12.10/8.12.10) with ESMTP id i62NIqe1004017
	for <linux-lvm@redhat.com>; Fri, 2 Jul 2004 19:18:53 -0400
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Sat, 3 Jul 2004 09:21:03 +1000
Message-ID: <7B5E506659A5D344A505F0F27972D87549CB0A@datafx-sbs.DataFX.local>
From: "Michael Bellears" <MBellears@staff.datafx.com.au>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Hardware Raid - LVM the way to go?
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


We have a new Compaq server, with a Raid Controller capable of handling
12 SCSI HD's - We currently only have 5 (In Raid 5)

We want to be able to "grow" the data partition as need dictates(i.e.
Add new HD's, grow the Raid 5 array, and data partition) - LVM looks the
way to go.

My *usual* partitioning scheme, is:

/dev/cciss/c0d0p1 /boot (100M)
/dev/cciss/c0d0p2 / (all of the disk not used by /boot and swap.)
/dev/cciss/c0d0p5 /swap (~1G)

I'm installing via Debian-Installer(Beta-4) - Which gives LVM
options...Would I create all my partitions as per my "normal" setup, but
mark them as LVM?

Hopefully someone out there has a similar setup and can provide some
suggestions/best pratices?

Regards,
MB
