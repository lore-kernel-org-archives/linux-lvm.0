Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l8Q1Fvb9007209
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 21:15:57 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id l8Q1Fu3K030955
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 21:15:56 -0400
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id l8Q1Fpb8014982
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 21:15:51 -0400
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.5) with ESMTP id l8Q1FpYL006060
	for <linux-lvm@redhat.com>; Tue, 25 Sep 2007 21:15:51 -0400
Date: Tue, 25 Sep 2007 21:15:51 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] LVM2 striping or md raid0
In-Reply-To: <46F97D06.60306@stercomm.com>
Message-ID: <Pine.LNX.4.44.0709252106030.5975-100000@bmsred.bmsi.com>
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

I prefer RAID1 integrated with LVM - it can handle mixed disk sizes 
with ease.  On a particular system with AIX LVM (where it has been integrated
for some time), We started with 3 512M disks, then added a 1G, then 2 4Gs, then
an 18G.  The filesystems were RAID1 at all times, and were expanded and PEs
moved between devices all with the filesystems mounted and active.
Linux LVM can do all this now, it is just a little kludgier at present.

With md, you have to arrange matching partition sizes by hand.  It *is*
possible, however, to move live/active md partitions between devices 
manually if you are careful (allocate partition on new device and add
as mirror, sync, set faulty and remove old partition).

Changing the partition table requires a reboot (or deactivating/unmounting all
partitions on the drive), so that limits what you can do live with md - unless
you have the foresight to divide your disks into roughly equal sized
partitions.  But that, of course, is what LVM does for you automatically.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
