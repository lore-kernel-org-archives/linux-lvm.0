Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.12.11.20060308/8.12.11) with ESMTP id
	k4VCYYrV023369
	for <linux-lvm@redhat.com>; Wed, 31 May 2006 08:34:34 -0400
Received: from mail.gmx.net (mail.gmx.de [213.165.64.20])
	by mx1.redhat.com (8.12.11.20060308/8.12.11) with SMTP id
	k4VCYVUP018048
	for <linux-lvm@redhat.com>; Wed, 31 May 2006 08:34:31 -0400
Date: Wed, 31 May 2006 14:34:04 +0200
From: chris <cspot@gmx.at>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <optae062jz51dxvh@notebook_chl.intern>
Subject: [linux-lvm] rescue data after hd crash
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
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: linux-lvm@redhat.com

hi all!

sorry if this is a double post, but i think the first post didn't succeed  
due to some registration race condition.

so here's my problem:

I have create a volume group with 4 250GByte harddisks with an ext3 file  
system on the 1TB result.

now the third harddisk failed and the volume group is "dead" - obviously.

lvscan tells me (like any other lv*, pv* command):
   Couldn't find device with uuid 'A57CS6-SFlw-1ROR-uIvO-cX2o-OE2g-N3SVZN'.
   Couldn't find all physical volumes for volume group media_volgrp.

in my understanding many of the files should still be intact (those on the  
first two disks), and I would like to rescue these files.

i found no hints about such a crash recovery.
(checked http://www.tldp.org/HOWTO/LVM-HOWTO/)

my approach would be to "fake" the third disk, as see what the filesystem  
makes out of it.

any help is welcome.

thanks, chris
