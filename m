Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n0EKwh6Y024228
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 15:58:43 -0500
Received: from mail-bw0-f20.google.com (mail-bw0-f20.google.com
	[209.85.218.20])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n0EKwTtw004237
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 15:58:29 -0500
Received: by bwz13 with SMTP id 13so2205251bwz.3
	for <linux-lvm@redhat.com>; Wed, 14 Jan 2009 12:58:28 -0800 (PST)
Message-ID: <b072968d0901141258n12aaea7nbccf0700bdda4512@mail.gmail.com>
Date: Wed, 14 Jan 2009 20:58:28 +0000
From: "David Robinson" <zxvdr.au@gmail.com>
Subject: Re: [linux-lvm] Allocation maps of a mirrored LV?
In-Reply-To: <20090113100902.GJ21131@lupe-christoph.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20090113100902.GJ21131@lupe-christoph.de>
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

On Tue, Jan 13, 2009 at 10:09 AM, Lupe Christoph <lupe@lupe-christoph.de> wrote:
> Hi!
>
> I'm about to integrate support for LVM mirrors into the configuration
> management system I'm maintaining for a client. This system has a "scan"
> function that retrieves the current configuration and compares it
> against a database.
>
> My problem is that I'm unable to get the allocation info for the parts
> of a mirrored volume under SLES 10 (lvm2 RPM is at 2.02.17, even
> OpenSuSE 10.3 has only lvm2 2.02.25).
>
> lvdisplay --maps only gives me:

Try pvs/vgs/lvs instead (and use -o to get the details you want):

# pvs --segments
  PV         VG     Fmt  Attr PSize  PFree  Start SSize
  /dev/dm-0  laptop lvm2 a-   55.69G 32.00M     0   250
  /dev/dm-0  laptop lvm2 a-   55.69G 32.00M   250  1499
  /dev/dm-0  laptop lvm2 a-   55.69G 32.00M  1749    32
  /dev/dm-0  laptop lvm2 a-   55.69G 32.00M  1781     1

--Dave
