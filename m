Received: from mx1.redhat.com (mx1.redhat.com [172.16.48.31])
	by int-mx1.corp.redhat.com (8.11.6/8.11.6) with ESMTP id j3R4cWO06221
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 00:38:32 -0400
Received: from mailhost.curriculum.edu.au (mailhost.curriculum.edu.au
	[203.24.26.74])
	by mx1.redhat.com (8.12.11/8.12.11) with ESMTP id j3R4cVnU012388
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 00:38:31 -0400
Received: from localhost (localhost [127.0.0.1])
	by mailhost.curriculum.edu.au (Postfix) with ESMTP id B0B8B1A0D3D
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 14:38:25 +1000 (EST)
Received: from mailhost.curriculum.edu.au ([127.0.0.1])
	by localhost (mailhost [127.0.0.1]) (amavisd-new, port 10024) with LMTP
	id 03779-01-5 for <linux-lvm@redhat.com>;
	Wed, 27 Apr 2005 14:38:23 +1000 (EST)
Received: from monhost.curriculum.edu.au (monhost.curriculum.edu.au
	[192.168.10.13])
	by mailhost.curriculum.edu.au (Postfix) with ESMTP id E9BC71A0D3C
	for <linux-lvm@redhat.com>; Wed, 27 Apr 2005 14:38:22 +1000 (EST)
Date: Wed, 27 Apr 2005 14:38:22 +1000
Message-ID: <20050427043822.GI15110@monhost.curriculum.edu.au>
Mime-Version: 1.0
Content-Disposition: inline
From: Christian Purnomo <cpurn@cpurn.net>
Subject: [linux-lvm] LVM2 on RAID
Reply-To: cpurn@cpurn.net,
	LVM general discussion and development <linux-lvm@redhat.com>
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
Content-Transfer-Encoding: 7bit
To: linux-lvm@redhat.com

Hi All

I use gentoo, lvm2, raid (lvm on top of raid-1).  My problem is that the
kernel doesn't automatically detect my /dev/md[2-8] as the partitions are set
to 8e (LVM2) instead of 0xFD ... the solution I have at the moment is to append
md=2,/dev/sdXY,/dev/sdAB and so forth to my grub.conf. 

Is it safe to change the partition types from 8e to 0xFD? will I break my lvm?

Many thanks

Christian.
