Return-Path: <oleg@bitband.com>
Message-ID: <3AD14610.626EAAC2@bitband.com>
Date: Mon, 09 Apr 2001 08:18:08 +0300
From: Oleg Volkov <oleg@bitband.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] "I have no root and I want to scream"
References: <F31rRjbDt3HvoFOAmEa00002377@hotmail.com>
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

cjs 2895 wrote:

> Howdy folks,
>
> I'm one step closer to having a working LVM system then I was
> yesterday. I've managed to create my volume group and all the
> logical volumes that I want too, and I've got the operating
> system installed on them -- once I mounted them to the
> appropriate places the Debian boot/setup program worked as
> expected with a non-LVM setup. And I've got LILO setup per
> the LVM-on-root howto. One difference, when I try to specify
> /dev/vg00/lv03 as a boot device, I get an error from lilo
> saying that "/dev/vg00/lv03 isn't a number", so I specified
> it as 5803 like you do with rdev.
>
> When I boot the ramdisk gets loaded, and both vgscan and
> vgchange seem to work as expected, but when it comes time
> to "fall through" to the real root device, I get one of the
> following errors:
>
> If I specified root as "5803" at the lilo command prompt,
> which I intend to use the thrid LV as my root volume, then
> when it falls through it says that it can't mount device
> 58:03. It should be able to, there is a valid ext2 filesystem
> on it, and ext2 is compiled into the kernel -- not a module.
>
> If I specified root as "/dev/vg00/lv03" at the lilo command
> prompt, then when it falls through I get the message
> "Kernel Panic: I have no root and I want to scream"

Try to change lvm_initrd's linuxrc to include /bin/bash at last
line and look for more reasons. ( Until you mount your "/"
you have no "ls" :-( but "echo *" may be helpfull )

--
Volkov Oleg
BitBand Technologies Ltd.
http://www.bitband.com
