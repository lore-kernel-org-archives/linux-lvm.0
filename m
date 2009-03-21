Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id n2L2ucft011861
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2009 22:56:38 -0400
Received: from fep7.cogeco.net (smtp2.cogeco.ca [216.221.81.29])
	by mx1.redhat.com (8.13.8/8.13.8) with ESMTP id n2L2uARL005959
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2009 22:56:11 -0400
Received: from stevePC (136-250.tr.cgocable.ca [24.122.136.250])
	by fep7.cogeco.net (Postfix) with SMTP id 67CE32063
	for <linux-lvm@redhat.com>; Fri, 20 Mar 2009 22:56:10 -0400 (EDT)
Message-ID: <3068401C6DAE4922843F9D70AAB8B915@stevePC>
From: "Steve Lavoie" <steve.lavoie@tr.cgocable.ca>
Date: Fri, 20 Mar 2009 22:56:02 -0400
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Mounting lvm partition
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

Hi!

Here what I did:
Created VG (vg0) and LV (testntfs)
Share them using Iscsi Enterprise target.
Connect to them using my Windows PC and created NTFS fileystem on it.

Stop Iscsi Enterprise target.

Now I am trying to mount this partition on the Linux system.

Here what is happening when I tried to mount it.

zabbix:/etc# mount -t ntfs-3g /dev/vg0/testntfs /mnt
NTFS signature is missing.
Failed to mount '/dev/mapper/vg0-testntfs': Invalid argument
The device '/dev/mapper/vg0-testntfs' doesn't have a valid NTFS.
Maybe you selected the wrong device? Or the whole disk instead of a
partition (e.g. /dev/hda, not /dev/hda1)? Or the other way around?

I retried but instead of creating a NTFS FS, I formatted using FAT32

zabbix:/etc# mount -t vfat /dev/vg0/testntfs /mnt
mount: wrong fs type, bad option, bad superblock on 
/dev/mapper/vg0-testntfs,
       missing codepage or helper program, or other error
       In some cases useful info is found in syslog - try
       dmesg | tail  or so


I need to access this data for some backup purpose. Any idea?

Steve Lavoie
IT Consultant, MCP, A+, Network+, Linux+, VCP
