Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with SMTP id i31FHGj25993
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 10:17:16 -0500
Received: from localhost.localdomain (shoenix.xs4all.nl [213.84.65.61])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i31FHDjj008691
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 10:17:14 -0500
Received: from shoenix.net (deathstar [127.0.0.1])
	by localhost.localdomain (8.12.8/8.12.8) with ESMTP id i31F6uUx001972
	for <linux-lvm@redhat.com>; Thu, 1 Apr 2004 17:06:57 +0200
Message-ID: <406C3010.2040103@shoenix.net>
Date: Thu, 01 Apr 2004 17:06:56 +0200
From: Martijn Schoemaker <lvm@shoenix.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Migration of linux 2.4/LVM1 to linux 2.6/LVM2 with root
	fs in LVM
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi all,

I'm pretty new to this list, but I wanted to share my experiences of migrating
my linux 2.4.25 kernel with an LVM1 root volume to linux 2.6.4 retaining as
much configuration as possible and keeping the root volume bootable. Since in
kernel 2.6 the old LVM1 is no longer supported this was quite a hassle which
I would like to spare other people :) I know this is a long message but I want
to describe all details and filter it out into a 'cookbook' with all you guy's
and gal's :) I know there are probably dosens of typos, but that was not the
main focus. Also, during my quest I ran into a couple of questions which I
put at the end of this text.

WARNING: Although it all went OK with me, you should really make backups of
your machine to be safe! (I did too ... honest!) Also keep a recent (RedHat 9)
bootcd present to use the 'Rescue' boot. This version has MD and LVM support.
You CAN seriously screw up your machine when making typos in the wrong places.

Base configuration
------------------
My starting configuration was a linux 2.4.25 machine (which used to be a
redhat 6.0 installation a loooong time ago, but is now heavilly modified by
myself) using a combination of RAID1 with LVM1. All filesystems are ext3. The
actual disks are two 40gb maxtor drives connected to a HPT366 UDMA controller.

/dev/vg00/lvol1        2064208   /              md0 = Small mirrored boot fs
/dev/vg00/lvol2        2031952   /home          md1 = swap (mirrored)
/dev/vg00/lvol6        2031952   /extend        md2 = rest of disk(s) for LVM
/dev/vg00/lvol4        2031952   /var
/dev/vg00/lvol5        2031952   /opt
/dev/vg00/lvol8        2064208   /mnt/sun
/dev/vg00/lvol3        3031760   /home/ftp
/dev/vg00/lvol7        2064208   /var/log
/dev/md0                 99470   /boot
/dev/md1                511992   swap

Note that I use LILO (Yes GRUB is better but ...) version 21.4-4 which I
needed to make the booting of a mirrored boot filesystem possible. And yes,
swap is mirrored otherwise you would still have a system crash when one of
the disks goes down.

Because I had some strange crashing problems, and kernel 2.4 is bound to be
superceded by 2.6 in the future anyway, I decided to be bold and to upgrade
to Linux 2.6. The latest version available was Linux 2.6.4 which I used.

The first steps (still on 2.4.25)
---------------------------------
After reading the Documentation/Changelog I noticed I would have to upgrade
my modutils and my procps to newer versions, the rest was all OK. I did not
install these versions yet, so I don't know if they would have worked on the
old 2.4.25 kernel. If I get a chance to check it out I'll let you know. Of-
course I DID  need to install the userland tools for LVM2 since LVM1 is not
suported in the 2.6 kernel any more. Separately I had to compile and install
the devmapper userland tools and lib.

First I dowloaded the device-mapper source (LVM2 needs this to compile the
support into it). This was really a question of running configure and running
make install. I did notice the installer did not copy the 'devmap_mknod.sh'
script from the source script directory into '/sbin', so I did this manually.
Ofcourse here I could have tried to get my old LVM1 coniguration to use dev-
mapper and upgrade to LVM2, but there did not seem to be kernel patches against
the 2.4.25 kernel so I skipped this and went straight into installing kernel
2.6.4.

Then downloaded the LVM2 sources and compiled and installed them in a separate
directory (/opt/lvm2 in this case, the old files were in /opt/lvm and of-
course in /sbin. I always compile these binaries static!!).

