Return-Path: <adilger@turbolinux.com>
From: Andreas Dilger <adilger@turbolinux.com>
Message-Id: <200104180057.f3I0vbo5015874@webber.adilger.int>
Subject: Re: [linux-lvm] Seems LVM not properly installed - help!
In-Reply-To: <200104180021.f3I0L0f15604@west.navpoint.com> "from Rupert Heesom
 at Apr 17, 2001 07:13:15 pm"
Date: Tue, 17 Apr 2001 18:57:37 -0600 (MDT)
MIME-Version: 1.0
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

Rupert writes:
> The iop10 libraries are under /lib/lvm-iop10.  (what IS "IOP10"
> anyway??)

IOP = Input/Output Protocol

This is the version of LVM user tools and kernel that your system has,
and the user tools IOP must match the kernel IOP.

> However when I try to run any of the /sbin progs, the same msg keeps
> appearing -

You can get the kernel IOP from "cat /proc/lvm/global".
You should check that /dev/lvm exists, and is character device 109,0.

>     vgcreate
>     lvmiopversion -- LVM driver/module not loaded?

This means that the lvmiopversion program can't get the kernel IOP
via ioctl from /dev/lvm.  This is very unusual, because even if /dev/lvm
is deleted or is totally bogus, it should be re-created for us.

>     vgcreate: /lib/lvm-iop not found.  Is lvm-iop installed?

This is a result of lvmiopversion failing.  The script _should_ report

vgcreate: /sbin/lvmiopversion not found or can't determine IOP version

in this case.  I don't know what else it could be.

> VGCREATE seems to be looking in the wrong place - "/lib/lvm-iop" instead
> of "/lib/lvm-iop10".

No, just a result of the wrapper script getting an empty string for IOP,
yet strangely not empty enough to generate the above error.

> Have I installed LVM correctly here, does anyone know?   If so, where
> can I look for a solution?

Try running both:

echo "'`lvmiopversion`'"
strace lvmiopversion

and sending the output here (you only need send the last 20 lines of strace).

Cheers, Andreas
-- 
Andreas Dilger  \ "If a man ate a pound of pasta and a pound of antipasto,
                 \  would they cancel out, leaving him still hungry?"
http://www-mddsp.enel.ucalgary.ca/People/adilger/               -- Dogbert
