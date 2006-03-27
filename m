Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2RJw7kH024389
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 14:58:07 -0500
Received: from smtp.univ-perp.fr (smtp.univ-perp.fr [194.167.137.6])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2RJvxKk009923
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 14:57:59 -0500
Received: from [194.167.136.6] (belle-ile.univ-perp.fr [194.167.136.6])
	by smtp.univ-perp.fr (8.13.1/jtpda-5.4) with ESMTP id k2RJvoN9026601
	for <linux-lvm@redhat.com>; Mon, 27 Mar 2006 21:57:50 +0200
Message-ID: <442843BE.1020000@univ-perp.fr>
Date: Mon, 27 Mar 2006 21:57:50 +0200
From: Stephane Branchoux <stephane.branchoux@univ-perp.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Crash during root file system check on boot
Reply-To: stephane.branchoux@univ-perp.fr,
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: linux-lvm@redhat.com

Hello,

I run Redhats AS4.0 (2.6.9-34.ELsmp) with lvm2 .

My system crashes during file system check on boot :

/dev/VolGroup00/Logvol00 is mounted e2fsck : cannot continue, aborting.
give root password for maintenance.
I ran :

e2fsck -y /dev/VolGroup00/Logvol00  

Then, if i use vgchange -a y, and init 3, i cant mount all filesystems 
and all seems OK.

I tried to boot on cdrom in rescue mode in order to check root file 
system but i have same message.
This file system check occurs running /etc/rc.d/rc.sysinit script.

grub.conf is like this :
title Red Hat Enterprise Linux AS (2.6.9-34.ELsmp)
       root (hd0,0)
       kernel /vmlinuz-2.6.9-34.ELsmp ro root=/dev/VolGroup00/LogVol00 
rhgb  acpi=off vga=0x317
       initrd /initrd-2.6.9-34.ELsmp.img


How can i solve this problem ?

Many thanks in advance

-- 
stephane BRANCHOUX
Centre de Ressources Informatiques de l'Universit� de Perpignan.
Syst�mes/R�seaux
mailto:stephane.branchoux@univ-perp.fr
04 68 66 21 24
Validation signature / Trusting signature: http://igc.cru.fr/trust.html


-- 
Ce message a ete verifie par MailScanner
pour des virus ou des polluriels et rien de
suspect n'a ete trouve.
CRI Universit� de Perpignan
