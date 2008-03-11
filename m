Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m2B7mZjG019841
	for <linux-lvm@redhat.com>; Tue, 11 Mar 2008 03:48:36 -0400
Received: from kenny.oneemedia.com (kenny.oneemedia.com [92.240.244.202])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id m2B7m3C8015721
	for <linux-lvm@redhat.com>; Tue, 11 Mar 2008 03:48:04 -0400
Received: from localhost (mail-o.oneemedia.com [92.240.244.203])
	(Authenticated sender: markionline)
	by kenny.oneemedia.com (Postfix) with ESMTP id 08CAC200097
	for <linux-lvm@redhat.com>; Tue, 11 Mar 2008 08:48:02 +0100 (CET)
Date: Tue, 11 Mar 2008 08:48:02 +0100
From: Marek Podmaka <marki@marki-online.net>
Message-ID: <732689741.20080311084802@marki-online.net>
Subject: Re: [linux-lvm] Can I create a PV that only uses a portion of a
	partition?
In-Reply-To: <Pine.LNX.4.44.0803101332080.29088-100000@bmsred.bmsi.com>
References: <47D54FC2.9050600@redhat.com>
	<Pine.LNX.4.44.0803101332080.29088-100000@bmsred.bmsi.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Reply-To: Marek Podmaka <marki@marki-online.net>,
	LVM general discussion and development <linux-lvm@redhat.com>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hello,

Monday, March 10, 2008, 18:45:15, Stuart D. Gathman wrote:

> o Use md raid1 mirroring with smaller (20-30G) pieces that need syncing.
>   Very important on systems where md driver can't remember its sync
>   status between reboots.

I didn't have md failure on recent kernels... now the reboot while
syncing is possible? On older kernels it just started from the
beginning.

But this approach has a performance penalty - from the md raid1 kernel
sources it seems that it does try to optimize reads (choose from which
of the mirrored drive to read block), but it does not work with multiple
md devices on the same disks (each md has its own information about
the current position of drive heads and doesn't know that the md is
also "using" the same drives).


-- 
  bYE, Marki
