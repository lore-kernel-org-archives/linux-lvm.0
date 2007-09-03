Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l839Ybub021075
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 05:34:37 -0400
Received: from mail2.syneticon.net (mail.syneticon.net [213.239.212.131])
	by mx1.redhat.com (8.13.1/8.13.1) with ESMTP id l839YTTB017752
	for <linux-lvm@redhat.com>; Mon, 3 Sep 2007 05:34:30 -0400
Received: from postfix1.syneticon.net (postfix1.syneticon.net [192.168.112.6])
	by mail2.syneticon.net (Postfix) with ESMTP id 229E22F7B2
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2007 11:34:20 +0200 (CEST)
Received: from localhost (filter1.syneticon.net [192.168.113.3])
	by postfix1.syneticon.net (Postfix) with ESMTP id 9485D94DC
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2007 11:34:19 +0200 (CEST)
Received: from postfix1.syneticon.net ([192.168.113.4])
	by localhost (mx03.syneticon.net [192.168.113.3]) (amavisd-new,
	port 10025) with ESMTP id iiVapxv18+gI for <linux-lvm@redhat.com>;
	Mon,  3 Sep 2007 11:34:16 +0200 (CEST)
Received: from [192.168.10.145] (xdsl-87-79-108-186.netcologne.de
	[87.79.108.186]) by postfix1.syneticon.net (Postfix) with ESMTP
	for <linux-lvm@redhat.com>; Mon,  3 Sep 2007 11:34:16 +0200 (CEST)
Message-ID: <46DBD517.80503@wpkg.org>
Date: Mon, 03 Sep 2007 11:34:15 +0200
From: Tomasz Chmielewski <mangoo@wpkg.org>
MIME-Version: 1.0
Subject: Re: [linux-lvm] how much memory does LVM need? oom-killer comes
References: <46D9C7CD.4050703@wpkg.org> <46D9CA1D.8050908@wpkg.org>
	<46DA886E.3030301@wpkg.org>
In-Reply-To: <46DA886E.3030301@wpkg.org>
Content-Transfer-Encoding: 7bit
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

Tomasz Chmielewski schrieb:

> Ouch - now it went so far that the machine only loops from a kernel 
> panic to a kernel panic - that's really bad:
> 
> (...)
> Out of memory: kill process 2220 (getty) score 24 or a child
> Killed process 2220 (getty)
> Kernel panic - not syncing: Out of memory and no killable processes...
> 
> Rebooting in 20 seconds..

Again, replying to myself, as no one on this list seem to have a clue 
about problems with LVM snapshots... I added RAM, and was able to boot 
again.


Below is a quick try to estimate the memory usage of LVM snapshots; I'm 
using 2.6.22.6.

The machine has 256 MB RAM.

With these volumes and snapshots, almost 200 MB of memory is used:

# lvs
   LV                  VG          Attr   LSize   Origin Snap%  Move Log 
Copy%
   backup              st          owi-ao   1.20T
   backup-snap         st          swi-a- 100.00G backup  31.22
   backup-snap-resized st          swi-a-  30.00G backup  72.73
   backup1             st          -wi-a-   3.00G
   backup1-sync-test   st          -wi-a-   3.00G
   src                 st          -wi-a-   2.00G
   swap                st          -wi-ao   3.00G

# free
              total       used       free     shared    buffers     cached
Mem:        512864     418380      94484          0     216036       5156
-/+ buffers/cache:     197188     315676


After removing a 100 GB snapshot that is over 30% full, we reclaim 
almost 100 MB of memory:

# lvremove /dev/st/backup-snap

Do you really want to remove active logical volume "backup-snap"? [y/n]: y
   Logical volume "backup-snap" successfully removed


# free
              total       used       free     shared    buffers     cached
Mem:        512864     328668     184196          0     220652       7480
-/+ buffers/cache:     100536     412328
Swap:      3145720        220    3145500


After removing yet another snapshot - 30 GB, over 70% full - we reclaim 
70 MB:

# lvremove /dev/st/backup-snap-resized
Do you really want to remove active logical volume 
"backup-snap-resized"? [y/n]: y
   Logical volume "backup-snap-resized" successfully removed

# free
              total       used       free     shared    buffers     cached
Mem:        512864     335500     177364          0     296444       9436
-/+ buffers/cache:      29620     483244
Swap:      3145720        216    3145504


So, as a rule of thumb, we can say that for each *used* GB of snapshot, 
~3 MB of RAM is needed.


-- 
Tomasz Chmielewski
http://wpkg.org
