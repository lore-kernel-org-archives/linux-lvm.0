Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CMOO40025415
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 18:24:24 -0400
Received: from amsfep15-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CMOMPu031239
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 18:24:22 -0400
Received: from laguna.nwhq.nl ([213.46.145.128]) by amsfep15-int.chello.nl
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP
	id <20060512222411.HTUJ1815.amsfep15-int.chello.nl@laguna.nwhq.nl>
	for <linux-lvm@redhat.com>; Sat, 13 May 2006 00:24:11 +0200
Received: from [127.0.0.1] (velsatis.nwhq.nl [192.168.100.33])
	by laguna.nwhq.nl (8.13.6/8.13.4) with ESMTP id k4CMOA6e003158
	for <linux-lvm@redhat.com>; Sat, 13 May 2006 00:24:10 +0200
Message-ID: <44650B76.6070604@neuroweave.nl>
Date: Sat, 13 May 2006 00:25:58 +0200
From: Joep Blom <jlblom@neuroweave.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem when creating a volumegroup on an external
	drive
References: <44647168.3030205@neuroweave.nl>
	<44647CA0.3010509@redhat.com>	<4464A0BE.7070509@neuroweave.nl>
	<4464A274.3090808@gmx.net>
In-Reply-To: <4464A274.3090808@gmx.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

Klaus Strebel wrote:

>Hi Joep,
>
>well, what Patrick meant is, that your system (forget that USB drive in
>this moment) already has a VG called VolGroup00 on your internal disk.
>The modern FC distros use it as default (i think, i'm using SuSE ;-) ).
>Before messing up more using fdisk, just provide us with the output of a
>vgdisplay -a ;-) get an impression of the 'disaster' :-).
>
>Btw. the volume group your wanted to create has the name VG0, not
>VolGroup00 ;-) ..
>
>Ciao
>Klaus
>
>  
>
Klaus & Pattrick,
I'm sorry I asked the wrong question (stupid me!). I interpreted the 
output of vgcreate wrongly. Yes, Klaus, the VolGroup00 was automatically 
created by FC when I did an upgrade.
The correct question is that VG01 (the name I gave it) occupies 232.88 
Gb although I had asked for 250 Gb. Where are the 17.2 GB and can I add 
them to VG01.
When I look with fdisk it says that no information is available for 
/dev/sda1 and "invalid flag 0x0000 of partition table 4 will be 
corrected by w(rite)".
I assume that all problems have arisen due to the fact that I did a 
pvcreate on a disk which has a W95 FAT32 partition ( of 250 Gb).
I assume the best way is to delete the partition completely and create a 
new partition (with parted or fdisk?) or are there better methods? Do I 
have to remove VG01 first?
Please, be lenient to me for these basic questions.
Joep
