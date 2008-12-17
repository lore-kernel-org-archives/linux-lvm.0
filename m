Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id mBHFR2TY021720
	for <linux-lvm@redhat.com>; Wed, 17 Dec 2008 10:27:02 -0500
Received: from zimbra.megabit.net (karfire.megabit.net [213.164.139.67])
	by mx3.redhat.com (8.13.8/8.13.8) with ESMTP id mBHFQgVV004392
	for <linux-lvm@redhat.com>; Wed, 17 Dec 2008 10:26:43 -0500
Received: from zimbra.megabit.net (localhost [127.0.0.1])
	by zimbra.megabit.net (Postfix) with ESMTP id 023A41DC03A
	for <linux-lvm@redhat.com>; Wed, 17 Dec 2008 15:26:47 +0000 (UTC)
Date: Wed, 17 Dec 2008 15:26:46 +0000 (UTC)
From: Rudolph Bott <rb@megabit.net>
Message-ID: <26617199.341229527604820.JavaMail.rudi@toronto>
In-Reply-To: <8251455.241229524675229.JavaMail.rudi@toronto>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] LVM / 3ware performance
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
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

Hi list,

I know this has been a topic on this and other lists before but I couldn't find a solution to my problem. I'lve already contacted 3ware support and I'm waiting for an answer from their site (but maybe someone comes up with a quick solution here).

My setup:

Hardware: Xeon Quad Core, Intel Mainboard, 2GB RAM, 3ware 9560SE PCI-Express, 4x 1TB WD Disks, RAID-10 Array

Software: Ubuntu Hardy LTS, Kernel 2.6.26

When I create an ext3 FS directly on the RAID array (/dev/sda1) I get write speeds at ~95MB/sec and read speeds at ~390MB/sec. But when I add LVM into the mix, write speed drops down to 39MB/sec (all tested with dd + /dev/zero or /dev/null). After some research I found out that this might be related to bad performance of the 3ware driver with non-4K blocksizes:

blockdev --getbsz /dev/sda1
4096

blockdev --getbsz /dev/sda3
512

sda1 is formatted with ext3, sda3 acts as the physical volume for LVM. Is there any way to change the blocksize of an LVM PV or does anyone know if theres a way to tweak the 3ware driver to handle 512-Byte blocksizes better than it does now?

Mit freundlichen Grüßen / with kind regards

Rudolph Bott
-- 
Megabit Informationstechnik GmbH
Karstr.25  41068 Moenchengladbach  Tel:02161/30898-0  Fax:-18
AG MG HRB 10141, GF: Dipl.-Ing. Thomas Tillig, Michael Benten 
