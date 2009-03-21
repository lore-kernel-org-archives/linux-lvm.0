Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2L6c3rd029566
	for <linux-lvm@redhat.com>; Sat, 21 Mar 2009 02:38:03 -0400
Received: from mail.knebb.de (mail.knebb.de [83.137.99.149])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id n2L6bgSU020154
	for <linux-lvm@redhat.com>; Sat, 21 Mar 2009 02:37:43 -0400
Received: from tp.knebb.de (i5DB520F3.pool.tripleplugandplay.com
	[93.181.32.243])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.knebb.de (Postfix) with ESMTP id 7079370123
	for <linux-lvm@redhat.com>; Sat, 21 Mar 2009 07:39:43 +0100 (CET)
Message-ID: <49C48B34.2020603@knebb.de>
Date: Sat, 21 Mar 2009 07:37:40 +0100
From: =?ISO-8859-1?Q?Christian_V=F6lker?= <chrischan@knebb.de>
MIME-Version: 1.0
Subject: Re: [linux-lvm] Mounting lvm partition
References: <3068401C6DAE4922843F9D70AAB8B915@stevePC>
In-Reply-To: <3068401C6DAE4922843F9D70AAB8B915@stevePC>
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Steve Lavoie schrieb:
Windows usually creates partitions on an available disk. So I'd try to use
> zabbix:/etc# mount -t ntfs-3g /dev/vg0/testntfs1 /mnt (with the
appended "1" for the partition).

Greetings

Christian


> Hi!
> 
> Here what I did:
> Created VG (vg0) and LV (testntfs)
> Share them using Iscsi Enterprise target.
> Connect to them using my Windows PC and created NTFS fileystem on it.
> 
> Stop Iscsi Enterprise target.
> 
> Now I am trying to mount this partition on the Linux system.
> 
> Here what is happening when I tried to mount it.
> 
> zabbix:/etc# mount -t ntfs-3g /dev/vg0/testntfs /mnt
> NTFS signature is missing.
> Failed to mount '/dev/mapper/vg0-testntfs': Invalid argument
> The device '/dev/mapper/vg0-testntfs' doesn't have a valid NTFS.
> Maybe you selected the wrong device? Or the whole disk instead of a
> partition (e.g. /dev/hda, not /dev/hda1)? Or the other way around?
> 
> I retried but instead of creating a NTFS FS, I formatted using FAT32
> 
> zabbix:/etc# mount -t vfat /dev/vg0/testntfs /mnt
> mount: wrong fs type, bad option, bad superblock on
> /dev/mapper/vg0-testntfs,
>       missing codepage or helper program, or other error
>       In some cases useful info is found in syslog - try
>       dmesg | tail  or so
> 
> 
> I need to access this data for some backup purpose. Any idea?
> 
> Steve Lavoie
> IT Consultant, MCP, A+, Network+, Linux+, VCP
> 
> 
> _______________________________________________
> linux-lvm mailing list
> linux-lvm@redhat.com
> https://www.redhat.com/mailman/listinfo/linux-lvm
> read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
> 
