Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.11.6) with ESMTP id
	k2LJFO83030089
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 14:15:24 -0500
Received: from styx.nll.se (styx.nll.se [81.216.21.34])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k2LJFLuE010777
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 14:15:22 -0500
Received: (from daemon@localhost) by styx.nll.se (8.9.3/8.9.3) id UAA27836
	for linux-lvm@redhat.com; Tue, 21 Mar 2006 20:15:18 +0100
From: fredrik.backman@nll.se
Received: (from daemon@localhost) by styx.nll.se (8.9.3/8.9.3) id UAA27608
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 20:15:15 +0100
Received: from fsu50.nll.se
	(U2FsdGVkX1/9RJgd1/c5+YJYXjEvDrhULJKzTPNsrXc@fsu50.nll.se
	[128.45.193.79])
	by flff0.nll.se (8.8.6 (PHNE_17135)/8.8.6) with ESMTP id UAA15199
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 20:11:13 +0100 (MET)
Received: from localhost (openmail@localhost)
	by fsu50.nll.se (8.13.1/8.13.1/Submit) with ESMTP id k2LJBDkp017339
	for <linux-lvm@redhat.com>; Tue, 21 Mar 2006 20:11:13 +0100
Date: Tue, 21 Mar 2006 20:11:13 +0100
Message-Id: <H000007200c27f69.1142968273.fsu50.nll.se@MHS>
MIME-Version: 1.0
Content-Disposition: inline
	;Creation-Date="Tue, 21 Mar 2006 20:11:13 +0100"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Hardware snapshots and LVM2?
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

Hi

Im doing a snapshot (hardware-based in EVA5000) of a LV 
(lvm2) and i 
wonder what is the correct way to use this snapshot? 
Problem is that 
this snapshot has the same ID as the original one. In HP-UX 
a would do a 
vgchgid on this snapshot-LV. Any help would be aprreciated.

Regards Fredrik
