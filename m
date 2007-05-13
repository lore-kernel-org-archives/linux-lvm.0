Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4DHOOiJ022367
	for <linux-lvm@redhat.com>; Sun, 13 May 2007 13:24:24 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4DHOMWN019677
	for <linux-lvm@redhat.com>; Sun, 13 May 2007 13:24:23 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l4DHOFCk010903
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Sun, 13 May 2007 13:24:17 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l4DHOF5m007269
	for <linux-lvm@redhat.com>; Sun, 13 May 2007 13:24:15 -0400
Date: Sun, 13 May 2007 13:24:15 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM on SATA/PATA disks
In-Reply-To: <464740CD.1080807@gmail.com>
Message-ID: <Pine.LNX.4.44.0705131307080.6567-100000@bmsred.bmsi.com>
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

On Sun, 13 May 2007, Les Mikesell wrote:

> > Of course, any of the re-ordering (SCSI TCQ, or SATA NCQ) requires
> > filesystem and driver support of write barriers for reliability.
> > Write barriers are not implement in DM, hence LVM, so there is a
> > reliability risk in going with this kind of solution.  Depending on
> > the filesystem this can result in power failures resulting in files
> > having inconsistent data.
> 
> Are you saying that LVM on SCSI is not safe in this scenario?

If out of order writes are enabled, then your server should hold power
to the disk drives for part of a second after disabling further writes
in software.  LVM is a low risk because LVM changes are comparatively
rare, and the modification window is small.  But, theoretically, if
you lost power right at the instant you pressed return on lvcreate,
lvextend, or lvremove, on a system with busy disk io, you could corrupt
the LVM metadata.

Having a UPS and doing a shutdown solves the problem.  However, if your
server enables out of order writes with native queuing, and loses power
without a shutdown, and doesn't keep drives powered long enough after 
stopping the CPUs (this is why high end servers now have a microprocessor
dedicated to power sequencing), then you should not rely on filesystem
journalling, and should do an fsck at reboot.  FS journals rely on physical
writes taking place in-order, or at least having 'sync' calls to finish
previous logical writes before starting a new one (write barrier).
There is a similar issue with creating a database on top of a file.
For example, you have to use 'fsync' after writing a checkpoint, before
beginning updates.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
