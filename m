Return-Path: <patrick@tykepenguin.cix.co.uk>
Date: Wed, 4 Apr 2001 17:03:13 +0100
From: Patrick Caulfield <caulfield@sistina.com>
Subject: Re: [linux-lvm] problem with vgcreate ...
Message-ID: <20010404170313.F549@tykepenguin.com>
References: <3ACAD385.9FE9BF6C@gazeta.pl> <200104040744.f347inj02400@webber.adilger.int>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <200104040744.f347inj02400@webber.adilger.int>; from adilger@turbolinux.com on Wed, Apr 04, 2001 at 01:44:48AM -0600
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com

On Wed, Apr 04, 2001 at 01:44:48AM -0600, Andreas Dilger wrote:
> Artur, you write:
> > I have problem with LVM beta6.
> > but when i started module and i want create lvm group
> > (vgcreate lvmgrp /dev/sd?? /dev/sd??) I obtain:
> > lvm -- lvm_chr_ioctl: unknown command 4004fe0a
> > vgcreate -- ERROR "Invalid argument" creating VGDA for volume group
> > "lvmgrp" in kernel.
> 
> The problem is that the kernel is running LVM beta2, and the user tools are
> beta6.  I posted a patch to this list for vg_create_remove() which will fix
> the problem.  You will still get the ioctl message, but vgcreate will work.
> Let's hope it makes it into CVS soon.

I'll get onto it tomorrow.


patrick
