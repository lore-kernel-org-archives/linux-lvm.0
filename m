Return-Path: <cworley@liberate.com>
Message-ID: <3A5F80D7.1080905@liberate.com>
Date: Fri, 12 Jan 2001 15:10:31 -0700
From: Chris Worley <cworley@liberate.com>
MIME-Version: 1.0
Subject: Re: [linux-lvm] [lvm 0.8 final] lvmcreate_initrd fails for me
References: <200101121859.f0CIxwf23470@webber.adilger.net> <3A5F657D.E3A67F2F@attglobal.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@sistina.com, seawolf@attglobal.net

Les,

I remember a similar problem from a different initrd: with such a 
small file system, there aren't enough inodes created to hold a large 
number of small files.  For example, "/dev/*" files don't require much 
actual file system space, but a disproportionate number of file 
pointers are required.  I believe this is controlled by reducing the 
bytes/inode setting in mke2fs (but I forget).

My lvmcreate_initrd says: "mke2fs -m0 -i 1024 $DEVRAM $INITRDSIZE"

The way to test this is to execute each of the commands in 
lvmcreate_initrd manually: when the error occurs, return to the point 
where "mke2fs" is run using a different value for "-i".  You should at 
least see the error messages start on different files for each iteration.

Note that a lot of the commands used in lvmcreate_initrd pipe their 
error output to /dev/null.  Don't do this during testing.

Also, are you sure your ramdisk size is 8MB?  The default is 4MB: it 
needs to be set on the lilo command line or when configuring the 
current kernel.  I think this is a mistake... since the initrd is not 
necessarily being built on the same system where it's going to be 
used, ramdisks should be avoided (since it may require rebooting if 
you're not already setup for 8MB ramdisks), using a loopback 
filesystem would be easier (if it's not currently part of the kernel, 
then the module can be loaded -- no reason to reboot).

Hope that helps,

Chris

Les Hazelton wrote:

> I have been working on a problem with 0.8final - lvmcreate_initrd for
> the past week or so - off and on.  The problem is that the step where
> the files are copied to the ram disk fails for lack of space even though
> the ram disk has about 7 meg free.
> 
> If I duplicate the commands from the command line I can create an 8 meg
> ram disk and fill the full 8 meg.
> 
> My system is running Mandrake 7.2 and the kernel is the source
> distributed by Mandrake kernel-2.2.17-21mdk patched with
> lvm-0.8final-2.2.16TL.patch.
> 
> As far as I can tell, everything else is working correctly. I can extend
> my reiserfs filesystems which are on LVs while they are on-line and in
> use with no identified problems.  I just can't build a new initrd for a
> new kernel compile.
> 
> I have attached a copy of the lvmcreate_initrd output and that of a df
> command also.
> 
> I would appreciate any ideas on how to resolve this.
> 
> 
> 
> ------------------------------------------------------------------------
> 
> [root@farpt1 /tmp]# lvmcreate_initrd
> 
> Logical Volume Manager 0.8 by Heinz Mauelshagen  11/11/1999
> 
> lvmcreate_initrd -- this script creates a LVM initial ram disk in /boot/initrd.gz
> 
> lvmcreate_initrd -- making ram filesystem
> lvmcreate_initrd -- mounting ram filesystem
> lvmcreate_initrd -- creating etc/conf.modules
> lvmcreate_initrd -- creating new modules.dep
> lvmcreate_initrd -- copying files to ram disk
> find: /lib/modules/2.2.17-21mdk-01/block/lvm.o: No such file or directory
> lvmcreate_initrd -- figuring out shared libraries
> lvmcreate_initrd -- copying shared libraries to ram disk
> strip: /tmp/mnt.1514/ram/lib/ld-linux.so.2: No such file or directory
> strip: /tmp/mnt.1514/ram/lib/libc.so.6: No such file or directory
> strip: /tmp/mnt.1514/ram/lib/libdl.so.2: No such file or directory
> strip: /tmp/mnt.1514/ram/lib/libhistory.so.4.1: No such file or directory
> strip: /tmp/mnt.1514/ram/lib/liblvm.so: No such file or directory
> strip: /tmp/mnt.1514/ram/lib/libreadline.so.4.1: No such file or directory
> strip: /tmp/mnt.1514/ram/lib/libtermcap.so.2: No such file or directory
> lvmcreate_initrd -- creating linuxrc
> lvmcreate_initrd -- ERROR creating linuxrc
> 
> [root@farpt1 /tmp]# df -h
> Filesystem            Size  Used Avail Use% Mounted on
> /dev/hda6             1.3G  1.2G   20M  98% /
> /dev/hda1              45M  4.3M   39M  10% /boot
> /dev/lvg01/home       1.0G  129M  895M  13% /home
> /dev/lvg01/usr        2.0G  1.3G  753M  63% /usr
> /dev/lvg01/src        700M  181M  519M  26% /usr/src
> /dev/lvg01/local      1.0G  517M  507M  51% /usr/local
> /dev/lvg01/var        300M  121M  179M  40% /var
> /dev/ram1             7.0M  876k  6.1M  12% /tmp/mnt.1514/ram
> wrk.txt
> 
> Content-Type:
> 
> text/plain
> Content-Encoding:
> 
> 7bit
