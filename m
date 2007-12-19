Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id lBJFix2m009798
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 10:44:59 -0500
Received: from smtp8-g19.free.fr (smtp8-g19.free.fr [212.27.42.65])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id lBJFiLEt010305
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 10:44:22 -0500
Received: from smtp8-g19.free.fr (localhost [127.0.0.1])
	by smtp8-g19.free.fr (Postfix) with ESMTP id 9ADA617F576
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 16:44:21 +0100 (CET)
Received: from imp6-g19.free.fr (imp6-g19.free.fr [212.27.42.6])
	by smtp8-g19.free.fr (Postfix) with ESMTP id 8C55917F53F
	for <linux-lvm@redhat.com>; Wed, 19 Dec 2007 16:44:21 +0100 (CET)
Message-ID: <1198079061.47693c5531ded@imp.free.fr>
Date: Wed, 19 Dec 2007 16:44:21 +0100
From: Georges Giralt <georges.giralt@free.fr>
Subject: RE: [linux-lvm] won't dual boot: 2 disks and LVM
References: <1197988092.29413.77.camel@veri.phy.umist.ac.uk><7C6C00FDABF70949A0A5D4DD8A4DC2170474A353@CORPUSMX20A.corp.emc.com><1198010286.6637.10.camel@amd64.local><7C6C00FDABF70949A0A5D4DD8A4DC2170474A356@CORPUSMX20A.corp.emc.com><1198058368.3859.10.camel@amd64.local><1198059645.4768f07d37201@imp.free.fr>
	<1198059909.3859.21.camel@amd64.local>
	<7C6C00FDABF70949A0A5D4DD8A4DC2170474A35A@CORPUSMX20A.corp.emc.com>
In-Reply-To: <7C6C00FDABF70949A0A5D4DD8A4DC2170474A35A@CORPUSMX20A.corp.emc.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
To: LVM general discussion and development <linux-lvm@redhat.com>

Selon pham_cuong@emc.com:

>  Instead of discussing back and forth w/o real data to discuss/explore with
> concrete evidences, could you:
>
> A. Post the content of both the grub.conf and boot.ini files
...........Heavilly snipped.................
Hi Pham !
I think this is not totally sufficient.
You have to check the BIOS to see how and in what order it sees the disks.
Some Bioses have a strange behavior especially when you have a SCSI card or USB
disks.
On my Mobo, if I plug a Sata drive, the first master IDE came in third position,
right after the sata disk and the SCSI DVDrom which is still lugged on. Do not
ask me why it sees this as a disk (and even if there is nothing into it).
So I admire the Grub people as they've made a terrific job ;-)
-- 
