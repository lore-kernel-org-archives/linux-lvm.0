Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lAH2RaMD025081
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2007 21:27:36 -0500
Received: from mail.bmsi.com (www.bmsi.com [24.248.44.156])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lAH2RaEq024938
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2007 21:27:36 -0500
Received: from bmsred.bmsi.com (bmsred.bmsi.com [192.168.9.50])
	by mail.bmsi.com (8.13.6/8.13.6) with ESMTP id lAH2RUSC028226
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2007 21:27:30 -0500
Received: from localhost (localhost [127.0.0.1])
	by bmsred.bmsi.com (8.13.5/8.13.6) with ESMTP id lAH2RUTl020135
	for <linux-lvm@redhat.com>; Fri, 16 Nov 2007 21:27:30 -0500
Date: Fri, 16 Nov 2007 21:27:30 -0500 (EST)
From: "Stuart D. Gathman" <stuart@bmsi.com>
Subject: Re: [linux-lvm] Strange snapshots behavior in dev/<vg>/
In-Reply-To: <473E2DA8.6000502@4lin.net>
Message-ID: <Pine.LNX.4.44.0711162121480.20101-100000@bmsred.bmsi.com>
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

On Sat, 17 Nov 2007, Denny Schierz wrote:

> root@henrietta ~ # ls /media/backup/angelica-disk/dev/neko/
> hitomi-disk

Why would you do this?  device nodes in your backup still just point to
the device.  I suggest mounting your backup volumes with -o nodev,noexec both
to prevent possible security problems and to make it clear that the above
isn't useful.

> ----
> 
> So, first question, why i have the name from a different volume
> (hitomi-disk) in the dev from angelica?

Because hitomi-disk is the one that happens to be online at the moment.

> root@henrietta ~ # ls /media/backup/hitomi-disk/dev/neko
> ls: /media/backup/hitomi-disk/dev/neko: Input/output error

> Why i get here an error?

Because there isn't a disk online at the moment.

-- 
	      Stuart D. Gathman <stuart@bmsi.com>
    Business Management Systems Inc.  Phone: 703 591-0911 Fax: 703 591-6154
"Confutatis maledictis, flammis acribus addictis" - background song for
a Microsoft sponsored "Where do you want to go from here?" commercial.
