Message-ID: <38A579D3.90A93436@moose.net>
Date: Sat, 12 Feb 2000 10:18:43 -0500
From: Brian Kress <kressb@moose.net>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mirroring
References: <Pine.LNX.4.20.0002111805300.18008-100000@vortex1.vrtx.net>
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: A James Lewis <james@fsck.co.uk>
Cc: Chris Anderson <chris@alwan.com>, h.milz@seneca.muc.de, "linux-lvm@msede.com" <linux-lvm@msede.com>

A James Lewis wrote:
> 
> What you're asking is can LVM be used in conjunction with MD, and is this
> the correct solution or is LVM/MD going to merge or LVM duplicate MD's
> work??

	Yes.  LVM on MD works great.  I have a 4 disk
RAID 5 that I run LVM on to chop up into more managable
chunks.  40GB for a single FS is a bit excessive.  I
do this with the new raid 0.90.  I've never tried
it with the kernel standard raid, but I think I've
seem success reports.
	Applying the LVM patch and the raid0.90 patch
gets you some errors in ll_rw_block.c, but if you know
C, you can pretty much figure out how to patch it by
hand.  If anyone wants to do this and needs help with
the patches, I'd be happy to help.
	LVM on top of MD is great.  I get redundancy
and managability.


Brian
