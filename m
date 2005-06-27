Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j5RCuou12639
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 08:56:50 -0400
Received: from mail.gmx.net (pop.gmx.de [213.165.64.20])
	by mx3.redhat.com (8.12.11/8.12.11) with SMTP id j5RCuiJ1011669
	for <linux-lvm@redhat.com>; Mon, 27 Jun 2005 08:56:44 -0400
Date: Mon, 27 Jun 2005 14:56:38 +0200 (MEST)
From: "Markus Jeckeln" <Markus.Jeckeln@gmx.de>
MIME-Version: 1.0
References: <27640.1119868518@www77.gmx.net>
Message-ID: <8794.1119876998@www77.gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Problem with locking_type 2 lvm/cluster/gfs
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
To: linux-lvm@redhat.com


Hi There,

i am trying to build up a setup with several servers accessing one SAN. 

I use a RedHat Enterprise Linux 4 with RHEL4U1 packages
(lvm2-2.01.08-1.0.RHEL4.i386.rpm) and the lvm2-cluster srpm from fedora 4 

as soon as i put up the locking_type = 2 and set the locking_library then i
can't run any lvm commands (vgdisplay/vgchange) ... returning with 
connect() failed on local socket: Connection refused
Locking type 2 initialisation failed.


only when the clvmd is running.. but i can not boot up my machine anymore
because clvmd is not running when mounting my local lvm filesystems.

any help is higly apreciated!!!

#lvmcmdline.c:836         Processing: vgchange -vvvvv -ay VolGroup00
#lvmcmdline.c:839         O_DIRECT will be used
#config/config.c:773       Setting global/locking_type to 2
#config/config.c:758       Setting global/locking_library to
/usr/lib/liblvm2clusterlock.so
#misc/sharedlib.c:41       Opening shared locking library
/usr/lib/liblvm2clusterlock.so
#locking/external_locking.c:92     Loaded external locking library
/usr/lib/liblvm2clusterlock.so
#cluster_locking.c:83   connect() failed on local socket: Connection refused
#lvmcmdline.c:853   Locking type 2 initialisation failed.



Greeeetings Markus Jeckeln

-- 
Geschenkt: 3 Monate GMX ProMail gratis + 3 Ausgaben stern gratis
++ Jetzt anmelden & testen ++ http://www.gmx.net/de/go/promail ++

-- 
Geschenkt: 3 Monate GMX ProMail gratis + 3 Ausgaben stern gratis
++ Jetzt anmelden & testen ++ http://www.gmx.net/de/go/promail ++
