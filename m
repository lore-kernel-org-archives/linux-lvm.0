From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200010121644.MAA03016@lynx.turbolabs.com>
Subject: Re: [linux-lvm] Very tricky new install of Linux (using LVM and Kernel 2.4)
Date: Thu, 12 Oct 2000 12:44:57 -0400 (EDT)
In-Reply-To: <20001012160136.E413@destiny.ist.flinders.edu.au> from "Mark Phillips" at Oct 12, 2000 04:01:36 PM
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Mark Phillips <mark@ist.flinders.edu.au>
Cc: linux-lvm@msede.com

Mark Phillips, you write:
> I want to install it on logical partitions using LVM.  This introduces
> a number of problems.  Firstly I need kernel 2.4 to use LVM.  I've
> compiled my own 2.4-test9 kernel and it runs fine on my old disk
> (using debian).  But the debian installation disk uses an older
> kernel, nor will it probably know how to cope with LVM.

I have made a kernel patch for 0.8 final on 2.2.  You will also need the
rawio kernel patch (or a vendor kernel which already includes this patch).

You can get the 2.2 LVM patch (along with bug-fixed 0.8 final user tools) at:

ftp://ftp.stelias.com/pub/adilger

Cheers, Andreas
