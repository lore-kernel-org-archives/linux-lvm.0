Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l4D1YNC2032741
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:34:23 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l4D1YLjU010613
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:34:21 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l4D1YG4G015400
	(version=TLSv1/SSLv3 cipher=EDH-RSA-DES-CBC3-SHA bits=168 verify=NO)
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:34:16 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l4D1YGva027176
	for <linux-lvm@redhat.com>; Sat, 12 May 2007 21:34:16 -0400
Date: Sat, 12 May 2007 21:34:16 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM on SATA/PATA disks
In-Reply-To: <1179019386.15162.53.camel@pc.ilinx>
Message-ID: <Pine.LNX.4.44.0705122130070.27083-100000@bmsred.bmsi.com>
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

On Sat, 12 May 2007, Brian J. Murrell wrote:

> On Sat, 2007-05-12 at 21:12 -0400, Stuart D. Gathman wrote:
> > 
> > The interrupt rate has nothing to do with the type of disk, and a lot to
> > do with the controller.  There is a CPU difference between $50 
> > consumer IDE/SATA adapters, and $300 server grade IDE/SATA adapters.
> > You'll want the controller to support fast DMA at minimum.
> 
> I thought the biggest thing that SCSI had that IDE didn't was SCSI's
> ability to shovel an ass-barn-load of data to a disk and the disk would
> go deal with it, giving up the SCSI bus so that another disk could be
> shovelled another ass-barn-load of data to go and deal with, and so on.
> 
> ...
> 
> The contrast with IDE (or PATA as I guess the trendy name is), again as
> I always thought was that the IDE bus was not available for use while a
> disk was still pending a media I/O operation, so that with multiple
> devices, you could not leverage the I/O of the IDE bus using multiple
> devices, essentially in parallel.  I guess this is where having system
> with multiple IDE buses and only putting a single device per bus grew
> from.

We always put exactly one IDE disk per channel for that very reason.
You are correct that with 2 disks on the same channel, only one can
be active at a time.  So don't do that.  A $50 IDE PCI card give you 2 IDE
channels - for 2 disks in high performance mode (suitable for mirroring).
Buy two cards for 4 disks.  Or a $300 server card for 8 disks.

> How does SATA fit in with all of this?  Is it basically the same
> limitations on the bus as IDE/PATA, so that you'd really not want to put
> more than 1 device per bus?

SATA mandates at most 1 disk per channel, making the issue moot.  It is
still true that there is only one active disk on a bus.  But then there
is only one disk on a bus.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
