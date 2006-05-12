Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CBR0XL026315
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 07:27:00 -0400
Received: from amsfep12-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CBQvSc024143
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 07:26:58 -0400
Received: from laguna.nwhq.nl ([213.46.145.128]) by amsfep12-int.chello.nl
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP
	id <20060512112651.RNPA15576.amsfep12-int.chello.nl@laguna.nwhq.nl>
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 13:26:51 +0200
Received: from [127.0.0.1] (velsatis.nwhq.nl [192.168.100.33])
	by laguna.nwhq.nl (8.13.6/8.13.4) with ESMTP id k4CBQoXD032285
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 13:26:51 +0200
Message-ID: <44647168.3030205@neuroweave.nl>
Date: Fri, 12 May 2006 13:28:40 +0200
From: Joep Blom <jlblom@neuroweave.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] problem when creating a volumegroup on an external drive
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
To: linux-lvm@redhat.com

Hi,
I'm new to the list and new to the use of LVM. I have read the manuals 
(which mainly are for LVM1) and am using LVM2.
I have one question. I just created a new volumegroup on an USB external 
disk.
As the manual says I did : pvcreate /dev/sda but that did't work but 
pvcreate /dev/sda1 worked.
I then did a vgcreate VG01, expecting to get one volume group for the 
whole disk (250 GB). However, it created 2 volumegroups, one named 
VolGroup00  of 46.6 GB and one VG01 (as expected) of 232.8 GB. The 
problem is I have on another 2 disks already a VolGroup00 so I cannot do 
an lvcreate VolGroup00 as this will try to access the earlier created one.
Can anybody explain why an unrequested volumegroup is created and how 
can I solve this.
I cannot do a vgdelete VolGroup00 as this will destroy my current - 
working - system.
Hope somebody knows the answers.
Thanks
Joep
