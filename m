Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2DKTK5p014682
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 16:29:21 -0400
Received: from mail.silentmedia.com (earth.silentmedia.com [216.254.19.12])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2DKT1uK031716
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 16:29:02 -0400
Received: from GRD (GRD [10.125.42.6])
	by mail.silentmedia.com (Postfix) with ESMTP id DE54F8A68
	for <linux-lvm@redhat.com>; Fri, 13 Mar 2009 13:29:00 -0700 (PDT)
Date: Fri, 13 Mar 2009 13:29:00 -0700 (PDT)
From: Ben Chobot <bench@silentmedia.com>
Subject: Re: [linux-lvm] fsync() and LVM
In-Reply-To: <Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
Message-ID: <Pine.LNX.4.64.0903131325590.10022@localhost.localdomain>
References: <49BA9BF9.3070507@esiway.net>
	<Pine.LNX.4.64.0903131552560.2685@bmsred.bmsi.com>
MIME-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

On Fri, 13 Mar 2009, Stuart D. Gathman wrote:

> I suspect that LVM simply fails to pass the *write barrier* through
> to underlying layers (i.e. ignores the writebarrier call).  Thus, you should be
> fine if you simply turn off writeback caching in your disk drives.  If you
> could guarrantee that disk drives would be powered long enough after the main
> system stops - even a drive write back cache would not be much of a risk.

The big question in my mind is which software layers don't get to see the 
write barrier. If any of them can reorder writes, that could (however 
unlikely) lead to data corruption.
