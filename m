Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k2GFER119028
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 10:14:27 -0500
Received: from styx.nll.se (styx.nll.se [81.216.21.34])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k2GFEFoP032371
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 10:14:21 -0500
Received: (from daemon@localhost) by styx.nll.se (8.9.3/8.9.3) id QAA20416
	for linux-lvm@redhat.com; Thu, 16 Mar 2006 16:13:53 +0100
From: fredrik.backman@nll.se
Received: (from daemon@localhost) by styx.nll.se (8.9.3/8.9.3) id QAA18967
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 16:12:22 +0100
Received: from fsu50.nll.se
	(U2FsdGVkX1/bUBPbWhDLns41HCMkpq5LgVVjxnEbIr8@fsu50.nll.se
	[128.45.193.79])
	by flff0.nll.se (8.8.6 (PHNE_17135)/8.8.6) with ESMTP id QAA03251
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 16:08:12 +0100 (MET)
Received: from localhost (openmail@localhost)
	by fsu50.nll.se (8.13.1/8.13.1/Submit) with ESMTP id k2GF8CF0022143
	for <linux-lvm@redhat.com>; Thu, 16 Mar 2006 16:08:12 +0100
Date: Thu, 16 Mar 2006 16:08:12 +0100
Message-Id: <H000007200bf1fff.1142521692.fsu50.nll.se@MHS>
MIME-Version: 1.0
Content-Disposition: inline
	;Creation-Date="Thu, 16 Mar 2006 16:08:12 +0100"
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] (no subject)
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

Im doing a snapshot (hardware-based in EVA5000) of a LV (lvm2) and i 
wonder what is the correct way to use this snapshot? Problem is that 
this snapshot has the same ID as the original one. In HP-UX a would do a 
vgchgid on this snapshot-LV. Any help would be aprreciated.

Regards Fredrik
