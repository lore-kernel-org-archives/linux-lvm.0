Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104040744.f347inj02400@webber.adilger.int>
Subject: Re: [linux-lvm] problem with vgcreate ...
In-Reply-To: <3ACAD385.9FE9BF6C@gazeta.pl> from Artur Wiak at "Apr 4, 2001 09:55:49
 am"
Date: Wed, 4 Apr 2001 01:44:48 -0600 (MDT)
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

Artur, you write:
> I have problem with LVM beta6.
> but when i started module and i want create lvm group
> (vgcreate lvmgrp /dev/sd?? /dev/sd??) I obtain:
> lvm -- lvm_chr_ioctl: unknown command 4004fe0a
> vgcreate -- ERROR "Invalid argument" creating VGDA for volume group
> "lvmgrp" in kernel.

The problem is that the kernel is running LVM beta2, and the user tools are
beta6.  I posted a patch to this list for vg_create_remove() which will fix
the problem.  You will still get the ioctl message, but vgcreate will work.
Let's hope it makes it into CVS soon.

The other option is to update your kernel code to beta6 with a patch.  See
PATCHES/* for more info.

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
