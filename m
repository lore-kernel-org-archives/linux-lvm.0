From: Robert Cole <robert.cole@support4linux.com>
References: <b6hukg$863$1@main.gmane.org>
In-Reply-To: <b6hukg$863$1@main.gmane.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200304031226.13324.robert.cole@support4linux.com>
Subject: [linux-lvm] Re: [gentoo-desktop] Starting and Configuration of LVM after Kernel Mod.
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
Date: Thu Apr  3 14:26:02 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jon Robertson <jonrobertson@sbcglobal.net>, gentoo-desktop@gentoo.org
Cc: linux-lvm@sistina.com

I just installed this successfully. Did you emerge lvm-user? Did you mount 
/boot and then run lvmcreate_initrd to create a ram disk? Did you put ramdisk 
support with an initial size of 8192 in the kernel config?

And lastly make sure your kernel line of grub.conf has the initrd= line in it.

Check all these things because from what I learned in setting lvm up if any 
one of these things are missing lvm will fail to boot.

There are instructions on setting lvm up in gentoo on the gentoo.org website 
under user docs.

Robert

On Thursday 03 April 2003 10:34 am, Jon Robertson wrote:
> all....
>
> I rebuilt my kernel to support LVM......and made the changes to bzImage,
> etc. I've re-booted, and not sure how I get LVM to start, I'd like to use
> Webmin for the configuration... I did check to make sure there is a global
> file in /proc/lvm  and it says
>
> LVM driver LVM version 1.0.3 (19/02/2002)
> Total: 0 VGs    0PVs    0LVs    (0LVs open)
> Global: 143 bytes malloced    IOP version: 10    0:35:59 active
>
> I've checked some of the LVM posts and not able to find instructions for
> Gentoo.
>
> thanks
> jr
>
>
>
>
> --
> gentoo-desktop@gentoo.org mailing list
