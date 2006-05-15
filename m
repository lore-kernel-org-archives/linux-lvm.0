Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4F9GLPb032303
	for <linux-lvm@redhat.com>; Mon, 15 May 2006 05:16:21 -0400
Received: from amsfep11-int.chello.nl (amsfep17-int.chello.nl [213.46.243.15])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4F9GBkk004627
	for <linux-lvm@redhat.com>; Mon, 15 May 2006 05:16:12 -0400
Received: from laguna.nwhq.nl ([213.46.145.128]) by amsfep17-int.chello.nl
	(InterMail vM.6.01.04.04 201-2131-118-104-20050224) with ESMTP
	id <20060515091547.CQTW19426.amsfep17-int.chello.nl@laguna.nwhq.nl>
	for <linux-lvm@redhat.com>; Mon, 15 May 2006 11:15:47 +0200
Received: from [127.0.0.1] (velsatis.nwhq.nl [192.168.100.33])
	by laguna.nwhq.nl (8.13.6/8.13.4) with ESMTP id k4F9Fk3M015317
	for <linux-lvm@redhat.com>; Mon, 15 May 2006 11:15:47 +0200
Message-ID: <4468465F.4000805@neuroweave.nl>
Date: Mon, 15 May 2006 11:14:07 +0200
From: Joep Blom <jlblom@neuroweave.nl>
MIME-Version: 1.0
Subject: Re: [linux-lvm] problem when creating a volumegroup on an external
	drive
References: <44647168.3030205@neuroweave.nl>
	<44647CA0.3010509@redhat.com>	<4464A0BE.7070509@neuroweave.nl>
	<4464A274.3090808@gmx.net>	<44650B76.6070604@neuroweave.nl>	<1147484968.7783.12.camel@localhost.localdomain>	<4465967E.6090206@neuroweave.nl>	<67d53e40605130320t50e4e912lcb2a2ea3d6773bc@mail.gmail.com>	<4467A42B.2020805@neuroweave.nl>
	<67d53e40605150142t6bf71023gab90d82c0eaa4a8a@mail.gmail.com>
In-Reply-To: <67d53e40605150142t6bf71023gab90d82c0eaa4a8a@mail.gmail.com>
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

Markus Laire wrote:

> On 5/15/06, Joep Blom <jlblom@neuroweave.nl> wrote:
>
>> Markus Laire wrote:
>> > pvcreate man-page says that:
>> > <quote>
>> > For *whole disk devices only* the partition table must be erased,
>> > which will effectively destroy all data on that disk. This can be done
>> > by zeroing the first sector with:
>> >  dd if=/dev/zero of=PhysicalVolume bs=512 count=1
>> > </quote>
>> >
>> Thanks, Marcus,
>> I have read that also but pvcreate (lvm2) worked nevertheless. I only
>> have the warning with fdisk that it encounters an "invalid flag 0x000 in
>> partition table 4 which will be corrected with write". So I simply don't
>> use fdisk on that disk and I don't know if this is harmful. But thanks
>> for reminding me.
>
>
> Well, since fdisk is "Partition table manipulator for Linux", you
> clearly shouldn't use it on disks which don't have a partition-table.
> And if you use whole disk for LVM, you don't have any partitions there
> (and shouldn't have partition-table either), and so fdisk is of no use
> for such a disk.
>
I agree.
Joep
