Message-Id: <200401151804.i0FI4gZ32327@ecstasy.winternet.com>
From: Ken Fuchs <kfuchs@winternet.com>
In-reply-to: <20040114234655.GA20045@aquila.katkansky.org> (message from Brant
	Katkansky on Wed, 14 Jan 2004 15:46:55 -0800)
Subject: Re: [linux-lvm] No Subject
References: <6413350.1074097638140.JavaMail.Administrator@atp> <20040114234655.GA20045@aquila.katkansky.org>
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
Date: Thu Jan 15 17:05:28 2004
List-Id: <linux-lvm.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@sistina.com
Cc: trylinux@nc.rr.com

>On Wed, Jan 14, 2004 at 08:27:18AM -0800, trylinux wrote:

>> I recently used vgrename to rename the volume group (from rootvol to rootvg
>> -- just a test to learn some more), and it seemed to succeed. I was able to
>> run afterwards with no problems. On the first reboot after this, though, my
>> system can no longer boot. Here's a rough transcription of what's going on:

>> Activating logical volumes
>> vgchange -- volume group "rootvg" successfully activated
>> 
>> Mounting root filesystem
>> mount: error 2 mounting ext3
>> pivotroot: pivot_root(/sysroot,/sysroot/initrt) failed: 2
>> umount /initrd/proc failed: 2
>> Freeing unused kernel memory: 136k freed
>> Kernel panic: No init found. Try passing init= option to kernel.

Brant Katkansky <lists@katkansky.org> wrote:

>You need to rebuild the kernel initrd if you change your root device,
>as the linuxrc script in the initrd has the root device hard-coded.

lvmcreate_initrd(8) can be used to do this, but one might learn more by
using the following manual approach.

To better understand how LVM 1 is used in mounting the root device, one
can loop mount the initrd and at least look at the current linuxrc
script and change it as needed.  Assuming the kernel has built-in ext2
support (almost always; lvmcreate_initrd creates an ext2 initrd), here
are the steps to do this (only for anyone reading who isn't sure how):

# cd /boot
# mkdir /initrd-tmp
# cp -p initrd<remainder of filename> initrd-tmp
# file initrd-tmp

If the file is gzip compressed data do the following two steps
(filesystem is probably ext2), otherwise skip them:

    # mv initrd-tmp initrd-tmp.gz
    # gunzip initrd-tmp.gz

# mount -o loop initrd-tmp /initrd-tmp
# mount | grep initrd-tmp

If the filesystem is cramfs, the following addition steps are needed to
convert the cramfs initrd to an ext2 initrd (this step shouldn't be
required since lvmcreate_initrd creates ext2 and not cramfs):

    # dd if=/dev/zero of=initrd-ext2 bs=1024 count=4096
    # mke2fs initrd-ext2
    ...
    Proceed anyway? (y,n) y
    # mkdir /initrd-ext2
    # mount -o loop initrd-ext2 /initrd-ext2
    # (cd /initrd-tmp; tar cf - .) | (cd /initrd-ext2; tar xvf -)
    # rmdir /initrd-ext2/lost+found     <initrd doesn't need it.>
    # umount /initrd-tmp
    # umount /initrd-ext2
    # mv initrd-ext2 initrd-tmp         <replace cramfs with ext2.>
    # mount -o loop initrd-tmp /initrd-tmp

Edit the /initrd-tmp/linuxrc or other parts of the initrd such as copying
filesystem modules from / to /initrd-tmp (do insmod in linuxrc):

    # emacs /initrd-tmp/linuxrc
    # cp -p /lib/modules/<version>/kernel/fs/<potential new root fs>.o \
      /initrd-tmp/lib/modules/<version>/kernel/drivers/fs/

Red Hat may use a shorter directory structure for modules in its
initrds.

Duplicate the grub/lilo boot entry that uses the original /boot/initrd*
and replace the original initrd reference in the new boot entry with
/initrd-tmp (or /boot/initrd-tmp if there is no /boot filesystem and
thus no lvm / logical volume).  Boot via the new boot entry.

Sincerely,

Ken Fuchs <kfuchs@winternet.com>
