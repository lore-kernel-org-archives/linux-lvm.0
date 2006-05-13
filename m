Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4DAKABh021864
	for <linux-lvm@redhat.com>; Sat, 13 May 2006 06:20:10 -0400
Received: from ug-out-1314.google.com (ug-out-1314.google.com [66.249.92.171])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k4DAK3Eh005022
	for <linux-lvm@redhat.com>; Sat, 13 May 2006 06:20:03 -0400
Received: by ug-out-1314.google.com with SMTP id c2so498377ugf
	for <linux-lvm@redhat.com>; Sat, 13 May 2006 03:20:03 -0700 (PDT)
Message-ID: <67d53e40605130320t50e4e912lcb2a2ea3d6773bc@mail.gmail.com>
Date: Sat, 13 May 2006 13:20:03 +0300
From: "Markus Laire" <malaire@gmail.com>
Subject: Re: [linux-lvm] problem when creating a volumegroup on an external
	drive
In-Reply-To: <4465967E.6090206@neuroweave.nl>
MIME-Version: 1.0
Content-Disposition: inline
References: <44647168.3030205@neuroweave.nl> <44647CA0.3010509@redhat.com>
	<4464A0BE.7070509@neuroweave.nl> <4464A274.3090808@gmx.net>
	<44650B76.6070604@neuroweave.nl>
	<1147484968.7783.12.camel@localhost.localdomain>
	<4465967E.6090206@neuroweave.nl>
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
Cc: mingz@ele.uri.edu

On 5/13/06, Joep Blom <jlblom@neuroweave.nl> wrote:
> One last question: Why can't  I use "pvcreate /dev/sda" but have to use
> "pvcreate /dev/sda1" (as the LV HOW-TO stated the former).
> Hope you can help me out with this as well.

pvcreate man-page says that:
<quote>
For *whole disk devices only* the partition table must be erased,
which will effectively destroy all data on that disk. This can be done
by zeroing the first sector with:
  dd if=/dev/zero of=PhysicalVolume bs=512 count=1
</quote>

-- 
Markus Laire
