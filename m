Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iADDcMr14741
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 08:38:22 -0500
Received: from mta2.cl.cam.ac.uk
	(IDENT:lgu6dNAV1VQpcu+YYqZvU4m5dUPPPlHE@mta2.cl.cam.ac.uk
	[128.232.0.14])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iADDcFnX002104
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 08:38:15 -0500
Received: from shep.cl.cam.ac.uk ([128.232.8.11] helo=cl.cam.ac.uk ident=pb)
	by mta2.cl.cam.ac.uk with esmtp (Exim 3.092 #1) id 1CSy6Y-0006qh-00
	for linux-lvm@redhat.com; Sat, 13 Nov 2004 13:38:14 +0000
Subject: Re: [linux-lvm] Re: raid 1 on a single disk 
In-Reply-To: Message from ptb@lab.it.uc3m.es (Peter T. Breuer) 
	of "Sat, 13 Nov 2004 13:59:19 +0100." <72dh62-4om.ln1@news.it.uc3m.es> 
References: <89af10f90411130217467c439@mail.gmail.com> 
	<lg4h62-8vg.ln1@news.it.uc3m.es>
	<89af10f90411130241e20e2c2@mail.gmail.com> 
	<72dh62-4om.ln1@news.it.uc3m.es>
Mime-Version: 1.0
Date: Sat, 13 Nov 2004 13:38:14 +0000
From: Piete Brooks <Piete.Brooks@cl.cam.ac.uk>
Message-Id: <E1CSy6Y-0006qh-00@mta2.cl.cam.ac.uk>
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
To: LVM general discussion and development <linux-lvm@redhat.com>

> (please do not top post - fixing. Please take note!)
(what's "top post"ing?)

>> ok so, i also do know, its performance is going to suck ! 
> No, it'll be fine - merely a couple or more times slower at writing
> large streams.

Actually, over 4 times :-(

He has a 4 way mirror on hdd.
As well as having to send all date over the (same!) IDE bus 4 times,
the disk head keeps having to move between the 4 partitions :-(

> What's silly is that there's no point in doing it

Not true -- there is little point.

It will protect against un-re-vectored block faults.

> you get no protection against the disk disappearing

Indeed -- which is the real use for RAID1 ...

> It's like making 3 sets of spare housekeys, and then putting them all
> in the same keyholder as the original set, and walking around like that.

Which has *some* use if the keys are made of very soft metal and "wear out".

[ His actual problem was that he didn't realise that mkraid is brain dead, and 
needs a chunk size in /etc/raidtab, even when it's not used!  I showed him how 
to use mdadm, and it worked ]
