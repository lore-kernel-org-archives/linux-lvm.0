Message-ID: <3CF6653D.6DD2E0E@online.fr>
From: Thierry DE CARVALHO <thierry.decarvalho@online.fr>
MIME-Version: 1.0
Subject: Re: [linux-lvm] LVM 1.03 root file system on Redhat 7.3
References: <3CF4C4D4.13851.A9276BF@localhost>
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
Date: Thu May 30 12:50:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@sistina.com

"James B. Byrne" wrote:
> 
> We are using the grub bootloader.  We have followed the
> instructions contained in the the lvm howto document provided by
> sistina, to the best of my ability to understand them.
> 
> The problem is that system gives a kernel panic when started using
> the lvm boot option.  Is there a way to redirect the boot dialogue
> output to a file?  It appears that the most informative messages may
> be scrolling of the top of the screen.  What I am seeing is this:
> 
> kmod: failed to exec /sbin/modeprobe -s -k block-major-7 errno = 2
> 
> repeated 16 times, followed by
> 
> vgvchange -- volume group "vg00" successfully activated
> 
> VFS: Cannot open root device "vg00"/lv01: or 00:00
> Please append correct "root=" boot option
> Kernel panic: VFS: Unable to mount root fs on 00:00

The problem is that at this time the kernel don't known anything about
your LVs and their major/minor ! (the root FS is not mounted).
It uses an internal table for translating /dev/hda* and others to 
major/minor(see init/main.c).

Try with grub (here /dev/vg00/lvol1 is the root fs):

title=GNU/Linux Debian 2.2 (potato)
kernel (hd0,1)/vmlinuz-2.2.19 root=3a00 ramdisk_size=8192 vga=10
#                                   ^^^^ <major><minor> of the lv device in hex
initrd (hd0,1)/initrd-lvm-2.2.19.gz
