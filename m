Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4D1CMhm029426
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:12:22 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4D1CKgN001491
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:12:20 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l4D1CFmo014969
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:12:15 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l4D1CFPT027127
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:12:15 -0400
Date: Sat, 12 May 2007 21:12:15 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM on SATA/PATA disks
In-Reply-To: <001e01c794de$7a54b210$6600a8c0@idefix>
Message-ID: <Pine.LNX.4.44.0705122102150.27083-100000@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Sat, 12 May 2007, Bertrand Renuart wrote:

> I always have been told (S/P)ATA disks should somehow be avoided in server
> systems. This mainly because the high rate of interrupt requests generated
> by the IO subsystem will constantly interrupt the CPU which then becomes
> unavailable for other server tasks. SCSI disks should be preferred mainly
> for that reason.
> 
> Can someone confirm this statement?

The interrupt rate has nothing to do with the type of disk, and a lot to
do with the controller.  There is a CPU difference between $50 
consumer IDE/SATA adapters, and $300 server grade IDE/SATA adapters.
You'll want the controller to support fast DMA at minimum.

> FYI, we have to upgrade one of our development machine - hence the question.
> This machine is mainly used to run unattended software builds -> moves large
> quantity of small files and requires lots of CPU.

However, even the $50 adapters are way faster than what you could get
10 years ago.  I would start with a higher end $50+ adapter (you want
it reliable).  If you get a lot of "system" CPU time during heavy disk
IO, then the $300 adapter will relieve that.  For example, a super cheap
ATA adapter was giving us 25% system CPU on backups on a 1.8Ghz Celeron.
Replacing that with a more expensive (but < $100) IDE adapter reduced 
system time to 1% or so.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
