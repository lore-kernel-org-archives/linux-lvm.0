Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2BGTlFv001968
	for <linux-lvm@redhat.com>; Tue, 11 Mar 2008 12:29:47 -0400
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2BGTEav001664
	for <linux-lvm@redhat.com>; Tue, 11 Mar 2008 12:29:14 -0400
Date: Tue, 11 Mar 2008 12:29:05 -0400 (EDT)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Can I create a PV that only uses a portion of a
	partition?
In-Reply-To: <732689741.20080311084802@marki-online.net>
Message-ID: <Pine.LNX.4.44.0803111227100.3399-100000@bmsred.bmsi.com>
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
To: Marek Podmaka <marki@marki-online.net>, LVM general discussion and development <linux-lvm@redhat.com>

On Tue, 11 Mar 2008, Marek Podmaka wrote:

> I didn't have md failure on recent kernels... now the reboot while
> syncing is possible? On older kernels it just started from the
> beginning.

Yes, recent kernels keep a sync status in the raid superblock.

> But this approach has a performance penalty - from the md raid1 kernel
> sources it seems that it does try to optimize reads (choose from which
> of the mirrored drive to read block), but it does not work with multiple
> md devices on the same disks (each md has its own information about
> the current position of drive heads and doesn't know that the md is
> also "using" the same drives).

Mirroring of any description is fairly pointless unless the mirrors
are on separate devices.  Not only for performance, but because the
main point is to protect you from single disk device failure.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
