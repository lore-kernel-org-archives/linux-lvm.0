Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104061453.f36Er7D09191@webber.adilger.int>
Subject: Re: [linux-lvm] ERROR on LVM
In-Reply-To: <008001c0bec4$0ee0b9d0$0500a8c0@centerjuli0> from Uther at "Apr
 6, 2001 11:04:43 am"
Date: Fri, 6 Apr 2001 08:53:06 -0600 (MDT)
Sender: linux-lvm-admin@sistina.com
Errors-To: linux-lvm-admin@sistina.com
Reply-To: linux-lvm@sistina.com
List-Help: <mailto:linux-lvm-request@sistina.com?subject=help>
List-Post: <mailto:linux-lvm@sistina.com>
List-Subscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=subscribe>
List-Unsubscribe: <http://lists.sistina.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@sistina.com?subject=unsubscribe>
List-Archive: <http://lists.sistina.com/pipermail/linux-lvm/>
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

Uther writes:
> I am using LVM on linus 2.4.3-ac3
> I get the following err when trying  vgcreate test /dev/hda3
> vgcreate -- ERROR "Invalid Argument" creating VGDA for volume group
> "test" in kernel

You need to update the kernel code (see PATCHES/README).  Alternately,
if you check the LVM code out of CVS, it will also work around this
problem.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
