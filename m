Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k588qRsW019508
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 04:52:27 -0400
Received: from smtp.real-sec.com (keeper.real-sec.com [213.161.20.70])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k588qPnC010826
	for <linux-lvm@redhat.com>; Thu, 8 Jun 2006 04:52:26 -0400
Received: from smtp.real-sec.com (localhost.localdomain [127.0.0.1])
	by localhost.localdomain (Postfix) with ESMTP id DA988C7DAE
	for <linux-lvm@redhat.com>; Thu,  8 Jun 2006 10:52:24 +0200 (CEST)
Received: from [192.168.10.100] (hal9000.real-sec.com [192.168.10.100])by 
	smtp.real-sec.com (Postfix) with ESMTP id C203DC7CF0for 
	<linux-lvm@redhat.com>; Thu,  8 Jun 2006 10:52:24 +0200 (CEST)
Message-ID: <4487E578.2060202@alienworld.org>
Date: Thu, 08 Jun 2006 10:53:12 +0200
From: Alen Salamun <alien@alienworld.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] Right way to resize LVM Volume on SAN?
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

Hello All!

I have read all the archives, HOWTO etc. but I don't seem to find the 
definitive guide to do it correctly.

My diskspace in Linux is on SAN. The last partition (/dev/sda3) is LVM, 
ext3 and it represents my /home. Now I expanded the SAN volume and I 
would like to add this additional space to this last LVM partition.

I already see larger disk space with fdisk. AFAIK I have now two 
options. Either I create new partition (for example /dev/sda4) and 
pvcreate it and add it to Logical Volume or I can resize existing 
/dev/sda3 since it is the last partition and I can resize it to new end 
sector.

I would prefer resizing existing partition. So I should make backup, 
delete existing partition /dev/sda3. make new partition with new end 
sector and same start sector and do pvresize, lvresize on it right?

Is there any other way to do it? It is after all quite something to 
delete existing live partiton and hope it still work after resize :)

Thank you!
