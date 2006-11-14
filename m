Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kAEHpEH6028557
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 12:51:14 -0500
Received: from mail.mayle.org (mail.mayle.org [82.242.109.112])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kAEHoW62011060
	for <linux-lvm@redhat.com>; Tue, 14 Nov 2006 12:50:32 -0500
Date: Tue, 14 Nov 2006 18:49:07 +0100
From: Douglas Mayle <douglas@mayle.org>
Subject: Re: [linux-lvm] Update to lvm2create_initrd
Message-ID: <20061114174907.GA15269@qube.mayle.org>
References: <CA207AAA-711C-4AAD-911A-4301C61C165B@mayle.org>
	<20061114170247.GD30653@agk.surrey.redhat.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="BXVAT5kNtrzKuDFl"
Content-Disposition: inline
In-Reply-To: <20061114170247.GD30653@agk.surrey.redhat.com>
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
To: Alasdair G Kergon <agk@redhat.com>
Cc: Jeff Layton <jtlayton@poochiereds.net>, LVM <linux-lvm@redhat.com>


--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 14, 2006 at 05:02:47PM +0000, Alasdair G Kergon wrote:
> Please update the changelog.
> 
> Can someone confirm the updated script also still works on Debian?
> 
> 
> -BINFILES=${BINFILES:-"/lib/lvm-200/lvm /bin/bash /bin/busybox /sbin/pivot_root"}
> +BINFILES=${BINFILES:-"`which lvm` `which bash` `which busybox` `which pivot_root`"}
> 
> Will 'which lvm' always give the same answer as before on Debian,
> or, if not, does it matter?
> 
> 
> -LIBFILES=`ldd $BINFILES 2>/dev/null | awk '{if (/=>/) { print $3 }}' | sort -u`
> +LIBFILES=`ldd $BINFILES 2>/dev/null |grep -v linux-gate |grep -v : | awk '{if (/=>/) { print $3 } else if (/\//) { print $1 }}' | sort -u`
> 
> This needs a comment explaining what's going on (e.g. include sample 
> output in the comment).  What's special about linux-gate?
> And why not combine the two greps?  -E (linux-gate|:)
> 
> Alasdair
> -- 
> agk@redhat.com
Done

Douglas Mayle

--BXVAT5kNtrzKuDFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="lvm2create_initrd.patch"

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

--BXVAT5kNtrzKuDFl--
