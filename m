Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4ELeW5n005281
	for <linux-lvm@redhat.com>; Sun, 14 May 2006 17:40:32 -0400
Received: from amsfep17-int.chello.nl (amsfep19-int.chello.nl [213.46.243.16])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4ELeRqo018724
	for <linux-lvm@redhat.com>; Sun, 14 May 2006 17:40:30 -0400
Message-ID: <4467A42B.2020805@neuroweave.nl>
Date: Sun, 14 May 2006 23:42:03 +0200
From: Joep Blom <jlblom@neuroweave.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem when creating a volumegroup on an external
	drive
References: <44647168.3030205@neuroweave.nl>
	<44647CA0.3010509@redhat.com>	<4464A0BE.7070509@neuroweave.nl>
	<4464A274.3090808@gmx.net>	<44650B76.6070604@neuroweave.nl>	<1147484968.7783.12.camel@localhost.localdomain>	<4465967E.6090206@neuroweave.nl>
	<67d53e40605130320t50e4e912lcb2a2ea3d6773bc@mail.gmail.com>
In-Reply-To: <67d53e40605130320t50e4e912lcb2a2ea3d6773bc@mail.gmail.com>
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
Cc: mingz@ele.uri.edu

Markus Laire wrote:

> On 5/13/06, Joep Blom <jlblom@neuroweave.nl> wrote:
>
>> One last question: Why can't  I use "pvcreate /dev/sda" but have to use
>> "pvcreate /dev/sda1" (as the LV HOW-TO stated the former).
>> Hope you can help me out with this as well.
>
>
> pvcreate man-page says that:
> <quote>
> For *whole disk devices only* the partition table must be erased,
> which will effectively destroy all data on that disk. This can be done
> by zeroing the first sector with:
>  dd if=/dev/zero of=PhysicalVolume bs=512 count=1
> </quote>
>
Thanks, Marcus,
I have read that also but pvcreate (lvm2) worked nevertheless. I only 
have the warning with fdisk that it encounters an "invalid flag 0x000 in 
partition table 4 which will be corrected with write". So I simply don't 
use fdisk on that disk and I don't know if this is harmful. But thanks 
for reminding me.
Joep
