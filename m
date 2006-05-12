Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CEoJp1012275
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 10:50:19 -0400
Received: from amsfep18-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4CEoH7Y000576
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 10:50:18 -0400
Received: from laguna.nwhq.nl ([213.46.145.128]) by amsfep17-int.chello.nl
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP
	id <20060512144850.CVPS19426.amsfep17-int.chello.nl@laguna.nwhq.nl>
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 16:48:50 +0200
Received: from [127.0.0.1] (velsatis.nwhq.nl [192.168.100.33])
	by laguna.nwhq.nl (8.13.6/8.13.4) with ESMTP id k4CEmnx9000840
	for <linux-lvm@redhat.com>; Fri, 12 May 2006 16:48:50 +0200
Message-ID: <4464A0BE.7070509@neuroweave.nl>
Date: Fri, 12 May 2006 16:50:38 +0200
From: Joep Blom <jlblom@neuroweave.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem when creating a volumegroup on an external
	drive
References: <44647168.3030205@neuroweave.nl> <44647CA0.3010509@redhat.com>
In-Reply-To: <44647CA0.3010509@redhat.com>
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

Patrick Caulfield wrote:

>Joep Blom wrote:
>  
>
>>Hi,
>>I'm new to the list and new to the use of LVM. I have read the manuals
>>(which mainly are for LVM1) and am using LVM2.
>>I have one question. I just created a new volumegroup on an USB external
>>disk.
>>
>>    
>>
>
>
>It's fantastically unlikely that a single 'vgcreate VG0' command would create
>two VGs.
>
>What is much more likely is that VolGroup00 already existed and you just
>didn't notice it. That's the default name for a volume group created by a
>Fedora install BTW
>
>patrick
>
>_______________________________________________
>linux-lvm mailing list
>linux-lvm@redhat.com
>https://www.redhat.com/mailman/listinfo/linux-lvm
>read the LVM HOW-TO at http://tldp.org/HOWTO/LVM-HOWTO/
>
>  
>
Patrick,
Thanks for the quick reply. However, this is external USB disk (250Gb 
and I just added it to the system as a backup disk. FC5 was running and 
before I did anything the disk was formatted as a FAT32 disk I then did 
a pvcreate. When I checked the disk was empty (as was expected). The 
vgcreate did the strange thing, which is a problem as I cant remove this 
VolGroup00 as there exists one on the other (2) disks and when I asses 
VolGroup00 it rightly goes to the original VolGroup00, which I cannot 
delete.
I think the only solution is fdisk and see if it will free the whole 
disk. But any other ideas?
Joep
