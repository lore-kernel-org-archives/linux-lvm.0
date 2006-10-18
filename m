Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9ILPDTx021704
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 17:25:13 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9ILPCVh028805
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 17:25:13 -0400
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1GaIuM-0007F2-8k
	for linux-lvm@redhat.com; Wed, 18 Oct 2006 23:25:02 +0200
Received: from 87.69.23.241.cable.012.net.il ([87.69.23.241])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 23:25:02 +0200
Received: from psichod by 87.69.23.241.cable.012.net.il with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 18 Oct 2006 23:25:02 +0200
From: PsichoD <psichod@securinux.net>
Date: Wed, 18 Oct 2006 23:26:41 +0200
Message-ID: <eh65ri$vmu$2@sea.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] LVM snapshot script, anybody?
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

Does anybody have a good cron script for creating and mounting 
hourly/daily/weekly snapshots, a-la NetApp? I'm too lazy for writing one 
myseself :-(
