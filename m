Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4CLgsSq006210
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 17:42:54 -0400
Received: from mailgate103.isp.belgacom.be (mailgate103.isp.belgacom.be
	[195.238.6.84])
	by mx2.redhat.com (8.13.1/8.13.1) with ESMTP id l4CLgqfm013722
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 17:42:52 -0400
From: "Bertrand Renuart" <bertrand.renuart@modulo1.be>
Date: Sat, 12 May 2007 23:42:45 +0200
Message-ID: <001e01c794de$7a54b210$6600a8c0@idefix>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] LVM on SATA/PATA disks
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Dear all,

I always have been told (S/P)ATA disks should somehow be avoided in server
systems. This mainly because the high rate of interrupt requests generated
by the IO subsystem will constantly interrupt the CPU which then becomes
unavailable for other server tasks. SCSI disks should be preferred mainly
for that reason.

Can someone confirm this statement?

FYI, we have to upgrade one of our development machine - hence the question.
This machine is mainly used to run unattended software builds -> moves large
quantity of small files and requires lots of CPU.

(sorry if my question is "stupid" or has already been asked many times - but
couldn't find any hint anywere)

Thanks
