From: 'Luca Berra ' <bluca@comedia.it>
Subject: Re: [linux-lvm] Problems with initrd for LVM2 on 2.6.0-test8 and -test9 kernels.. .
Message-ID: <20031031081603.GA26757@percy.comedia.it>
References: <253458D17524064C996F67C97116BF8806592C@Oscar-5.north.mcld.net>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <253458D17524064C996F67C97116BF8806592C@Oscar-5.north.mcld.net>
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
Date: Fri Oct 31 02:17:03 2003
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: "Weber, Geoffrey M." <Geoffrey.Weber@mcleodusa.com>
Cc: linux-lvm@sistina.com

On Thu, Oct 30, 2003 at 09:46:52AM -0600, Weber, Geoffrey M. wrote:
>My apologies for not providing the information earlier... and for my mistake
>in supplying the link to my initrd image.  I have been bookmarking sites
>like mad and apparently chose the wrong one...
if you even quit posting in multipart/alternative i'll be an happy man
:))))

>Here is my linuxrc inside the initrd image (this is the one based off of the
>evms initrd I found on the web, since it seemed the most complete).
>
>Please note that I still can't get the "/bin/ash" command to work properly,
>though I'm working on it.  I did put in the /dev/tty* and /dev/pt* nodes
>into the initrd image, but still no luck.  

here's the initrd i produce (shell is modified mdk/redhat nash)
note that i mount manually the root fs then i pivot_root.

-------------------------------------------------
... load modules ...
echo Mounting /proc filesystem
mount -t proc /proc /proc
echo Creating device files
mkdevices /dev
echo Activating md devices
mknod /dev/md1 b 9 1
mdassemble
echo Scanning logical volumes
vgscan
echo Activating logical volumes
vgchange -ay
echo 0x0100 > /proc/sys/kernel/real-root-dev
echo Mounting root filesystem
mount -o defaults --ro -t ext3 /dev/vg00/lvol1 /sysroot
pivot_root /sysroot /sysroot/initrd
echo Remounting devfs at correct place if necessary
handledevfs
umount /initrd/proc
-------------------------------------------------
mkdevices: creates device files based on /proc/partitions (if not devfs)
mdassemble: diet-libc version of mdadm --assemble (cannot build full
mdadm with diet-libc)
handledevfs: is described in the comment above

>Here is my menu.lst from grub.  I've been testing with grub just so that I
>could enter changes at boot time instead of running "lilo" all over the
>place.
you can append options to lilo command lines (just type 'em)

>-------- CUT --------
>
>gweber@windforce:/tmp/test$ more menu.lst
>default=1
>root    (hd0,3)
>splashimage (hd0,0)/grub/images/debian_cooleye-dither.xpm.gz
>vga=791
>title   Linux (2.6.0-lvm)
>kernel  (hd0,0)/vmlinuz-2.6.0-test9-aa0.2 root=fe00 console=ttys0
>initrd  (hd0,0)/initrd-gw.gz
                                                     ^^^^^^^^^^^^^
ttys0 ???
i tought serial console was ttyS0,<speed>

L.

-- 
Luca Berra -- bluca@comedia.it
        Communication Media & Services S.r.l.
 /"\
 \ /     ASCII RIBBON CAMPAIGN
  X        AGAINST HTML MAIL
 / \
