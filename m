Received: from mx1.redhat.com (ext-mx03.extmail.prod.ext.phx2.redhat.com
	[10.5.110.7])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n98JbjlC017913
	for <linux-lvm@redhat.com>; Thu, 8 Oct 2009 15:37:45 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n98JbZIJ006641
	for <linux-lvm@redhat.com>; Thu, 8 Oct 2009 15:37:35 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.14.3/8.14.3) with ESMTP id n98JbYMC026727
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <linux-lvm@redhat.com>; Thu, 8 Oct 2009 15:37:34 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
	by bmsred.bmsi.com (8.14.3/8.14.3) with ESMTP id n98JbY7s026527
	for <linux-lvm@redhat.com>; Thu, 8 Oct 2009 15:37:34 -0400
Date: Thu, 8 Oct 2009 15:37:34 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Corrupted LV after resize2fs crashed when adding
	new disk to LV
In-Reply-To: <99f624940910081142q8e3388br8fb2fdd61e0874fe@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.0910081523100.26436@bmsred.bmsi.com>
References: <99f624940910081142q8e3388br8fb2fdd61e0874fe@mail.gmail.com>
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

On Thu, 8 Oct 2009, Ken Bass wrote:

> The last command - resize2fs - crashed before completing.

Did you let resize2fs default to the device size?

> After that:
> 
> - vgdisplay showed a total 442G for VolGroup3W (the original size plus the
> new PV) - that's okay
> - lvs showed a total of 331G for LogVol3W (the original size, without the
> new PV)

Assuming the previous answer was yes (if 'no', then that is your problem),
looks like the LVM metadata got rolled back.  (Effectively undoing the
lvextend.)  When that happened is when resize2fs crashed.

> When I run e2fsck and answer 'n' to abort, I get 2648 Group checksum errors,
> and after answering 'y' to fix them, I get this:

Bad move, when things go south, you want to leave things unmodified until
you figure it out.

> So it seems to me, IMHO, that the LVM is looking at one set of data, while
> the other utilities (eg, mount, e2fsck) are looking at another. I am

No, the mount,e2fsck are looking at a filesystem on an LV that got reduced (mid
resize, apparently).  Did you do 'lvs' before starting the resize?

> assuming that the original LV data is still intact, just somewhere the file
> size/block count is wrong.(one place says the original size, the other sees
> the size with the new disk (attempted to be) added.
> 
> Is there ANY way possible to rectify this? PLEASE!!!

Look at your metadata backups, and see if you can find the version with
the larger LV.  Look at the timestamp on the revert to get a clue on
how it got reverted.

First, I would make a copy of what you got (it will fit on a cheap
external USB disk) before making any more mods.  Then restore the metadata
to the extended LV before retrying e2fsck.

Disclaimer, I am not an LVM expert.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
