Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j1C0g9O29203
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 19:42:09 -0500
Received: from fe09.axelero.hu (fe09.axelero.hu [195.228.240.97])
	by mx3.redhat.com (8.12.11/8.12.11) with ESMTP id j1C0g2VM009683
	for <linux-lvm@redhat.com>; Fri, 11 Feb 2005 19:42:03 -0500
Received: from fe09 (localhost-02 [127.0.2.1])
	by fe09.axelero.hu (8.12.11/8.12.11) with SMTP id j1C0g296075866
	for <linux-lvm@redhat.com>; Sat, 12 Feb 2005 01:42:02 +0100 (CET)
Received: from sutihome (101.154-183-adsl-pool.axelero.hu [81.183.154.101])
	by fe09.axelero.hu (8.12.11/8.12.11) with SMTP id j1C0g0dE075838
	for <linux-lvm@redhat.com>; Sat, 12 Feb 2005 01:42:02 +0100 (CET)
Message-ID: <000701c5109b$be941c00$0202a8c0@sutihome>
From: "Sutto Zoltan" <sutto.zoltan@rutinsoft.hu>
Subject: Re: [linux-lvm] moving LVM to a new box
Date: Sat, 12 Feb 2005 01:42:34 +0100
MIME-Version: 1.0
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: linux-lvm@redhat.com

>If I suppose you can install and boot you old disk in you new system 
>together with the new disk, >you can do the following (I suppose the old 
>disk is /dev/hda with a /dev/hda1 partition, and new >one /dev/sda with a 
>/dev/sda1 partition, I suppose your volume group is vg0):
>
>make backups ;-)
>
>- pvcreate /dev/sda1
>- vgextend vg0 /dev/sda1
>- move all the lv data with pvmove /dev/hda1.
>- vgreduce vg0 /dev/hda2
>- you will have to configure lilo/grub to install and point on your new 
>disk.
>
>I've done such a way but it was not with lvm2. Maybe there are some pvmove 
>issues with lvm2.
/dev/hda2->/dev/sda2

The new box booted correctly with the old disk.
Loading the necessary modules to be able to access SATA drive (ata_piix.ko).
When I tried to move my PV to a new partition using
pvmove /dev/hda2
I got kernel panic. After reseting I have complitly lost my VG.

What did I wrong?

I forgot to say that my root partition was on the VG I tried to move to the 
new disk.
Did this cause the problem?


Zoltan Sutto

Ps.: Installing/etc...
