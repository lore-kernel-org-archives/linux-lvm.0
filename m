Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.13.1/8.13.1) with ESMTP id kBBGXhWF032414
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 11:33:43 -0500
Received: from tornado.virtua.ch (tornado.virtua.ch [217.119.144.130])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	kBBGXg9M014671
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 11:33:42 -0500
Received: from tornado.virtua.ch (localhost.localdomain [127.0.0.1])
	by tornado.virtua.ch (Postfix) with ESMTP id 0EB1B2D2A1F
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 17:33:40 +0100 (CET)
Received: from albator.aubonne.virtua.ch (albator.aubonne.virtua.ch
	[192.168.1.2])
	by tornado.virtua.ch (Postfix) with ESMTP id EC8152D29F2
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 17:33:39 +0100 (CET)
Received: from [192.168.1.30] (unknown [192.168.1.30])
	by albator.aubonne.virtua.ch (Postfix) with ESMTP id DA40473539
	for <linux-lvm@redhat.com>; Mon, 11 Dec 2006 17:33:39 +0100 (CET)
Message-ID: <457D8863.1020801@virtua.ch>
Date: Mon, 11 Dec 2006 17:33:39 +0100
From: Jean Chiappini <Jean.Chiappini@virtua.ch>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: [linux-lvm] EXT3-fs: unable to read superblock
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

Hello all,

I have a server production with centos 4 with kernel 2.6.9-42 and 
lvm2-2.02.06 installed. All was working find, but today the server 
crashed. When I would reboot my server, I saw in the log that the lvm 
partiton wouldn't mount. This is the error -> kernel: EXT3-fs: unable to 
read superblock.

If I try to mount manually the partition, these errors appears :

the superblock could not be read or does not describe a correct ext2 
filesystem. if the device is valid and it really contains an ext2 
filesystem (and not swap or ufs or something else), then the superblock 
is corrupt, and you might try running e2fsck with an alterate superblock:

I don't understand these errors, my partition if formated in ext3...

Someone could help me please ???

Regards

Jean
