Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id l0BCuO8L017377
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 07:56:24 -0500
Received: from smtp-s6.antel.net.uy (smtp-s6.antel.net.uy [200.40.30.235])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	l0BCuN8h030850
	for <linux-lvm@redhat.com>; Thu, 11 Jan 2007 07:56:23 -0500
Received: from [192.168.0.16] (200.40.82.186) by smtp-s6.antel.net.uy
	(7.2.072.1) (authenticated as arle)
	id 4550C09002CBD9D1 for linux-lvm@redhat.com;
	Thu, 11 Jan 2007 10:14:14 -0200
Message-ID: <45A637F1.5040508@adinet.com.uy>
Date: Thu, 11 Jan 2007 10:13:21 -0300
From: =?UTF-8?B?QXJsZXF1w61u?= <arle@adinet.com.uy>
MIME-Version: 1.0
Subject: [SOLVERD] Re: [linux-lvm] fsck.ext3 truncates boot sequence
References: <45A5194D.5070501@adinet.com.uy>
In-Reply-To: <45A5194D.5070501@adinet.com.uy>
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

El 10/01/2007 13:50, Arlequín escribió :
> Hello, list.
> 
> I've a LVM working OK. I plugged an externar USB harddisk and Linux 
> emulates SCSCI, so it is seen as /dev/sdc1
> 
> I formated it as ext3 and the added it as a new Physical Volume in order 
> to gaim more disk space. Then, create a new logical volume, say 
> <LOGICAL_VOLUME_**new**> and was up'n'running OK.
> 
> I assume that the USB device is recognized before LVM mount, since the 
> boot sequence:
> 
>   Setting up LVM Volume Groups ...done
>   Starting Enterprise Volume Management System ...done
>   Checking all file systems
> 
>      fsck.ext3 Bad magic number in super-block while trying to open
> /dev/sdc1
> 
>      the superblock could not be read or does not describe a correct
> ext2 filesystem. if the device is valid and it really contains an ext2
> filesystem (and not swap ou ufs or something else), then the superblock
> is corrupt, and you might try running e2fsck with an alternate superblock:
> e2fsck - 8193 <device>
> 
> /dev/<VOLUME_GROUP>/<LOGICAL_VOLUME_**new**> clean
> 
>    fsck failed Please repair manually
> 
> 
> Freezes there and only can continue starting the system using Ctrl+D.
> Please note that after that the system works just fine, LVM & USB device 
> included.
> 
> Tried to run fsck.ext on that parition and says it's clean.
> 
> What am I missing to solve?
> How can I avoid the boot sequence being stopped?
> 
> Thanks in advance. Cheers.

Removing the line which mounted the USB device from /etc/fstab did the 
trick.

Used to be:
# External USB disk
/dev/sdc1       /mnt/usb        ext3    defaults        1       2
#LABEL=/mnt/usb   /mnt/usb      ext3    defaults        1       2
# External USB disk as LVM Volume '**new**'
/dev/<VOLUME_GROUP>/<LOGICAL_VOLUME_**new**>  /mount/point  ext3 
suid,dev,exec  0  2


Commenting the line
#/dev/sdc1       /mnt/usb        ext3    defaults        1       2

solved it! :)
-- 
Arlequín                         _o)
arle_AT_adinet_DOT_com_DOT_uy    / \\
http://counter.li.org/         _(___V
Linux Registered User          #207262
