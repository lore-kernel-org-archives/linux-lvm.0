Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAKJicNx007621
	for <linux-lvm@redhat.com>; Mon, 20 Nov 2006 14:44:38 -0500
Received: from mayle.org ([82.242.109.112])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kAKJibFo022457
	for <linux-lvm@redhat.com>; Mon, 20 Nov 2006 14:44:37 -0500
In-Reply-To: <20061114174907.GA15269@qube.mayle.org>
References: <CA207AAA-711C-4AAD-911A-4301C61C165B@mayle.org>
	<20061114170247.GD30653@agk.surrey.redhat.com>
	<20061114174907.GA15269@qube.mayle.org>
Mime-Version: 1.0 (Apple Message framework v752.3)
Content-Type: multipart/mixed; boundary=Apple-Mail-4-1060638100
Message-Id: <A6195709-81DE-4F00-996F-6490A367593C@mayle.org>
From: Douglas Mayle <douglas@mayle.org>
Subject: Re: [linux-lvm] Update to lvm2create_initrd
Date: Mon, 20 Nov 2006 20:37:11 +0100
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: LVM general discussion and development <linux-lvm@redhat.com>
Cc: Jeff Layton <jtlayton@poochiereds.net>, Alasdair G Kergon <agk@redhat.com>


--Apple-Mail-4-1060638100
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

To follow up, I've made the requested changes to my patch.  I was  
wondering if the changes are sufficient, or there needs to be more  
work?  If so, please let me know.
I'd really like to see this get committed, as I often see people  
having all sorts of problems generating lvm2 initrd images, and they  
perform all sorts of hacks just to get it working.  These couple of  
lines make all that extra work unnecessary, and the script shouldn't  
be changed for older distributions.


--Apple-Mail-4-1060638100
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	x-unix-mode=0644;
	name=lvm2create_initrd.patch
Content-Disposition: attachment;
	filename=lvm2create_initrd.patch

--- lvm2create_initrd.orig	2006-11-14 18:26:08.000000000 +0100
+++ lvm2create_initrd	2006-11-14 18:47:11.000000000 +0100
@@ -29,6 +29,8 @@
 #               PATH entries to /sbin/init shell script so chroot works without /usr mounted. Remove
 #               mkdir /initrd so we don't cause problems if root filesystem is corrupted. -- Jeff Layton
 # 15/05/2004	initial support for modules, create lvm.conf from lvm dumpconfig, other cleanups -- Jeff Layton
+# 14/11/2006	Update handling of ldd output to handle hardcoded library links and virtual dll linux-gate.
+#		Add support for Gentoo-style MAKEDEV. Remove hardcoded BINUTILS paths -- Douglas Mayle
 #
 # Copyright Miguel Cabeca, Jeffrey Layton, 2004
 #
@@ -52,7 +54,7 @@
 DEVRAM=/tmp/initrd.$$
 
 # set defaults
-BINFILES=${BINFILES:-"/lib/lvm-200/lvm /bin/bash /bin/busybox /sbin/pivot_root"}
+BINFILES=${BINFILES:-"`which lvm` `which bash` `which busybox` `which pivot_root`"}
 BASICDEVICES=${BASICDEVICES:-"std consoleonly fd"}
 BLOCKDEVICES=${BLOCKDEVICES:-"md hda hdb hdc hdd sda sdb sdc sdd"}
 MAKEDEV=${MAKEDEV:-"debian"}
@@ -269,7 +271,27 @@
 # Figure out which shared libraries we actually need in our initrd
 echo "$cmd -- finding required shared libraries"
 verbose "BINFILES: `echo $BINFILES`"
-LIBFILES=`ldd $BINFILES 2>/dev/null | awk '{if (/=>/) { print $3 }}' | sort -u`
+
+# We need to strip certain lines from ldd output.  This is the full output of an example ldd:
+#lvmhost~ # ldd /sbin/lvm /bin/bash
+#/sbin/lvm:
+#        not a dynamic executable
+#/bin/bash:
+#        linux-gate.so.1 =>  (0xbfffe000)
+#        libncurses.so.5 => /lib/libncurses.so.5 (0xb7ee3000)
+#        libdl.so.2 => /lib/libdl.so.2 (0xb7edf000)
+#        libc.so.6 => /lib/libc.so.6 (0xb7dc1000)
+#        /lib/ld-linux.so.2 (0xb7f28000)
+#
+# 1) Lines with a ":" contain the name of the original binary we're examining, and so are unnecessary.
+#    We need to strip them because they contain "/", and can be confused with links with a hardcoded path.
+# 2) The linux-gate library is a virtual dll that does not exist on disk, but is instead loaded automatically
+#    into the process space, and can't be copied to the ramdisk
+#
+# After these lines have been stripped, we're interested in the lines remaining if they
+# 1) Contain "=>" because they are pathless links, and the value following the token is the path on the disk
+# 2) Contain "/" because it's a link with a hardcoded path, and so we're interested in the link itself.
+LIBFILES=`ldd $BINFILES 2>/dev/null |grep -v -E \(linux-gate\|:\) | awk '{if (/=>/) { print $3 } else if (/\//) { print $1 }}' | sort -u`
 if [ $? -ne 0 ]; then
    echo "$cmd -- ERROR figuring out needed shared libraries"
    exit 1
@@ -356,6 +378,10 @@
     (cd $TMPMNT/dev; /dev/MAKEDEV $OPT_Q -d $TMPMNT/dev -m 2)
     RETCODE=$?
     ;;
+gentoo)
+    (cd $TMPMNT/dev; /usr/sbin/MAKEDEV $OPT_Q $BASICDEVICES $BLOCKDEVICES)
+    RETCODE=$?
+    ;;
 *)
     echo "$cmd -- ERROR: $MAKEDEV is not a known MAKEDEV style."
     RETCODE=1

--Apple-Mail-4-1060638100
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed



--Apple-Mail-4-1060638100--
