Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id iADAZNr22446
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 05:35:23 -0500
Received: from main.gmane.org (main.gmane.org [80.91.229.2])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id iADAZ9Ai008709
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 05:35:15 -0500
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1CSvFM-0001qb-00
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 11:35:08 +0100
Received: from triangulo.it.uc3m.es ([163.117.139.109])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 11:35:08 +0100
Received: from ptb by triangulo.it.uc3m.es with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Sat, 13 Nov 2004 11:35:08 +0100
From: Peter T. Breuer <ptb@lab.it.uc3m.es>
Date: Sat, 13 Nov 2004 11:33:25 +0100
Message-ID: <lg4h62-8vg.ln1@news.it.uc3m.es>
References: <89af10f90411130217467c439@mail.gmail.com>
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: raid 1 on a single disk
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

ashwin chaugule <ashwin.chaugule@gmail.com> wrote:
>          Im trying to get RAID 1 working on a single disk. Can anyone
> tell me if thats possible ?

Yes, of course it is.

> Do I have to use LVM for that ?

No.

> So, far this is what i've understood ...
> Now.. I have a separate disk on which I want RAID 1.
> so I create one PV on that disk (/dev/hdd)

No you don't. LVM is not involved.

> create a logical vol grp.


No you don't. LVM is not involved.


> add 4 LV's , for four filesystems of the same type ...

No you don't. LVM is not involved.

> then in /etc/raidtab or whatever ..
> say that i have 4 disks and for each disk specify each LV partition ..

No you don't, since LVM is not involved.

> then mkraid /dev/md0 ...
> 
> Is this correct if I want data to be mirrored across all 4 partitions
> , using RAID 1 on a single disk ?

So, you are talking about a mirror with 4 components, all of them
partitions on the same disk?

Well, that's silly, but nothing stops you doing it. Just maek a raidtab
for the mirror and name the partitions as raid-disk components there.
The RAID howto or faq should tell you all you need to know, as should
the mananpage for the conf file or mdadm, or whatever ...

Peter
