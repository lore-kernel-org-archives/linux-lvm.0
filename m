Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id jA4JIqV17083
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 14:18:52 -0500
Received: from hermes.mvista.com (gateway-1237.mvista.com [12.44.186.158])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id jA4JIhi2011005
	for <linux-lvm@redhat.com>; Fri, 4 Nov 2005 14:18:43 -0500
Received: from [10.50.1.77] (blade.az.mvista.com [10.50.1.77])
	by hermes.mvista.com (Postfix) with ESMTP id C8AF71A7BA
	for <linux-lvm@redhat.com>; Fri,  4 Nov 2005 11:18:37 -0800 (PST)
Message-ID: <436BB40C.6020601@mvista.com>
Date: Fri, 04 Nov 2005 12:18:36 -0700
From: Dave Jiang <djiang@mvista.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] building LVM2 static fails
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: linux-lvm@redhat.com

Has anyone compiled LVM2 successfully with static linking?
./configure --enable-static_link

gcc -o lvm.static dumpconfig.o formats.o lvchange.o lvconvert.o 
lvcreate.o lvdisplay.o lvextend.o lvmchange.o lvmcmdline.o lvmdiskscan.o 
lvreduce.o lvremove.o lvrename.o lvresize.o lvscan.o polldaemon.o 
pvchange.o pvcreate.o pvdisplay.o pvmove.o pvremove.o pvscan.o 
reporter.o segtypes.o toollib.o vgcfgbackup.o vgcfgrestore.o vgchange.o 
vgck.o vgcreate.o vgconvert.o vgdisplay.o vgexport.o vgextend.o 
vgimport.o vgmerge.o vgmknodes.o vgreduce.o vgremove.o vgrename.o 
vgscan.o vgsplit.o lvm-static.o -static -Wl,--export-dynamic -L../lib 
-L/lib -llvm -ldevmapper \
         -ldl  -rdynamic
/usr/bin/ld: cannot find -ldevmapper
collect2: ld returned 1 exit status
make[1]: *** [lvm.static] Error 1
make[1]: *** Waiting for unfinished jobs....

Why is autoconf still attempting dynamic linking while with -static? I 
can build successfully without --enable-static_link.


-- 

------------------------------------------------------
Dave Jiang
Software Engineer, Carrier Grade Software
MontaVista Software, Inc.
http://www.mvista.com
------------------------------------------------------
