Return-Path: <markv@wave.co.nz>
Date: Wed, 8 Aug 2001 14:38:01 +1200
From: Mark van Walraven <markv@wave.co.nz>
Subject: Re: [linux-lvm] Installing Linux on LVM
Message-ID: <20010808143801.C4638@mail.wave.co.nz>
References: <20010807105410.A31158@verb.syntaxsleuth.org> <000901c11f71$1b950100$f04b7818@lvcm.com>
Mime-Version: 1.0
In-Reply-To: <000901c11f71$1b950100$f04b7818@lvcm.com>; from Glenn Shannon on Tue, Aug 07, 2001 at 11:45:19AM -0700
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
Cc: Glenn Shannon <warl0k@lvcm.com>

On Tue, Aug 07, 2001 at 11:45:19AM -0700, Glenn Shannon wrote:
> is if there is any way to get Debian (or any linux really) to install
> straight into an LVM without the aforementioned steps above? Or would I need
> to create my own bootfloppy/installation system?

These are just my thoughts; I'm running a couple of root-on-LVM Debian
systems, but I got there by cloning exiting systems.  Here's how I would
attack a fresh install:

Replace the kernel on the rescue floppy (there are instructions on
the disk on how to do this) with a kernel that includes the LVM patch.
Start the install and partition the disk, switch to an alternate console
and create and activate any LVM volumes you want.  Since the LVM tools
(pvcreate, vgscan, etc.) aren't on the boot-floppies, you will need to
get them onto the system some other way - perhaps another floppy.

The boot-floppies initial ramdisk might be too small for the files vgscan
creates in /etc.  If so, create another ramdisk for /etc.

Switching back to the installer console, the LVM volumes may automagically
show up in the list of partitions.  Failing that, go back to the alternate
console, make filesystems on the LVM volumes and mount them under /target.

The rest of the install *might* then proceed normally ...

But, unless you genuinely enjoy - as I do - booting linux from a lilo
floppy with an initrd and linuxrc=/bin/sh to work past hiccups, it's
probably easier to install onto a borrowed disk and copy the entire
system onto your LVM volumes afterwards.

I don't think direct support for LVM will appear in the Debian installer
until LVM auto-detect makes it into the kernel.

Regards,

Mark.
