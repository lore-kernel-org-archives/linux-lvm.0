Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i52HAY013796
	for <linux-lvm@redhat.com>; Wed, 2 Jun 2004 13:10:34 -0400
Received: from matrix.tmit.bme.hu (mail@matrix.tmit.bme.hu [152.66.246.235])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i52HANXn004273
	for <linux-lvm@redhat.com>; Wed, 2 Jun 2004 13:10:23 -0400
Received: from kefir (helo=localhost)
	by matrix.tmit.bme.hu with local-esmtp (Exim 3.35 #1 (Debian))
	id 1BVZFu-0001Sm-00
	for <linux-lvm@redhat.com>; Wed, 02 Jun 2004 19:10:22 +0200
Date: Wed, 2 Jun 2004 19:10:22 +0200 (CEST)
From: Andras Gefferth <g_a@freeXdeletethisXmail.hu.redhat.com>
Message-ID: <Pine.LNX.4.44.0406021905350.5350-100000@matrix.tmit.bme.hu>
MIME-Version: 1.0
Sender: Andras Gefferth <kefir@matrix.tmit.bme.hu>
Subject: [linux-lvm] PV size error
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi All!

I'm using LVM 2 with linux 2.6.5. The size of the partition (as reported
by fdisk, or cfdisk) is around 20G, while pvdisplay (or something similar)
says 30G for this pv. I think this shouldn't happen. Am I right?

What should I do?

pls send answers to my private address too

thanks

Andras
