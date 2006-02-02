Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id k12N6k125894
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 18:06:46 -0500
Received: from mail.silentmedia.com (fire.silentmedia.com [216.254.19.118])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k12N6bX1010278
	for <linux-lvm@redhat.com>; Thu, 2 Feb 2006 18:06:37 -0500
Received: from unknown (HELO babylon) (bench.silentmedia@[10.5.5.254])
	(envelope-sender <bench@silentmedia.com>)
	by 0 (qmail-ldap-1.03) with SMTP
	for <linux-lvm@redhat.com>; 2 Feb 2006 23:06:32 -0000
Date: Thu, 2 Feb 2006 15:06:31 -0800 (PST)
From: Ben <bench@silentmedia.com>
Message-ID: <Pine.LNX.4.64.0602021457070.1276@localhost.localdomain>
MIME-Version: 1.0
Subject: [linux-lvm] Expanding volume groups to fill a growing disk
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

I'm new to LVM, so maybe I'm missing something basic, but it seems like LVM2 
makes it difficult to expand a VG. Or rather, it's easy if you want to just add 
another disk to the group, but I have a hardware RAID card that supports online 
expansion, and I'd like to use it.

Basically, I'm looking for a way to tell LVM "I know I partioned you on 
/dev/sda2 to be 500GB; now that I've expanded the disk with the raid card, I 
want to expand that volume group to fill the new space."

Do I have to use fdisk to make a new partition, and then use pvcreate followed 
by vgextend? That sounds like it would work, but it seems like there should be a 
cleaner way.
