Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n1DLv9ZW002105
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 16:57:09 -0500
Received: from mail-fx0-f10.google.com (mail-fx0-f10.google.com
	[209.85.220.10])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n1DLurRW022710
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 16:56:53 -0500
Received: by fxm3 with SMTP id 3so2595507fxm.3
	for <linux-lvm@redhat.com>; Fri, 13 Feb 2009 13:56:50 -0800 (PST)
MIME-Version: 1.0
Sender: pdftex@gmail.com
In-Reply-To: <200902132034.PAA09181@out-of-band.media.mit.edu>
References: <499541F1.3080501@redhat.com>
	<200902132034.PAA09181@out-of-band.media.mit.edu>
Date: Fri, 13 Feb 2009 22:55:37 +0100
Message-ID: <68c491a60902131355g7d69e760va70625e499c3d576@mail.gmail.com>
Subject: Re: [linux-lvm] Re: About fstab and fsck
From: =?ISO-8859-1?Q?Martin_Schr=F6der?= <martin@oneiros.de>
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

2009/2/13  <f-lvm@media.mit.edu>:
> For that matter, subtle hardware issues might eat the data in your
> files, bit by bit, and you might never notice unless it was starting
> to eat your metadata and you wondered why fsck kept finding small
> errors.  It depends on whether you care whether your data might have
> a few bits of corruption scattered through it.

Which is why ZFS was invented, and we are hoping for btrfs. You need
checksums when you use pc-level rotating rust for storing data.

Best
   Martin