After doing this I tried to run the 'vgdisplay' command of the new LVM2 in
my old LVM1 configuration. This did not work. I got a message that 'the driver
has the volumes in use', or something like that, and this put me to more caution.
The first thing I did was to move all LVM1 binaries in /sbin to <tool>1 files
(i.e. vgscan became vgscan1) so I would retain my old binaries in my root fs. I
copied all the new LVM2 files (symbolic links except 'lvm') to the /sbin directory.

This also meant I had to change the init-ramdisk and the rc-scripts to make
sure they would use the old binaries when booting my old linux version(s).

I changed my old vgscan/vgchange line in my /etc/rc.d/rc.sysinit to :

if [ "`/bin/uname -r`" = "2.6.4" ]; then
         /sbin/devmap_mknod.sh;/sbin/lvm vgscan;/sbin/lvm vgchange -ay
else    /sbin/vgscan1 && /sbin/vgchange1 -a y
fi

(note: the devmap_mknod and lvm commands will be discussed later)

I also changed my lvmcreate_initrd1 (!) to use and copy the old versions
into the ramdisk image and the generated linuxrc. Just change the commands
in the 'create_linuxrc()' function and make sure to change the names in
the INITRDFILES variable further in the file. I chose not to make the
lvmcreate_initrd general (like I did with the rc.sysinit) because I wanted
to really separate the configuration and scripts used therefor.

After this I created the new ramdisk image by running lvmcreate_initrd1
(you need to do this for all 2.4 configurations) and ran 'lilo' again.
After this I rebooted my machine to see if all went well with using the
old LVM1 binaries. TAKE CARE! If you make mistakes here, you will have
to use the RedHat boot CD and use the Rescue option to put things right.
Typo's in the lvmcreate_inird1 are generally deadly.

(note: At this point it would have been nice to have installed the new
        module-init-tools package, especially since the older versions
        will NOT work with a 2.6 kernel! As mentioned before, I don't
        know if these new modutils work with a 2.4 kernel)

Installing the new 2.6 kernel
-----------------------------
Now I downloaded the 2.6 kernel and unpacked it. I ran the 'make menuconfig'
of my old kernel and the new kernel in separate screens. I went through
everything and made sure all options (if they still existed) were enabled
in the new kernel. I did notice the first strange thing, in the menu
for 'Multi-device support (RAID and LVM)' the actual LVM option was gone. I
also saw a new option called 'Device Mapper Support'. Make sure you ena-
ble this and all neccesary RAID options (At least RAID1 for me). Also, in
my struggle I got all kinds of ramdisk errors which were caused because I
ran out of ramdisk space. I needed to set this in kernel to 8192! So make
sure to do this too! After all seemed OK I built the new kernel.

(note:If you did not upgrade your modutils, make sure to compile all nes-
       secary drivers and options in the kernel and not as module! These were
       for instance all drivers (3com), RAID, and filesystems (ext2,ext3).)

Fixing the boot process
-----------------------
Now for the real challenge. Booting the new kernel without loosing the pos-
ibility to boot my old kernel. The problems were :

- LILO config : the new devmapper device major and minor numbers are dy-
                 namic. The old LVM1 device files had major number 58, in
                 the LVM2/DM it could be anything! So how to let LILO know
                 which device to mount as 'root' (the 'root=' parameter) ?
                 And even worse, you cannot change the device files while
                 running the old kernel since this can cause serious pro-
                 blems when rebooting to boot the new kernel!
- Root fs '/dev' directory :
                 Because of the major/minor number problem, the old root
                 fs will still have the wrong device files at the stage
                 the root filesystem is 'switched' from initrd to the
                 real read-only root filesystem. How to fix this ?

