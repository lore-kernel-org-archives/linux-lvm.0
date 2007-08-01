Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l71J96CW031823
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 15:09:06 -0400
Received: from ccerelbas04.cce.hp.com (ccerelbas04.cce.hp.com [161.114.21.107])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l71J8tY2009053
	for <linux-lvm@redhat.com>; Wed, 1 Aug 2007 15:08:55 -0400
Received: from G3W0059.americas.hpqcorp.net (g3w0059.americas.hpqcorp.net
	[16.232.1.16])
	by ccerelbas04.cce.hp.com (Postfix) with ESMTP id B1DCF344F1
	for <linux-lvm@redhat.com>; Wed,  1 Aug 2007 14:08:45 -0500 (CDT)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Date: Wed, 1 Aug 2007 19:08:43 -0000
Message-ID: <55D16D5A051757489679376DECFE315E0157E47F@G3W0639.americas.hpqcorp.net>
From: "Joubert, Kevin" <kevin.joubert@hp.com>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Redirecting LVM command output on RHEL5?
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
To: linux-lvm@redhat.com

 
Hello, 

Okay.. I am probably missing something simple here but...

I just added a RHEL5 system to my lab and I am testing a script that
captures LVM structure. 
This script works on other versions of RHEL and SLES, but on RHEL5,
whenever I try to redirect LVM command output, I get a blank. 

For instance...

[root@linux-dl585 ~]# pvs
  PV         VG   Fmt  Attr PSize  PFree
  /dev/sda   vg01 lvm2 a-   10.00G    0
  /dev/sdd   vg02 lvm2 ax    1.95G 1.08G
  /dev/sde   vg02 lvm2 ax    1.95G 1.46G

[root@linux-dl585 ~]# pvs > kevin.txt

[root@linux-dl585 ~]# cat kevin.txt


No matter what LVM command I run (i.e. vgdisplay, lvs, etc. etc.), it
will not redirect output to my text file. Screen output is always
successful, and every other system command I have tried (i.e. fdisk,
etc.) will redirect output successfully. 


Any ideas?


Kevin 
