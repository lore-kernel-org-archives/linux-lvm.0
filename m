Return-Path: <harvell@nortelnetworks.com>
Message-ID: <3B0F1423.267CEE40@americasm01.nt.com>
Date: Fri, 25 May 2001 21:25:39 -0500
From: "Joe Harvell" <harvell@nortelnetworks.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] lvm on root filesystem with devfs
References: <NBBBKLKHMJHIJLHOGAOJGEOIIOAA.steve.wray@the.net.nz>
Content-Transfer-Encoding: 7bit
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
To: linux-lvm@sistina.com

Yes, the lvm module is on the initrd.
Yes, the module is being loaded.

As I said, This works just fine if I am not using devfs.

Steve Wray wrote:

> > From: linux-lvm-admin@sistina.com [mailto:linux-lvm-admin@sistina.com]On
> > Behalf Of Joe Harvell
> [snip]
> > When I run with devfs, though, the /dev entries don't ever show up in
> > /dev when I do a vgscan.  The result is that I am not able to mount the
> > lvm root filesystem.
> >
> >
> >    * Does the fact that I have lvm compiled as a module have anything to
> >      do with this?
>
> uh huh. Unless;
> 1. the lvm module is on the initrd
> and
> 2. the initrd loads this module
>
> the lvm module will be on a logical volume which can't be mounted
> because the kernel doesn't know how to...
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