(note: this might have been a lot easier when I would have been using
        devfs. But hey, I wasn't)

I did the following to solve the problems. First I copied the
/sbin/lvmcreate_initrd1 to /sbin/lvmcreate_initrd since in LVM2 there is
no such script. And for all I know you really NEED this, also in LVM2.
I changed the '<tool>1' back to '<tool>' in the script so it would use the
new LVM2 binaries. Also, the new LVM2 would need the devmap_mknod.sh script
to run prior to the lvm commands to create the control device. So the new
create_linuxrc() function would be :

create_linuxrc () {
    echo "#!/bin/bash" > $TMPMNT/linuxrc
    [ "$LVMMOD" ] && echo "/sbin/modprobe $LVMMOD" >> $TMPMNT/linuxrc
    cat << LINUXRC >> $TMPMNT/linuxrc
/bin/mount /proc
/sbin/devmap_mknod.sh
/sbin/lvm vgscan
/sbin/lvm vgchange -a y
echo "Listing /dev/mapper and /dev/vg00 [ press a key to continue]"
ls -la /dev/mapper /dev/vg00
read inp
/bin/umount /proc
LINUXRC
    chmod 555 $TMPMNT/linuxrc
}

Since I would not know what device major and minor numbers the devmapper would
assign I also added lines that listed the actual /dev/mapper and /dev/vg00 di-
rectories at ramdisk stage. These lines I would remove later once I knew the
device numbers (I need them once at least!) Additionally I needed to add the
other binaries to the ramdisk that the devmap_mknod.sh script uses and that my
additional script lines needed. This gave the following line :

INITRDFILES="/sbin/lvm /sbin/devmap_mknod.sh /sbin/vgchange /sbin/vgscan
/bin/bash /bin/mount /bin/umount /bin/sh /bin/rm /bin/sed /bin/mkdir
/bin/mknod /bin/ls"

After I made these changes I ran the 'lvmcreate_initrd 2.6.4'. Since I was
still running my 2.4 kernel at this point, I had to add the new kernel ver-
sion. So now I had the modified ramdisk image (Double check that you com-
piled the new 2.6 kernel with at least 8192 initial ramdisk size or you will
run into problems later!). I manually installed my new kernel and made a new
entry in LILO. Since I did not know the new device info I kept the 'root='
parameter at '/dev/vg00/lvol1' for the 2.6 entry.

At this point I rebooted my machine and chose the new kernel. This showed
me the actual device major/minor numbers in my case (configuration) were
253 major and 0 - lvolmax minor. So my lvol1 would have 253 major and
0 minor. WARNING: These device numbers are assigned dynamically and will
probably not work for you! Worse still, if you make configuration chan-
ges these numbers may change! In this case, write down the numbers you
see, you will need them (at least once) later on. Also write down the
major and minor numbers of the control file.

After pressing 'enter' the first error occured. As forseen, the mounting
of the real rootfs as readonly failed because the kernel had no support
for devices with major number 58 (= old LVM1 device numbers). I rebooted
the machine in my old 2.4 configuration.

Now I knew the major/minor numbers I went into the /dev/vg00 directory
and make two subdirs : 2.4 and 2.6. In the 2.4 I copied the lvol* files
(make sure to use cp -a) into the 2.4 directory. I also made a new
file with :
                 mknod lvol1new b 253 0

I changed my lilo.conf to make it use the lvol1new device for the 2.6
kernel so the actual root= was '/dev/vg00/lvol1new' instead of the old
'/dev/vg00/lvol1'.

I ran LILO again and rebooted.

Now the actual remounting from ramdisk to real disk went fine, but there
was still a problem when filesystemchecking the rootfs. This is caused
by the fact that on disk the '/dev/vg00/lvol1' file at this stage is
still the old one (58) (checking of the root filesystem happens before
the LVM initialisation in the rc.sysconfig. Logical, since the rootfs
is still read-only at this stage!). So I typed in my password to enter
the maintenance console. I typed :

         mount -n -o remount,ro /

(note: make sure you did a clean shutdown! Otherwise you can kill your
        filesystem!)

Then I went into '/dev', I created the 'mapper' directory. In this
directory I created the 'control' device (use the major/minor num-
bers as you written down earlyer) and I manually created all nesse-
cary device files conforming devmapper. So I had :

crw-------   1 root     root      10,  63 Mar 31 14:35 control
brw-r--r--   1 root     root     253,   0 Mar 31 10:23 vg00-lvol1
brw-r--r--   1 root     root     253,   1 Mar 31 10:23 vg00-lvol2
brw-r--r--   1 root     root     253,   2 Mar 31 10:24 vg00-lvol3
brw-r--r--   1 root     root     253,   3 Mar 31 10:24 vg00-lvol4
brw-r--r--   1 root     root     253,   4 Mar 31 10:24 vg00-lvol5
brw-r--r--   1 root     root     253,   5 Mar 31 10:24 vg00-lvol6
brw-r--r--   1 root     root     253,   6 Mar 31 10:24 vg00-lvol7
brw-r--r--   1 root     root     253,   7 Mar 31 10:24 vg00-lvol8

(note: Your major and minor numbers may vary!)

Then in the '/dev/vg00' directory I removed all lvol files and made
symbolic links to the '/dev/mapper/' files so I had :

lrwxrwxrwx   1 root     root           22 Mar 31 14:13 lvol1 -> /dev/mapper/vg00-lvol1
lrwxrwxrwx   1 root     root           22 Mar 31 14:13 lvol2 -> /dev/mapper/vg00-lvol2
lrwxrwxrwx   1 root     root           22 Mar 31 14:13 lvol3 -> /dev/mapper/vg00-lvol3
lrwxrwxrwx   1 root     root           22 Mar 31 14:13 lvol4 -> /dev/mapper/vg00-lvol4
lrwxrwxrwx   1 root     root           22 Mar 31 14:13 lvol5 -> /dev/mapper/vg00-lvol5
lrwxrwxrwx   1 root     root           22 Mar 31 14:13 lvol6 -> /dev/mapper/vg00-lvol6
lrwxrwxrwx   1 root     root           22 Mar 31 14:13 lvol7 -> /dev/mapper/vg00-lvol7
lrwxrwxrwx   1 root     root           22 Mar 31 14:13 lvol8 -> /dev/mapper/vg00-lvol8

I also copied these symlinks to the '2.6' directory. This directory,
and the 2.4 one, make life easier if you want to switch boot between 2.4
and 2.6 (which I did a lot `of times to write this doc :))

When all was done I typed 'reboot'. After this the boot went fine and all
worked. I cleaned up my lilo.conf and changed all 'root=' directives for
my old 2.4 kernels to use the '/dev/vg00/2.4/lvol1'.  For the 2.6 entry
I changed the root from '/dev/vg00/lvol1new' to '/dev/vg00/lvol1'. I removed
the three lines from the 'lvmcreate_initrd' script (the LVM2 one) which caused
the wait for an enter and the listing of the mapper and vg00 directories. Don't
forget to re-run the 'lvmcreate_initrd' to generate a new ramdisk image. And
don't forget to run LILO.

At this point I had sucessfully migrated my old configuration to a new 2.6
kernel with LVM2 and devmapper. Ofcourse my linux migration was not fini-
shed, had to install new procfs and modutils, but that is out of the scope
of LVM. And the rc.sysinit script still has a check on a fixed kernel ver-
sion (2.6.4) which needs to be removed or made more flexible since this
will make newer 2.6 kernels to boot with usage of the old tools.

All this tinkering left me with a couple of questions which might have made
life easier :

1. Has anyone done a migration using devfs ? Does this really save a lot of
    problems ?
2. In my hacking, I noticed that the vgscan and vgchange commands of LVM2 did
    not recreate (overwrite) the files in '/dev/mapper' and '/dev/vg00' at each
    boot. I can recall that the LVM1 did do this. Is this true ? Since I ini-
    tially only fixed the 'lvol1' device files I expected the vg tools in the
    rc.sysinit to recreate (overwrite) my old and obsolete LVM1 device files,
    but this did not happen, therefor I needed to change them all.
3. Is it possible to use LVM2 without an initial ramdisk ? This would re-
    quire boot-time volume activation. Is this possible/planned ?
4. Has anyone first tried to migrate the 2.4 to LVM2 and devmapper with a
    root filesystem in LVM ? I think you would run into the same boot pro-
    blems.
5. Would using GRUB have simpified this migration ? It is more dynamic, but
    I think the 'wrong devicefiles in rootfs' problem remains.
6. It there more documentation on the device mapper ? I could not find any.
7. If the device number assignment of devmapper is indeed completely dy-
    namic, won't this give problems for booting ? Say you add a disk into
    your config with LVM data on it, won't it cause your device numbers of
    your exiting disk to change thus making booting impossible ?
8. Shouldn't the devmapper install script install the devmap_mknod script
    into /sbin ? And is it possible for the devmapper control file major and
    minor numbers to change?
9. I noticed that the LVM2 userland tools did not work with the LVM1 confi-
    guration on 2.4. Shouldn't this work ? I was led to believe that these
    tools were downwards compatible. Did I forget configure options while
    building ?
10.Does anyone have any other comments on this ? Things I might have over-
    looked or things that I have done that are waaaay to dangerous ?
11.Is it safe for me to upgrade the LVM1 metadata to the LVM2 metadata ?
    What are the consequences of this ?

Well, this is a loooot of text, but I'm eagerly awaiting your responses.

Cheers,
Martijn Schoemaker
