Received: from mx1.redhat.com (ext-mx01.extmail.prod.ext.phx2.redhat.com
	[10.5.110.5])
	by int-mx04.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id n8J6elko004422
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 02:40:47 -0400
Received: from relay04.mail-hub.dodo.com.au (relay04.mail-hub.dodo.com.au
	[123.2.6.239])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n8J6eXSr015088
	for <linux-lvm@redhat.com>; Sat, 19 Sep 2009 02:40:34 -0400
Received: from 123-2-156-143.static.dsl.dodo.com.au ([123.2.156.143]
	helo=fc11-64.localdomain)
	by relay04.mail-hub.dodo.com.au with esmtp (Exim 4.68)
	(envelope-from <whobedobe@dodo.com.au>) id 1MotcR-0004G6-MO
	for linux-lvm@redhat.com; Sat, 19 Sep 2009 16:40:32 +1000
From: Hugh <whobedobe@dodo.com.au>
Subject: Re: [linux-lvm] I've tried to get some support on this list about lvm
Date: Sat, 19 Sep 2009 16:40:27 +1000
References: <200909152137.44474.whobedobe@dodo.com.au>
	<20090915114939.GA2715@agk-dp.fab.redhat.com>
In-Reply-To: <20090915114939.GA2715@agk-dp.fab.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <200909191640.27257.whobedobe@dodo.com.au>
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
Content-Type: Text/Plain; charset="us-ascii"
To: linux-lvm@redhat.com

On Tuesday 15 September 2009 21:49:39 Alasdair G Kergon wrote:
> On Tue, Sep 15, 2009 at 09:37:44PM +1000, Hugh wrote:
> > Sep 10 20:55:46 fc11-64 kernel: device-mapper: table: device 8:18
> > too small for target
> 
> There's your answer: You're trying to make it bigger than the underlying
> device.
> 
> Use pvs -v to check device sizes for discrepancies.
> (--units s if necessary).
> 
> Alasdair
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 

This makes no sense to me Alasdair.
This may be the error message but it defies explanation.
I still think there is something wrong with the lvm sine it's the one throwing 
the error and everything else seems normal.:
[root@fc11-64 ~]# pvs -v
    Scanning for physical volume names
  PV         VG         Fmt  Attr PSize  PFree  DevSize PV UUID                               
  /dev/sda2  vg_fc1164  lvm2 a-   99.80G     0   99.80G qunnek-OG2y-hp2j-31J8-
J3HT-0Aye-3w2rMN
  /dev/sdb2  VolGroup00 lvm2 a-   67.91G 20.00G  47.93G eCuGyH-jV7L-Tgdg-JyYW-
sWK1-ehZY-OLw0WS
[root@fc11-64 ~]# pvscan
  PV /dev/sdb2   VG VolGroup00   lvm2 [67.91 GB / 20.00 GB free]
  PV /dev/sda2   VG vg_fc1164    lvm2 [99.80 GB / 0    free]
  Total: 2 [167.71 GB] / in use: 2 [167.71 GB] / in no VG: 0 [0   ]

Perhaps I just don't know how to interpret the output but it appears to be 
normal and I don't know what to do next.
I'm desperate to recover my old fc9 disk, any suggestions or step by step 
guides which might point out where I went wrong or what the actual problem 
might be?

Thank, Hugh
