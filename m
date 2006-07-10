Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k6AE1al3023290
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 10:01:36 -0400
Received: from smtp3.marviq.com (smtp3.marviq.com [80.248.35.20])
	by mx3.redhat.com (8.13.1/8.13.1) with ESMTP id k6AE1TbM015183
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 10:01:29 -0400
Received: from owa.xb.nl (unknown [10.0.56.10])
	by smtp3.marviq.com (Postfix) with ESMTP id 93B6F940BB
	for <linux-lvm@redhat.com>; Mon, 10 Jul 2006 16:01:28 +0200 (CEST)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Date: Mon, 10 Jul 2006 16:01:27 +0200
Message-ID: <32F72C4D4D0EC8458CA5BFD76A6D6C680ACF39D0@gimli.xb.local>
From: "Shaun Mccullagh" <Shaun.Mccullagh@xb.nl>
Content-Transfer-Encoding: 8bit
Subject: [linux-lvm] Copying LVM from one system to another
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
To: linux-lvm@redhat.com

Hi,

I would like to copy an entire volume group to another PC with identical
hardware and the same disc config.

I would like to do this using a method like this:

Boot destination PC from a USB stick with a full copy of RH ES v4 on it.

Create a Volume Group and all necessary Logical Volumes etc on
destination hard discs so that they are the same sizes as on the source.
All the filesystems associated with these logical volumes will be mount
under /restore.

Restore all the data that was on the source to the destination to
/restore.

Note that /restore/boot is a small primary partition.

Once I have done this, do I copy /etc/lvm to /restore/etc/lvm, and then
chroot /restore, then do vgscan? Finally label the discs, exec grub,
then reboot

I guess the last bit is wrong?

TIA

Shaun





Op dit e-mailbericht is een disclaimer van toepassing, welke te vinden is op http://www.xb.nl/disclaimer.html
