Date: Wed, 22 Dec 1999 20:11:28 +0100
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] booting w/o initrd
Message-ID: <19991222201127.C13180@colombina.comedia.it>
Reply-To: bluca@comedia.it
References: <3860D151.21FD732B@twc.de>
Mime-Version: 1.0
In-Reply-To: <3860D151.21FD732B@twc.de>
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@msede.com

there are some good ideas here, i will only point the problems.
On Wed, Dec 22, 1999 at 02:25:37PM +0100, Ulf Bartelt wrote:
<snip>

> And when bringing the system down, LVM can be stopped cleanly because the 
> root filesystem is only addressed via the partition alias.

add mirrored LV to the equation and you'll obtain a mess.

> But what if ...
> ---------------
> 
> ... you want to resize the root?
> 
> It is not much more complicated to do this compared to booting via initrd.
> Even when booting via initrd, you cannot resize the root while it is
> mounted. So this way is not responsible for the main problem in resizing 
> the root.
it is, you are adding one more constraint, that the root must
be contiguous. enjoy pvmoving things around (if you have 2 disks)
btw you can resize a mounted filesystem, and i hope this wil become
standard practice.

what's the problem with initrd, just look at it as a very big
__initfunc(), just easier to debug.

L.

-- 
Luca Berra -- bluca@comedia.it
    Communication Media & Services S.r.l.
