Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6S9cwGH012773
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 05:38:58 -0400
Received: from web51115.mail.yahoo.com (web51115.mail.yahoo.com
	[206.190.39.92])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k6S9cvmN017173
	for <linux-lvm@redhat.com>; Fri, 28 Jul 2006 05:38:57 -0400
Message-ID: <20060728093852.68178.qmail@web51115.mail.yahoo.com>
Date: Fri, 28 Jul 2006 02:38:52 -0700 (PDT)
From: Dave <davo_muc@yahoo.com>
MIME-Version: 1.0
Subject: [linux-lvm] LVM1 - "VGDA in kernel and lvmtab are NOT consistent"
	error following lvm operations
Reply-To: Dave <davo_muc@yahoo.com>,
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hello,

I've been using LVM (1.08), which comes by default with RedHat AS3update5, for over a year now and am consistently running into a problem.  I hope there are still some LVM version 1 users out there who have some knowledge about this!!

After a reboot, LVM typically functions as expected, however, oftentimes, after some LVM operations, I get the following sequence:

[root@mucrrp10 vb]# vgdisplay
vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan

[root@mucrrp10 vb]# vgscan
vgscan -- reading all physical volumes (this may take a while...)
vgscan -- found active volume group "prdxptux"
vgscan -- found exported volume group "prdtuxPV_EXP"
vgscan -- "/etc/lvmtab" and "/etc/lvmtab.d" successfully created
vgscan -- WARNING: This program does not do a VGDA backup of your volume groups

[root@mucrrp10 vb]# vgdisplay
vgdisplay -- ERROR: VGDA in kernel and lvmtab are NOT consistent; please run vgscan

This is troublesome because it makes it difficult to reliably use certain LVM commands and trust their results.  I need to minimize reboots as much as possible.

Any help in understanding the cause of this problem, and how to resolve it, or avoid it, are greatly appreciated!!

Here is some version info about the system and software (I can provide more information if needed):

[root@mucrrp10 vb]# cat /etc/redhat-release
 Red Hat Enterprise Linux AS release 3 (Taroon Update 5)
 [root@mucrrp10 vb]# uname -a
 Linux mucrrp10 2.4.21-32.ELsmp #1 SMP Fri Apr 15 21:17:59 EDT 2005 i686 i686 i386 GNU/Linux
 [root@mucrrp10 vb]# rpm -qa|grep lvm
 lvm-1.0.8-12.2
 
Thanks in advance for any assistance.
Regards,
David
