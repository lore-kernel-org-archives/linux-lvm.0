Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i82DXl317687
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:33:47 -0400
Received: from main.gmane.org (main.gmane.org [80.91.224.249])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i82DXf1d002335
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 09:33:41 -0400
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1C2riZ-0007R9-00
	for <linux-lvm@redhat.com>; Thu, 02 Sep 2004 15:33:35 +0200
Received: from adsl-214-28-210.asm.bellsouth.net ([68.214.28.210])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 02 Sep 2004 15:33:35 +0200
Received: from ecashin by adsl-214-28-210.asm.bellsouth.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 02 Sep 2004 15:33:35 +0200
From: Ed L Cashin <ecashin@coraid.com>
Date: Thu, 02 Sep 2004 09:33:32 -0400
Message-ID: <871xhkhk2b.fsf@coraid.com>
Mime-Version: 1.0
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] clvmd.8 absent in latest snapshot
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi.  I don't know how tarballs are released, but I noticed that
although the CVS LVM2 has clvmd.8, the LVM2.2.00.21 tarball does not.

Without clvmd.8, when LVM2 is configured with cluster support, "make
install" fails early and clvmd is never installed.

-- 
  Ed L Cashin <ecashin@coraid.com>
