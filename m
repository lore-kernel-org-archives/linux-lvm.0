Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4F8glQa026482
	for <linux-lvm@redhat.com>; Mon, 15 May 2006 04:42:47 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.175])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4F8gddE028692
	for <linux-lvm@redhat.com>; Mon, 15 May 2006 04:42:39 -0400
Received: by ug-out-1314.google.com with SMTP id c2so734942ugf
	for <linux-lvm@redhat.com>; Mon, 15 May 2006 01:42:39 -0700 (PDT)
Message-ID: <67d53e40605150142t6bf71023gab90d82c0eaa4a8a@mail.gmail.com>
Date: Mon, 15 May 2006 11:42:39 +0300
From: "Markus Laire" <malaire@gmail.com>
Subject: Re: [linux-lvm] problem when creating a volumegroup on an external
	drive
In-Reply-To: <4467A42B.2020805@neuroweave.nl>
MIME-Version: 1.0
Content-Disposition: inline
References: <44647168.3030205@neuroweave.nl> <44647CA0.3010509@redhat.com>
	<4464A0BE.7070509@neuroweave.nl> <4464A274.3090808@gmx.net>
	<44650B76.6070604@neuroweave.nl>
	<1147484968.7783.12.camel@localhost.localdomain>
	<4465967E.6090206@neuroweave.nl>
	<67d53e40605130320t50e4e912lcb2a2ea3d6773bc@mail.gmail.com>
	<4467A42B.2020805@neuroweave.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: LVM general discussion and development <linux-lvm@redhat.com>

On 5/15/06, Joep Blom <jlblom@neuroweave.nl> wrote:
> Markus Laire wrote:
> > pvcreate man-page says that:
> > <quote>
> > For *whole disk devices only* the partition table must be erased,
> > which will effectively destroy all data on that disk. This can be done
> > by zeroing the first sector with:
> >  dd if=/dev/zero of=PhysicalVolume bs=512 count=1
> > </quote>
> >
> Thanks, Marcus,
> I have read that also but pvcreate (lvm2) worked nevertheless. I only
> have the warning with fdisk that it encounters an "invalid flag 0x000 in
> partition table 4 which will be corrected with write". So I simply don't
> use fdisk on that disk and I don't know if this is harmful. But thanks
> for reminding me.

Well, since fdisk is "Partition table manipulator for Linux", you
clearly shouldn't use it on disks which don't have a partition-table.
And if you use whole disk for LVM, you don't have any partitions there
(and shouldn't have partition-table either), and so fdisk is of no use
for such a disk.

-- 
Markus Laire
