Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i5AKFL017317
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 16:15:21 -0400
Received: from nerim.mx.42-networks.com (gw.c9x.org [213.41.131.17])
	by mx1.redhat.com (8.12.10/8.12.10) with SMTP id i5AKFKi5011312
	for <linux-lvm@redhat.com>; Thu, 10 Jun 2004 16:15:21 -0400
Date: Thu, 10 Jun 2004 22:32:47 +0159
From: Jedi/Sector One <lvm@pureftpd.org>
Message-ID: <20040610203309.GA18186@c9x.org>
Mime-Version: 1.0
Content-Disposition: inline
Subject: [linux-lvm] Multipath without round-robin?
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

  Hello.
  
  I'm trying to get multipath working with LVM2 (2.6.7-rc2-udm2 kernel) with
an LSI storage array.

  The array has two FC controllers, HBAs are two identical Qlogic 2340.
  
  On the array, "preferred" controllers are assigned to each LUN.
  
  Unfortunately, it looks like dm-multipath always does round-robin load
balancing.

  The result is that the array fills up the (SANtricity) error log with
messages like "LUN was accessed through the wrong controller".

  Is there any way to keep failover abilities without load balancing?
  
  Best regards,
  
       -Frank.
       
