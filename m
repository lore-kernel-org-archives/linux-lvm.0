Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k9DIlcF1026436
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 14:47:38 -0400
Received: from java-cup.de (h7339.serverkompetenz.net [81.169.183.84])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9DIlarL027417
	for <linux-lvm@redhat.com>; Fri, 13 Oct 2006 14:47:37 -0400
From: Martin Wilmes <martin.wilmes@java-cup.de>
Subject: Re: [linux-lvm] Broken hard disk
Date: Fri, 13 Oct 2006 20:46:12 +0200
References: <200610122350.46609.martin.wilmes@java-cup.de>
	<200610130553.24145.martin.wilmes@java-cup.de>
	<452FBFCE.9030204@redhat.com>
In-Reply-To: <452FBFCE.9030204@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200610132046.17181.martin.wilmes@java-cup.de>
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
Content-Type: text/plain; charset="us-ascii"
Cc: LVM general discussion and development <linux-lvm@redhat.com>

On Friday, 13. October 2006 18:33, Bryn M. Reeves wrote:
> Martin Wilmes wrote:
> > On Friday, 13. October 2006 00:53, Bryn M. Reeves wrote:

> > ...

> >         Closed /dev/hda1
> >         /dev/loop1: Skipping (sysfs)
> >         /dev/cloop1: Skipping: Unrecognised LVM device type 240
> > ...
>
> What about hda2? According to your fdisk output, that's the PV on this
> disk.

Sorry, that was really silly.

> Does hda2 appear in /proc/partitions?

Yes, it does.

> >> It'd also be good to see what pvscan shows, for e.g.:
> >
> > pvscan -vvv outputs:
>
> Likewise - all I can see here is hda1 - that's a type 0x83 (Linux)
> partition, rather than the 0x8e (Linux LVM) partition that we're
> interested in here.
>
> Can you put the complete output of vgscan -vvv and pvscan -vvv somewhere
> on the web and post the links here?

Here are the links:

http://java-cup.de/~wilmes/lvm/pvscan.txt
http://java-cup.de/~wilmes/lvm/vgscan.txt

Thanks again for your patience.
Martin
