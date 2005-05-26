Received: from mx2.redhat.com (mx2.redhat.com [10.255.15.25])
	by int-mx2.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4QDB5P00545
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 09:11:05 -0400
Received: from ciao.gmane.org (main.gmane.org [80.91.229.2])
	by mx2.redhat.com (8.12.11/8.12.11) with ESMTP id j4QDehfY032593
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 09:40:43 -0400
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1DbHmr-0008SK-Kx
	for linux-lvm@redhat.com; Thu, 26 May 2005 14:48:33 +0200
Received: from pd95eac6e.dip.t-dialin.net ([217.94.172.110])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 14:48:33 +0200
Received: from bill.mair by pd95eac6e.dip.t-dialin.net with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 14:48:33 +0200
From: Bill Mair <bill.mair@web.de>
Date: Thu, 26 May 2005 16:48:21 +0200
Message-ID: <d74ged$ueo$1@sea.gmane.org>
References: <4295B7F7.9060802@hp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <4295B7F7.9060802@hp.com>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: Daemon or Thread with 5 minute interval
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

Howard Rifkin wrote:
>  So, my question is does anyone know of a
> kernel thread or daemon in the 2.4 kernel that wakes up every 5 minutes?

[kupdated] can cause massive CPU load if your kernel does not have the IDE 
chipset support for your system. I think it flushed any data in the HD
buffers to disk and if the chipset support isn't there, then the main CPU has
to do this using PIO.

--
Bill
