Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id k9GIXFB1012144
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 14:33:15 -0400
Received: from jade.aracnet.com (jade.aracnet.com [216.99.193.136])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k9GIXC1j001815
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 14:33:14 -0400
Received: from tinman.seitzassoc.com (helium.seitzassoc.com [216.99.217.243])
	by jade.aracnet.com (8.13.6/8.12.8) with ESMTP id k9GIXBl8015115
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 11:33:11 -0700
Received: from tinman.seitzassoc.com (localhost [127.0.0.1])
	by tinman.seitzassoc.com (Postfix) with ESMTP id C93B1BE8E
	for <linux-lvm@redhat.com>; Mon, 16 Oct 2006 11:33:10 -0700 (PDT)
Subject: Re: [linux-lvm] Boot fails after change of motherboard: No volume
	groups found 
In-Reply-To: Message from Volker Englisch <Volker@englisch.us> 
	of "Wed, 11 Oct 2006 02:36:12 EDT." <452C90DC.1030409@Englisch.us> 
Date: Mon, 16 Oct 2006 11:33:05 -0700
From: Galen Seitz <galens@seitzassoc.com>
Message-Id: <20061016183310.D1DA08F00@tinman.seitzassoc.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: LVM general discussion and development <linux-lvm@redhat.com>

Volker Englisch <Volker@englisch.us> wrote:

> I am running FC4 (with AMD64) and was able to boot the machine without
> problems until Friday when I had to change my motherboard.
> Since then it appears that I'm unable to boot because the system can
> not find my LVM.  I see this error message after grub selected the OS:
>    Red Hat nash version 4.2.15 starting
>       Reading all physical volumes. This may take a while ...
>       No volume groups found
>       Unable to find volume group "VolGroup00"
> 
> and as a result a kernel panic.
> I can start the machine by using the installation disk and boot with
> 'linux rescue' and then I can see my volume and access the data.
> 
> I have two SATA hard drives with a /boot partition and the volume
> group on the first one and the second HDD has just regular partitions:
>    Filesystem                       Size   Used  Avail Use%  Mounted on
>    /dev/mapper/VolGroup00-LogVol04   15G   7.2G   6.4G  54%  /var
>    /dev/mapper/VolGroup00-LogVol03   34G    12G    20G  37%  /backup
>    /dev/mapper/VolGroup00-LogVol00   24G   7.9G    15G  35%  /
>    /dev/sda1                         99M    29M    65M  31%  /boot
>    /dev/sdb3                        138G    18G   113G  14%  /free
>    /dev/mapper/VolGroup00-LogVol02   29G   3.4G    24G  13%  /home
>    /dev/sdb2                         46G   1.2G    43G   3%  /home/public
>    /dev/sdb1                         46G   706M    43G   2%  /home/mail
> 
> 
> Why would the boot process not find my volume group but does when I'm
> starting the OS with the rescue disk (or Knoppix)?

Does your new motherboard use a different SATA controller?  Perhaps
your initrd doesn't have the proper driver.

galen
