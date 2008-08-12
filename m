Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id m7C4VK0D003832
	for <linux-lvm@redhat.com>; Tue, 12 Aug 2008 00:31:20 -0400
Received: from outbound-mail-119.bluehost.com (outbound-mail-119.bluehost.com
	[69.89.22.19])
	by mx3.redhat.com (8.13.8/8.13.8) with SMTP id m7C4V3EW006363
	for <linux-lvm@redhat.com>; Tue, 12 Aug 2008 00:31:03 -0400
Received: from c-76-24-201-106.hsd1.ma.comcast.net ([76.24.201.106]
	helo=[192.168.1.102])
	by box138.bluehost.com with esmtpsa (SSLv3:AES256-SHA:256)
	(Exim 4.69) (envelope-from <paul@mad-scientist.us>)
	id 1KSlX8-0005xL-Dr
	for linux-lvm@redhat.com; Mon, 11 Aug 2008 22:30:58 -0600
From: Paul Smith <paul@mad-scientist.us>
Content-Type: multipart/mixed; boundary="=-UWt3+5Md9T191QpQu/2/"
Date: Tue, 12 Aug 2008 00:30:21 -0400
Message-Id: <1218515421.8242.164.camel@localhost>
Mime-Version: 1.0
Subject: [linux-lvm] Please remove bash from lvm2
Reply-To: paul@mad-scientist.us,
	LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: <https://www.redhat.com/archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
To: linux-lvm@redhat.com


--=-UWt3+5Md9T191QpQu/2/
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I've been trying to pack a bunch of tools onto an embedded systems and
it's very frustrating how man of them have requirements on bash, for no
real reason.  Just a bit more care could easily take care of this
problem.  I definitely don't want to be forced to include bash, instead
of using busybox sh for example, only because of a few scripts that
could just as easily be written in standard sh.

Here's a patch that removes bash requirements from lvm_dump.  The init
scripts I looked at can be fixed by just changing #!/bin/bash to
#!/bin/sh.

Cheers!

--=-UWt3+5Md9T191QpQu/2/
Content-Disposition: attachment; filename=no-bash.patch
Content-Type: text/x-patch; name=no-bash.patch; charset=us-ascii
Content-Transfer-Encoding: 7bit

diff -ubB -r LVM2.2.02.25-orig/scripts/lvm_dump.sh LVM2.2.02.25/scripts/lvm_dump.sh
--- LVM2.2.02.25-orig/scripts/lvm_dump.sh	2007-04-25 10:49:27.000000000 -0400
+++ LVM2.2.02.25/scripts/lvm_dump.sh	2008-08-11 23:09:21.000000000 -0400
@@ -1,5 +1,4 @@
-#!/bin/bash
-# we use some bash-isms (getopts?)
+#!/bin/sh
 
 # lvm_dump: This script is used to collect pertinent information for
 #           the debugging of lvm issues.
@@ -50,17 +49,17 @@
 	exit 1
 }
 
-advanced=0
-clustered=0
-metadata=0
+advanced=false
+clustered=false
+metadata=false
 while getopts :acd:hm opt; do
 	case $opt in 
-		s)      sysreport=1 ;;
-		a)	advanced=1 ;;
-		c)	clustered=1 ;;
+		s)      sysreport=true ;;
+		a)	advanced=true ;;
+		c)	clustered=true ;;
 		d)	userdir=$OPTARG ;;
 		h)	usage ;;
-		m)	metadata=1 ;;
+		m)	metadata=true ;;
 		:)	echo "$0: $OPTARG requires a value:"; usage ;;
 		\?)     echo "$0: unknown option $OPTARG"; usage ;;
 		*)	usage ;;
@@ -94,7 +93,7 @@
 myecho "Creating dump directory: $dir"
 echo " "
 
-if (( $advanced )); then
+if $advanced; then
 	myecho "Gathering LVM volume info..."
 
 	myecho "  vgscan..."
@@ -113,7 +112,7 @@
 	log "$LVM vgs -v > $dir/vgs 2>> $log"
 fi
 
-if (( $clustered )); then
+if $clustered; then
 	myecho "Gathering cluster info..."
 	echo "STATUS: " > $dir/cluster_info
 	echo "----------------------------------" >> $dir/cluster_info
@@ -152,7 +151,7 @@
 myecho "Gathering /sys/block listing..."
 log "$LS -laR /sys/block > $dir/sysblock_listing"
 
-if (( $metadata )); then
+if $metadata; then
 	myecho "Gathering LVM metadata from Physical Volumes..."
 
 	log "$MKDIR -p $dir/metadata"

--=-UWt3+5Md9T191QpQu/2/--
