Date: Fri, 8 Sep 2000 09:03:15 -0500
From: Michael J Kellen <idsfa@visi.com>
Subject: Re: [linux-lvm] LVM support for LILO
Message-ID: <20000908090315.A23300@isis.visi.com>
References: <20000908000253.A23165@srv.t-online.de> <200009072329.RAA21600@lynx.turbolabs.com>
Mime-Version: 1.0
In-Reply-To: <200009072329.RAA21600@lynx.turbolabs.com>; from Andreas Dilger on Thu, Sep 07, 2000 at 05:29:17PM -0600
Sender: owner-linux-lvm
Errors-To: owner-linux-lvm
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM List <linux-lvm@msede.com>

On Thu, Sep 07, 2000 at 05:29:17PM -0600,
in response to Heinz J. Mauelshagen's question:
>> Question: how do you want to ensure that all kernel image blocks really
>>           are BIOS addressable? They could for eg. live on a MD or could
>>           be out of the BIOS addressable range of blocks.

Andreas Dilger wrote:
> LILO already handles many of these issues, or at least warns about them.
> None of them are specific to LVM, so people are aware of them already
> (although LVM may hide a few of the details).  It would be documented
> that the /boot LV can reside only on 1 disk, and that it must reside on
> a BIOS addressible disk.  Most systems create /boot on the first disk
> when they are installed, and even with the number of kernels on my system
> it is only a few MB (1 or 2 PEs is enough).

I actually already have code for a check (in lilo.c) to insure that the
files are contiguous and on the first physical disk.  With the lv to pv
ioctl, that would be easy to extend to any bootable device.

In implementing this, we need to remember that not just the kernel needs
to be mapped.  The boot loader (boot.b -- side note: get LILO 21.1.5 if
you don't have it and give boot-menu.b a whirl) and any ramdisks need to
be known as well.

What I'd *really* like to see is kernel code for autostarting of LVM
similar to the autostart of md (side note: 2.4.0-test7 seems to break
that, though). One step at a time, though.

Lastly, remember that if you install LILO in the MBR, you don't need to
restructure the PV.

MIchael Kellen
