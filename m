Return-Path: <seawolf@attglobal.net>
Message-ID: <3A5F657D.E3A67F2F@attglobal.net>
Date: Fri, 12 Jan 2001 15:13:49 -0500
From: Les Hazelton <seawolf@attglobal.net>
MIME-Version: 1.0
References: <200101121859.f0CIxwf23470@webber.adilger.net>
Content-Type: multipart/mixed;
 boundary="------------2AB1F35ABB387FE8DD598F72"
Subject: [linux-lvm] [lvm 0.8 final] lvmcreate_initrd fails for me
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
To: linux-lvm@sistina.com

This is a multi-part message in MIME format.
--------------2AB1F35ABB387FE8DD598F72
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

I have been working on a problem with 0.8final - lvmcreate_initrd for
the past week or so - off and on.  The problem is that the step where
the files are copied to the ram disk fails for lack of space even though
the ram disk has about 7 meg free.

If I duplicate the commands from the command line I can create an 8 meg
ram disk and fill the full 8 meg.

My system is running Mandrake 7.2 and the kernel is the source
distributed by Mandrake kernel-2.2.17-21mdk patched with
lvm-0.8final-2.2.16TL.patch.

As far as I can tell, everything else is working correctly. I can extend
my reiserfs filesystems which are on LVs while they are on-line and in
use with no identified problems.  I just can't build a new initrd for a
new kernel compile.

I have attached a copy of the lvmcreate_initrd output and that of a df
command also.

I would appreciate any ideas on how to resolve this.

-- 

Good Journey, longevity and prosperity to all

Les Hazelton
--------------2AB1F35ABB387FE8DD598F72
Content-Type: text/plain; charset=us-ascii;
 name="wrk.txt"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="wrk.txt"

[root@farpt1 /tmp]# lvmcreate_initrd

Logical Volume Manager 0.8 by Heinz Mauelshagen  11/11/1999

lvmcreate_initrd -- this script creates a LVM initial ram disk in /boot/initrd.gz

lvmcreate_initrd -- making ram filesystem
lvmcreate_initrd -- mounting ram filesystem
lvmcreate_initrd -- creating etc/conf.modules
lvmcreate_initrd -- creating new modules.dep
lvmcreate_initrd -- copying files to ram disk
find: /lib/modules/2.2.17-21mdk-01/block/lvm.o: No such file or directory
lvmcreate_initrd -- figuring out shared libraries
lvmcreate_initrd -- copying shared libraries to ram disk
strip: /tmp/mnt.1514/ram/lib/ld-linux.so.2: No such file or directory
strip: /tmp/mnt.1514/ram/lib/libc.so.6: No such file or directory
strip: /tmp/mnt.1514/ram/lib/libdl.so.2: No such file or directory
strip: /tmp/mnt.1514/ram/lib/libhistory.so.4.1: No such file or directory
strip: /tmp/mnt.1514/ram/lib/liblvm.so: No such file or directory
strip: /tmp/mnt.1514/ram/lib/libreadline.so.4.1: No such file or directory
strip: /tmp/mnt.1514/ram/lib/libtermcap.so.2: No such file or directory
lvmcreate_initrd -- creating linuxrc
lvmcreate_initrd -- ERROR creating linuxrc

[root@farpt1 /tmp]# df -h
Filesystem            Size  Used Avail Use% Mounted on
/dev/hda6             1.3G  1.2G   20M  98% /
/dev/hda1              45M  4.3M   39M  10% /boot
/dev/lvg01/home       1.0G  129M  895M  13% /home
/dev/lvg01/usr        2.0G  1.3G  753M  63% /usr
/dev/lvg01/src        700M  181M  519M  26% /usr/src
/dev/lvg01/local      1.0G  517M  507M  51% /usr/local
/dev/lvg01/var        300M  121M  179M  40% /var
/dev/ram1             7.0M  876k  6.1M  12% /tmp/mnt.1514/ram

--------------2AB1F35ABB387FE8DD598F72--
