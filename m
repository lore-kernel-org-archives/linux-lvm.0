Received: from mx3.redhat.com (mx3.redhat.com [172.16.48.32])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id i59EQ9022779
	for <linux-lvm@redhat.com>; Wed, 9 Jun 2004 10:26:09 -0400
Received: from main.gmane.org (main.gmane.org [80.91.224.249])
	by mx3.redhat.com (8.12.10/8.12.10) with ESMTP id i59EQ4Xn006959
	for <linux-lvm@redhat.com>; Wed, 9 Jun 2004 10:26:04 -0400
Received: from list by main.gmane.org with local (Exim 3.35 #1 (Debian))
	id 1BY41j-0005le-00
	for <linux-lvm@redhat.com>; Wed, 09 Jun 2004 16:26:03 +0200
Received: from d66-183-199-238.bchsia.telus.net ([66.183.199.238])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 09 Jun 2004 16:26:03 +0200
Received: from dspear99ca by d66-183-199-238.bchsia.telus.net with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-lvm@redhat.com>; Wed, 09 Jun 2004 16:26:03 +0200
From: David Spear <dspear99ca@yahoo.com>
Date: Wed, 9 Jun 2004 14:26:00 +0000 (UTC)
Message-ID: <loom.20040609T162258-145@post.gmane.org>
References: <000401c4473c$5087e670$6401a8c0@downstairs>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: news <news@sea.gmane.org>
Subject: [linux-lvm] Re: root restore onto a logical volume
Reply-To: LVM general discussion and development <linux-lvm@redhat.com>
List-Id: LVM general discussion and development <linux-lvm.redhat.com>
List-Unsubscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=unsubscribe>
List-Archive: </archives/linux-lvm>
List-Post: <mailto:linux-lvm@redhat.com>
List-Help: <mailto:linux-lvm-request@redhat.com?subject=help>
List-Subscribe: <https://www.redhat.com/mailman/listinfo/linux-lvm>,
	<mailto:linux-lvm-request@redhat.com?subject=subscribe>
List-Id: <linux-lvm.redhat.com>
Content-Type: text/plain; charset="utf-8"
To: linux-lvm@redhat.com

David Spear <dspear <at> telus.net> writes:

> 
>  
> Did I miss something in my restore?  Do I need to restore a configuration of
> some sort?  I have read through the manpages on vgcfgbackup and vgcfgrestore 
and believe that these write out
> configurations to the physical volumes. 
> As I can boot my old root (or boot from cd)
> and both see and mount /dev/Volume00/TempVol I’m sure there’s
> nothing wrong with my volume group configuration on the disks…
> 

Okay, solved my own problem.  My backup of root "/" that I restored onto the 
new logical volume /dev/Volume00/TempVol was lacking the block device to access 
TempVol.  A simple:

# mknod /dev/Volume00/TempVol b 58 4

was all I needed and up she came.  I have a vague recollection that one of the 
manpages for an lvm utility mentioned something about backup/restore of special 
files but I can't remember which one...
