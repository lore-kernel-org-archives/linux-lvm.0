Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with SMTP id n5J4dXod026938
	for <linux-lvm@redhat.com>; Fri, 19 Jun 2009 00:39:33 -0400
Received: from web87109.mail.ird.yahoo.com (web87109.mail.ird.yahoo.com
	[87.248.115.225])
	by mx1.redhat.com (8.13.8/8.13.8) with SMTP id n5J4dBod031145
	for <linux-lvm@redhat.com>; Fri, 19 Jun 2009 00:39:14 -0400
Message-ID: <860189.66656.qm@web87109.mail.ird.yahoo.com>
References: <11905247.42271245248829110.JavaMail.servlet@kundenserver>
Date: Fri, 19 Jun 2009 04:39:10 +0000 (GMT)
From: chris procter <chris-procter@talk21.com>
Subject: Re: [linux-lvm] Exposing the same VG from two different disks
In-Reply-To: <11905247.42271245248829110.JavaMail.servlet@kundenserver>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>




> I've had a closer look at the vgimportclone script and I think the fix for the
> lost filter is very straight forward. The errors are coming out of the final
> vgscan and it seems to be caused by the LVM_SYSTEM_DIR variable being set to an 
> empty string rather than being unset. So I made the following change and it 
> seemed to fix the errors...

Cool, I'd kind of noticed this bit of weirdness but hadn't got round to actually doing anything about it :)

LVM_SYSTEM_DIR also gets reset in the cleanup function (which pointless because our changes are dropped when the script ends anyway so we might as well get rid of it, also we're using #!/bin/sh  but assuming several bash-isms so this is a cleanup patch that covers both (hopefully I've figured out how to create proper patches!):

diff --git a/vgimportclone.sh b/vgimportclone.sh
--- a/vgimportclone.sh
+++ b/vgimportclone.sh
@@ -1,4 +1,4 @@
-#!/bin/sh
+#!/bin/bash
 
 # Copyright (C) 2009 Chris Procter All rights reserved.
 # Copyright (C) 2009 Red Hat, Inc. All rights reserved.
@@ -87,8 +87,6 @@
 
 
 function cleanup {
-    #set to use old lvm.conf
-    LVM_SYSTEM_DIR=${ORIG_LVM_SYS_DIR}
 
     if [ $KEEP_TMP_LVM_SYSTEM_DIR -eq 1 ]; then
         echo "${SCRIPTNAME}: LVM_SYSTEM_DIR (${TMP_LVM_SYSTEM_DIR}) must be cleaned up manually."


      
