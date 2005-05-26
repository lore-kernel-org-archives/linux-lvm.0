Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j4QIU1O22321
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 14:30:01 -0400
Received: from mailout03.sul.t-online.com (mailout03.sul.t-online.com
	[194.25.134.81])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j4QITtZB001546
	for <linux-lvm@redhat.com>; Thu, 26 May 2005 14:29:55 -0400
Message-ID: <429623A0.5010109@web.de>
Date: Thu, 26 May 2005 21:29:36 +0200
From: bill.mair@t-online.de
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: LVM general discussion and development <linux-lvm@redhat.com>

Howard Rifkin wrote:

 >> So, my question is does anyone know of a
 >> kernel thread or daemon in the 2.4 kernel that wakes up every 5 minutes?
 >
 >[kupdated] can cause massive CPU load if your kernel does not have the IDE 
 >chipset support for your system. I think it flushed any data in the HD
 >buffers to disk and if the chipset support isn't there, then the main CPU has
 >to do this using PIO.
 >
 >--
 >Bill


** In addition to my post I might add that kswapd and bdflushd also deal with
IDE drives.

**  Correcting my initial reply, kupdated deals with "journal" flushing to the
HD, which may also be relevant on your cluster.

--
Bill
