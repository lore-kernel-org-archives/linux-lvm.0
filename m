From: "Jorge Melhado" <jrgmelhado@hotmail.com>
References: <OE50LHN0t0oY6k8zpHy0000da29@hotmail.com> <20020808172939.GA18645@colombina.comedia.it> <OE30LU028EGcAJ4e7jX0000ec6f@hotmail.com> <20020809061302.GA22782@colombina.comedia.it> <OE183IR6t6c6oghBePr00001338@hotmail.com> <20020809150118.GD25223@colombina.comedia.it>
Subject: Re: [linux-lvm] kernel panic - converting root fs to lvm
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <OE18lx6EIfu4FbATcFZ0000167a@hotmail.com>
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
Date: Fri Aug  9 13:08:02 2002
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@sistina.com

Ok. I ran  "mount -o remount,rw/" and I got fix /etc/fstab.

The output of my mkinitrd command with -v option was:

Using modules:  ./kernel/drivers/scsi/scsi_mod.o
./kernel/drivers/scsi/sd_mod.o ./kernel/drivers/scsi/aic7xxx/aic7xxx.o
./kernel/drivers/scsi/ips.o ./kernel/drivers/md/lvm-mod.o
./kernel/fs/jbd/jbd.o ./kernel/fs/ext3/ext3.o
Using loopback device /dev/loop0
/sbin/nash -> /tmp/initrd.d66GM4/bin/nash
/sbin/insmod.static -> /tmp/initrd.d66GM4/bin/insmod
`/lib/modules/2.4.18-3/./kernel/drivers/scsi/scsi_mod.o' ->
`/tmp/initrd.d66GM4/lib/scsi_mod.o'
`/lib/modules/2.4.18-3/./kernel/drivers/scsi/sd_mod.o' ->
`/tmp/initrd.d66GM4/lib/sd_mod.o'
`/lib/modules/2.4.18-3/./kernel/drivers/scsi/aic7xxx/aic7xxx.o' ->
`/tmp/initrd.d66GM4/lib/aic7xxx.o'
`/lib/modules/2.4.18-3/./kernel/drivers/scsi/ips.o' ->
`/tmp/initrd.d66GM4/lib/ips.o'
`/lib/modules/2.4.18-3/./kernel/drivers/md/lvm-mod.o' ->
`/tmp/initrd.d66GM4/lib/lvm-mod.o'
`/lib/modules/2.4.18-3/./kernel/fs/jbd/jbd.o' ->
`/tmp/initrd.d66GM4/lib/jbd.o'
`/lib/modules/2.4.18-3/./kernel/fs/ext3/ext3.o' ->
`/tmp/initrd.d66GM4/lib/ext3.o'
Loading module scsi_mod
Loading module sd_mod
Loading module aic7xxx
Loading module ips
Loading module lvm-mod
Loading module jbd
Loading module ext3


My mounted filesystems are:

Filesystem           1k-blocks      Used Available Use% Mounted on
/dev/sda2                 2063316     406816   1551688    21%    /
/dev/sda1                     30985         4976       24409    17%    /boot
none                           257180              0      257180     0%
/dev/shm
/dev/rootvg/root          198337      56448      131649   31%    /mnt
/dev/rootvg/usr            806288    317880      447448   42%    /mnt/usr
/dev/rootvg/home        198337        4133      183964     3%    /mnt/home
/dev/rootvg/tmp             99150        4128        89902     5%
/mnt/tmp
/dev/rootvg/var            198337      13400      174697     8%    /mnt/var



My /etc/fstab is here:

LABEL=/              /                        ext3        defaults
1 1
LABEL=/boot       /boot                 ext2        defaults
1 2
none                      /dev/pts             devpts     gid=5,mode=620
0 0
none                      /proc                 proc        defaults
0 0
none                      /dev/shm            tmpfs      defaults
0 0
/dev/sda5              swap                  swap      defaults
0 0
/dev/cdrom            /mnt/cdrom        iso9660  noauto,owner,kudzu,ro     0
0
/dev/fd0                 /mnt/floppy        auto        noauto,owner,kudzu
0 0
/dev/rootvg/root     /mnt                   ext3       defaults
0 0
/dev/rootvg/usr       /mnt/usr             ext3       defaults
0 0
/dev/rootvg/home   /mnt/home          ext3       defaults
0 0
/dev/rootvg/tmp      /mnt/tmp            ext3       defaults
0 0
/dev/rootvg/var       /mnt/var             ext3       defaults
0 0


My /mnt/etc/fstab is here:

/dev/rootvg/root        /                     ext3         defaults
1 1
/boot                        /boot               ext2        defaults
1 2
none                         /dev/pts          devpts      gid=5,mode=620
0 0
none                        /proc               proc         defaults
0 0
none                        /dev/shm          tmpfs       defaults
0 0
/dev/sda5                swap                swap        defaults
0 0
/dev/cdrom              /mnt/cdrom      iso9660     noauto,owner,kudzu,ro
0 0
/dev/fd0                   /mnt/floppy      auto          noauto,owner,kudzu
0 0
/dev/rootvg/root       /mnt                 ext3         defaults
0 0
/dev/rootvg/usr         /mnt/usr           ext3         defaults
0 0
/dev/rootvg/home     /mnt/home        ext3         defaults
0 0
/dev/rootvg/tmp        /mnt/tmp          ext3         defaults
0 0
/dev/rootvg/var         /mnt/var           ext3        defaults
0 0



My /etc/lilo.conf is:

prompt
timeout=50
default=linux
boot=/dev/sda
map=/boot/map
install=/boot/boot.b
message=/boot/message
linear
image=/boot/vmlinuz-2.4.18-3
        label=linux
        initrd=/boot/initrd-2.4.18-3.img
        read-only
        root=/dev/sda2
image=/boot/vmlinuz-2.4.18-3
        label=lvm
        initrd=/boot/initrd-lvm-2.4.18-3.img
        read-only
        root=/dev/rootvg/root
        append="ramdisk_size=8192"



I have a initrd directory under /mnt mount point (/dev/rootvg/root)

How can I check that linuxrc in the ramdisk initrd-lvm-2.4.18-3.img contains
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



Jorge



----- Original Message -----
From: "Luca Berra" <bluca@comedia.it>
To: <linux-lvm@sistina.com>
Sent: Friday, August 09, 2002 12:01 PM
Subject: Re: [linux-lvm] kernel panic - converting root fs to lvm


> On Fri, Aug 09, 2002 at 09:49:45AM -0300, Jorge Melhado wrote:
> > Then, if I enter with root passwor I can�t change /etc/fstab because
it�s in
> > readonly mode. So, I reboot again and the problem persists.
> mount -o remount,rw /
>
> L.
>
> --
> Luca Berra -- bluca@comedia.it
>         Communication Media & Services S.r.l.
>  /"\
>  \ /     ASCII RIBBON CAMPAIGN
>   X        AGAINST HTML MAIL
>  / \
>
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@sistina.com
> http://lists.sistina.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://www.sistina.com/lvm/Pages/howto.html
>
