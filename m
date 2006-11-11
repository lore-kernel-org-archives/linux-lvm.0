Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kABBIqwT019921
	for <linux-lvm@redhat.com>; Sat, 11 Nov 2006 06:18:52 -0500
Received: from mayle.org (mail.mayle.org [82.242.109.112])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id kABBIltM023154
	for <linux-lvm@redhat.com>; Sat, 11 Nov 2006 06:18:48 -0500
Mime-Version: 1.0 (Apple Message framework v752.3)
Message-Id: <CA207AAA-711C-4AAD-911A-4301C61C165B@mayle.org>
Content-Type: multipart/mixed; boundary=Apple-Mail-1-253126029
From: Douglas Mayle <douglas@mayle.org>
Date: Sat, 11 Nov 2006 12:18:39 +0100
Subject: [linux-lvm] Update to lvm2create_initrd
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
To: LVM <linux-lvm@redhat.com>


--Apple-Mail-1-253126029
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	delsp=yes;
	format=flowed

I've made an update to the lvm2create_initrd script that fixes some  
problems with ldd output that were never addressed in the first  
version (e.g. libraries linked with a static path).

I also check for binaries in the path, rather than hardcoding their  
location, and I've added support for the Gentoo style of MAKEDEV.


--Apple-Mail-1-253126029
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream; x-unix-mode=0644;
	name=lvm2create_initrd.patch
Content-Disposition: attachment;
	filename=lvm2create_initrd.patch

--- lvm2create_initrd.orig	2006-11-10 21:32:53.000000000 +0100
+++ lvm2create_initrd	2006-11-10 21:35:42.000000000 +0100
@@ -52,7 +52,7 @@
 DEVRAM=/tmp/initrd.$$
 
 # set defaults
-BINFILES=${BINFILES:-"/lib/lvm-200/lvm /bin/bash /bin/busybox /sbin/pivot_root"}
+BINFILES=${BINFILES:-"`which lvm` `which bash` `which busybox` `which pivot_root`"}
 BASICDEVICES=${BASICDEVICES:-"std consoleonly fd"}
 BLOCKDEVICES=${BLOCKDEVICES:-"md hda hdb hdc hdd sda sdb sdc sdd"}
 MAKEDEV=${MAKEDEV:-"debian"}
@@ -269,7 +269,7 @@
 # Figure out which shared libraries we actually need in our initrd
 echo "$cmd -- finding required shared libraries"
 verbose "BINFILES: `echo $BINFILES`"
-LIBFILES=`ldd $BINFILES 2>/dev/null | awk '{if (/=>/) { print $3 }}' | sort -u`
+LIBFILES=`ldd $BINFILES 2>/dev/null |grep -v linux-gate |grep -v : | awk '{if (/=>/) { print $3 } else if (/\//) { print $1 }}' | sort -u`
 if [ $? -ne 0 ]; then
    echo "$cmd -- ERROR figuring out needed shared libraries"
    exit 1
@@ -356,6 +356,10 @@
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

--Apple-Mail-1-253126029--
