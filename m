Return-Path: <0b6894b7ccb2926f392e83004049819c@interlinx.bc.ca>
Date: Sun, 3 Jun 2001 03:22:25 -0700
Subject: Re: [linux-lvm] Migrating to an LVM system (boot/root) disk
Message-ID: <20010603032225.K21442@linux.interlinx.bc.ca>
References: <20010602191624.E21442@linux.interlinx.bc.ca> <NBBBKLKHMJHIJLHOGAOJCEALIPAA.steve.wray@the.net.nz>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <NBBBKLKHMJHIJLHOGAOJCEALIPAA.steve.wray@the.net.nz>; from steve.wray@the.net.nz on Sun, Jun 03, 2001 at 05:02:41PM +1200
From: "Brian J. Murrell" <lvm@interlinx.bc.ca>
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

On Sun, Jun 03, 2001 at 05:02:41PM +1200, Steve Wray wrote:
> 1. In the LFS howto, I saw a warning to the effect of: NEVER run lilo
> from a chrooted environment. You can destroy your MBR making
> your system bootable only from floppy... Dunno if it applied here.

If you do not tell it which disk to write the MBR to, yes, that would
be true.

> 2. Having a /boot on LVM *is* possible, BUT you will need to boot
> from floppy.

No you don't.  There are several in depth discussions in the archive
about doing this including a posting (several times in fact) of a
patch to Lilo to help it locate the kernel and initrd on an LVM /boot.
Please see the archives for details.

> 3. to get over your night horrors, make a boot disk

disks!  My initrd is 1.3MB alone!

> that includes the LVM
> tools. A good starting point is miniroot. I posted a URL to it on this
> list a little while ago. I don't have it to hand but it'll be in the
> archive!

Yeah, I realize that making boot diskettes is what I have to do, but
the "automated" mkbootdisk that some distros ship as well as the
various root/boot kits out there sure are not going to inclue the LMV
tools.  Having to manually craft the pair is a pain.  :-)

Perhaps just like LVM has a nice little script for creating the
initrd, they can ship with a nice little script for creating root/boot
diskettes.

Of course a lot of this headache goes away if the kernel had the
"auto-detection" code like it does for MDs.

b.

-- 
Brian J. Murrell
