Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i826XX326036
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 02:33:33 -0400
Received: from mail.netregistry.net (mail.netregistry.net [203.202.16.100])
	by mx3.redhat.com (8.12.11/8.12.10) with ESMTP id i826XRWY028081
	for <linux-lvm@redhat.com>; Thu, 2 Sep 2004 02:33:28 -0400
Received: from proxy.netregistry.net ([203.202.16.2] helo=[10.1.1.174])
	by mail.netregistry.net with esmtp (Exim 4.22) id 1C2l9x-000143-Ct
	for linux-lvm@redhat.com; Thu, 02 Sep 2004 16:33:25 +1000
From: Adam Cassar <adam.cassar@netregistry.com.au>
Message-Id: <1094106922.10860.82.camel@akira2.nro.au.com>
Mime-Version: 1.0
Date: Thu, 02 Sep 2004 16:35:22 +1000
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] lvm and blockdev --setra
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Hi Guys,

Should one set blockdev --setra on the lvm device, on the individual
block devices making up the lvm device or both?
