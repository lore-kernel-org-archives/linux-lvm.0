From: "Martin Mosny, PosTel a.s." <mmosny@postel.sk>
Message-ID: <135106662292.20020809152009@postel.sk>
Subject: Re[2]: [linux-lvm] kernel panic - converting root fs to lvm
In-Reply-To: <OE183IR6t6c6oghBePr00001338@hotmail.com>
References: <OE50LHN0t0oY6k8zpHy0000da29@hotmail.com>
 <20020808172939.GA18645@colombina.comedia.it>
 <OE30LU028EGcAJ4e7jX0000ec6f@hotmail.com>
 <20020809061302.GA22782@colombina.comedia.it>
 <OE183IR6t6c6oghBePr00001338@hotmail.com>
MIME-Version: 1.0
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
Date: Fri Aug  9 08:19:01 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
To: Jorge Melhado <linux-lvm@sistina.com>

Hello Jorge,

check this out!

/etc/fstab:
something like this if you have ext3 or change to ext2.

/dev/lvm_disk/root      /                       ext3    defaults        1 1
/dev/hda1               /boot                   ext2    defaults        1 2

check  that  the  lvm  partition have devices in /dev/ == /dev/lvm_disk/root (like
your).


check the /etc/lilo.conf:

image=/boot/vmlinuz-2.4.18
        label=lvm-18
        read-only
        root=/dev/lvm_disk/root
        initrd=/boot/initrd-lvm-2.4.18.img.gz

check  that  linuxrc  in  the ramdisk initrd-lvm-xxxxx.img.gz contains
something like this:

echo "Loading jbd module"
insmod /lib/jbd.o
echo "Loading ext3 module"
insmod /lib/ext3.o
echo "Loading lvm-mod module"
insmod /lib/lvm-mod.o
echo "Mounting /proc filesystem"
mount -t proc /proc /proc
echo "Running vgscan"
vgscan
echo "Running vgchange -a y"
vgchange -a y
echo Creating root device
mkrootdev /dev/root
echo 0x0100 > /proc/sys/kernel/real-root-dev
echo Mounting root filesystem
mount --ro -t ext3 /dev/root /sysroot
umount /proc
pivot_root /sysroot /sysroot/initrd

You  need  to  have  equivalent  modules in the /lib of the initrd-lvm
disk.

and  dont  forget  check  dir  /initrd  in the /dev/lvm_disk/root root
partition!

have more fun! ;)

Best regards

Martin
