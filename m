Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i6LCQFa25230
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 08:26:15 -0400
Received: from smtp.mailbox.co.uk (smtp.mailbox.net.uk [195.82.125.32])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i6LCQ9Xn015458
	for <linux-lvm@redhat.com>; Wed, 21 Jul 2004 08:26:09 -0400
Received: from core.penguinpowered.org ([212.18.250.170]
	helo=smtp.penguinpowered.org)
	by smtp.mailbox.co.uk with esmtp (Exim 4.30) id 1BnGAi-0002VG-T0
	for linux-lvm@redhat.com; Wed, 21 Jul 2004 13:26:08 +0100
Received: from localhost ([127.0.0.1] helo=webmail.penguinpowered.org)
	by smtp.penguinpowered.org with smtp (Exim 4.30; FreeBSD)
	id 1BnG7Z-00032N-FX
	for linux-lvm@redhat.com; Wed, 21 Jul 2004 13:22:53 +0100
Message-ID: <39112.195.50.100.20.1090412573.squirrel@webmail.penguinpowered.org>
Date: Wed, 21 Jul 2004 13:22:53 +0100 (BST)
From: "Wayne Pascoe" <lists-june2004@penguinpowered.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Raid 0+1
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
Content-Type: text/plain; charset="us-ascii"
To: linux-lvm@redhat.com

Hi all,

I am working on a project to evaluate LVM2 against Veritas Volume
Manager for a new Linux deployment. I am trying to get a Raid 0+1
solution working and I'm struggling.

So far, this is where I am:

1. I created 8GB partitions on 4 disks, sdb, sdc, sdd and sde, and set
their partition types to 8e with fdisk

2. I then ran vgscan, follwed by pvcreate /dev/sdb1, /dev/sdc1,
/dev/sdd1, /dev/sde1

3. Next, I created 2 volume groups as follows:
vgcreate StripedData1 /dev/sdb1 /dev/sdc1
vgcreate StripedData2 /dev/sdd1 /dev/sde1

4. Next, I created 2 volumes, one in each group as follows:
lvcreate -i 2 -I 64 -n Data1 -L 6G StripedData1
lvcreate -i 2 -I 64 -n Data2 -L 6G StripedData2
Now I have 2 striped volumes, but no redundancy. This is where I think
things start to go wrong.

5. I now create a raid device, /dev/md0 consisting of these two
volumes. I run mkraid on this, create a file system, and mount it on
/Data1. This all works fine, and I have a 6GB filesystem on /Data1

Now I need to be able to resize this whole solution, and I'm not sure
if the way I've built it caters for what I need to do...

I unmount /Data1 and use lvextend to extend the 2 volumes from 6GB to
7.5GB. This succeeds. Now even though both of the volumes that make up
/dev/md0 are extended, I cannot resize /dev/md0 using resize2fs
/dev/md0

Can anyone advise me how I can achieve what I'm looking for here ? I'm
guessing maybe I did things the wrong way around, but I can't find a
solution that will give me both striping and mirroring :(

Thanks in advance,


-- 
Wayne Pascoe
