Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n596sPMN028997
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 02:54:25 -0400
Received: from maude.comedia.it (mail.comedia.it [77.93.254.181])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n596s6kx020745
	for <linux-lvm@redhat.com>; Tue, 9 Jun 2009 02:54:06 -0400
Received: from localhost (localhost [127.0.0.1])
	by maude.comedia.it (Postfix) with ESMTP id 4696486F18
	for <linux-lvm@redhat.com>; Tue,  9 Jun 2009 08:54:05 +0200 (CEST)
Received: from maude.comedia.it ([127.0.0.1])
	by localhost (maude.comedia.it [127.0.0.1]) (amavisd-new, port 10025)
	with LMTP id D757tFpG9azU for <linux-lvm@redhat.com>;
	Tue,  9 Jun 2009 08:54:05 +0200 (CEST)
Date: Tue, 9 Jun 2009 08:54:05 +0200
From: Luca Berra <bluca@comedia.it>
Subject: Re: [linux-lvm] pvremove won't work
Message-ID: <20090609065405.GB10101@maude.comedia.it>
References: <4A2E0396.4030006@nektulos.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4A2E0396.4030006@nektulos.de>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

On Tue, Jun 09, 2009 at 08:39:18AM +0200, Stefan Radovanovici wrote:
>Hi All, 
>
>I have a LVM over 3 partitions (3 separate disks) and one of them is failing so I need to remove it from the group. I moved the content to the rest of the disks (pvmove) and now pvdisplay shows:
....
>However, I can't remove /dev/sda4 (the partition on the failing disk) from the group: 
>
>root@neriak:~# pvremove /dev/sda4
>  Can't open /dev/sda4 exclusively - not removing. Mounted filesystem?
what is the use of doing pvremove on sda4?? you just rip the disk off
and dump it in the wastebin.

to remove a pv from a vg you use vgreduce, but i assume you already did
that, judging from the pvdisplay.

>I don't see it mounted anywhere. The LVM is also unmounted. Any ideas of what I might be doing wrong ? I am running LVM 2.02.39 on Ubuntu 9.04 64bit

check /sys/block/sda/sda4/holders

-- 
Luca Berra -- bluca@comedia.it
         Communication Media & Services S.r.l.
  /"\
  \ /     ASCII RIBBON CAMPAIGN
   X        AGAINST HTML MAIL
  / \
