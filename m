Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8Q15PSB004008
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 21:05:25 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8Q15P0c025835
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 21:05:25 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l8Q15Jou014697
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 21:05:19 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l8Q15JDF006033
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 21:05:19 -0400
Date: Tue, 25 Sep 2007 21:05:19 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM2 striping or md raid0
In-Reply-To: <46F97D06.60306@stercomm.com>
Message-ID: <Pine.LNX.4.44.0709252059290.5975-100000@bmsred.bmsi.com>
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

On Tue, 25 Sep 2007, Chris Cox wrote:

> This is merely my own opinion, but md was designed to be
> THE software raid mechanism.  So, my preference would be
> to establish a RAID md device and make that into a PV.

This is FOSS, and choice is king.  There is no "THE" desktop, you
can choose from KDE, Gnome, or a host of desktop-like window managers.
It is entirely in character to have 2 different RAID mechanisms.

That said, LVM raid will likely always be restricted to RAID0 and RAID1,
because these are simple and efficient to implement as part of what
LVM does anyway.  For RAID5, etc, your only choice in linux will be
hardware or the md driver.

> Of course, I don't believe in non-RAID (i.e. RAID0) anyhow.
> Maybe someone else will chime in on this one.

RAID0 on top of RAID1 or (RAID1 on RAID0) gives you mirroring plus high
bandwidth.  For RAID5, I'd go with hardware.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
